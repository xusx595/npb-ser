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
#pragma simd
      for (i = 1; i <= nx2; i++) {
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
