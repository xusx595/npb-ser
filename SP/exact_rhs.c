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
// compute the right hand side based on exact solution
//---------------------------------------------------------------------
void exact_rhs()
{
  double dtemp1, dtemp[4], xi, eta, zeta, dtpp;
  int m, i, j, k, ip1, im1, jp1, jm1, km1, kp1;

  //---------------------------------------------------------------------
  // initialize                                  
  //---------------------------------------------------------------------
  for (k = 0; k <= grid_points[2]-1; k++) {
    for (j = 0; j <= grid_points[1]-1; j++) {
#pragma simd
      for (i = 0; i <= grid_points[0]-1; i++) {
        //for (m = 0; m < 4; m++) {
          forcing1[k][j][i] = 0.0;
          forcing[k][j][i][0] = 0.0;
          forcing[k][j][i][1] = 0.0;
          forcing[k][j][i][2] = 0.0;
          forcing[k][j][i][3] = 0.0;
        //}
      }
    }
  }

  //---------------------------------------------------------------------
  // xi-direction flux differences                      
  //---------------------------------------------------------------------
  for (k = 1; k <= grid_points[2]-2; k++) {
    zeta = (double)k * dnzm1;
    for (j = 1; j <= grid_points[1]-2; j++) {
      eta = (double)j * dnym1;
#pragma simd
      for (i = 0; i <= grid_points[0]-1; i++) {
        xi = (double)i * dnxm1;

        /* TODO inline exact_solution. */
        //exact_solution(xi, eta, zeta, dtemp);
      //for (m = 0; m < 5; m++) {
        dtemp1 = ce[0][0] +
          xi  *(ce[0][1] + xi  *(ce[0][4] + xi  *(ce[0][7] + xi  *ce[0][10]))) +
          eta *(ce[0][2] + eta *(ce[0][5] + eta *(ce[0][8] + eta *ce[0][11]))) +
          zeta*(ce[0][3] + zeta*(ce[0][6] + zeta*(ce[0][9] + zeta*ce[0][12])));
        dtemp[0] = ce[1][0] +
          xi  *(ce[1][1] + xi  *(ce[1][4] + xi  *(ce[1][7] + xi  *ce[1][10]))) +
          eta *(ce[1][2] + eta *(ce[1][5] + eta *(ce[1][8] + eta *ce[1][11]))) +
          zeta*(ce[1][3] + zeta*(ce[1][6] + zeta*(ce[1][9] + zeta*ce[1][12])));
        dtemp[1] = ce[2][0] +
          xi  *(ce[2][1] + xi  *(ce[2][4] + xi  *(ce[2][7] + xi  *ce[2][10]))) +
          eta *(ce[2][2] + eta *(ce[2][5] + eta *(ce[2][8] + eta *ce[2][11]))) +
          zeta*(ce[2][3] + zeta*(ce[2][6] + zeta*(ce[2][9] + zeta*ce[2][12])));
        dtemp[2] = ce[3][0] +
          xi  *(ce[3][1] + xi  *(ce[3][4] + xi  *(ce[3][7] + xi  *ce[3][10]))) +
          eta *(ce[3][2] + eta *(ce[3][5] + eta *(ce[3][8] + eta *ce[3][11]))) +
          zeta*(ce[3][3] + zeta*(ce[3][6] + zeta*(ce[3][9] + zeta*ce[3][12])));
        dtemp[3] = ce[4][0] +
          xi  *(ce[4][1] + xi  *(ce[4][4] + xi  *(ce[4][7] + xi  *ce[4][10]))) +
          eta *(ce[4][2] + eta *(ce[4][5] + eta *(ce[4][8] + eta *ce[4][11]))) +
          zeta*(ce[4][3] + zeta*(ce[4][6] + zeta*(ce[4][9] + zeta*ce[4][12])));
        
       //}
        /*for (m = 0; m < 5; m++) {
          ue[i][m] = dtemp[m];
        }*/

        ue1[i] = dtemp1;
        ue[i][0] = dtemp[0];
        ue[i][1] = dtemp[1];
        ue[i][2] = dtemp[2];
        ue[i][3] = dtemp[3];

        dtpp = 1.0 / dtemp1;

        /*for (m = 1; m < 5; m++) {
          buf[i][m] = dtpp * dtemp[m];
        }*/
        buf1[i] = dtpp * dtemp1;
        buf[i][0] = dtpp * dtemp[0];
        buf[i][1] = dtpp * dtemp[1];
        buf[i][2] = dtpp * dtemp[2];
        buf[i][3] = dtpp * dtemp[3];

        cuf[i]    = buf[i][0] * buf[i][0];
        buf1[i] = cuf[i] + buf[i][1] * buf[i][1] + buf[i][2] * buf[i][2]; 
        q[i] = 0.5*(buf[i][0]*ue[i][0] + buf[i][1]*ue[i][1] +
                    buf[i][2]*ue[i][2]);
      }
#pragma simd
      for (i = 1; i <= grid_points[0]-2; i++) {
        im1 = i-1;
        ip1 = i+1;

        forcing1[k][j][i] = forcing1[k][j][i] -
          tx2*( ue[ip1][0]-ue[im1][0] )+
          dx1tx1*(ue1[ip1]-2.0*ue1[i]+ue1[im1]);

        forcing[k][j][i][0] = forcing[k][j][i][0] - tx2 * (
            (ue[ip1][0]*buf[ip1][0]+c2*(ue[ip1][3]-q[ip1]))-
            (ue[im1][0]*buf[im1][0]+c2*(ue[im1][3]-q[im1])))+
          xxcon1*(buf[ip1][0]-2.0*buf[i][0]+buf[im1][0])+
          dx2tx1*( ue[ip1][0]-2.0* ue[i][0]+ue[im1][0]);

        forcing[k][j][i][1] = forcing[k][j][i][1] - tx2 * (
            ue[ip1][1]*buf[ip1][0]-ue[im1][1]*buf[im1][0])+
          xxcon2*(buf[ip1][1]-2.0*buf[i][1]+buf[im1][1])+
          dx3tx1*( ue[ip1][1]-2.0*ue[i][1] +ue[im1][1]);

        forcing[k][j][i][2] = forcing[k][j][i][2] - tx2*(
            ue[ip1][2]*buf[ip1][0]-ue[im1][2]*buf[im1][0])+
          xxcon2*(buf[ip1][2]-2.0*buf[i][2]+buf[im1][2])+
          dx4tx1*( ue[ip1][2]-2.0* ue[i][2]+ ue[im1][2]);

        forcing[k][j][i][3] = forcing[k][j][i][3] - tx2*(
            buf[ip1][0]*(c1*ue[ip1][3]-c2*q[ip1])-
            buf[im1][0]*(c1*ue[im1][3]-c2*q[im1]))+
          0.5*xxcon3*(buf1[ip1]-2.0*buf1[i]+buf1[im1])+
          xxcon4*(cuf[ip1]-2.0*cuf[i]+cuf[im1])+
          xxcon5*(buf[ip1][3]-2.0*buf[i][3]+buf[im1][3])+
          dx5tx1*( ue[ip1][3]-2.0* ue[i][3]+ ue[im1][3]);
      }

      //---------------------------------------------------------------------
      // Fourth-order dissipation                         
      //---------------------------------------------------------------------
      //for (m = 0; m < 4; m++) {
        i = 1;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (5.0*ue1[i] - 4.0*ue1[i+1] +ue1[i+2]);
        i = 2;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (-4.0*ue1[i-1] + 6.0*ue1[i] -
            4.0*ue1[i+1] +     ue1[i+2]);
      //}
            
      for (m = 0; m < 4; m++) {
        i = 1;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (5.0*ue[i][m] - 4.0*ue[i+1][m] +ue[i+2][m]);
        i = 2;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (-4.0*ue[i-1][m] + 6.0*ue[i][m] -
            4.0*ue[i+1][m] +     ue[i+2][m]);
      }
#pragma simd
      for (i = 3; i <= grid_points[0]-4; i++) {
        //for (m = 0; m < 5; m++) {
          forcing1[k][j][i] = forcing1[k][j][i] - dssp*
            (ue1[i-2] - 4.0*ue1[i-1] +
             6.0*ue1[i] - 4.0*ue1[i+1] + ue1[i+2]);
          forcing[k][j][i][0] = forcing[k][j][i][0] - dssp*
            (ue[i-2][0] - 4.0*ue[i-1][0] +
             6.0*ue[i][0] - 4.0*ue[i+1][0] + ue[i+2][0]);
          forcing[k][j][i][1] = forcing[k][j][i][1] - dssp*
            (ue[i-2][1] - 4.0*ue[i-1][1] +
             6.0*ue[i][1] - 4.0*ue[i+1][1] + ue[i+2][1]);
          forcing[k][j][i][2] = forcing[k][j][i][2] - dssp*
            (ue[i-2][2] - 4.0*ue[i-1][2] +
             6.0*ue[i][2] - 4.0*ue[i+1][2] + ue[i+2][2]);
          forcing[k][j][i][3] = forcing[k][j][i][3] - dssp*
            (ue[i-2][3] - 4.0*ue[i-1][3] +
             6.0*ue[i][3] - 4.0*ue[i+1][3] + ue[i+2][3]);
        //}
      }
      //for (m = 0; m < 5; m++) {
        i = grid_points[0]-3;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (ue1[i-2] - 4.0*ue1[i-1] +
           6.0*ue1[i] - 4.0*ue1[i+1]);
        i = grid_points[0]-2;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (ue1[i-2] - 4.0*ue1[i-1] + 5.0*ue1[i]);
      //}
      
      for (m = 0; m < 4; m++) {
        i = grid_points[0]-3;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (ue[i-2][m] - 4.0*ue[i-1][m] +
           6.0*ue[i][m] - 4.0*ue[i+1][m]);
        i = grid_points[0]-2;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (ue[i-2][m] - 4.0*ue[i-1][m] + 5.0*ue[i][m]);
      }
    }
  }

  //---------------------------------------------------------------------
  // eta-direction flux differences             
  //---------------------------------------------------------------------
  for (k = 1; k <= grid_points[2]-2; k++) {
    zeta = (double)k * dnzm1;
    for (i = 1; i <= grid_points[0]-2; i++) {
      xi = (double)i * dnxm1;
#pragma simd
      for (j = 0; j <= grid_points[1]-1; j++) {
        eta = (double)j * dnym1;

        //exact_solution(xi, eta, zeta, dtemp);
        dtemp1 = ce[0][0] +
          xi  *(ce[0][1] + xi  *(ce[0][4] + xi  *(ce[0][7] + xi  *ce[0][10]))) +
          eta *(ce[0][2] + eta *(ce[0][5] + eta *(ce[0][8] + eta *ce[0][11]))) +
          zeta*(ce[0][3] + zeta*(ce[0][6] + zeta*(ce[0][9] + zeta*ce[0][12])));
        dtemp[0] = ce[1][0] +
          xi  *(ce[1][1] + xi  *(ce[1][4] + xi  *(ce[1][7] + xi  *ce[1][10]))) +
          eta *(ce[1][2] + eta *(ce[1][5] + eta *(ce[1][8] + eta *ce[1][11]))) +
          zeta*(ce[1][3] + zeta*(ce[1][6] + zeta*(ce[1][9] + zeta*ce[1][12])));
        dtemp[1] = ce[2][0] +
          xi  *(ce[2][1] + xi  *(ce[2][4] + xi  *(ce[2][7] + xi  *ce[2][10]))) +
          eta *(ce[2][2] + eta *(ce[2][5] + eta *(ce[2][8] + eta *ce[2][11]))) +
          zeta*(ce[2][3] + zeta*(ce[2][6] + zeta*(ce[2][9] + zeta*ce[2][12])));
        dtemp[2] = ce[3][0] +
          xi  *(ce[3][1] + xi  *(ce[3][4] + xi  *(ce[3][7] + xi  *ce[3][10]))) +
          eta *(ce[3][2] + eta *(ce[3][5] + eta *(ce[3][8] + eta *ce[3][11]))) +
          zeta*(ce[3][3] + zeta*(ce[3][6] + zeta*(ce[3][9] + zeta*ce[3][12])));
        dtemp[3] = ce[4][0] +
          xi  *(ce[4][1] + xi  *(ce[4][4] + xi  *(ce[4][7] + xi  *ce[4][10]))) +
          eta *(ce[4][2] + eta *(ce[4][5] + eta *(ce[4][8] + eta *ce[4][11]))) +
          zeta*(ce[4][3] + zeta*(ce[4][6] + zeta*(ce[4][9] + zeta*ce[4][12])));
        //for (m = 0; m < 5; m++) {
        //  ue[j][m] = dtemp[m];
        //}
        
        ue1[j] = dtemp1;
        ue[j][0] = dtemp[0];
        ue[j][1] = dtemp[1];
        ue[j][2] = dtemp[2];
        ue[j][3] = dtemp[3];
        
        dtpp = 1.0/dtemp1;

        /*for (m = 1; m < 5; m++) {
          buf[j][m] = dtpp * dtemp[m];
        }*/
        buf1[j] = dtpp * dtemp1;
        buf[j][0] = dtpp * dtemp[0];
        buf[j][1] = dtpp * dtemp[1];
        buf[j][2] = dtpp * dtemp[2];
        buf[j][3] = dtpp * dtemp[3];

        cuf[j]    = buf[j][1] * buf[j][1];
        buf1[j] = cuf[j] + buf[j][0] * buf[j][0] + buf[j][2] * buf[j][2];
        q[j] = 0.5*(buf[j][0]*ue[j][0] + buf[j][1]*ue[j][1] +
                    buf[j][2]*ue[j][2]);
      }

#pragma simd
      for (j = 1; j <= grid_points[1]-2; j++) {
        jm1 = j-1;
        jp1 = j+1;

        forcing1[k][j][i] = forcing1[k][j][i] -
          ty2*( ue[jp1][1]-ue[jm1][1] )+
          dy1ty1*(ue1[jp1]-2.0*ue1[j]+ue1[jm1]);

        forcing[k][j][i][0] = forcing[k][j][i][0] - ty2*(
            ue[jp1][0]*buf[jp1][1]-ue[jm1][0]*buf[jm1][1])+
          yycon2*(buf[jp1][0]-2.0*buf[j][0]+buf[jm1][0])+
          dy2ty1*( ue[jp1][0]-2.0* ue[j][0]+ ue[jm1][0]);

        forcing[k][j][i][1] = forcing[k][j][i][1] - ty2*(
            (ue[jp1][1]*buf[jp1][1]+c2*(ue[jp1][3]-q[jp1]))-
            (ue[jm1][1]*buf[jm1][1]+c2*(ue[jm1][3]-q[jm1])))+
          yycon1*(buf[jp1][1]-2.0*buf[j][1]+buf[jm1][1])+
          dy3ty1*( ue[jp1][1]-2.0*ue[j][1] +ue[jm1][1]);

        forcing[k][j][i][2] = forcing[k][j][i][2] - ty2*(
            ue[jp1][2]*buf[jp1][1]-ue[jm1][2]*buf[jm1][1])+
          yycon2*(buf[jp1][2]-2.0*buf[j][2]+buf[jm1][2])+
          dy4ty1*( ue[jp1][2]-2.0*ue[j][2]+ ue[jm1][2]);

        forcing[k][j][i][3] = forcing[k][j][i][3] - ty2*(
            buf[jp1][1]*(c1*ue[jp1][3]-c2*q[jp1])-
            buf[jm1][1]*(c1*ue[jm1][3]-c2*q[jm1]))+
          0.5*yycon3*(buf1[jp1]-2.0*buf1[j]+
              buf1[jm1])+
          yycon4*(cuf[jp1]-2.0*cuf[j]+cuf[jm1])+
          yycon5*(buf[jp1][3]-2.0*buf[j][3]+buf[jm1][3])+
          dy5ty1*(ue[jp1][3]-2.0*ue[j][3]+ue[jm1][3]);
      }

      //---------------------------------------------------------------------
      // Fourth-order dissipation                      
      //---------------------------------------------------------------------
      //for (m = 0; m < 5; m++) {
        j = 1;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (5.0*ue1[j] - 4.0*ue1[j+1] +ue1[j+2]);
        j = 2;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (-4.0*ue1[j-1] + 6.0*ue1[j] -
            4.0*ue1[j+1] +     ue1[j+2]);
      //}
      for (m = 0; m < 4; m++) {
        j = 1;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (5.0*ue[j][m] - 4.0*ue[j+1][m] +ue[j+2][m]);
        j = 2;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (-4.0*ue[j-1][m] + 6.0*ue[j][m] -
            4.0*ue[j+1][m] +     ue[j+2][m]);
      }
#pragma simd
      for (j = 3; j <= grid_points[1]-4; j++) {
        /* for (m = 0; m < 5; m++) {
          forcing[k][j][i][m] = forcing[k][j][i][m] - dssp*
            (ue[j-2][m] - 4.0*ue[j-1][m] +
             6.0*ue[j][m] - 4.0*ue[j+1][m] + ue[j+2][m]);
        }*/
          forcing1[k][j][i] = forcing1[k][j][i] - dssp*
            (ue1[j-2] - 4.0*ue1[j-1] +
             6.0*ue1[j] - 4.0*ue1[j+1] + ue1[j+2]);
          forcing[k][j][i][0] = forcing[k][j][i][0] - dssp*
            (ue[j-2][0] - 4.0*ue[j-1][0] +
             6.0*ue[j][0] - 4.0*ue[j+1][0] + ue[j+2][0]);
          forcing[k][j][i][1] = forcing[k][j][i][1] - dssp*
            (ue[j-2][1] - 4.0*ue[j-1][1] +
             6.0*ue[j][1] - 4.0*ue[j+1][1] + ue[j+2][1]);
          forcing[k][j][i][2] = forcing[k][j][i][2] - dssp*
            (ue[j-2][2] - 4.0*ue[j-1][2] +
             6.0*ue[j][2] - 4.0*ue[j+1][2] + ue[j+2][2]);
          forcing[k][j][i][3] = forcing[k][j][i][3] - dssp*
            (ue[j-2][3] - 4.0*ue[j-1][3] +
             6.0*ue[j][3] - 4.0*ue[j+1][3] + ue[j+2][3]);
      }

      //for (m = 0; m < 5; m++) {
        j = grid_points[1]-3;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (ue1[j-2] - 4.0*ue1[j-1] +
           6.0*ue1[j] - 4.0*ue1[j+1]);
        j = grid_points[1]-2;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (ue1[j-2] - 4.0*ue1[j-1] + 5.0*ue1[j]);
      //}
      
      for (m = 0; m < 4; m++) {
        j = grid_points[1]-3;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (ue[j-2][m] - 4.0*ue[j-1][m] +
           6.0*ue[j][m] - 4.0*ue[j+1][m]);
        j = grid_points[1]-2;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (ue[j-2][m] - 4.0*ue[j-1][m] + 5.0*ue[j][m]);
      }
    }
  }

  //---------------------------------------------------------------------
  // zeta-direction flux differences                      
  //---------------------------------------------------------------------
  for (j = 1; j <= grid_points[1]-2; j++) {
    eta = (double)j * dnym1;
    for (i = 1; i <= grid_points[0]-2; i++) {
      xi = (double)i * dnxm1;
#pragma simd
      for (k = 0; k <= grid_points[2]-1; k++) {
        zeta = (double)k * dnzm1;

        //exact_solution(xi, eta, zeta, dtemp);
        dtemp1 = ce[0][0] +
          xi  *(ce[0][1] + xi  *(ce[0][4] + xi  *(ce[0][7] + xi  *ce[0][10]))) +
          eta *(ce[0][2] + eta *(ce[0][5] + eta *(ce[0][8] + eta *ce[0][11]))) +
          zeta*(ce[0][3] + zeta*(ce[0][6] + zeta*(ce[0][9] + zeta*ce[0][12])));
        dtemp[0] = ce[1][0] +
          xi  *(ce[1][1] + xi  *(ce[1][4] + xi  *(ce[1][7] + xi  *ce[1][10]))) +
          eta *(ce[1][2] + eta *(ce[1][5] + eta *(ce[1][8] + eta *ce[1][11]))) +
          zeta*(ce[1][3] + zeta*(ce[1][6] + zeta*(ce[1][9] + zeta*ce[1][12])));
        dtemp[1] = ce[2][0] +
          xi  *(ce[2][1] + xi  *(ce[2][4] + xi  *(ce[2][7] + xi  *ce[2][10]))) +
          eta *(ce[2][2] + eta *(ce[2][5] + eta *(ce[2][8] + eta *ce[2][11]))) +
          zeta*(ce[2][3] + zeta*(ce[2][6] + zeta*(ce[2][9] + zeta*ce[2][12])));
        dtemp[2] = ce[3][0] +
          xi  *(ce[3][1] + xi  *(ce[3][4] + xi  *(ce[3][7] + xi  *ce[3][10]))) +
          eta *(ce[3][2] + eta *(ce[3][5] + eta *(ce[3][8] + eta *ce[3][11]))) +
          zeta*(ce[3][3] + zeta*(ce[3][6] + zeta*(ce[3][9] + zeta*ce[3][12])));
        dtemp[3] = ce[4][0] +
          xi  *(ce[4][1] + xi  *(ce[4][4] + xi  *(ce[4][7] + xi  *ce[4][10]))) +
          eta *(ce[4][2] + eta *(ce[4][5] + eta *(ce[4][8] + eta *ce[4][11]))) +
          zeta*(ce[4][3] + zeta*(ce[4][6] + zeta*(ce[4][9] + zeta*ce[4][12])));
        /*for (m = 0; m < 5; m++) {
          ue[k][m] = dtemp[m];
        }*/
        ue1[k] = dtemp1;
        ue[k][0] = dtemp[0];
        ue[k][1] = dtemp[1];
        ue[k][2] = dtemp[2];
        ue[k][3] = dtemp[3];

        dtpp = 1.0/dtemp1;

        /*for (m = 1; m < 5; m++) {
          buf[k][m] = dtpp * dtemp[m];
        }*/
        buf1[k] = dtpp * dtemp1;
        buf[k][0] = dtpp * dtemp[0];
        buf[k][1] = dtpp * dtemp[1];
        buf[k][2] = dtpp * dtemp[2];
        buf[k][3] = dtpp * dtemp[3];


        cuf[k]    = buf[k][2] * buf[k][2];
        buf1[k] = cuf[k] + buf[k][0] * buf[k][0] + buf[k][1] * buf[k][1];
        q[k] = 0.5*(buf[k][0]*ue[k][0] + buf[k][1]*ue[k][1] +
                    buf[k][2]*ue[k][2]);
      }
      
#pragma simd
      for (k = 1; k <= grid_points[2]-2; k++) {
        km1 = k-1;
        kp1 = k+1;

        forcing1[k][j][i] = forcing1[k][j][i] -
          tz2*( ue[kp1][2]-ue[km1][2] )+
          dz1tz1*(ue1[kp1]-2.0*ue1[k]+ue1[km1]);

        forcing[k][j][i][0] = forcing[k][j][i][0] - tz2 * (
            ue[kp1][0]*buf[kp1][2]-ue[km1][0]*buf[km1][2])+
          zzcon2*(buf[kp1][0]-2.0*buf[k][0]+buf[km1][0])+
          dz2tz1*( ue[kp1][0]-2.0* ue[k][0]+ ue[km1][0]);

        forcing[k][j][i][1] = forcing[k][j][i][1] - tz2 * (
            ue[kp1][1]*buf[kp1][2]-ue[km1][1]*buf[km1][2])+
          zzcon2*(buf[kp1][1]-2.0*buf[k][1]+buf[km1][1])+
          dz3tz1*(ue[kp1][1]-2.0*ue[k][1]+ue[km1][1]);

        forcing[k][j][i][2] = forcing[k][j][i][2] - tz2 * (
            (ue[kp1][2]*buf[kp1][2]+c2*(ue[kp1][3]-q[kp1]))-
            (ue[km1][2]*buf[km1][2]+c2*(ue[km1][3]-q[km1])))+
          zzcon1*(buf[kp1][2]-2.0*buf[k][2]+buf[km1][2])+
          dz4tz1*( ue[kp1][2]-2.0*ue[k][2] +ue[km1][2]);

        forcing[k][j][i][3] = forcing[k][j][i][3] - tz2 * (
            buf[kp1][2]*(c1*ue[kp1][3]-c2*q[kp1])-
            buf[km1][2]*(c1*ue[km1][3]-c2*q[km1]))+
          0.5*zzcon3*(buf1[kp1]-2.0*buf1[k]+buf1[km1])+
          zzcon4*(cuf[kp1]-2.0*cuf[k]+cuf[km1])+
          zzcon5*(buf[kp1][3]-2.0*buf[k][3]+buf[km1][3])+
          dz5tz1*( ue[kp1][3]-2.0*ue[k][3]+ ue[km1][3]);
      }

      //---------------------------------------------------------------------
      // Fourth-order dissipation
      //---------------------------------------------------------------------
      //for (m = 0; m < 5; m++) {
        k = 1;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (5.0*ue1[k] - 4.0*ue1[k+1] +ue1[k+2]);
        k = 2;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (-4.0*ue1[k-1] + 6.0*ue1[k] -
            4.0*ue1[k+1] +     ue1[k+2]);
      //}
      for (m = 0; m < 4; m++) {
        k = 1;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (5.0*ue[k][m] - 4.0*ue[k+1][m] +ue[k+2][m]);
        k = 2;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (-4.0*ue[k-1][m] + 6.0*ue[k][m] -
            4.0*ue[k+1][m] +     ue[k+2][m]);
      }
      
#pragma simd
      for (k = 3; k <= grid_points[2]-4; k++) {
        //for (m = 0; m < 5; m++) {
          forcing1[k][j][i] = forcing1[k][j][i] - dssp*
            (ue1[k-2] - 4.0*ue1[k-1] +
             6.0*ue1[k] - 4.0*ue1[k+1] + ue1[k+2]);
        forcing[k][j][i][0] = forcing[k][j][i][0] - dssp*
            (ue[k-2][0] - 4.0*ue[k-1][0] +
             6.0*ue[k][0] - 4.0*ue[k+1][0] + ue[k+2][0]);
        forcing[k][j][i][1] = forcing[k][j][i][1] - dssp*
            (ue[k-2][1] - 4.0*ue[k-1][1] +
             6.0*ue[k][1] - 4.0*ue[k+1][1] + ue[k+2][1]);
        forcing[k][j][i][2] = forcing[k][j][i][2] - dssp*
            (ue[k-2][2] - 4.0*ue[k-1][2] +
             6.0*ue[k][2] - 4.0*ue[k+1][2] + ue[k+2][2]);
        forcing[k][j][i][3] = forcing[k][j][i][3] - dssp*
            (ue[k-2][3] - 4.0*ue[k-1][3] +
             6.0*ue[k][3] - 4.0*ue[k+1][3] + ue[k+2][3]);
        //}
      }
      //for (m = 0; m < 5; m++) {
        k = grid_points[2]-3;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (ue1[k-2] - 4.0*ue1[k-1] +
           6.0*ue1[k] - 4.0*ue1[k+1]);
        k = grid_points[2]-2;
        forcing1[k][j][i] = forcing1[k][j][i] - dssp *
          (ue1[k-2] - 4.0*ue1[k-1] + 5.0*ue1[k]);
      //}
      
      for (m = 0; m < 4; m++) {
        k = grid_points[2]-3;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (ue[k-2][m] - 4.0*ue[k-1][m] +
           6.0*ue[k][m] - 4.0*ue[k+1][m]);
        k = grid_points[2]-2;
        forcing[k][j][i][m] = forcing[k][j][i][m] - dssp *
          (ue[k-2][m] - 4.0*ue[k-1][m] + 5.0*ue[k][m]);
      }

    }
  }

  //---------------------------------------------------------------------
  // now change the sign of the forcing function, 
  //---------------------------------------------------------------------
  for (k = 1; k <= grid_points[2]-2; k++) {
    for (j = 1; j <= grid_points[1]-2; j++) {
#pragma simd
      for (i = 1; i <= grid_points[0]-2; i++) {
        //for (m = 0; m < 5; m++) {
        forcing1[k][j][i] = -1.0 * forcing1[k][j][i];
        forcing[k][j][i][0] = -1.0 * forcing[k][j][i][0];
        forcing[k][j][i][1] = -1.0 * forcing[k][j][i][1];
        forcing[k][j][i][2] = -1.0 * forcing[k][j][i][2];
        forcing[k][j][i][3] = -1.0 * forcing[k][j][i][3];
        //}
      }
    }
  }
}

