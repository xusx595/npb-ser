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

//---------------------------------------------------------------------
// The following include file is generated automatically by the
// "setparams" utility. It defines 
//      problem_size:  12, 64, 102, 162 (for class T, A, B, C)
//      dt_default:    default time step for this problem size if no
//                     config file
//      niter_default: default number of iterations for this problem size
//---------------------------------------------------------------------

#include "npbparams.h"
#include "type.h"

#include "timers.h"


/* common /global/ */
extern int grid_points[3], nx2, ny2, nz2;
extern logical timeron;

/* common /constants/ */
extern float tx1, tx2, tx3, ty1, ty2, ty3, tz1, tz2, tz3, 
              dx1, dx2, dx3, dx4, dx5, dy1, dy2, dy3, dy4, 
              dy5, dz1, dz2, dz3, dz4, dz5, dssp, dt, 
              ce[5][13], dxmax, dymax, dzmax, xxcon1, xxcon2, 
              xxcon3, xxcon4, xxcon5, dx1tx1, dx2tx1, dx3tx1,
              dx4tx1, dx5tx1, yycon1, yycon2, yycon3, yycon4,
              yycon5, dy1ty1, dy2ty1, dy3ty1, dy4ty1, dy5ty1,
              zzcon1, zzcon2, zzcon3, zzcon4, zzcon5, dz1tz1, 
              dz2tz1, dz3tz1, dz4tz1, dz5tz1, dnxm1, dnym1, 
              dnzm1, c1c2, c1c5, c3c4, c1345, conz1, c1, c2, 
              c3, c4, c5, c4dssp, c5dssp, dtdssp, dttx1, bt,
              dttx2, dtty1, dtty2, dttz1, dttz2, c2dttx1, 
              c2dtty1, c2dttz1, comz1, comz4, comz5, comz6, 
              c3c4tx3, c3c4ty3, c3c4tz3, c2iv, con43, con16;

#define IMAX    PROBLEM_SIZE
#define JMAX    PROBLEM_SIZE
#define KMAX    PROBLEM_SIZE
#define IMAXP   (IMAX/2*2)
#define JMAXP   (JMAX/2*2)

//---------------------------------------------------------------------
// To improve cache performance, grid dimensions padded by 1 
// for even number sizes only
//---------------------------------------------------------------------
/* common /fields/ */
extern float u1      [KMAX][JMAXP+1][IMAXP];
extern float u2      [KMAX][JMAXP+1][IMAXP+1][2];
extern float u3      [KMAX][JMAXP+1][IMAXP+1][2];
extern float us     [KMAX][JMAXP+1][IMAXP];
extern float vs     [KMAX][JMAXP+1][IMAXP];
extern float ws     [KMAX][JMAXP+1][IMAXP];
extern float qs     [KMAX][JMAXP+1][IMAXP];
extern float rho_i  [KMAX][JMAXP+1][IMAXP];
extern float speed  [KMAX][JMAXP+1][IMAXP];
extern float square [KMAX][JMAXP+1][IMAXP];
extern float rhs1    [KMAX][JMAXP+1][IMAXP];
extern float rhs2    [KMAX][JMAXP+1][IMAXP+1][2];
extern float rhs3    [KMAX][JMAXP+1][IMAXP+1][2];
extern float forcing1[KMAX][JMAXP+1][IMAXP];
extern float forcing2[KMAX][JMAXP+1][IMAXP+1][2];
extern float forcing3[KMAX][JMAXP+1][IMAXP+1][2];

/* common /work_1d/ */
extern float cv  [PROBLEM_SIZE];
extern float rhon[PROBLEM_SIZE];
extern float rhos[PROBLEM_SIZE];
extern float rhoq[PROBLEM_SIZE];
extern float cuf [PROBLEM_SIZE];
extern float q   [PROBLEM_SIZE];
extern float ue1 [PROBLEM_SIZE];
extern float ue2 [PROBLEM_SIZE][2];
extern float ue3 [PROBLEM_SIZE][2];
extern float buf1[PROBLEM_SIZE];
extern float buf2[PROBLEM_SIZE][2];
extern float buf3[PROBLEM_SIZE][2];

/* common /work_lhs/ */
extern float lhs1 [IMAXP+1][IMAXP];
extern float lhs2 [IMAXP+1][IMAXP+1][2];
extern float lhs3 [IMAXP+1][IMAXP+1][2];
extern float lhsp1[IMAXP+1][IMAXP];
extern float lhsp2[IMAXP+1][IMAXP+1][2];
extern float lhsp3[IMAXP+1][IMAXP+1][2];
extern float lhsm1[IMAXP+1][IMAXP];
extern float lhsm2[IMAXP+1][IMAXP+1][2];
extern float lhsm3[IMAXP+1][IMAXP+1][2];

//-----------------------------------------------------------------------
// Timer constants
//-----------------------------------------------------------------------
#define t_total     1
#define t_rhsx      2
#define t_rhsy      3
#define t_rhsz      4
#define t_rhs       5
#define t_xsolve    6
#define t_ysolve    7
#define t_zsolve    8
#define t_rdis1     9
#define t_rdis2     10
#define t_txinvr    11
#define t_pinvr     12
#define t_ninvr     13
#define t_tzetar    14
#define t_add       15
#define t_last      15


//-----------------------------------------------------------------------
void initialize();
void lhsinit(int ni, int nj);
void lhsinitj(int nj, int ni);
void exact_solution(float xi, float eta, float zeta, float dtemp[5]);
void exact_rhs();
void set_constants();
void adi();
void compute_rhs();
void x_solve();
void ninvr();
void y_solve();
void pinvr();
void z_solve();
void tzetar();
void add();
void txinvr();
void error_norm(float rms[5]);
void rhs_norm(float rms[5]);
void verify(int no_time_steps, char *Class, logical *verified);

