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
// step in the z-direction for all five matrix components
// simultaneously. The Thomas algorithm is employed to solve the
// systems for the z-lines. Boundary conditions are non-periodic
//---------------------------------------------------------------------
void z_solve()
{
  int i, j, k, k1, k2, m;
  float ru1, fac1, fac2;

  if (timeron) timer_start(t_zsolve);
  for (j = 1; j <= ny2; j++) {
    lhsinitj(nz2+1, nx2);

    //---------------------------------------------------------------------
    // Computes the left hand side for the three z-factors   
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // first fill the lhs for the u-eigenvalue                          
    //---------------------------------------------------------------------
    for (i = 1; i <= nx2; i++) {
 
      for (k = 0; k <= nz2+1; k++) {
        ru1 = c3c4*rho_i[k][j][i];
        cv[k] = ws[k][j][i];
        rhos[k] = max(max(dz4+con43*ru1, dz5+c1c5*ru1), max(dzmax+ru1, dz1));
      }
 
      for (k = 1; k <= nz2; k++) {
        lhs1[k][i] =  0.0;
        lhs2[k][i][0] = -dttz2 * cv[k-1] - dttz1 * rhos[k-1];
        lhs2[k][i][1] =  1.0 + c2dttz1 * rhos[k];
        lhs3[k][i][0] =  dttz2 * cv[k+1] - dttz1 * rhos[k+1];
        lhs3[k][i][1] =  0.0;
      }
    }

    //---------------------------------------------------------------------
    // add fourth order dissipation                                  
    //---------------------------------------------------------------------
 
    for (i = 1; i <= nx2; i++) {
      k = 1;
      lhs2[k][i][1] = lhs2[k][i][1] + comz5;
      lhs3[k][i][0] = lhs3[k][i][0] - comz4;
      lhs3[k][i][1] = lhs3[k][i][1] + comz1;

      k = 2;
      lhs2[k][i][0] = lhs2[k][i][0] - comz4;
      lhs2[k][i][1] = lhs2[k][i][1] + comz6;
      lhs3[k][i][0] = lhs3[k][i][0] - comz4;
      lhs3[k][i][1] = lhs3[k][i][1] + comz1;
    }

    for (k = 3; k <= nz2-2; k++) {
 
      for (i = 1; i <= nx2; i++) {
        lhs1[k][i] = lhs1[k][i] + comz1;
        lhs2[k][i][0] = lhs2[k][i][0] - comz4;
        lhs2[k][i][1] = lhs2[k][i][1] + comz6;
        lhs3[k][i][0] = lhs3[k][i][0] - comz4;
        lhs3[k][i][1] = lhs3[k][i][1] + comz1;
      }
    }
 
    for (i = 1; i <= nx2; i++) {
      k = nz2-1;
      lhs1[k][i] = lhs1[k][i] + comz1;
      lhs2[k][i][0] = lhs2[k][i][0] - comz4;
      lhs2[k][i][1] = lhs2[k][i][1] + comz6;
      lhs3[k][i][0] = lhs3[k][i][0] - comz4;

      k = nz2;
      lhs1[k][i] = lhs1[k][i] + comz1;
      lhs2[k][i][0] = lhs2[k][i][0] - comz4;
      lhs2[k][i][1] = lhs2[k][i][1] + comz5;
    }

    //---------------------------------------------------------------------
    // subsequently, fill the other factors (u+c), (u-c) 
    //---------------------------------------------------------------------
    for (k = 1; k <= nz2; k++) {
 
      for (i = 1; i <= nx2; i++) {
        lhsp1[k][i] = lhs1[k][i];
        lhsp2[k][i][0] = lhs2[k][i][0] - dttz2 * speed[k-1][j][i];
        lhsp2[k][i][1] = lhs2[k][i][1];
        lhsp3[k][i][0] = lhs3[k][i][0] + dttz2 * speed[k+1][j][i];
        lhsp3[k][i][1] = lhs3[k][i][1];
        lhsm1[k][i] = lhs1[k][i];
        lhsm2[k][i][0] = lhs2[k][i][0] + dttz2 * speed[k-1][j][i];
        lhsm2[k][i][1] = lhs2[k][i][1];
        lhsm3[k][i][0] = lhs3[k][i][0] - dttz2 * speed[k+1][j][i];
        lhsm3[k][i][1] = lhs3[k][i][1];
      }
    }


    //---------------------------------------------------------------------
    // FORWARD ELIMINATION  
    //---------------------------------------------------------------------
    for (k = 0; k <= grid_points[2]-3; k++) {
      k1 = k + 1;
      k2 = k + 2;
 
      for (i = 1; i <= nx2; i++) {
        fac1 = 1.0/lhs2[k][i][1];
        lhs3[k][i][0] = fac1*lhs3[k][i][0];
        lhs3[k][i][1] = fac1*lhs3[k][i][1];
        //for (m = 0; m < 3; m++) {
          rhs1[k][j][i] = fac1*rhs1[k][j][i];
        rhs2[k][j][i][0] = fac1*rhs2[k][j][i][0];
        rhs2[k][j][i][1] = fac1*rhs2[k][j][i][1];
        //}
        lhs2[k1][i][1] = lhs2[k1][i][1] - lhs2[k1][i][0]*lhs3[k][i][0];
        lhs3[k1][i][0] = lhs3[k1][i][0] - lhs2[k1][i][0]*lhs3[k][i][1];
        //for (m = 0; m < 3; m++) {
          rhs1[k1][j][i] = rhs1[k1][j][i] - lhs2[k1][i][0]*rhs1[k][j][i];
        rhs2[k1][j][i][0] = rhs2[k1][j][i][0] - lhs2[k1][i][0]*rhs2[k][j][i][0];
        rhs2[k1][j][i][1] = rhs2[k1][j][i][1] - lhs2[k1][i][0]*rhs2[k][j][i][1];
        //}
        lhs2[k2][i][0] = lhs2[k2][i][0] - lhs1[k2][i]*lhs3[k][i][0];
        lhs2[k2][i][1] = lhs2[k2][i][1] - lhs1[k2][i]*lhs3[k][i][1];
        //for (m = 0; m < 3; m++) {
        rhs1[k2][j][i] = rhs1[k2][j][i] - lhs1[k2][i]*rhs1[k][j][i];
        rhs2[k2][j][i][0] = rhs2[k2][j][i][0] - lhs1[k2][i]*rhs2[k][j][i][0];
        rhs2[k2][j][i][1] = rhs2[k2][j][i][1] - lhs1[k2][i]*rhs2[k][j][i][1];
        //}
      }
    }

    //---------------------------------------------------------------------
    // The last two rows in this grid block are a bit different, 
    // since they for (not have two more rows available for the
    // elimination of off-diagonal entries
    //---------------------------------------------------------------------
    k  = grid_points[2]-2;
    k1 = grid_points[2]-1;
 
    for (i = 1; i <= nx2; i++) {
      fac1 = 1.0/lhs2[k][i][1];
      lhs3[k][i][0] = fac1*lhs3[k][i][0];
      lhs3[k][i][1] = fac1*lhs3[k][i][1];
      //for (m = 0; m < 3; m++) {
        rhs1[k][j][i] = fac1*rhs1[k][j][i];
      rhs2[k][j][i][0] = fac1*rhs2[k][j][i][0];
      rhs2[k][j][i][1] = fac1*rhs2[k][j][i][1];
      //}
      lhs2[k1][i][1] = lhs2[k1][i][1] - lhs2[k1][i][0]*lhs3[k][i][0];
      lhs3[k1][i][0] = lhs3[k1][i][0] - lhs2[k1][i][0]*lhs3[k][i][1];
      //for (m = 0; m < 3; m++) {
        rhs1[k1][j][i] = rhs1[k1][j][i] - lhs2[k1][i][0]*rhs1[k][j][i];
      rhs2[k1][j][i][0] = rhs2[k1][j][i][0] - lhs2[k1][i][0]*rhs2[k][j][i][0];
      rhs2[k1][j][i][1] = rhs2[k1][j][i][1] - lhs2[k1][i][0]*rhs2[k][j][i][1];
      //}

      //---------------------------------------------------------------------
      // scale the last row immediately
      //---------------------------------------------------------------------
      fac2 = 1.0/lhs2[k1][i][1];
      //for (m = 0; m < 3; m++) {
       rhs1[k1][j][i] = fac2*rhs1[k1][j][i];
       rhs2[k1][j][i][0] = fac2*rhs2[k1][j][i][0];
       rhs2[k1][j][i][1] = fac2*rhs2[k1][j][i][1];
      //}
    }

    //---------------------------------------------------------------------
    // for (the u+c and the u-c factors               
    //---------------------------------------------------------------------
    for (k = 0; k <= grid_points[2]-3; k++) {
      k1 = k + 1;
      k2 = k + 2;
      for (i = 1; i <= nx2; i++) {
        m = 2;
        fac1 = 1.0/lhsp2[k][i][1];
        lhsp3[k][i][0]    = fac1*lhsp3[k][i][0];
        lhsp3[k][i][1]    = fac1*lhsp3[k][i][1];
        rhs3[k][j][i][0]  = fac1*rhs3[k][j][i][0];
        lhsp2[k1][i][1]   = lhsp2[k1][i][1] - lhsp2[k1][i][0]*lhsp3[k][i][0];
        lhsp3[k1][i][0]   = lhsp3[k1][i][0] - lhsp2[k1][i][0]*lhsp3[k][i][1];
        rhs3[k1][j][i][0] = rhs3[k1][j][i][0] - lhsp2[k1][i][0]*rhs3[k][j][i][0];
        lhsp2[k2][i][0]   = lhsp2[k2][i][0] - lhsp1[k2][i]*lhsp3[k][i][0];
        lhsp2[k2][i][1]   = lhsp2[k2][i][1] - lhsp1[k2][i]*lhsp3[k][i][1];
        rhs3[k2][j][i][0] = rhs3[k2][j][i][0] - lhsp1[k2][i]*rhs3[k][j][i][0];

        m = 3;
        fac1 = 1.0/lhsm2[k][i][1];
        lhsm3[k][i][0]    = fac1*lhsm3[k][i][0];
        lhsm3[k][i][1]    = fac1*lhsm3[k][i][1];
        rhs3[k][j][i][1]  = fac1*rhs3[k][j][i][1];
        lhsm2[k1][i][1]   = lhsm2[k1][i][1] - lhsm2[k1][i][0]*lhsm3[k][i][0];
        lhsm3[k1][i][0]   = lhsm3[k1][i][0] - lhsm2[k1][i][0]*lhsm3[k][i][1];
        rhs3[k1][j][i][1] = rhs3[k1][j][i][1] - lhsm2[k1][i][0]*rhs3[k][j][i][1];
        lhsm2[k2][i][0]   = lhsm2[k2][i][0] - lhsm1[k2][i]*lhsm3[k][i][0];
        lhsm2[k2][i][1]   = lhsm2[k2][i][1] - lhsm1[k2][i]*lhsm3[k][i][1];
        rhs3[k2][j][i][1] = rhs3[k2][j][i][1] - lhsm1[k2][i]*rhs3[k][j][i][1];
      }
    }

    //---------------------------------------------------------------------
    // And again the last two rows separately
    //---------------------------------------------------------------------
    k  = grid_points[2]-2;
    k1 = grid_points[2]-1;
 
    for (i = 1; i <= nx2; i++) {
      m = 2;
      fac1 = 1.0/lhsp2[k][i][1];
      lhsp3[k][i][0]    = fac1*lhsp3[k][i][0];
      lhsp3[k][i][1]    = fac1*lhsp3[k][i][1];
      rhs3[k][j][i][0]  = fac1*rhs3[k][j][i][0];
      lhsp2[k1][i][1]   = lhsp2[k1][i][1] - lhsp2[k1][i][0]*lhsp3[k][i][0];
      lhsp3[k1][i][0]   = lhsp3[k1][i][0] - lhsp2[k1][i][0]*lhsp3[k][i][1];
      rhs3[k1][j][i][0] = rhs3[k1][j][i][0] - lhsp2[k1][i][0]*rhs3[k][j][i][0];

      m = 3;
      fac1 = 1.0/lhsm2[k][i][1];
      lhsm3[k][i][0]    = fac1*lhsm3[k][i][0];
      lhsm3[k][i][1]    = fac1*lhsm3[k][i][1];
      rhs3[k][j][i][1]  = fac1*rhs3[k][j][i][1];
      lhsm2[k1][i][1]   = lhsm2[k1][i][1] - lhsm2[k1][i][0]*lhsm3[k][i][0];
      lhsm3[k1][i][0]   = lhsm3[k1][i][0] - lhsm2[k1][i][0]*lhsm3[k][i][1];
      rhs3[k1][j][i][1] = rhs3[k1][j][i][1] - lhsm2[k1][i][0]*rhs3[k][j][i][1];

      //---------------------------------------------------------------------
      // Scale the last row immediately (some of this is overkill
      // if this is the last cell)
      //---------------------------------------------------------------------
      rhs3[k1][j][i][0] = rhs3[k1][j][i][0]/lhsp2[k1][i][1];
      rhs3[k1][j][i][1] = rhs3[k1][j][i][1]/lhsm2[k1][i][1];
    }


    //---------------------------------------------------------------------
    // BACKSUBSTITUTION 
    //---------------------------------------------------------------------
    k  = grid_points[2]-2;
    k1 = grid_points[2]-1;
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 3; m++) {
      rhs1[k][j][i] = rhs1[k][j][i] - lhs3[k][i][0]*rhs1[k1][j][i];
      rhs2[k][j][i][0] = rhs2[k][j][i][0] - lhs3[k][i][0]*rhs2[k1][j][i][0];
      rhs2[k][j][i][1] = rhs2[k][j][i][1] - lhs3[k][i][0]*rhs2[k1][j][i][1];
      //}

      rhs3[k][j][i][0] = rhs3[k][j][i][0] - lhsp3[k][i][0]*rhs3[k1][j][i][0];
      rhs3[k][j][i][1] = rhs3[k][j][i][1] - lhsm3[k][i][0]*rhs3[k1][j][i][1];
    }

    //---------------------------------------------------------------------
    // Whether or not this is the last processor, we always have
    // to complete the back-substitution 
    //---------------------------------------------------------------------

    //---------------------------------------------------------------------
    // The first three factors
    //---------------------------------------------------------------------
    for (k = grid_points[2]-3; k >= 0; k--) {
      k1 = k + 1;
      k2 = k + 2;
 
      for (i = 1; i <= nx2; i++) {
        //for (m = 0; m < 3; m++) {
          rhs1[k][j][i] = rhs1[k][j][i] - 
                            lhs3[k][i][0]*rhs1[k1][j][i] -
                            lhs3[k][i][1]*rhs1[k2][j][i];
        rhs2[k][j][i][0] = rhs2[k][j][i][0] - 
                            lhs3[k][i][0]*rhs2[k1][j][i][0] -
                            lhs3[k][i][1]*rhs2[k2][j][i][0];
        rhs2[k][j][i][1] = rhs2[k][j][i][1] - 
                            lhs3[k][i][0]*rhs2[k1][j][i][1] -
                            lhs3[k][i][1]*rhs2[k2][j][i][1];
        //}

        //-------------------------------------------------------------------
        // And the remaining two
        //-------------------------------------------------------------------
        rhs3[k][j][i][0] = rhs3[k][j][i][0] - 
                          lhsp3[k][i][0]*rhs3[k1][j][i][0] -
                          lhsp3[k][i][1]*rhs3[k2][j][i][0];
        rhs3[k][j][i][1] = rhs3[k][j][i][1] - 
                          lhsm3[k][i][0]*rhs3[k1][j][i][1] -
                          lhsm3[k][i][1]*rhs3[k2][j][i][1];
      }
    }
  }
  if (timeron) timer_stop(t_zsolve);

  tzetar();
}
