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

#include <math.h>
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

void compute_rhs()
{
  int i, j, k, m;
  double aux, rho_inv, uijk, up1, um1, vijk, vp1, vm1, wijk, wp1, wm1;


  if (timeron) timer_start(t_rhs);
  //---------------------------------------------------------------------
  // compute the reciprocal of density, and the kinetic energy, 
  // and the speed of sound. 
  //---------------------------------------------------------------------
  for (k = 0; k <= grid_points[2]-1; k++) {
    for (j = 0; j <= grid_points[1]-1; j++) {
      int new_i_upper = (grid_points[0]-1)/4*4;
      for (i = 0; i < 4; i++) {
        rho_inv = 1.0/u1[k][j][i];
        rho_i[k][j][i] = rho_inv;
        us[k][j][i] = u[k][j][i][0] * rho_inv;
        vs[k][j][i] = u[k][j][i][1] * rho_inv;
        ws[k][j][i] = u[k][j][i][2] * rho_inv;
        square[k][j][i] = 0.5* (
            u[k][j][i][0]*u[k][j][i][0] + 
            u[k][j][i][1]*u[k][j][i][1] +
            u[k][j][i][2]*u[k][j][i][2] ) * rho_inv;
        qs[k][j][i] = square[k][j][i] * rho_inv;
        //-------------------------------------------------------------------
        // (don't need speed and ainx until the lhs computation)
        //-------------------------------------------------------------------
        aux = c1c2*rho_inv* (u[k][j][i][3] - square[k][j][i]);
        speed[k][j][i] = sqrt(aux);
      }
      /* SIMD loops */
      for (i = 4; i <new_i_upper; i+=4) {
        /*rho_inv = 1.0/u1[k][j][i];*/
        __m256d vrho_ivn = _mm256_div_pd(_mm256_set1_pd(1.0f),
                                                                _mm256_loadu_pd(&u1[k][j][i]));
        /*rho_i[k][j][i] = rho_inv;*/
        _mm256_storeu_pd(&rho_i[k][j][i], vrho_ivn);

        /* load u*/
        __m256d u0 = _mm256_load_pd(&u[k][j][i][0]);
        __m256d u1 = _mm256_load_pd(&u[k][j][i+1][0]);
        __m256d u2 = _mm256_load_pd(&u[k][j][i+2][0]);
        __m256d u3 = _mm256_load_pd(&u[k][j][i+3][0]);
        interleave (&u0, &u1, &u2, &u3);

        /*us[k][j][i] = u[k][j][i][0] * rho_inv;*/
        _mm256_storeu_pd(&us[k][j][i], _mm256_mul_pd(u0, vrho_ivn));
        /*vs[k][j][i] = u[k][j][i][1] * rho_inv;*/
        _mm256_storeu_pd(&vs[k][j][i], _mm256_mul_pd(u1, vrho_ivn));
        
        /*ws[k][j][i] = u[k][j][i][2] * rho_inv;*/
        _mm256_storeu_pd(&ws[k][j][i], _mm256_mul_pd(u2, vrho_ivn));

        __m256d tmp0 = _mm256_mul_pd(u0, u0);
        __m256d tmp1 = _mm256_mul_pd(u1, u1);
        __m256d tmp2 = _mm256_mul_pd(u2, u2);

        tmp0 = _mm256_add_pd(tmp0, tmp1);
        tmp0 = _mm256_add_pd(tmp0, tmp2);

        tmp0 = _mm256_mul_pd(_mm256_set1_pd(0.5f), tmp0);
        tmp0 = _mm256_mul_pd(tmp0, vrho_ivn);

        _mm256_storeu_pd(&square[k][j][i], tmp0);
        
        /*square[k][j][i] = 0.5* (
            u[k][j][i][0]*u[k][j][i][0] + 
            u[k][j][i][1]*u[k][j][i][1] +
            u[k][j][i][2]*u[k][j][i][2] ) * rho_inv;*/
        
        /*qs[k][j][i] = square[k][j][i] * rho_inv;*/
        _mm256_storeu_pd(&qs[k][j][i], _mm256_mul_pd(tmp0, vrho_ivn));
        //-------------------------------------------------------------------
        // (don't need speed and ainx until the lhs computation)
        //-------------------------------------------------------------------
        //aux = c1c2*rho_inv* (u[k][j][i][3] - square[k][j][i]);
        tmp1 = _mm256_sub_pd(u3, tmp0);
        tmp2 = _mm256_mul_pd(_mm256_set1_pd(c1c2), vrho_ivn);
        tmp2 = _mm256_mul_pd(tmp2, tmp1);
        
        /*speed[k][j][i] = sqrt(aux);*/
        _mm256_storeu_pd(&speed[k][j][i], _mm256_sqrt_pd(tmp2));
      }

      for (i = new_i_upper; i <= grid_points[0]-1; i++) {
        rho_inv = 1.0/u1[k][j][i];
        rho_i[k][j][i] = rho_inv;
        us[k][j][i] = u[k][j][i][0] * rho_inv;
        vs[k][j][i] = u[k][j][i][1] * rho_inv;
        ws[k][j][i] = u[k][j][i][2] * rho_inv;
        square[k][j][i] = 0.5* (
            u[k][j][i][0]*u[k][j][i][0] + 
            u[k][j][i][1]*u[k][j][i][1] +
            u[k][j][i][2]*u[k][j][i][2] ) * rho_inv;
        qs[k][j][i] = square[k][j][i] * rho_inv;
        //-------------------------------------------------------------------
        // (don't need speed and ainx until the lhs computation)
        //-------------------------------------------------------------------
        aux = c1c2*rho_inv* (u[k][j][i][3] - square[k][j][i]);
        speed[k][j][i] = sqrt(aux);
      }
    }
  }

  //---------------------------------------------------------------------
  // copy the exact forcing term to the right hand side;  because 
  // this forcing term is known, we can store it on the whole grid
  // including the boundary                   
  //---------------------------------------------------------------------
  for (k = 0; k <= grid_points[2]-1; k++) {
    for (j = 0; j <= grid_points[1]-1; j++) {
      int new_i_upper = (grid_points[0]-1)/4*4;
      for (i = 0; i < 4; i++) {
        /*for (m = 0; m < 5; m++) {
          rhs[k][j][i][m] = forcing[k][j][i][m];
        }*/
        rhs1[k][j][i] = forcing1[k][j][i];
        rhs[k][j][i][0] = forcing[k][j][i][0];
        rhs[k][j][i][1] = forcing[k][j][i][1];
        rhs[k][j][i][2] = forcing[k][j][i][2];
        rhs[k][j][i][3] = forcing[k][j][i][3];
      }
      for (i = 4; i < new_i_upper; i+=4) {
        /*for (m = 0; m < 5; m++) {
          rhs[k][j][i][m] = forcing[k][j][i][m];
        }*/
        /*rhs1[k][j][i] = forcing1[k][j][i];*/
        _mm256_storeu_pd(&rhs1[k][j][i], _mm256_loadu_pd(&forcing1[k][j][i]));
        /*rhs[k][j][i][0] = forcing[k][j][i][0];
        rhs[k][j][i][1] = forcing[k][j][i][1];
        rhs[k][j][i][2] = forcing[k][j][i][2];
        rhs[k][j][i][3] = forcing[k][j][i][3];*/
        _mm256_storeu_pd(&rhs[k][j][i][0], _mm256_loadu_pd(&forcing[k][j][i][0]));
        _mm256_storeu_pd(&rhs[k][j][i+1][0], _mm256_loadu_pd(&forcing[k][j][i+1][0]));
        _mm256_storeu_pd(&rhs[k][j][i+2][0], _mm256_loadu_pd(&forcing[k][j][i+2][0]));
        _mm256_storeu_pd(&rhs[k][j][i+3][0], _mm256_loadu_pd(&forcing[k][j][i+3][0]));
      }
      for (i = 0; i <= grid_points[0]-1; i++) {
        /*for (m = 0; m < 5; m++) {
          rhs[k][j][i][m] = forcing[k][j][i][m];
        }*/
        rhs1[k][j][i] = forcing1[k][j][i];
        rhs[k][j][i][0] = forcing[k][j][i][0];
        rhs[k][j][i][1] = forcing[k][j][i][1];
        rhs[k][j][i][2] = forcing[k][j][i][2];
        rhs[k][j][i][3] = forcing[k][j][i][3];
      }
    }
  }

  //---------------------------------------------------------------------
  // compute xi-direction fluxes 
  //---------------------------------------------------------------------
  if (timeron) timer_start(t_rhsx);
  for (k = 1; k <= nz2; k++) {
    for (j = 1; j <= ny2; j++) {
#pragma simd
      for (i = 1; i <= nx2; i++) {
        uijk = us[k][j][i];
        up1  = us[k][j][i+1];
        um1  = us[k][j][i-1];

        rhs1[k][j][i] = rhs1[k][j][i] + dx1tx1 * 
          (u1[k][j][i+1] - 2.0*u1[k][j][i] + u1[k][j][i-1]) -
          tx2 * (u[k][j][i+1][0] - u[k][j][i-1][0]);

        rhs[k][j][i][0] = rhs[k][j][i][0] + dx2tx1 * 
          (u[k][j][i+1][0] - 2.0*u[k][j][i][0] + u[k][j][i-1][0]) +
          xxcon2*con43 * (up1 - 2.0*uijk + um1) -
          tx2 * (u[k][j][i+1][0]*up1 - u[k][j][i-1][0]*um1 +
                (u[k][j][i+1][3] - square[k][j][i+1] -
                 u[k][j][i-1][3] + square[k][j][i-1]) * c2);

        rhs[k][j][i][1] = rhs[k][j][i][1] + dx3tx1 * 
          (u[k][j][i+1][1] - 2.0*u[k][j][i][1] + u[k][j][i-1][1]) +
          xxcon2 * (vs[k][j][i+1] - 2.0*vs[k][j][i] + vs[k][j][i-1]) -
          tx2 * (u[k][j][i+1][1]*up1 - u[k][j][i-1][1]*um1);

        rhs[k][j][i][2] = rhs[k][j][i][2] + dx4tx1 * 
          (u[k][j][i+1][2] - 2.0*u[k][j][i][2] + u[k][j][i-1][2]) +
          xxcon2 * (ws[k][j][i+1] - 2.0*ws[k][j][i] + ws[k][j][i-1]) -
          tx2 * (u[k][j][i+1][2]*up1 - u[k][j][i-1][2]*um1);

        rhs[k][j][i][3] = rhs[k][j][i][3] + dx5tx1 * 
          (u[k][j][i+1][3] - 2.0*u[k][j][i][3] + u[k][j][i-1][3]) +
          xxcon3 * (qs[k][j][i+1] - 2.0*qs[k][j][i] + qs[k][j][i-1]) +
          xxcon4 * (up1*up1 -       2.0*uijk*uijk + um1*um1) +
          xxcon5 * (u[k][j][i+1][3]*rho_i[k][j][i+1] - 
                2.0*u[k][j][i][3]*rho_i[k][j][i] +
                    u[k][j][i-1][3]*rho_i[k][j][i-1]) -
          tx2 * ( (c1*u[k][j][i+1][3] - c2*square[k][j][i+1])*up1 -
                  (c1*u[k][j][i-1][3] - c2*square[k][j][i-1])*um1 );
      }
    }

    //---------------------------------------------------------------------
    // add fourth order xi-direction dissipation               
    //---------------------------------------------------------------------
#pragma simd
    for (j = 1; j <= ny2; j++) {
      i = 1;
      /*for (m = 0; m < 5; m++) {
        rhs[k][j][i][m] = rhs[k][j][i][m]- dssp * 
          (5.0*u[k][j][i][m] - 4.0*u[k][j][i+1][m] + u[k][j][i+2][m]);
      }*/
      rhs1[k][j][i] = rhs1[k][j][i]- dssp * 
          (5.0*u1[k][j][i] - 4.0*u1[k][j][i+1] + u1[k][j][i+2]);
      rhs[k][j][i][0] = rhs[k][j][i][0]- dssp * 
          (5.0*u[k][j][i][0] - 4.0*u[k][j][i+1][0] + u[k][j][i+2][0]);
      rhs[k][j][i][1] = rhs[k][j][i][1]- dssp * 
          (5.0*u[k][j][i][1] - 4.0*u[k][j][i+1][1] + u[k][j][i+2][1]);
      rhs[k][j][i][2] = rhs[k][j][i][2]- dssp * 
          (5.0*u[k][j][i][2] - 4.0*u[k][j][i+1][2] + u[k][j][i+2][2]);
      rhs[k][j][i][3] = rhs[k][j][i][3]- dssp * 
          (5.0*u[k][j][i][3] - 4.0*u[k][j][i+1][3] + u[k][j][i+2][3]);

      i = 2;
      /*for (m = 0; m < 5; m++) {
        rhs[k][j][i][m] = rhs[k][j][i][m] - dssp * 
          (-4.0*u[k][j][i-1][m] + 6.0*u[k][j][i][m] -
            4.0*u[k][j][i+1][m] + u[k][j][i+2][m]);
      }*/
      rhs1[k][j][i] = rhs1[k][j][i] - dssp * 
          (-4.0*u1[k][j][i-1] + 6.0*u1[k][j][i] -
            4.0*u1[k][j][i+1] + u1[k][j][i+2]);
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp * 
          (-4.0*u[k][j][i-1][0] + 6.0*u[k][j][i][0] -
            4.0*u[k][j][i+1][0] + u[k][j][i+2][0]);
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp * 
          (-4.0*u[k][j][i-1][1] + 6.0*u[k][j][i][1] -
            4.0*u[k][j][i+1][1] + u[k][j][i+2][1]);
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp * 
          (-4.0*u[k][j][i-1][2] + 6.0*u[k][j][i][2] -
            4.0*u[k][j][i+1][2] + u[k][j][i+2][2]);
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp * 
          (-4.0*u[k][j][i-1][3] + 6.0*u[k][j][i][3] -
            4.0*u[k][j][i+1][3] + u[k][j][i+2][3]);
    }

    for (j = 1; j <= ny2; j++) {
#pragma simd
      for (i = 3; i <= nx2-2; i++) {
        /*for (m = 0; m < 5; m++) {
          rhs[k][j][i][m] = rhs[k][j][i][m] - dssp * 
            ( u[k][j][i-2][m] - 4.0*u[k][j][i-1][m] + 
            6.0*u[k][j][i][m] - 4.0*u[k][j][i+1][m] + 
              u[k][j][i+2][m] );
        }*/
        rhs1[k][j][i] = rhs1[k][j][i] - dssp * 
            ( u1[k][j][i-2] - 4.0*u1[k][j][i-1] + 
            6.0*u1[k][j][i] - 4.0*u1[k][j][i+1] + 
              u1[k][j][i+2] );
        rhs[k][j][i][0] = rhs[k][j][i][0] - dssp * 
            ( u[k][j][i-2][0] - 4.0*u[k][j][i-1][0] + 
            6.0*u[k][j][i][0] - 4.0*u[k][j][i+1][0] + 
              u[k][j][i+2][0] );
        rhs[k][j][i][1] = rhs[k][j][i][1] - dssp * 
            ( u[k][j][i-2][1] - 4.0*u[k][j][i-1][1] + 
            6.0*u[k][j][i][1] - 4.0*u[k][j][i+1][1] + 
              u[k][j][i+2][1] );
        rhs[k][j][i][2] = rhs[k][j][i][2] - dssp * 
            ( u[k][j][i-2][2] - 4.0*u[k][j][i-1][2] + 
            6.0*u[k][j][i][2] - 4.0*u[k][j][i+1][2] + 
              u[k][j][i+2][2] );
        rhs[k][j][i][3] = rhs[k][j][i][3] - dssp * 
            ( u[k][j][i-2][3] - 4.0*u[k][j][i-1][3] + 
            6.0*u[k][j][i][3] - 4.0*u[k][j][i+1][3] + 
              u[k][j][i+2][3] );

      }
    }
#pragma simd
    for (j = 1; j <= ny2; j++) {
      i = nx2-1;
      /*for (m = 0; m < 5; m++) {
        rhs[k][j][i][m] = rhs[k][j][i][m] - dssp *
          ( u[k][j][i-2][m] - 4.0*u[k][j][i-1][m] + 
          6.0*u[k][j][i][m] - 4.0*u[k][j][i+1][m] );
      }*/
      rhs1[k][j][i] = rhs1[k][j][i] - dssp *
          ( u1[k][j][i-2] - 4.0*u1[k][j][i-1] + 
          6.0*u1[k][j][i] - 4.0*u1[k][j][i+1] );
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp *
          ( u[k][j][i-2][0] - 4.0*u[k][j][i-1][0] + 
          6.0*u[k][j][i][0] - 4.0*u[k][j][i+1][0] );
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp *
          ( u[k][j][i-2][1] - 4.0*u[k][j][i-1][1] + 
          6.0*u[k][j][i][1] - 4.0*u[k][j][i+1][1] );
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp *
          ( u[k][j][i-2][2] - 4.0*u[k][j][i-1][2] + 
          6.0*u[k][j][i][2] - 4.0*u[k][j][i+1][2] );
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp *
          ( u[k][j][i-2][3] - 4.0*u[k][j][i-1][3] + 
          6.0*u[k][j][i][3] - 4.0*u[k][j][i+1][3] );

      i = nx2;
      /*for (m = 0; m < 5; m++) {
        rhs[k][j][i][m] = rhs[k][j][i][m] - dssp *
          ( u[k][j][i-2][m] - 4.0*u[k][j][i-1][m] + 5.0*u[k][j][i][m] );
      }*/
      rhs1[k][j][i] = rhs1[k][j][i] - dssp *
          ( u1[k][j][i-2] - 4.0*u1[k][j][i-1] + 5.0*u1[k][j][i]);
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp *
          ( u[k][j][i-2][0] - 4.0*u[k][j][i-1][0] + 5.0*u[k][j][i][0] );
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp *
          ( u[k][j][i-2][1] - 4.0*u[k][j][i-1][1] + 5.0*u[k][j][i][1] );
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp *
          ( u[k][j][i-2][2] - 4.0*u[k][j][i-1][2] + 5.0*u[k][j][i][2] );
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp *
          ( u[k][j][i-2][3] - 4.0*u[k][j][i-1][3] + 5.0*u[k][j][i][3] );
    }
  }
  if (timeron) timer_stop(t_rhsx);

  //---------------------------------------------------------------------
  // compute eta-direction fluxes 
  //---------------------------------------------------------------------
  if (timeron) timer_start(t_rhsy);
  for (k = 1; k <= nz2; k++) {
    for (j = 1; j <= ny2; j++) {
#pragma simd
      for (i = 1; i <= nx2; i++) {
        vijk = vs[k][j][i];
        vp1  = vs[k][j+1][i];
        vm1  = vs[k][j-1][i];

        rhs1[k][j][i] = rhs1[k][j][i] + dy1ty1 * 
          (u1[k][j+1][i] - 2.0*u1[k][j][i] + u1[k][j-1][i]) -
          ty2 * (u[k][j+1][i][1] - u[k][j-1][i][1]);

        rhs[k][j][i][0] = rhs[k][j][i][0] + dy2ty1 * 
          (u[k][j+1][i][0] - 2.0*u[k][j][i][0] + u[k][j-1][i][0]) +
          yycon2 * (us[k][j+1][i] - 2.0*us[k][j][i] + us[k][j-1][i]) -
          ty2 * (u[k][j+1][i][0]*vp1 - u[k][j-1][i][0]*vm1);

        rhs[k][j][i][1] = rhs[k][j][i][1] + dy3ty1 * 
          (u[k][j+1][i][1] - 2.0*u[k][j][i][1] + u[k][j-1][i][1]) +
          yycon2*con43 * (vp1 - 2.0*vijk + vm1) -
          ty2 * (u[k][j+1][i][1]*vp1 - u[k][j-1][i][1]*vm1 +
                (u[k][j+1][i][3] - square[k][j+1][i] - 
                 u[k][j-1][i][3] + square[k][j-1][i]) * c2);

        rhs[k][j][i][2] = rhs[k][j][i][2] + dy4ty1 * 
          (u[k][j+1][i][2] - 2.0*u[k][j][i][2] + u[k][j-1][i][2]) +
          yycon2 * (ws[k][j+1][i] - 2.0*ws[k][j][i] + ws[k][j-1][i]) -
          ty2 * (u[k][j+1][i][2]*vp1 - u[k][j-1][i][2]*vm1);

        rhs[k][j][i][3] = rhs[k][j][i][3] + dy5ty1 * 
          (u[k][j+1][i][3] - 2.0*u[k][j][i][3] + u[k][j-1][i][3]) +
          yycon3 * (qs[k][j+1][i] - 2.0*qs[k][j][i] + qs[k][j-1][i]) +
          yycon4 * (vp1*vp1       - 2.0*vijk*vijk + vm1*vm1) +
          yycon5 * (u[k][j+1][i][3]*rho_i[k][j+1][i] - 
                  2.0*u[k][j][i][3]*rho_i[k][j][i] +
                    u[k][j-1][i][3]*rho_i[k][j-1][i]) -
          ty2 * ((c1*u[k][j+1][i][3] - c2*square[k][j+1][i]) * vp1 -
                 (c1*u[k][j-1][i][3] - c2*square[k][j-1][i]) * vm1);
      }
    }

    //---------------------------------------------------------------------
    // add fourth order eta-direction dissipation         
    //---------------------------------------------------------------------
    j = 1;
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
      rhs1[k][j][i] = rhs1[k][j][i]- dssp * 
          ( 5.0*u1[k][j][i] - 4.0*u1[k][j+1][i] + u1[k][j+2][i]);
      rhs[k][j][i][0] = rhs[k][j][i][0]- dssp * 
          ( 5.0*u[k][j][i][0] - 4.0*u[k][j+1][i][0] + u[k][j+2][i][0]);
      rhs[k][j][i][1] = rhs[k][j][i][1]- dssp * 
          ( 5.0*u[k][j][i][1] - 4.0*u[k][j+1][i][1] + u[k][j+2][i][1]);
      rhs[k][j][i][2] = rhs[k][j][i][2]- dssp * 
          ( 5.0*u[k][j][i][2] - 4.0*u[k][j+1][i][2] + u[k][j+2][i][2]);
      rhs[k][j][i][3] = rhs[k][j][i][3]- dssp * 
          ( 5.0*u[k][j][i][3] - 4.0*u[k][j+1][i][3] + u[k][j+2][i][3]);
      //}
    }

    j = 2;
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
      rhs1[k][j][i] = rhs1[k][j][i] - dssp * 
          (-4.0*u1[k][j-1][i] + 6.0*u1[k][j][i] -
            4.0*u1[k][j+1][i] + u1[k][j+2][i]);
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp * 
          (-4.0*u[k][j-1][i][0] + 6.0*u[k][j][i][0] -
            4.0*u[k][j+1][i][0] + u[k][j+2][i][0]);
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp * 
          (-4.0*u[k][j-1][i][1] + 6.0*u[k][j][i][1] -
            4.0*u[k][j+1][i][1] + u[k][j+2][i][1]);
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp * 
          (-4.0*u[k][j-1][i][2] + 6.0*u[k][j][i][2] -
            4.0*u[k][j+1][i][2] + u[k][j+2][i][2]);
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp * 
          (-4.0*u[k][j-1][i][3] + 6.0*u[k][j][i][3] -
            4.0*u[k][j+1][i][3] + u[k][j+2][i][3]);
      //}
    }

    for (j = 3; j <= ny2-2; j++) {
#pragma simd
      for (i = 1; i <= nx2; i++) {
        //for (m = 0; m < 5; m++) {
          rhs1[k][j][i]= rhs1[k][j][i] - dssp * 
            ( u1[k][j-2][i] - 4.0*u1[k][j-1][i] + 
            6.0*u1[k][j][i] - 4.0*u1[k][j+1][i]+ 
              u1[k][j+2][i] );
        rhs[k][j][i][0] = rhs[k][j][i][0] - dssp * 
            ( u[k][j-2][i][0] - 4.0*u[k][j-1][i][0] + 
            6.0*u[k][j][i][0] - 4.0*u[k][j+1][i][0] + 
              u[k][j+2][i][0] );
        rhs[k][j][i][1] = rhs[k][j][i][1] - dssp * 
            ( u[k][j-2][i][1] - 4.0*u[k][j-1][i][1] + 
            6.0*u[k][j][i][1] - 4.0*u[k][j+1][i][1] + 
              u[k][j+2][i][1] );
        rhs[k][j][i][2] = rhs[k][j][i][2] - dssp * 
            ( u[k][j-2][i][2] - 4.0*u[k][j-1][i][2] + 
            6.0*u[k][j][i][2] - 4.0*u[k][j+1][i][2] + 
              u[k][j+2][i][2] );
        rhs[k][j][i][3] = rhs[k][j][i][3] - dssp * 
            ( u[k][j-2][i][3] - 4.0*u[k][j-1][i][3] + 
            6.0*u[k][j][i][3] - 4.0*u[k][j+1][i][3] + 
              u[k][j+2][i][3] );
        //}
      }
    }

    j = ny2-1;
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
      rhs1[k][j][i] = rhs1[k][j][i] - dssp *
          ( u1[k][j-2][i] - 4.0*u1[k][j-1][i] + 
          6.0*u1[k][j][i] - 4.0*u1[k][j+1][i] );
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp *
          ( u[k][j-2][i][0] - 4.0*u[k][j-1][i][0] + 
          6.0*u[k][j][i][0] - 4.0*u[k][j+1][i][0] );
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp *
          ( u[k][j-2][i][1] - 4.0*u[k][j-1][i][1] + 
          6.0*u[k][j][i][1] - 4.0*u[k][j+1][i][1] );
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp *
          ( u[k][j-2][i][2] - 4.0*u[k][j-1][i][2] + 
          6.0*u[k][j][i][2] - 4.0*u[k][j+1][i][2] );
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp *
          ( u[k][j-2][i][3] - 4.0*u[k][j-1][i][3] + 
          6.0*u[k][j][i][3] - 4.0*u[k][j+1][i][3] );
      //}
    }

    j = ny2;
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
      rhs1[k][j][i] = rhs1[k][j][i] - dssp *
          ( u1[k][j-2][i] - 4.0*u1[k][j-1][i] + 5.0*u1[k][j][i] );
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp *
          ( u[k][j-2][i][0] - 4.0*u[k][j-1][i][0] + 5.0*u[k][j][i][0] );
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp *
          ( u[k][j-2][i][1] - 4.0*u[k][j-1][i][1] + 5.0*u[k][j][i][1] );
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp *
          ( u[k][j-2][i][2] - 4.0*u[k][j-1][i][2] + 5.0*u[k][j][i][2] );
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp *
          ( u[k][j-2][i][3] - 4.0*u[k][j-1][i][3] + 5.0*u[k][j][i][3] );
      //}
    }
  }
  if (timeron) timer_stop(t_rhsy);

  //---------------------------------------------------------------------
  // compute zeta-direction fluxes 
  //---------------------------------------------------------------------
  if (timeron) timer_start(t_rhsz);
  for (k = 1; k <= nz2; k++) {
    for (j = 1; j <= ny2; j++) {
#pragma simd
      for (i = 1; i <= nx2; i++) {
        wijk = ws[k][j][i];
        wp1  = ws[k+1][j][i];
        wm1  = ws[k-1][j][i];

        rhs1[k][j][i] = rhs1[k][j][i] + dz1tz1 * 
          (u1[k+1][j][i] - 2.0*u1[k][j][i] + u1[k-1][j][i]) -
          tz2 * (u[k+1][j][i][2] - u[k-1][j][i][2]);

        rhs[k][j][i][0] = rhs[k][j][i][0] + dz2tz1 * 
          (u[k+1][j][i][0] - 2.0*u[k][j][i][0] + u[k-1][j][i][0]) +
          zzcon2 * (us[k+1][j][i] - 2.0*us[k][j][i] + us[k-1][j][i]) -
          tz2 * (u[k+1][j][i][0]*wp1 - u[k-1][j][i][0]*wm1);

        rhs[k][j][i][1] = rhs[k][j][i][1] + dz3tz1 * 
          (u[k+1][j][i][1] - 2.0*u[k][j][i][1] + u[k-1][j][i][1]) +
          zzcon2 * (vs[k+1][j][i] - 2.0*vs[k][j][i] + vs[k-1][j][i]) -
          tz2 * (u[k+1][j][i][1]*wp1 - u[k-1][j][i][1]*wm1);

        rhs[k][j][i][2] = rhs[k][j][i][2] + dz4tz1 * 
          (u[k+1][j][i][2] - 2.0*u[k][j][i][2] + u[k-1][j][i][2]) +
          zzcon2*con43 * (wp1 - 2.0*wijk + wm1) -
          tz2 * (u[k+1][j][i][2]*wp1 - u[k-1][j][i][2]*wm1 +
                (u[k+1][j][i][3] - square[k+1][j][i] - 
                 u[k-1][j][i][3] + square[k-1][j][i]) * c2);

        rhs[k][j][i][3] = rhs[k][j][i][3] + dz5tz1 * 
          (u[k+1][j][i][3] - 2.0*u[k][j][i][3] + u[k-1][j][i][3]) +
          zzcon3 * (qs[k+1][j][i] - 2.0*qs[k][j][i] + qs[k-1][j][i]) +
          zzcon4 * (wp1*wp1 - 2.0*wijk*wijk + wm1*wm1) +
          zzcon5 * (u[k+1][j][i][3]*rho_i[k+1][j][i] - 
                  2.0*u[k][j][i][3]*rho_i[k][j][i] +
                    u[k-1][j][i][3]*rho_i[k-1][j][i]) -
          tz2 * ((c1*u[k+1][j][i][3] - c2*square[k+1][j][i])*wp1 -
                 (c1*u[k-1][j][i][3] - c2*square[k-1][j][i])*wm1);
      }
    }
  }

  //---------------------------------------------------------------------
  // add fourth order zeta-direction dissipation                
  //---------------------------------------------------------------------
  k = 1;
  for (j = 1; j <= ny2; j++) {
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
      rhs1[k][j][i] = rhs1[k][j][i]- dssp * 
          (5.0*u1[k][j][i] - 4.0*u1[k+1][j][i] + u1[k+2][j][i]);
      rhs[k][j][i][0] = rhs[k][j][i][0]- dssp * 
          (5.0*u[k][j][i][0] - 4.0*u[k+1][j][i][0] + u[k+2][j][i][0]);
      rhs[k][j][i][1] = rhs[k][j][i][1]- dssp * 
          (5.0*u[k][j][i][1] - 4.0*u[k+1][j][i][1] + u[k+2][j][i][1]);
      rhs[k][j][i][2] = rhs[k][j][i][2]- dssp * 
          (5.0*u[k][j][i][2] - 4.0*u[k+1][j][i][2] + u[k+2][j][i][2]);
      rhs[k][j][i][3] = rhs[k][j][i][3]- dssp * 
          (5.0*u[k][j][i][3] - 4.0*u[k+1][j][i][3] + u[k+2][j][i][3]);
      //}
    }
  }

  k = 2;
  for (j = 1; j <= ny2; j++) {
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] - dssp * 
          (-4.0*u1[k-1][j][i] + 6.0*u1[k][j][i] -
            4.0*u1[k+1][j][i] + u1[k+2][j][i]);
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp * 
          (-4.0*u[k-1][j][i][0] + 6.0*u[k][j][i][0] -
            4.0*u[k+1][j][i][0] + u[k+2][j][i][0]);
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp * 
          (-4.0*u[k-1][j][i][1] + 6.0*u[k][j][i][1] -
            4.0*u[k+1][j][i][1] + u[k+2][j][i][1]);
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp * 
          (-4.0*u[k-1][j][i][2] + 6.0*u[k][j][i][2] -
            4.0*u[k+1][j][i][2] + u[k+2][j][i][2]);
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp * 
          (-4.0*u[k-1][j][i][3] + 6.0*u[k][j][i][3] -
            4.0*u[k+1][j][i][3] + u[k+2][j][i][3]);
      //}
    }
  }

  for (k = 3; k <= nz2-2; k++) {
    for (j = 1; j <= ny2; j++) {
#pragma simd
      for (i = 1; i <= nx2; i++) {
        //for (m = 0; m < 5; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] - dssp * 
            ( u1[k-2][j][i] - 4.0*u1[k-1][j][i] + 
            6.0*u1[k][j][i] - 4.0*u1[k+1][j][i] + 
              u1[k+2][j][i] );
        rhs[k][j][i][0] = rhs[k][j][i][0] - dssp * 
            ( u[k-2][j][i][0] - 4.0*u[k-1][j][i][0] + 
            6.0*u[k][j][i][0] - 4.0*u[k+1][j][i][0] + 
              u[k+2][j][i][0] );
        rhs[k][j][i][1] = rhs[k][j][i][1] - dssp * 
            ( u[k-2][j][i][1] - 4.0*u[k-1][j][i][1] + 
            6.0*u[k][j][i][1] - 4.0*u[k+1][j][i][1] + 
              u[k+2][j][i][1] );
        rhs[k][j][i][2] = rhs[k][j][i][2] - dssp * 
            ( u[k-2][j][i][2] - 4.0*u[k-1][j][i][2] + 
            6.0*u[k][j][i][2] - 4.0*u[k+1][j][i][2] + 
              u[k+2][j][i][2] );
        rhs[k][j][i][3] = rhs[k][j][i][3] - dssp * 
            ( u[k-2][j][i][3] - 4.0*u[k-1][j][i][3] + 
            6.0*u[k][j][i][3] - 4.0*u[k+1][j][i][3] + 
              u[k+2][j][i][3] );
        //}
      }
    }
  }

  k = nz2-1;
  for (j = 1; j <= ny2; j++) {
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] - dssp *
          ( u1[k-2][j][i] - 4.0*u1[k-1][j][i] + 
          6.0*u1[k][j][i] - 4.0*u1[k+1][j][i] );
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp *
          ( u[k-2][j][i][0] - 4.0*u[k-1][j][i][0] + 
          6.0*u[k][j][i][0] - 4.0*u[k+1][j][i][0] );
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp *
          ( u[k-2][j][i][1] - 4.0*u[k-1][j][i][1] + 
          6.0*u[k][j][i][1] - 4.0*u[k+1][j][i][1] );
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp *
          ( u[k-2][j][i][2] - 4.0*u[k-1][j][i][2] + 
          6.0*u[k][j][i][2] - 4.0*u[k+1][j][i][2] );
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp *
          ( u[k-2][j][i][3] - 4.0*u[k-1][j][i][3] + 
          6.0*u[k][j][i][3] - 4.0*u[k+1][j][i][3] );
      //}
    }
  }

  k = nz2;
  for (j = 1; j <= ny2; j++) {
#pragma simd
    for (i = 1; i <= nx2; i++) {
      //for (m = 0; m < 5; m++) {
      rhs1[k][j][i] = rhs1[k][j][i] - dssp *
          ( u1[k-2][j][i] - 4.0*u1[k-1][j][i] + 5.0*u1[k][j][i] );
      rhs[k][j][i][0] = rhs[k][j][i][0] - dssp *
          ( u[k-2][j][i][0] - 4.0*u[k-1][j][i][0] + 5.0*u[k][j][i][0] );
      rhs[k][j][i][1] = rhs[k][j][i][1] - dssp *
          ( u[k-2][j][i][1] - 4.0*u[k-1][j][i][1] + 5.0*u[k][j][i][1] );
      rhs[k][j][i][2] = rhs[k][j][i][2] - dssp *
          ( u[k-2][j][i][2] - 4.0*u[k-1][j][i][2] + 5.0*u[k][j][i][2] );
      rhs[k][j][i][3] = rhs[k][j][i][3] - dssp *
          ( u[k-2][j][i][3] - 4.0*u[k-1][j][i][3] + 5.0*u[k][j][i][3] );
      //}
    }
  }
  if (timeron) timer_stop(t_rhsz);

  for (k = 1; k <= nz2; k++) {
    for (j = 1; j <= ny2; j++) {
#pragma simd
      for (i = 1; i <= nx2; i++) {
        //for (m = 0; m < 5; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] * dt;
        rhs[k][j][i][0] = rhs[k][j][i][0] * dt;
        rhs[k][j][i][1] = rhs[k][j][i][1] * dt;
        rhs[k][j][i][2] = rhs[k][j][i][2] * dt;
        rhs[k][j][i][3] = rhs[k][j][i][3] * dt;
        //}
      }
    }
  }
  if (timeron) timer_stop(t_rhs);
}
