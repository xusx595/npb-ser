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
// this function performs the solution of the approximate factorization
// step in the x-direction for all five matrix components
// simultaneously. The Thomas algorithm is employed to solve the
// systems for the x-lines. Boundary conditions are non-periodic
//---------------------------------------------------------------------
void x_solve()
{
  int i, j, k, i1, i2, m;
  float ru1, fac1, fac2;

  if (timeron) timer_start(t_xsolve);
  for (k = 1; k <= nz2; k++) {
    lhsinit(nx2+1, ny2);

    //---------------------------------------------------------------------
    // Computes the left hand side for the three x-factors  
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // first fill the lhs for the u-eigenvalue                   
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
 
      for (i = 0; i <= grid_points[0]-1; i++) {
        ru1 = c3c4*rho_i[k][j][i];
        cv[i] = us[k][j][i];
        rhon[i] = max(max(dx2+con43*ru1,dx5+c1c5*ru1), max(dxmax+ru1,dx1));
      }
 
      for (i = 1; i <= nx2; i++) {
        lhs1[j][i] =  0.0;
        lhs2[j][i][0] = -dttx2 * cv[i-1] - dttx1 * rhon[i-1];
        lhs2[j][i][1] =  1.0 + c2dttx1 * rhon[i];
        lhs3[j][i][0] =  dttx2 * cv[i+1] - dttx1 * rhon[i+1];
        lhs3[j][i][1] =  0.0;
      }
    }

    //---------------------------------------------------------------------
    // add fourth order dissipation                             
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      i = 1;
      lhs2[j][i][1] = lhs2[j][i][1] + comz5;
      lhs3[j][i][0] = lhs3[j][i][0] - comz4;
      lhs3[j][i][1] = lhs3[j][i][1] + comz1;

      lhs2[j][i+1][0] = lhs2[j][i+1][0] - comz4;
      lhs2[j][i+1][1] = lhs2[j][i+1][1] + comz6;
      lhs3[j][i+1][0] = lhs3[j][i+1][0] - comz4;
      lhs3[j][i+1][1] = lhs3[j][i+1][1] + comz1;
    }

    for (j = 1; j <= ny2; j++) {
      for (i = 3; i <= grid_points[0]-4; i++) {
        lhs1[j][i] = lhs1[j][i] + comz1;
        lhs2[j][i][0] = lhs2[j][i][0] - comz4;
        lhs2[j][i][1] = lhs2[j][i][1] + comz6;
        lhs3[j][i][0] = lhs3[j][i][0] - comz4;
        lhs3[j][i][1] = lhs3[j][i][1] + comz1;
      }
    }

    for (j = 1; j <= ny2; j++) {
      i = grid_points[0]-3;
      lhs1[j][i] = lhs1[j][i] + comz1;
      lhs2[j][i][0] = lhs2[j][i][0] - comz4;
      lhs2[j][i][1] = lhs2[j][i][1] + comz6;
      lhs3[j][i][0] = lhs3[j][i][0] - comz4;

      lhs1[j][i+1] = lhs1[j][i+1] + comz1;
      lhs2[j][i+1][0] = lhs2[j][i+1][0] - comz4;
      lhs2[j][i+1][1] = lhs2[j][i+1][1] + comz5;
    }

    //---------------------------------------------------------------------
    // subsequently, fill the other factors (u+c), (u-c) by adding to 
    // the first  
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      for (i = 1; i <= nx2; i++) {
        lhsp1[j][i] = lhs1[j][i];
        lhsp2[j][i][0] = lhs2[j][i][0] - dttx2 * speed[k][j][i-1];
        lhsp2[j][i][1] = lhs2[j][i][1];
        lhsp3[j][i][0] = lhs3[j][i][0] + dttx2 * speed[k][j][i+1];
        lhsp3[j][i][1] = lhs3[j][i][1];
        lhsm1[j][i] = lhs1[j][i];
        lhsm2[j][i][0] = lhs2[j][i][0] + dttx2 * speed[k][j][i-1];
        lhsm2[j][i][1] = lhs2[j][i][1];
        lhsm3[j][i][0] = lhs3[j][i][0] - dttx2 * speed[k][j][i+1];
        lhsm3[j][i][1] = lhs3[j][i][1];
      }
    }

    //---------------------------------------------------------------------
    // FORWARD ELIMINATION  
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // perform the Thomas algorithm; first, FORWARD ELIMINATION     
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      for (i = 0; i <= grid_points[0]-3; i++) {
        i1 = i + 1;
        i2 = i + 2;
        fac1 = 1.0/lhs2[j][i][1];
        lhs3[j][i][0] = fac1*lhs3[j][i][0];
        lhs3[j][i][1] = fac1*lhs3[j][i][1];
        //for (m = 0; m < 3; m++) {
          rhs1[k][j][i] = fac1*rhs1[k][j][i];
        rhs2[k][j][i][0] = fac1*rhs2[k][j][i][0];
        rhs2[k][j][i][1] = fac1*rhs2[k][j][i][1];
        //}
        lhs2[j][i1][1] = lhs2[j][i1][1] - lhs2[j][i1][0]*lhs3[j][i][0];
        lhs3[j][i1][0] = lhs3[j][i1][0] - lhs2[j][i1][0]*lhs3[j][i][1];
        //for (m = 0; m < 3; m++) {
        rhs1[k][j][i1] = rhs1[k][j][i1] - lhs2[j][i1][0]*rhs1[k][j][i];
        rhs2[k][j][i1][0] = rhs2[k][j][i1][0] - lhs2[j][i1][0]*rhs2[k][j][i][0];
        rhs2[k][j][i1][1] = rhs2[k][j][i1][1] - lhs2[j][i1][0]*rhs2[k][j][i][1];
        //}
        lhs2[j][i2][0] = lhs2[j][i2][0] - lhs1[j][i2]*lhs3[j][i][0];
        lhs2[j][i2][1] = lhs2[j][i2][1] - lhs1[j][i2]*lhs3[j][i][1];
        //for (m = 0; m < 3; m++) {
        rhs1[k][j][i2] = rhs1[k][j][i2] - lhs1[j][i2]*rhs1[k][j][i];
        rhs2[k][j][i2][0] = rhs2[k][j][i2][0] - lhs1[j][i2]*rhs2[k][j][i][0];
        rhs2[k][j][i2][1] = rhs2[k][j][i2][1] - lhs1[j][i2]*rhs2[k][j][i][1];
        //}
      }
    }

    //---------------------------------------------------------------------
    // The last two rows in this grid block are a bit different, 
    // since they for (not have two more rows available for the
    // elimination of off-diagonal entries
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      i  = grid_points[0]-2;
      i1 = grid_points[0]-1;
      fac1 = 1.0/lhs2[j][i][1];
      lhs3[j][i][0] = fac1*lhs3[j][i][0];
      lhs3[j][i][1] = fac1*lhs3[j][i][1];
      //for (m = 0; m < 3; m++) {
      rhs1[k][j][i] = fac1*rhs1[k][j][i];
      rhs2[k][j][i][0] = fac1*rhs2[k][j][i][0];
      rhs2[k][j][i][1] = fac1*rhs2[k][j][i][1];
      //}
      lhs2[j][i1][1] = lhs2[j][i1][1] - lhs2[j][i1][0]*lhs3[j][i][0];
      lhs3[j][i1][0] = lhs3[j][i1][0] - lhs2[j][i1][0]*lhs3[j][i][1];
      //for (m = 0; m < 3; m++) {
      rhs1[k][j][i1] = rhs1[k][j][i1] - lhs2[j][i1][0]*rhs1[k][j][i];
      rhs2[k][j][i1][0] = rhs2[k][j][i1][0] - lhs2[j][i1][0]*rhs2[k][j][i][0];
      rhs2[k][j][i1][1] = rhs2[k][j][i1][1] - lhs2[j][i1][0]*rhs2[k][j][i][1];
      //}

      //---------------------------------------------------------------------
      // scale the last row immediately 
      //---------------------------------------------------------------------
      fac2 = 1.0/lhs2[j][i1][1];
      //for (m = 0; m < 3; m++) {
      rhs1[k][j][i1] = fac2*rhs1[k][j][i1];
      rhs2[k][j][i1][0] = fac2*rhs2[k][j][i1][0];
      rhs2[k][j][i1][1] = fac2*rhs2[k][j][i1][1];
      //}
    }

    //---------------------------------------------------------------------
    // for (the u+c and the u-c factors                 
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      for (i = 0; i <= grid_points[0]-3; i++) {
        i1 = i + 1;
        i2 = i + 2;

        m = 2;
        fac1 = 1.0/lhsp2[j][i][1];
        lhsp3[j][i][0]    = fac1*lhsp3[j][i][0];
        lhsp3[j][i][1]    = fac1*lhsp3[j][i][1];
        rhs3[k][j][i][0]  = fac1*rhs3[k][j][i][0];
        lhsp2[j][i1][1]   = lhsp2[j][i1][1] - lhsp2[j][i1][0]*lhsp3[j][i][0];
        lhsp3[j][i1][0]   = lhsp3[j][i1][0] - lhsp2[j][i1][0]*lhsp3[j][i][1];
        rhs3[k][j][i1][0] = rhs3[k][j][i1][0] - lhsp2[j][i1][0]*rhs3[k][j][i][0];
        lhsp2[j][i2][0]   = lhsp2[j][i2][0] - lhsp1[j][i2]*lhsp3[j][i][0];
        lhsp2[j][i2][1]   = lhsp2[j][i2][1] - lhsp1[j][i2]*lhsp3[j][i][1];
        rhs3[k][j][i2][0] = rhs3[k][j][i2][0] - lhsp1[j][i2]*rhs3[k][j][i][0];

        m = 3;
        fac1 = 1.0/lhsm2[j][i][1];
        lhsm3[j][i][0]    = fac1*lhsm3[j][i][0];
        lhsm3[j][i][1]    = fac1*lhsm3[j][i][1];
        rhs3[k][j][i][1]  = fac1*rhs3[k][j][i][1];
        lhsm2[j][i1][1]   = lhsm2[j][i1][1] - lhsm2[j][i1][0]*lhsm3[j][i][0];
        lhsm3[j][i1][0]   = lhsm3[j][i1][0] - lhsm2[j][i1][0]*lhsm3[j][i][1];
        rhs3[k][j][i1][1] = rhs3[k][j][i1][1] - lhsm2[j][i1][0]*rhs3[k][j][i][1];
        lhsm2[j][i2][0]   = lhsm2[j][i2][0] - lhsm1[j][i2]*lhsm3[j][i][0];
        lhsm2[j][i2][1]   = lhsm2[j][i2][1] - lhsm1[j][i2]*lhsm3[j][i][1];
        rhs3[k][j][i2][1] = rhs3[k][j][i2][1] - lhsm1[j][i2]*rhs3[k][j][i][1];
      }
    }

    //---------------------------------------------------------------------
    // And again the last two rows separately
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      i  = grid_points[0]-2;
      i1 = grid_points[0]-1;

      m = 2;
      fac1 = 1.0/lhsp2[j][i][1];
      lhsp3[j][i][0]    = fac1*lhsp3[j][i][0];
      lhsp3[j][i][1]    = fac1*lhsp3[j][i][1];
      rhs3[k][j][i][0]  = fac1*rhs3[k][j][i][0];
      lhsp2[j][i1][1]   = lhsp2[j][i1][1] - lhsp2[j][i1][0]*lhsp3[j][i][0];
      lhsp3[j][i1][0]   = lhsp3[j][i1][0] - lhsp2[j][i1][0]*lhsp3[j][i][1];
      rhs3[k][j][i1][0] = rhs3[k][j][i1][0] - lhsp2[j][i1][0]*rhs3[k][j][i][0];

      m = 3;
      fac1 = 1.0/lhsm2[j][i][1];
      lhsm3[j][i][0]    = fac1*lhsm3[j][i][0];
      lhsm3[j][i][1]    = fac1*lhsm3[j][i][1];
      rhs3[k][j][i][1]  = fac1*rhs3[k][j][i][1];
      lhsm2[j][i1][1]   = lhsm2[j][i1][1] - lhsm2[j][i1][0]*lhsm3[j][i][0];
      lhsm3[j][i1][0]   = lhsm3[j][i1][0] - lhsm3[j][i1][0]*lhsm3[j][i][1];
      rhs3[k][j][i1][1] = rhs3[k][j][i1][1] - lhsm2[j][i1][0]*rhs3[k][j][i][1];

      //---------------------------------------------------------------------
      // Scale the last row immediately
      //---------------------------------------------------------------------
      rhs3[k][j][i1][0] = rhs3[k][j][i1][0]/lhsp2[j][i1][1];
      rhs3[k][j][i1][1] = rhs3[k][j][i1][1]/lhsm2[j][i1][1];
    }

    //---------------------------------------------------------------------
    // BACKSUBSTITUTION 
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      i  = grid_points[0]-2;
      i1 = grid_points[0]-1;
      //for (m = 0; m < 3; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] - lhs3[j][i][0]*rhs1[k][j][i1];
      rhs2[k][j][i][0] = rhs2[k][j][i][0] - lhs3[j][i][0]*rhs2[k][j][i1][0];
      rhs2[k][j][i][1] = rhs2[k][j][i][1] - lhs3[j][i][0]*rhs2[k][j][i1][1];
      //}

      rhs3[k][j][i][0] = rhs3[k][j][i][0] - lhsp3[j][i][0]*rhs3[k][j][i1][0];
      rhs3[k][j][i][1] = rhs3[k][j][i][1] - lhsm3[j][i][0]*rhs3[k][j][i1][1];
    }

    //---------------------------------------------------------------------
    // The first three factors
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      for (i = grid_points[0]-3; i >= 0; i--) {
        i1 = i + 1;
        i2 = i + 2;
        //for (m = 0; m < 3; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] - 
                            lhs3[j][i][0]*rhs1[k][j][i1] -
                            lhs3[j][i][1]*rhs1[k][j][i2];
        rhs2[k][j][i][0] = rhs2[k][j][i][0] - 
                            lhs3[j][i][0]*rhs2[k][j][i1][0] -
                            lhs3[j][i][1]*rhs2[k][j][i2][0];
        rhs2[k][j][i][1] = rhs2[k][j][i][1] - 
                            lhs3[j][i][0]*rhs2[k][j][i1][1] -
                            lhs3[j][i][1]*rhs2[k][j][i2][1];
        //}

        //-------------------------------------------------------------------
        // And the remaining two
        //-------------------------------------------------------------------
        rhs3[k][j][i][0] = rhs3[k][j][i][0] - 
                          lhsp3[j][i][0]*rhs3[k][j][i1][0] -
                          lhsp3[j][i][1]*rhs3[k][j][i2][0];
        rhs3[k][j][i][1] = rhs3[k][j][i][1] - 
                          lhsm3[j][i][0]*rhs3[k][j][i1][1] -
                          lhsm3[j][i][1]*rhs3[k][j][i2][1];
      }
    }
  }
  if (timeron) timer_stop(t_xsolve);

  //---------------------------------------------------------------------
  // Do the block-diagonal inversion          
  //---------------------------------------------------------------------
  ninvr();
}

