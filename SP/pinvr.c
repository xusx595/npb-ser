//-------------------------------------------------------------------------//
//                                                                         //
//  This benchmark is a serial C version of the NPB SP code. This C        //
//  version is developed by the Center for Manycore Programming at Seoul   //
//  National University and derived from the serial Fortran versions in    //
//  "NPB3.3-SER" developed by NAS.                                         //
//                                                                         //
//  Permission to use, copy, distribute and modify this software for any   //
//  purpose with or without fee is hereby granted. This software is        //
//  provided "as is" without express or implied warranty.                  //
//                                                                         //
//  Information on NPB 3.3, including the technical report, the original   //
//  specifications, source code, results and information on how to submit  //
//  new results, is available at:                                          //
//                                                                         //
//           http://www.nas.nasa.gov/Software/NPB/                         //
//                                                                         //
//  Send comments or suggestions for this C version to cmp@aces.snu.ac.kr  //
//                                                                         //
//          Center for Manycore Programming                                //
//          School of Computer Science and Engineering                     //
//          Seoul National University                                      //
//          Seoul 151-744, Korea                                           //
//                                                                         //
//          E-mail:  cmp@aces.snu.ac.kr                                    //
//                                                                         //
//-------------------------------------------------------------------------//

//-------------------------------------------------------------------------//
// Authors: Sangmin Seo, Jungwon Kim, Jun Lee, Jeongho Nah, Gangwon Jo,    //
//          and Jaejin Lee                                                 //
//-------------------------------------------------------------------------//

#include "header.h"

//---------------------------------------------------------------------
// block-diagonal matrix-vector multiplication                       
//---------------------------------------------------------------------
static inline void interleave(
__m256d * vA,
__m256d * vB,
__m256d * vC,
__m256d * vD)
{
// B2A2 B0A0
// D2C2 D0C0
// B3A3 B1A1
// D3C3 D1C1
// B2A2 B0A0
__m256d v0 = _mm256_unpacklo_pd(*vA, *vB);
// D2C2 D0C0
__m256d v1 = _mm256_unpacklo_pd(*vC, *vD);
// B3A3 B1A1
__m256d v2 = _mm256_unpackhi_pd(*vA, *vB);
// D3C3 D1C1
__m256d v3 = _mm256_unpackhi_pd(*vC, *vD);

// D0C0 B0A0
*vA = _mm256_permute2f128_pd(v0, v1, 0x20);
// D1C1 B1A1
*vB = _mm256_permute2f128_pd(v2, v3, 0x20);
// D2C2 B2A2
*vC = _mm256_permute2f128_pd(v0, v1, 0x31);
// D3C3 B3A3
*vD = _mm256_permute2f128_pd(v2, v3, 0x31);
}

void pinvr()
{
  int i, j, k;
  double r1, r2, r3, r4, r5, t1, t2;

  if (timeron) timer_start(t_pinvr);
  for (k = 1; k <= nz2; k++) {
    for (j = 1; j <= ny2; j++) {

/* simd for this loop may not be profitable. */
      int new_i_upper = nx2/4*4;
      for (i = 1; i <4; i++) {
        r1 = rhs1[k][j][i];
        r2 = rhs[k][j][i][0];
        r3 = rhs[k][j][i][1];
        r4 = rhs[k][j][i][2];
        r5 = rhs[k][j][i][3];

        t1 = bt * r1;
        t2 = 0.5 * ( r4 + r5 );

        rhs1[k][j][i] =  bt * ( r4 - r5 );
        rhs[k][j][i][0] = -r3;
        rhs[k][j][i][1] =  r2;
        rhs[k][j][i][2] = -t1 + t2;
        rhs[k][j][i][3] =  t1 + t2;
      }
#if 0
      for (i = 4; i <new_i_upper; i++) {
        r1 = rhs1[k][j][i];
        r2 = rhs[k][j][i][0];
        r3 = rhs[k][j][i][1];
        r4 = rhs[k][j][i][2];
        r5 = rhs[k][j][i][3];
        

        t1 = bt * r1;
        t2 = 0.5 * ( r4 + r5 );

        rhs1[k][j][i] =  bt * ( r4 - r5 );
        rhs[k][j][i][0] = -r3;
        rhs[k][j][i][1] =  r2;
        rhs[k][j][i][2] = -t1 + t2;
        rhs[k][j][i][3] =  t1 + t2;
      }
#endif
      for (i = 4; i <new_i_upper; i+=4) {
        /*r1 = rhs1[k][j][i];
        r2 = rhs[k][j][i][0];
        r3 = rhs[k][j][i][1];
        r4 = rhs[k][j][i][2];
        r5 = rhs[k][j][i][3];*/
        __m256d vr1 = _mm256_loadu_pd(&rhs1[k][j][i]);
        __m256d vr2 = _mm256_load_pd(&rhs[k][j][i][0]);
        __m256d vr3 = _mm256_load_pd(&rhs[k][j][i+1][0]);
        __m256d vr4 = _mm256_load_pd(&rhs[k][j][i+2][0]);
        __m256d vr5 = _mm256_load_pd(&rhs[k][j][i+3][0]);

        /* transpose */
        interleave (&vr2, &vr3, &vr4, &vr5);
        
        /* t1 = bt * r1;*/
        __m256d vbt = _mm256_set1_pd(bt);
        __m256d vt1 = _mm256_mul_pd(vbt, vr1);
        
        /*t2 = 0.5 * ( r4 + r5 );*/
        __m256d tmp1 = _mm256_add_pd(vr4, vr5);
        __m256d vt2 = _mm256_mul_pd(_mm256_set1_pd(0.5f), tmp1);

        /*rhs1[k][j][i] =  bt * ( r4 - r5 );*/
        tmp1 = _mm256_sub_pd(vr4, vr5);
        __m256d vrhs = _mm256_mul_pd(vbt, tmp1);
        _mm256_storeu_pd(&rhs1[k][j][i], vrhs);
        
        /*rhs[k][j][i][0] = -r3;*/
        __m256d zeros = _mm256_setzero_pd();
        __m256d vrhs0 = _mm256_sub_pd(zeros, vr3);
        
        /*rhs[k][j][i][1] =  r2;*/
        __m256d vrhs1 = vr2;
        
        /*rhs[k][j][i][2] = -t1 + t2;*/
        tmp1 = _mm256_sub_pd(zeros, vt1);
        __m256d vrhs2 = _mm256_add_pd(tmp1, vt2);
        
        /*rhs[k][j][i][3] =  t1 + t2;*/
        __m256d vrhs3 = _mm256_add_pd(vt1, vt2);

        /* transpose*/
        interleave (&vrhs0, &vrhs1, &vrhs2, &vrhs3);

        /* store data back. */
        _mm256_store_pd(&rhs[k][j][i][0] , vrhs0);
        _mm256_store_pd(&rhs[k][j][i+1][0] , vrhs1);
        _mm256_store_pd(&rhs[k][j][i+2][0] , vrhs2);
        _mm256_store_pd(&rhs[k][j][i+3][0] , vrhs3);
      }

      for (i = new_i_upper; i <= nx2; i++) {
        r1 = rhs1[k][j][i];
        r2 = rhs[k][j][i][0];
        r3 = rhs[k][j][i][1];
        r4 = rhs[k][j][i][2];
        r5 = rhs[k][j][i][3];

        t1 = bt * r1;
        t2 = 0.5 * ( r4 + r5 );

        rhs1[k][j][i] =  bt * ( r4 - r5 );
        rhs[k][j][i][0] = -r3;
        rhs[k][j][i][1] =  r2;
        rhs[k][j][i][2] = -t1 + t2;
        rhs[k][j][i][3] =  t1 + t2;
      }
    }
  }
  if (timeron) timer_stop(t_pinvr);
}

