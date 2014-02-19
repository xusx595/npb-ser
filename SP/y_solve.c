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
// step in the y-direction for all five matrix components
// simultaneously. The Thomas algorithm is employed to solve the
// systems for the y-lines. Boundary conditions are non-periodic
//---------------------------------------------------------------------
void y_solve()
{
  int i, j, k, j1, j2, m;
  float ru1, fac1, fac2;

  if (timeron) timer_start(t_ysolve);
  for (k = 1; k <= grid_points[2]-2; k++) {
    lhsinitj(ny2+1, nx2);

    //---------------------------------------------------------------------
    // Computes the left hand side for the three y-factors   
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // first fill the lhs for the u-eigenvalue         
    //---------------------------------------------------------------------
    for (i = 1; i <= grid_points[0]-2; i++) {
 
      for (j = 0; j <= grid_points[1]-1; j++) {
        ru1 = c3c4*rho_i[k][j][i];
        cv[j] = vs[k][j][i];
        rhoq[j] = max(max(dy3+con43*ru1, dy5+c1c5*ru1), max(dymax+ru1, dy1));
      }
 
      for (j = 1; j <= grid_points[1]-2; j++) {
        lhs1[j][i] =  0.0;
        lhs2[j][i][0] = -dtty2 * cv[j-1] - dtty1 * rhoq[j-1];
        lhs2[j][i][1] =  1.0 + c2dtty1 * rhoq[j];
        lhs3[j][i][0] =  dtty2 * cv[j+1] - dtty1 * rhoq[j+1];
        lhs3[j][i][1] =  0.0;
      }
    }

    //---------------------------------------------------------------------
    // add fourth order dissipation                             
    //---------------------------------------------------------------------
 
    for (i = 1; i <= grid_points[0]-2; i++) {
      j = 1;
      lhs2[j][i][1] = lhs2[j][i][1] + comz5;
      lhs3[j][i][0] = lhs3[j][i][0] - comz4;
      lhs3[j][i][1] = lhs3[j][i][1] + comz1;

      lhs2[j+1][i][0] = lhs2[j+1][i][0] - comz4;
      lhs2[j+1][i][1] = lhs2[j+1][i][1] + comz6;
      lhs3[j+1][i][0] = lhs3[j+1][i][0] - comz4;
      lhs3[j+1][i][1] = lhs3[j+1][i][1] + comz1;
    }

    for (j = 3; j <= grid_points[1]-4; j++) {
 
      for (i = 1; i <= grid_points[0]-2; i++) {
        lhs1[j][i] = lhs1[j][i] + comz1;
        lhs2[j][i][0] = lhs2[j][i][0] - comz4;
        lhs2[j][i][1] = lhs2[j][i][1] + comz6;
        lhs3[j][i][0] = lhs3[j][i][0] - comz4;
        lhs3[j][i][1] = lhs3[j][i][1] + comz1;
      }
    }
 
    for (i = 1; i <= grid_points[0]-2; i++) {
      j = grid_points[1]-3;
      lhs1[j][i] = lhs1[j][i] + comz1;
      lhs2[j][i][0] = lhs2[j][i][0] - comz4;
      lhs3[j][i][0] = lhs3[j][i][0] + comz6;
      lhs3[j][i][1] = lhs3[j][i][1] - comz4;

      lhs1[j+1][i] = lhs1[j+1][i] + comz1;
      lhs2[j+1][i][0] = lhs2[j+1][i][0] - comz4;
      lhs2[j+1][i][1] = lhs2[j+1][i][1] + comz5;
    }

    //---------------------------------------------------------------------
    // subsequently, for (the other two factors                    
    //---------------------------------------------------------------------
    for (j = 1; j <= grid_points[1]-2; j++) {
 
      for (i = 1; i <= grid_points[0]-2; i++) {
        lhsp1[j][i] = lhs1[j][i];
        lhsp2[j][i][0] = lhs2[j][i][0] - dtty2 * speed[k][j-1][i];
        lhsp2[j][i][1] = lhs2[j][i][1];
        lhsp3[j][i][0] = lhs3[j][i][0] + dtty2 * speed[k][j+1][i];
        lhsp3[j][i][1] = lhs3[j][i][1];
        lhsm1[j][i] = lhs1[j][i];
        lhsm2[j][i][0] = lhs2[j][i][0] + dtty2 * speed[k][j-1][i];
        lhsm2[j][i][1] = lhs2[j][i][1];
        lhsm3[j][i][0] = lhs3[j][i][0] - dtty2 * speed[k][j+1][i];
        lhsm3[j][i][1] = lhs3[j][i][1];
      }
    }


    //---------------------------------------------------------------------
    // FORWARD ELIMINATION  
    //---------------------------------------------------------------------
    for (j = 0; j <= grid_points[1]-3; j++) {
      j1 = j + 1;
      j2 = j + 2;
 
      for (i = 1; i <= grid_points[0]-2; i++) {
        fac1 = 1.0/lhs2[j][i][1];
        lhs3[j][i][0] = fac1*lhs3[j][i][0];
        lhs3[j][i][1] = fac1*lhs3[j][i][1];
        //for (m = 0; m < 3; m++) {
          rhs1[k][j][i] = fac1*rhs1[k][j][i];
        rhs2[k][j][i][0] = fac1*rhs2[k][j][i][0];
        rhs2[k][j][i][1] = fac1*rhs2[k][j][i][1];
        //}
        lhs2[j1][i][1] = lhs2[j1][i][1] - lhs2[j1][i][0]*lhs3[j][i][0];
        lhs3[j1][i][0] = lhs3[j1][i][0] - lhs2[j1][i][0]*lhs3[j][i][1];
        //for (m = 0; m < 3; m++) {
          rhs1[k][j1][i] = rhs1[k][j1][i] - lhs2[j1][i][0]*rhs1[k][j][i];
        rhs2[k][j1][i][0] = rhs2[k][j1][i][0] - lhs2[j1][i][0]*rhs2[k][j][i][0];
        rhs2[k][j1][i][1] = rhs2[k][j1][i][1] - lhs2[j1][i][0]*rhs2[k][j][i][1];
        //}
        lhs2[j2][i][0] = lhs2[j2][i][0] - lhs1[j2][i]*lhs3[j][i][0];
        lhs2[j2][i][1] = lhs2[j2][i][1] - lhs1[j2][i]*lhs3[j][i][1];
        //for (m = 0; m < 3; m++) {
        rhs1[k][j2][i] = rhs1[k][j2][i] - lhs1[j2][i]*rhs1[k][j][i];
        rhs2[k][j2][i][0] = rhs2[k][j2][i][0] - lhs1[j2][i]*rhs2[k][j][i][0];
        rhs2[k][j2][i][1] = rhs2[k][j2][i][1] - lhs1[j2][i]*rhs2[k][j][i][1];
        //}
      }
    }

    //---------------------------------------------------------------------
    // The last two rows in this grid block are a bit different, 
    // since they for (not have two more rows available for the
    // elimination of off-diagonal entries
    //---------------------------------------------------------------------
    j  = grid_points[1]-2;
    j1 = grid_points[1]-1;
 
    for (i = 1; i <= grid_points[0]-2; i++) {
      fac1 = 1.0/lhs2[j][i][1];
      lhs3[j][i][0] = fac1*lhs2[j][i][0];
      lhs3[j][i][1] = fac1*lhs2[j][i][1];
      //for (m = 0; m < 3; m++) {
        rhs1[k][j][i] = fac1*rhs1[k][j][i];
      rhs2[k][j][i][0] = fac1*rhs2[k][j][i][0];
      rhs2[k][j][i][1] = fac1*rhs2[k][j][i][1];
      //}
      lhs2[j1][i][1] = lhs2[j1][i][1] - lhs2[j1][i][0]*lhs3[j][i][0];
      lhs3[j1][i][0] = lhs3[j1][i][0] - lhs2[j1][i][0]*lhs3[j][i][1];
      //for (m = 0; m < 3; m++) {
        rhs1[k][j1][i] = rhs1[k][j1][i] - lhs2[j1][i][0]*rhs1[k][j][i];
      rhs2[k][j1][i][0] = rhs2[k][j1][i][0] - lhs2[j1][i][0]*rhs2[k][j][i][0];
      rhs2[k][j1][i][1] = rhs2[k][j1][i][1] - lhs2[j1][i][0]*rhs2[k][j][i][1];
      //}
      //---------------------------------------------------------------------
      // scale the last row immediately 
      //---------------------------------------------------------------------
      fac2 = 1.0/lhs2[j1][i][1];
      //for (m = 0; m < 3; m++) {
      rhs1[k][j1][i] = fac2*rhs1[k][j1][i];
      rhs2[k][j1][i][0] = fac2*rhs2[k][j1][i][0];
      rhs2[k][j1][i][1] = fac2*rhs2[k][j1][i][1];
      //}
    }

    //---------------------------------------------------------------------
    // for (the u+c and the u-c factors                 
    //---------------------------------------------------------------------
    for (j = 0; j <= grid_points[1]-3; j++) {
      j1 = j + 1;
      j2 = j + 2;
 
      for (i = 1; i <= grid_points[0]-2; i++) {
        m = 2;
        fac1 = 1.0/lhsp2[j][i][1];
        lhsp3[j][i][0]    = fac1*lhsp3[j][i][0];
        lhsp3[j][i][1]    = fac1*lhsp3[j][i][1];
        rhs3[k][j][i][0]  = fac1*rhs3[k][j][i][0];
        lhsp2[j1][i][1]   = lhsp2[j1][i][1] - lhsp2[j1][i][0]*lhsp3[j][i][0];
        lhsp3[j1][i][0]   = lhsp3[j1][i][0] - lhsp3[j1][i][0]*lhsp3[j][i][1];
        rhs3[k][j1][i][0] = rhs3[k][j1][i][0] - lhsp2[j1][i][0]*rhs3[k][j][i][0];
        lhsp2[j2][i][0]   = lhsp2[j2][i][0] - lhsp1[j2][i]*lhsp3[j][i][0];
        lhsp2[j2][i][1]   = lhsp2[j2][i][1] - lhsp1[j2][i]*lhsp3[j][i][1];
        rhs3[k][j2][i][0] = rhs3[k][j2][i][0] - lhsp1[j2][i]*rhs3[k][j][i][0];

        m = 3;
        fac1 = 1.0/lhsm2[j][i][1];
        lhsm3[j][i][0]    = fac1*lhsm3[j][i][0];
        lhsm3[j][i][1]    = fac1*lhsm3[j][i][1];
        rhs3[k][j][i][1]  = fac1*rhs3[k][j][i][1];
        lhsm2[j1][i][1]   = lhsm2[j1][i][1] - lhsm2[j1][i][0]*lhsm3[j][i][0];
        lhsm3[j1][i][0]   = lhsm3[j1][i][0] - lhsm2[j1][i][0]*lhsm3[j][i][1];
        rhs3[k][j1][i][1] = rhs3[k][j1][i][1] - lhsm2[j1][i][0]*rhs3[k][j][i][1];
        lhsm2[j2][i][0]   = lhsm2[j2][i][0] - lhsm1[j2][i]*lhsm3[j][i][0];
        lhsm2[j2][i][1]   = lhsm2[j2][i][1] - lhsm1[j2][i]*lhsm3[j][i][1];
        rhs3[k][j2][i][1] = rhs3[k][j2][i][1] - lhsm1[j2][i]*rhs3[k][j][i][1];
      }
    }

    //---------------------------------------------------------------------
    // And again the last two rows separately
    //---------------------------------------------------------------------
    j  = grid_points[1]-2;
    j1 = grid_points[1]-1;
 
    for (i = 1; i <= grid_points[0]-2; i++) {
      m = 2;
      fac1 = 1.0/lhsp2[j][i][1];
      lhsp3[j][i][0]    = fac1*lhsp3[j][i][0];
      lhsp3[j][i][1]    = fac1*lhsp3[j][i][1];
      rhs3[k][j][i][0]  = fac1*rhs3[k][j][i][0];
      lhsp2[j1][i][1]   = lhsp2[j1][i][1] - lhsp2[j1][i][0]*lhsp3[j][i][0];
      lhsp3[j1][i][0]   = lhsp3[j1][i][0] - lhsp2[j1][i][0]*lhsp3[j][i][1];
      rhs3[k][j1][i][0] = rhs3[k][j1][i][0] - lhsp2[j1][i][0]*rhs3[k][j][i][0];

      m = 3;
      fac1 = 1.0/lhsm2[j][i][1];
      lhsm3[j][i][0]    = fac1*lhsm3[j][i][0];
      lhsm3[j][i][1]    = fac1*lhsm3[j][i][1];
      rhs3[k][j][i][1]  = fac1*rhs3[k][j][i][1];
      lhsm2[j1][i][1]   = lhsm2[j1][i][1] - lhsm2[j1][i][0]*lhsm3[j][i][0];
      lhsm3[j1][i][0]   = lhsm3[j1][i][0] - lhsm2[j1][i][0]*lhsm3[j][i][1];
      rhs3[k][j1][i][1] = rhs3[k][j1][i][1] - lhsm2[j1][i][0]*rhs3[k][j][i][1];

      //---------------------------------------------------------------------
      // Scale the last row immediately 
      //---------------------------------------------------------------------
      rhs3[k][j1][i][0]   = rhs3[k][j1][i][0]/lhsp2[j1][i][1];
      rhs3[k][j1][i][1]   = rhs3[k][j1][i][1]/lhsm2[j1][i][1];
    }


    //---------------------------------------------------------------------
    // BACKSUBSTITUTION 
    //---------------------------------------------------------------------
    j  = grid_points[1]-2;
    j1 = grid_points[1]-1;
    for (i = 1; i <= grid_points[0]-2; i++) {
      //for (m = 0; m < 3; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] - lhs3[j][i][0]*rhs1[k][j1][i];
      rhs2[k][j][i][0] = rhs2[k][j][i][0] - lhs3[j][i][0]*rhs2[k][j1][i][0];
      rhs2[k][j][i][1] = rhs2[k][j][i][1] - lhs3[j][i][0]*rhs2[k][j1][i][1];
      //}

      rhs3[k][j][i][0] = rhs3[k][j][i][0] - lhsp3[j][i][0]*rhs3[k][j1][i][0];
      rhs3[k][j][i][1] = rhs3[k][j][i][1] - lhsm3[j][i][0]*rhs3[k][j1][i][1];
    }

    //---------------------------------------------------------------------
    // The first three factors
    //---------------------------------------------------------------------
    for (j = grid_points[1]-3; j >= 0; j--) {
      j1 = j + 1;
      j2 = j + 2;
 
      for (i = 1; i <= grid_points[0]-2; i++) {
        //for (m = 0; m < 3; m++) {
          rhs1[k][j][i] = rhs1[k][j][i] - 
                            lhs3[j][i][0]*rhs1[k][j1][i] -
                            lhs3[j][i][1]*rhs1[k][j2][i];
        rhs2[k][j][i][0] = rhs2[k][j][i][0] - 
                            lhs3[j][i][0]*rhs2[k][j1][i][0] -
                            lhs3[j][i][1]*rhs2[k][j2][i][0];
        rhs2[k][j][i][1] = rhs2[k][j][i][1] - 
                            lhs3[j][i][0]*rhs2[k][j1][i][1] -
                            lhs3[j][i][1]*rhs2[k][j2][i][1];
        //}

        //-------------------------------------------------------------------
        // And the remaining two
        //-------------------------------------------------------------------
        rhs3[k][j][i][0] = rhs3[k][j][i][0] - 
                          lhsp3[j][i][0]*rhs3[k][j1][i][0] -
                          lhsp3[j][i][1]*rhs3[k][j2][i][0];
        rhs3[k][j][i][1] = rhs3[k][j][i][1] - 
                          lhsm3[j][i][0]*rhs3[k][j1][i][1] -
                          lhsm3[j][i][1]*rhs3[k][j2][i][1];
      }
    }
  }
  if (timeron) timer_stop(t_ysolve);

  pinvr();
}

