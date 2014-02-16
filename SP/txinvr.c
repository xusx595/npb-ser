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

//---------------------------------------------------------------------
// block-diagonal matrix-vector multiplication                  
//---------------------------------------------------------------------
void txinvr()
{
  int i, j, k;
  double t1, t2, t3, ac, ru1, uu, vv, ww, r1, r2, r3, r4, r5, ac2inv;

  if (timeron) timer_start(t_txinvr);
  for (k = 1; k <= nz2; k++) {
    for (j = 1; j <= ny2; j++) {
      /* peeling the loops. */
      int new_i_upper = nx2 / 4 * 4;
      for (i = 1; i <=3; i++) {
        ru1 = rho_i[k][j][i];
        uu = us[k][j][i];
        vv = vs[k][j][i];
        ww = ws[k][j][i];
        ac = speed[k][j][i];
        ac2inv = ac*ac;

        r1 = rhs1[k][j][i];
        r2 = rhs[k][j][i][0];
        r3 = rhs[k][j][i][1];
        r4 = rhs[k][j][i][2];
        r5 = rhs[k][j][i][3];

        t1 = c2 / ac2inv * ( qs[k][j][i]*r1 - uu*r2  - vv*r3 - ww*r4 + r5 );
        t2 = bt * ru1 * ( uu * r1 - r2 );
        t3 = ( bt * ru1 * ac ) * t1;

        rhs1[k][j][i] = r1 - t1;
        rhs[k][j][i][0] = - ru1 * ( ww*r1 - r4 );
        rhs[k][j][i][1] =   ru1 * ( vv*r1 - r3 );
        rhs[k][j][i][2] = - t2 + t3;
        rhs[k][j][i][3] =   t2 + t3;
      }
      for (i = 4; i <new_i_upper; i+=4) {
        /*ru1 = rho_i[k][j][i];*/
        __m256d vru1 = _mm256_load_pd(&rho_i[k][j][i]);
        /*uu = us[k][j][i];*/
        __m256d vuu = _mm256_load_pd(&us[k][j][i]);
        /*vv = vs[k][j][i];*/
        __m256d vvv = _mm256_load_pd(&vs[k][j][i]);
        /*ww = ws[k][j][i];*/
        __m256d vww = _mm256_load_pd(&ws[k][j][i]);
        /*ac = speed[k][j][i];*/
        __m256d vac = _mm256_load_pd(&speed[k][j][i]);
        /*ac2inv = ac*ac;*/
        __m256d vac2inv = _mm256_mul_pd(vac, vac);

        /*r1 = rhs1[k][j][i];*/
        __m256d vr1 = _mm256_load_pd(&rhs1[k][j][i]);
        /*r2 = rhs[k][j][i][0];
        r3 = rhs[k][j][i][1];
        r4 = rhs[k][j][i][2];
        r5 = rhs[k][j][i][3];*/
        __m256d vr2 = _mm256_load_pd(&rhs[k][j][i][0]);
        __m256d vr3 = _mm256_load_pd(&rhs[k][j][i+1][0]);
        __m256d vr4 = _mm256_load_pd(&rhs[k][j][i+2][0]);
        __m256d vr5 = _mm256_load_pd(&rhs[k][j][i+3][0]);

        /* TODO transpose vr2, vr3, vr4, vr5*/
        interleave (&vr2, &vr3, &vr4, &vr5);
        
        /*t1 = c2 / ac2inv * ( qs[k][j][i]*r1 - uu*r2  - vv*r3 - ww*r4 + r5 );*/

        __m256d vqs = _mm256_load_pd(&qs[k][j][i]);
        __m256d tmp1 = _mm256_mul_pd(vqs, vr1);
        __m256d tmp2 = _mm256_mul_pd(vuu, vr2);
        __m256d tmp3 = _mm256_mul_pd(vvv, vr3);
        __m256d tmp4 = _mm256_mul_pd(vww, vr4);
        tmp1 = _mm256_sub_pd(tmp1, tmp2);
        tmp1 = _mm256_sub_pd(tmp1, tmp3);
        tmp1 = _mm256_sub_pd(tmp1, tmp4);
        tmp1 = _mm256_add_pd(tmp1, vr5);
        __m256d vc2 = _mm256_set1_pd(c2);
        tmp2 = _mm256_div_pd(vc2, vac2inv);
        __m256d vt1 = _mm256_mul_pd(tmp2, tmp1);
        
        
        /*t2 = bt * ru1 * ( uu * r1 - r2 );*/
        __m256d vbt = _mm256_set1_pd(bt);
        tmp1 = _mm256_mul_pd(vbt, vru1);
        tmp2 = _mm256_mul_pd(vuu, vr1);
        tmp2 = _mm256_sub_pd(tmp2, vr2);
        __m256d vt2 = _mm256_mul_pd(tmp1, tmp2);
        
        /*t3 = ( bt * ru1 * ac ) * t1;*/
        tmp1 = _mm256_mul_pd(vbt, vru1);
        tmp1 = _mm256_mul_pd(tmp1, vac);
        __m256d vt3 = _mm256_mul_pd(tmp1, vt1);
        

        /*rhs1[k][j][i] = r1 - t1;*/
        tmp1 = _mm256_sub_pd(vr1, vt1);
        _mm256_storeu_pd(&rhs1[k][j][i], tmp1);

        __m256d rhs0, rhs1, rhs2, rhs3;
        
        /*rhs[k][j][i][0] = - ru1 * ( ww*r1 - r4 );*/
        __m256d zeros = _mm256_setzero_pd();
        tmp1 = _mm256_sub_pd(zeros, vru1);
        tmp2 = _mm256_mul_pd(vww, vr1);
        tmp2 = _mm256_sub_pd(tmp2, vr4);
        rhs0 = _mm256_mul_pd(tmp1, tmp2);
        
        /*rhs[k][j][i][1] =   ru1 * ( vv*r1 - r3 );*/
        tmp1 = _mm256_mul_pd(vvv, vr1);
        tmp1 = _mm256_sub_pd(tmp1, vr3);
        rhs1 = _mm256_mul_pd(vru1, tmp1);
        
        /*rhs[k][j][i][2] = - t2 + t3;*/
        tmp1 =_mm256_sub_pd(zeros, vt2);
        rhs2 = _mm256_add_pd(tmp1, vt3);
        /*rhs[k][j][i][3] =   t2 + t3;*/
        rhs3 = _mm256_add_pd(vt2, vt3);

        /* transpose rhs0, rhs1, rhs2, rhs3. */
        interleave (&rhs0, &rhs1, &rhs2, &rhs3);
        
        _mm256_store_pd(&rhs[k][j][i][0], rhs0);
        _mm256_store_pd(&rhs[k][j][i+1][0], rhs1);
        _mm256_store_pd(&rhs[k][j][i+2][0], rhs2);
        _mm256_store_pd(&rhs[k][j][i+3][0], rhs3);
      }

      for (i = new_i_upper; i <=nx2; i++) {
        ru1 = rho_i[k][j][i];
        uu = us[k][j][i];
        vv = vs[k][j][i];
        ww = ws[k][j][i];
        ac = speed[k][j][i];
        ac2inv = ac*ac;

        r1 = rhs1[k][j][i];
        r2 = rhs[k][j][i][0];
        r3 = rhs[k][j][i][1];
        r4 = rhs[k][j][i][2];
        r5 = rhs[k][j][i][3];

        t1 = c2 / ac2inv * ( qs[k][j][i]*r1 - uu*r2  - vv*r3 - ww*r4 + r5 );
        t2 = bt * ru1 * ( uu * r1 - r2 );
        t3 = ( bt * ru1 * ac ) * t1;

        rhs1[k][j][i] = r1 - t1;
        rhs[k][j][i][0] = - ru1 * ( ww*r1 - r4 );
        rhs[k][j][i][1] =   ru1 * ( vv*r1 - r3 );
        rhs[k][j][i][2] = - t2 + t3;
        rhs[k][j][i][3] =   t2 + t3;
      }
    }
  }
  if (timeron) timer_stop(t_txinvr);
}

