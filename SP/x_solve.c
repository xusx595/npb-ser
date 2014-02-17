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
// this function performs the solution of the approximate factorization
// step in the x-direction for all five matrix components
// simultaneously. The Thomas algorithm is employed to solve the
// systems for the x-lines. Boundary conditions are non-periodic
//---------------------------------------------------------------------
void x_solve()
{
  int i, j, k, i1, i2, m;
  double ru1, fac1, fac2;

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

      int new_i_upper = nx2 /4 * 4;

      for (i = 1; i < 4; i++) {
        lhs1[j][i] =  0.0;
        lhs[j][i][0] = -dttx2 * cv[i-1] - dttx1 * rhon[i-1];
        lhs[j][i][1] =  1.0 + c2dttx1 * rhon[i];
        lhs[j][i][2] =  dttx2 * cv[i+1] - dttx1 * rhon[i+1];
        lhs[j][i][3] =  0.0;
      }
 
      for (i = 4; i < new_i_upper; i+=4) {
        /*lhs1[j][i] =  0.0;*/
        _mm256_store_pd(&lhs1[j][i], _mm256_setzero_pd());

        /*lhs[j][i][0] = -dttx2 * cv[i-1] - dttx1 * rhon[i-1];*/
        __m256d tmp1 = _mm256_sub_pd(_mm256_setzero_pd(),
                                  _mm256_mul_pd(_mm256_set1_pd(dttx2),
                                                     _mm256_load_pd(&cv[i-1])));
        __m256d tmp2 = _mm256_mul_pd(_mm256_set1_pd(dttx1),
                                                    _mm256_load_pd(&rhon[i-1]));
        __m256d lhs_0 = _mm256_sub_pd(tmp1, tmp2);
        
        /*lhs[j][i][1] =  1.0 + c2dttx1 * rhon[i];*/
        tmp1 = _mm256_mul_pd(_mm256_set1_pd(c2dttx1),
                                            _mm256_load_pd(&rhon[i]));
        __m256d lhs_1 = _mm256_add_pd(_mm256_set1_pd(1.0), tmp1);
        
        /*lhs[j][i][2] =  dttx2 * cv[i+1] - dttx1 * rhon[i+1];*/
        tmp1 = _mm256_mul_pd(_mm256_set1_pd(dttx2),
                                                     _mm256_load_pd(&cv[i+1]));
        tmp2 = _mm256_mul_pd(_mm256_set1_pd(dttx1),
                                                    _mm256_load_pd(&rhon[i+1]));
        __m256d lhs_2 = _mm256_sub_pd(tmp1, tmp2);

        /* lhs[j][i][3] =  0.0; */
        __m256d lhs_3 = _mm256_setzero_pd();
        //===========================================
        interleave(&lhs_0, &lhs_1, &lhs_2, &lhs_3);
        _mm256_store_pd(&lhs[j][i][0], lhs_0);
        _mm256_store_pd(&lhs[j][i+1][0], lhs_1);
        _mm256_store_pd(&lhs[j][i+2][0], lhs_2);
        _mm256_store_pd(&lhs[j][i+3][0], lhs_3);
        
      }

      for (i = new_i_upper; i <= nx2; i++) {
        lhs1[j][i] =  0.0;
        lhs[j][i][0] = -dttx2 * cv[i-1] - dttx1 * rhon[i-1];
        lhs[j][i][1] =  1.0 + c2dttx1 * rhon[i];
        lhs[j][i][2] =  dttx2 * cv[i+1] - dttx1 * rhon[i+1];
        lhs[j][i][3] =  0.0;
      }
    }

    //---------------------------------------------------------------------
    // add fourth order dissipation                             
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      i = 1;
      /*lhs[j][i][1] = lhs[j][i][1] + comz5;
      lhs[j][i][2] = lhs[j][i][2] - comz4;
      lhs[j][i][3] = lhs[j][i][3] + comz1;*/
      __m256d vcons = _mm256_set_pd(comz1, - comz4, comz5, 0);
      __m256d vlhs = _mm256_load_pd(&lhs[j][i][0]);
      vlhs = _mm256_add_pd(vlhs, vcons);
      _mm256_store_pd(&lhs[j][i][0], vlhs);

      vcons = _mm256_set_pd(comz1, - comz4, comz6, - comz4);
      vlhs = _mm256_load_pd(&lhs[j][i+1][0]);
      vlhs = _mm256_add_pd(vlhs, vcons);
      _mm256_store_pd(&lhs[j][i+1][0], vlhs);
      
      /*lhs[j][i+1][0] = lhs[j][i+1][0] - comz4;
      lhs[j][i+1][1] = lhs[j][i+1][1] + comz6;
      lhs[j][i+1][2] = lhs[j][i+1][2] - comz4;
      lhs[j][i+1][3] = lhs[j][i+1][3] + comz1;*/
    }

    for (j = 1; j <= ny2; j++) {
      for (i = 3; i <= grid_points[0]-4; i++) {
        lhs1[j][i] = lhs1[j][i] + comz1;
        /*lhs[j][i][0] = lhs[j][i][0] - comz4;
        lhs[j][i][1] = lhs[j][i][1] + comz6;
        lhs[j][i][2] = lhs[j][i][2] - comz4;
        lhs[j][i][3] = lhs[j][i][3] + comz1;*/
      __m256d vcons = _mm256_set_pd(comz1, - comz4, comz6, - comz4);
      __m256d vlhs = _mm256_load_pd(&lhs[j][i][0]);
      vlhs = _mm256_add_pd(vlhs, vcons);
      _mm256_store_pd(&lhs[j][i][0], vlhs);
      }
    }

    for (j = 1; j <= ny2; j++) {
      i = grid_points[0]-3;
      lhs1[j][i] = lhs1[j][i] + comz1;
      /*lhs[j][i][0] = lhs[j][i][0] - comz4;
      lhs[j][i][1] = lhs[j][i][1] + comz6;
      lhs[j][i][2] = lhs[j][i][2] - comz4;*/
      __m256d vcons = _mm256_set_pd(0, - comz4, comz6, - comz4);
      __m256d vlhs = _mm256_load_pd(&lhs[j][i][0]);
      vlhs = _mm256_add_pd(vlhs, vcons);
      _mm256_store_pd(&lhs[j][i][0], vlhs);

      lhs1[j][i+1] = lhs1[j][i+1] + comz1;
      /*lhs[j][i+1][0] = lhs[j][i+1][0] - comz4;
      lhs[j][i+1][1] = lhs[j][i+1][1] + comz5;*/
      vcons = _mm256_set_pd(0, 0, comz5, - comz4);
      vlhs = _mm256_load_pd(&lhs[j][i+1][0]);
      vlhs = _mm256_add_pd(vlhs, vcons);
      _mm256_store_pd(&lhs[j][i+1][0], vlhs);
    }

    //---------------------------------------------------------------------
    // subsequently, fill the other factors (u+c), (u-c) by adding to 
    // the first  
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      for (i = 1; i <= nx2; i++) {
        lhsp1[j][i] = lhs1[j][i];
        lhsp[j][i][0] = lhs[j][i][0] - dttx2 * speed[k][j][i-1];
        lhsp[j][i][1] = lhs[j][i][1];
        lhsp[j][i][2] = lhs[j][i][2] + dttx2 * speed[k][j][i+1];
        lhsp[j][i][3] = lhs[j][i][3];
        lhsm1[j][i] = lhs1[j][i];
        lhsm[j][i][0] = lhs[j][i][0] + dttx2 * speed[k][j][i-1];
        lhsm[j][i][1] = lhs[j][i][1];
        lhsm[j][i][2] = lhs[j][i][2] - dttx2 * speed[k][j][i+1];
        lhsm[j][i][3] = lhs[j][i][3];
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
        fac1 = 1.0/lhs[j][i][1];
        __m128d vfac1 = _mm_set1_pd(fac1);
        
        /*lhs[j][i][2] = fac1*lhs[j][i][2];
        lhs[j][i][3] = fac1*lhs[j][i][3];*/
        __m128d vlhs = _mm_load_pd(&lhs[j][i][2]);
        vlhs = _mm_mul_pd(vfac1, vlhs);
        _mm_store_pd(&lhs[j][i][2], vlhs);
        
        //for (m = 0; m < 3; m++) {
        rhs1[k][j][i] = fac1*rhs1[k][j][i];
        /*rhs[k][j][i][0] = fac1*rhs[k][j][i][0];
        rhs[k][j][i][1] = fac1*rhs[k][j][i][1];*/
        __m128d vrhs = _mm_load_pd(&rhs[k][j][i][0]);
        vrhs = _mm_mul_pd(vfac1, vrhs);
        _mm_store_pd(&rhs[k][j][i][0], vrhs);
        //}

        __m128d lhs_i1_0 = _mm_set1_pd(lhs[j][i1][0]);
        
        /*lhs[j][i1][1] = lhs[j][i1][1] - lhs[j][i1][0]*lhs[j][i][2];
        lhs[j][i1][2] = lhs[j][i1][2] - lhs[j][i1][0]*lhs[j][i][3];*/
        __m128d vlhs_i1 = _mm_loadu_pd(&lhs[j][i1][1]);
        __m128d vlhs_i = _mm_loadu_pd(&lhs[j][i][2]);
        vlhs_i = _mm_mul_pd(lhs_i1_0, vlhs_i);
        vlhs_i1 = _mm_sub_pd(vlhs_i1, vlhs_i);
        _mm_storeu_pd(&lhs[j][i1][1], vlhs_i1);

        //for (m = 0; m < 3; m++) {
        rhs1[k][j][i1] = rhs1[k][j][i1] - lhs[j][i1][0]*rhs1[k][j][i];
        /*rhs[k][j][i1][0] = rhs[k][j][i1][0] - lhs[j][i1][0]*rhs[k][j][i][0];
        rhs[k][j][i1][1] = rhs[k][j][i1][1] - lhs[j][i1][0]*rhs[k][j][i][1];*/
        __m128d vrhs_i1 = _mm_load_pd(&rhs[k][j][i1][0]);
        __m128d vrhs_i = _mm_load_pd(&rhs[k][j][i][0]);
        vrhs_i = _mm_mul_pd(lhs_i1_0, vrhs_i);
        vrhs_i1 = _mm_sub_pd(vrhs_i1, vrhs_i);
        _mm_storeu_pd(&rhs[k][j][i1][0], vrhs_i1);
        //}
       __m128d lhs1_i2 = _mm_set1_pd(lhs1[j][i2]);
        /*lhs[j][i2][0] = lhs[j][i2][0] - lhs1[j][i2]*lhs[j][i][2];
        lhs[j][i2][1] = lhs[j][i2][1] - lhs1[j][i2]*lhs[j][i][3];*/
        __m128d vlhs_i2 = _mm_loadu_pd(&lhs[j][i2][0]);
        vlhs_i = _mm_loadu_pd(&lhs[j][i][2]);
        vlhs_i = _mm_mul_pd(lhs1_i2, vlhs_i);
        vlhs_i2 = _mm_sub_pd(vlhs_i2, vlhs_i);
        _mm_store_pd(&lhs[j][i2][0], vlhs_i2);
        
        //for (m = 0; m < 3; m++) {
        rhs1[k][j][i2] = rhs1[k][j][i2] - lhs1[j][i2]*rhs1[k][j][i];
        /*rhs[k][j][i2][0] = rhs[k][j][i2][0] - lhs1[j][i2]*rhs[k][j][i][0];
        rhs[k][j][i2][1] = rhs[k][j][i2][1] - lhs1[j][i2]*rhs[k][j][i][1];*/
        __m128d vrhs_i2 = _mm_load_pd(&rhs[k][j][i2][0]);
        vrhs_i = _mm_load_pd(&rhs[k][j][i][0]);
        vrhs_i = _mm_mul_pd(lhs1_i2, vrhs_i);
        vrhs_i2 = _mm_sub_pd(vrhs_i2, vrhs_i);
        _mm_storeu_pd(&rhs[k][j][i2][0], vrhs_i2);
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
      fac1 = 1.0/lhs[j][i][1];
      lhs[j][i][2] = fac1*lhs[j][i][2];
      lhs[j][i][3] = fac1*lhs[j][i][3];
      //for (m = 0; m < 3; m++) {
      rhs1[k][j][i] = fac1*rhs1[k][j][i];
      rhs[k][j][i][0] = fac1*rhs[k][j][i][0];
      rhs[k][j][i][1] = fac1*rhs[k][j][i][1];
      //}
      lhs[j][i1][1] = lhs[j][i1][1] - lhs[j][i1][0]*lhs[j][i][2];
      lhs[j][i1][2] = lhs[j][i1][2] - lhs[j][i1][0]*lhs[j][i][3];
      //for (m = 0; m < 3; m++) {
      rhs1[k][j][i1] = rhs1[k][j][i1] - lhs[j][i1][0]*rhs1[k][j][i];
      rhs[k][j][i1][0] = rhs[k][j][i1][0] - lhs[j][i1][0]*rhs[k][j][i][0];
      rhs[k][j][i1][1] = rhs[k][j][i1][1] - lhs[j][i1][0]*rhs[k][j][i][1];
      //}

      //---------------------------------------------------------------------
      // scale the last row immediately 
      //---------------------------------------------------------------------
      fac2 = 1.0/lhs[j][i1][1];
      //for (m = 0; m < 3; m++) {
      rhs1[k][j][i1] = fac2*rhs1[k][j][i1];
      rhs[k][j][i1][0] = fac2*rhs[k][j][i1][0];
      rhs[k][j][i1][1] = fac2*rhs[k][j][i1][1];
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
        fac1 = 1.0/lhsp[j][i][1];
        lhsp[j][i][2]    = fac1*lhsp[j][i][2];
        lhsp[j][i][3]    = fac1*lhsp[j][i][3];
        rhs[k][j][i][m]  = fac1*rhs[k][j][i][m];
        lhsp[j][i1][1]   = lhsp[j][i1][1] - lhsp[j][i1][0]*lhsp[j][i][2];
        lhsp[j][i1][2]   = lhsp[j][i1][2] - lhsp[j][i1][0]*lhsp[j][i][3];
        rhs[k][j][i1][m] = rhs[k][j][i1][m] - lhsp[j][i1][0]*rhs[k][j][i][m];
        lhsp[j][i2][0]   = lhsp[j][i2][0] - lhsp1[j][i2]*lhsp[j][i][2];
        lhsp[j][i2][1]   = lhsp[j][i2][1] - lhsp1[j][i2]*lhsp[j][i][3];
        rhs[k][j][i2][m] = rhs[k][j][i2][m] - lhsp1[j][i2]*rhs[k][j][i][m];

        m = 3;
        fac1 = 1.0/lhsm[j][i][1];
        lhsm[j][i][2]    = fac1*lhsm[j][i][2];
        lhsm[j][i][3]    = fac1*lhsm[j][i][3];
        rhs[k][j][i][m]  = fac1*rhs[k][j][i][m];
        lhsm[j][i1][1]   = lhsm[j][i1][1] - lhsm[j][i1][0]*lhsm[j][i][2];
        lhsm[j][i1][2]   = lhsm[j][i1][2] - lhsm[j][i1][0]*lhsm[j][i][3];
        rhs[k][j][i1][m] = rhs[k][j][i1][m] - lhsm[j][i1][0]*rhs[k][j][i][m];
        lhsm[j][i2][0]   = lhsm[j][i2][0] - lhsm1[j][i2]*lhsm[j][i][2];
        lhsm[j][i2][1]   = lhsm[j][i2][1] - lhsm1[j][i2]*lhsm[j][i][3];
        rhs[k][j][i2][m] = rhs[k][j][i2][m] - lhsm1[j][i2]*rhs[k][j][i][m];
      }
    }

    //---------------------------------------------------------------------
    // And again the last two rows separately
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      i  = grid_points[0]-2;
      i1 = grid_points[0]-1;

      m = 2;
      fac1 = 1.0/lhsp[j][i][1];
      lhsp[j][i][2]    = fac1*lhsp[j][i][2];
      lhsp[j][i][3]    = fac1*lhsp[j][i][3];
      rhs[k][j][i][m]  = fac1*rhs[k][j][i][m];
      lhsp[j][i1][1]   = lhsp[j][i1][1] - lhsp[j][i1][0]*lhsp[j][i][2];
      lhsp[j][i1][2]   = lhsp[j][i1][2] - lhsp[j][i1][0]*lhsp[j][i][3];
      rhs[k][j][i1][m] = rhs[k][j][i1][m] - lhsp[j][i1][0]*rhs[k][j][i][m];

      m = 3;
      fac1 = 1.0/lhsm[j][i][1];
      lhsm[j][i][2]    = fac1*lhsm[j][i][2];
      lhsm[j][i][3]    = fac1*lhsm[j][i][3];
      rhs[k][j][i][m]  = fac1*rhs[k][j][i][m];
      lhsm[j][i1][1]   = lhsm[j][i1][1] - lhsm[j][i1][0]*lhsm[j][i][2];
      lhsm[j][i1][2]   = lhsm[j][i1][2] - lhsm[j][i1][0]*lhsm[j][i][3];
      rhs[k][j][i1][m] = rhs[k][j][i1][m] - lhsm[j][i1][0]*rhs[k][j][i][m];

      //---------------------------------------------------------------------
      // Scale the last row immediately
      //---------------------------------------------------------------------
      rhs[k][j][i1][2] = rhs[k][j][i1][2]/lhsp[j][i1][1];
      rhs[k][j][i1][3] = rhs[k][j][i1][3]/lhsm[j][i1][1];
    }

    //---------------------------------------------------------------------
    // BACKSUBSTITUTION 
    //---------------------------------------------------------------------
    for (j = 1; j <= ny2; j++) {
      i  = grid_points[0]-2;
      i1 = grid_points[0]-1;
      //for (m = 0; m < 3; m++) {
        rhs1[k][j][i] = rhs1[k][j][i] - lhs[j][i][2]*rhs1[k][j][i1];
      rhs[k][j][i][0] = rhs[k][j][i][0] - lhs[j][i][2]*rhs[k][j][i1][0];
      rhs[k][j][i][1] = rhs[k][j][i][1] - lhs[j][i][2]*rhs[k][j][i1][1];
      //}

      rhs[k][j][i][2] = rhs[k][j][i][2] - lhsp[j][i][2]*rhs[k][j][i1][2];
      rhs[k][j][i][3] = rhs[k][j][i][3] - lhsm[j][i][2]*rhs[k][j][i1][3];
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
                            lhs[j][i][2]*rhs1[k][j][i1] -
                            lhs[j][i][3]*rhs1[k][j][i2];
        rhs[k][j][i][0] = rhs[k][j][i][0] - 
                            lhs[j][i][2]*rhs[k][j][i1][0] -
                            lhs[j][i][3]*rhs[k][j][i2][0];
        rhs[k][j][i][1] = rhs[k][j][i][1] - 
                            lhs[j][i][2]*rhs[k][j][i1][1] -
                            lhs[j][i][3]*rhs[k][j][i2][1];
        //}

        //-------------------------------------------------------------------
        // And the remaining two
        //-------------------------------------------------------------------
        rhs[k][j][i][2] = rhs[k][j][i][2] - 
                          lhsp[j][i][2]*rhs[k][j][i1][2] -
                          lhsp[j][i][3]*rhs[k][j][i2][2];
        rhs[k][j][i][3] = rhs[k][j][i][3] - 
                          lhsm[j][i][2]*rhs[k][j][i1][3] -
                          lhsm[j][i][3]*rhs[k][j][i2][3];
      }
    }
  }
  if (timeron) timer_stop(t_xsolve);

  //---------------------------------------------------------------------
  // Do the block-diagonal inversion          
  //---------------------------------------------------------------------
  ninvr();
}

