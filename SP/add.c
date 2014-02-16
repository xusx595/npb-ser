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
// addition of update to the vector u
//---------------------------------------------------------------------
void add()
{
  int i, j, k, m;

  if (timeron) timer_start(t_add);
  for (k = 1; k <= nz2; k++) {
    for (j = 1; j <= ny2; j++) {
      int new_i_upper = nx2/4*4;
      for (i = 1; i < 4; i++) {
        //for (m = 0; m < 5; m++) {
        u1[k][j][i] = u1[k][j][i] + rhs1[k][j][i];
        u[k][j][i][0] = u[k][j][i][0] + rhs[k][j][i][0];
        u[k][j][i][1] = u[k][j][i][1] + rhs[k][j][i][1];
        u[k][j][i][2] = u[k][j][i][2] + rhs[k][j][i][2];
        u[k][j][i][3] = u[k][j][i][3] + rhs[k][j][i][3];
        //}
      }
      
      for (i = 4; i <new_i_upper; i+=4) {
        //for (m = 0; m < 5; m++) {
        /*u1[k][j][i] = u1[k][j][i] + rhs1[k][j][i];*/
        __m256d vu = _mm256_load_pd(&u1[k][j][i]);
        __m256d vrhs = _mm256_load_pd(&rhs1[k][j][i]);
        vu = _mm256_add_pd(vu, vrhs);
        _mm256_storeu_pd(&u1[k][j][i], vu);
        
        /*u[k][j][i][0] = u[k][j][i][0] + rhs[k][j][i][0];
        u[k][j][i][1] = u[k][j][i][1] + rhs[k][j][i][1];
        u[k][j][i][2] = u[k][j][i][2] + rhs[k][j][i][2];
        u[k][j][i][3] = u[k][j][i][3] + rhs[k][j][i][3];*/
        __m256d vu0 = _mm256_load_pd(&u[k][j][i][0]);
        __m256d vu1 = _mm256_load_pd(&u[k][j][i+1][0]);
        __m256d vu2 = _mm256_load_pd(&u[k][j][i+2][0]);
        __m256d vu3 = _mm256_load_pd(&u[k][j][i+3][0]);

        __m256d vrhs0 = _mm256_load_pd(&rhs[k][j][i][0]);
        __m256d vrhs1 = _mm256_load_pd(&rhs[k][j][i+1][0]);
        __m256d vrhs2 = _mm256_load_pd(&rhs[k][j][i+2][0]);
        __m256d vrhs3 = _mm256_load_pd(&rhs[k][j][i+3][0]);

        vu0 = _mm256_add_pd(vu0, vrhs0);
        vu1 = _mm256_add_pd(vu1, vrhs1);
        vu2 = _mm256_add_pd(vu2, vrhs2);
        vu3 = _mm256_add_pd(vu3, vrhs3);

        _mm256_store_pd(&u[k][j][i][0], vu0);
        _mm256_store_pd(&u[k][j][i+1][0], vu1);
        _mm256_store_pd(&u[k][j][i+2][0], vu2);
        _mm256_store_pd(&u[k][j][i+3][0], vu3);
        //}
      }
      
      for (i = new_i_upper; i <= nx2; i++) {
        //for (m = 0; m < 5; m++) {
        u1[k][j][i] = u1[k][j][i] + rhs1[k][j][i];
        u[k][j][i][0] = u[k][j][i][0] + rhs[k][j][i][0];
        u[k][j][i][1] = u[k][j][i][1] + rhs[k][j][i][1];
        u[k][j][i][2] = u[k][j][i][2] + rhs[k][j][i][2];
        u[k][j][i][3] = u[k][j][i][3] + rhs[k][j][i][3];
        //}
      }
    }
  }
  if (timeron) timer_stop(t_add);
}
