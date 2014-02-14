	.section .text
.LNDBG_TX:
# mark_description "Intel(R) C Intel(R) 64 Compiler XE for applications running on Intel(R) 64, Version 13.1.3.192 Build 2013060";
# mark_description "7";
# mark_description "-I../common -c -Wall -O3 -mcmodel=medium -vec-report=6 -mcore-avx2 -S -o x_solve.icc.s";
	.file "x_solve.c"
	.text
..TXTST0:
L__routine_start_x_solve_0:
# -- Begin  x_solve
# mark_begin;
       .align    16,0x90
	.globl x_solve
x_solve:
..B1.1:                         # Preds ..B1.0
..___tag_value_x_solve.1:                                       #43.1
..LN0:
  .file   1 "x_solve.c"
   .loc    1  43  is_stmt 1
        subq      $488, %rsp                                    #43.1
..___tag_value_x_solve.3:                                       #
..LN1:
   .loc    1  47  is_stmt 1
        movabsq   $timeron, %rax                                #47.7
..LN2:
   .loc    1  43  is_stmt 1
..LN3:
   .loc    1  47  is_stmt 1
        cmpl      $0, (%rax)                                    #47.7
..LN4:
        je        ..B1.3        # Prob 78%                      #47.7
..LN5:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
..LN6:
        movl      $6, %edi                                      #47.16
..___tag_value_x_solve.4:                                       #47.16
..LN7:
        call      timer_start                                   #47.16
..___tag_value_x_solve.5:                                       #
..LN8:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
..LN9:
   .loc    1  48  is_stmt 1
        movabsq   $nz2, %rax                                    #48.20
..LN10:
        cmpl      $0, (%rax)                                    #48.20
..LN11:
        jle       ..B1.134      # Prob 68%                      #48.20
..LN12:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.4:                         # Preds ..B1.3
..LN13:
   .loc    1  68  is_stmt 1
        movabsq   $.L_2il0floatpacket.0, %rax                   #68.25
..LN14:
   .loc    1  49  is_stmt 1
        movabsq   $ny2, %rdx                                    #49.20
..LN15:
   .loc    1  68  is_stmt 1
        movabsq   $.L_2il0floatpacket.1, %r8                    #68.25
        movl      $1, %ecx                                      #
        movl      $54760, %edi                                  #
..LN16:
   .loc    1  66  is_stmt 1
..LN17:
   .loc    1  59  is_stmt 1
        movq      %r12, (%rsp)                                  #59.7
..LN18:
   .loc    1  66  is_stmt 1
        pxor      %xmm0, %xmm0                                  #66.25
..LN19:
   .loc    1  68  is_stmt 1
        movaps    (%rax), %xmm2                                 #68.25
..LN20:
   .loc    1  69  is_stmt 1
        movabsq   $rhon, %rax                                   #69.51
..LN21:
   .loc    1  59  is_stmt 1
        movq      %rax, %r10                                    #59.7
..LN22:
   .loc    1  49  is_stmt 1
        movslq    (%rdx), %rsi                                  #49.20
        movl      $10952, %edx                                  #
..LN23:
   .loc    1  68  is_stmt 1
        movsd     (%r8), %xmm1                                  #68.25
..LN24:
   .loc    1  66  is_stmt 1
        xorl      %r8d, %r8d                                    #66.25
..LN25:
   .loc    1  59  is_stmt 1
        andq      $15, %r10                                     #59.7
..LN26:
   .loc    1  65  is_stmt 1
        lea       16(%rax), %r9                                 #65.7
..LN27:
        andq      $31, %r9                                      #65.7
..___tag_value_x_solve.6:                                       #
..LN28:
   .loc    1  59  is_stmt 1
        movq      %rdx, %r12                                    #59.7
..LN29:
   .loc    1  65  is_stmt 1
        movl      %r9d, %r11d                                   #65.7
..LN30:
        negl      %r11d                                         #65.7
..LN31:
        addl      $32, %r11d                                    #65.7
..LN32:
        shrl      $3, %r11d                                     #65.7
..LN33:
   .loc    1  59  is_stmt 1
        movsd     %xmm1, 272(%rsp)                              #59.7
..LN34:
        movaps    %xmm2, 112(%rsp)                              #59.7
..LN35:
        movq      %r10, 240(%rsp)                               #59.7
..LN36:
        movl      %r11d, 344(%rsp)                              #59.7
..LN37:
        movl      %r9d, 352(%rsp)                               #59.7
..LN38:
        movq      %r13, 8(%rsp)                                 #59.7
..___tag_value_x_solve.7:                                       #
..LN39:
        movq      %rdi, %r13                                    #59.7
..LN40:
        movq      %r14, 16(%rsp)                                #59.7
..LN41:
        movq      %r15, 24(%rsp)                                #59.7
..LN42:
        movq      %rbx, 32(%rsp)                                #59.7
..___tag_value_x_solve.8:                                       #
..LN43:
        movq      %r8, %rbx                                     #59.7
..LN44:
        movq      %rbp, 40(%rsp)                                #59.7
..___tag_value_x_solve.11:                                      #
..LN45:
        movl      %ecx, %ebp                                    #59.7
..LN46:
                                # LOE rbx rsi r12 r13 ebp
..B1.5:                         # Preds ..B1.132 ..B1.4
..LN47:
   .loc    1  49  is_stmt 1
        movabsq   $nx2, %rax                                    #49.5
..LN48:
        movl      (%rax), %edi                                  #49.5
..LN49:
        incl      %edi                                          #49.5
..___tag_value_x_solve.12:                                      #49.5
..LN50:
        call      lhsinit                                       #49.5
..___tag_value_x_solve.13:                                      #
..LN51:
                                # LOE rbx r12 r13 ebp
..B1.6:                         # Preds ..B1.5
..LN52:
   .loc    1  58  is_stmt 1
        movabsq   $ny2, %rax                                    #58.22
..LN53:
        movq      %rbx, %rcx                                    #58.5
        movq      %rcx, %rdi                                    #
        movq      %rdi, %r10                                    #
..LN54:
        movslq    (%rax), %rsi                                  #58.22
..LN55:
        testq     %rsi, %rsi                                    #58.22
..LN56:
        jle       ..B1.46       # Prob 16%                      #58.22
..LN57:
                                # LOE rcx rbx rsi rdi r10 r12 r13 ebp
..B1.7:                         # Preds ..B1.6
..LN58:
   .loc    1  65  is_stmt 1
        movabsq   $nx2, %rax                                    #65.24
..LN59:
   .loc    1  67  is_stmt 1
        movabsq   $dttx1, %r14                                  #67.43
..LN60:
   .loc    1  59  is_stmt 1
        movabsq   $grid_points, %r9                             #59.24
..LN61:
   .loc    1  68  is_stmt 1
        movabsq   $c2dttx1, %r15                                #68.31
..LN62:
   .loc    1  67  is_stmt 1
        movabsq   $dttx2, %r11                                  #67.25
..LN63:
        pxor      %xmm5, %xmm5                                  #67.25
..LN64:
   .loc    1  65  is_stmt 1
        movslq    (%rax), %rdx                                  #65.24
..LN65:
   .loc    1  60  is_stmt 1
        movabsq   $c3c4, %rax                                   #60.15
..LN66:
   .loc    1  67  is_stmt 1
        movsd     (%r14), %xmm6                                 #67.43
..LN67:
   .loc    1  62  is_stmt 1
        movabsq   $dx5, %r14                                    #62.19
..LN68:
   .loc    1  59  is_stmt 1
        movslq    (%r9), %r8                                    #59.24
..LN69:
   .loc    1  62  is_stmt 1
        movabsq   $dx2, %r9                                     #62.19
..LN70:
   .loc    1  68  is_stmt 1
        movsd     (%r15), %xmm2                                 #68.31
..LN71:
   .loc    1  67  is_stmt 1
        movaps    %xmm6, %xmm1                                  #67.33
..LN72:
   .loc    1  60  is_stmt 1
        movsd     (%rax), %xmm14                                #60.15
..LN73:
   .loc    1  62  is_stmt 1
        movabsq   $dxmax, %rax                                  #62.19
..LN74:
        movabsq   $c1c5, %r15                                   #62.19
..LN75:
   .loc    1  61  is_stmt 1
        movaps    %xmm14, %xmm11                                #61.9
..LN76:
   .loc    1  67  is_stmt 1
        movsd     (%r11), %xmm7                                 #67.25
..LN77:
   .loc    1  62  is_stmt 1
        movabsq   $con43, %r11                                  #62.19
..LN78:
        movsd     (%r14), %xmm9                                 #62.19
..LN79:
   .loc    1  66  is_stmt 1
        movaps    %xmm7, %xmm10                                 #66.9
..LN80:
   .loc    1  62  is_stmt 1
        movsd     (%r9), %xmm13                                 #62.19
..LN81:
        movabsq   $dx1, %r9                                     #62.19
..LN82:
        movaps    %xmm9, %xmm15                                 #62.19
..LN83:
   .loc    1  45  is_stmt 1
        movaps    %xmm13, %xmm0                                 #45.3
..LN84:
   .loc    1  62  is_stmt 1
        movsd     (%r15), %xmm8                                 #62.19
..LN85:
        unpcklpd  %xmm15, %xmm15                                #62.19
..LN86:
        movaps    %xmm15, 160(%rsp)                             #62.19
..LN87:
        movaps    %xmm8, %xmm15                                 #62.19
..LN88:
        movsd     (%rax), %xmm4                                 #62.19
..LN89:
   .loc    1  65  is_stmt 1
        movl      %edx, %eax                                    #65.7
..LN90:
   .loc    1  62  is_stmt 1
        movsd     (%r11), %xmm12                                #62.19
..LN91:
   .loc    1  59  is_stmt 1
        movl      %r8d, %r11d                                   #59.7
..LN92:
   .loc    1  62  is_stmt 1
        unpcklpd  %xmm15, %xmm15                                #62.19
..LN93:
   .loc    1  45  is_stmt 1
        unpcklpd  %xmm0, %xmm0                                  #45.3
..LN94:
   .loc    1  62  is_stmt 1
        movaps    %xmm15, 176(%rsp)                             #62.19
..LN95:
        movaps    %xmm4, %xmm15                                 #62.19
..LN96:
        movsd     (%r9), %xmm3                                  #62.19
        movq      %r12, %r9                                     #
..LN97:
   .loc    1  45  is_stmt 1
        movaps    %xmm0, 224(%rsp)                              #45.3
..LN98:
        movaps    %xmm12, %xmm0                                 #45.3
..LN99:
   .loc    1  62  is_stmt 1
        unpcklpd  %xmm15, %xmm15                                #62.19
..LN100:
   .loc    1  67  is_stmt 1
        unpcklpd  %xmm1, %xmm1                                  #67.33
..LN101:
   .loc    1  61  is_stmt 1
        unpcklpd  %xmm11, %xmm11                                #61.9
..LN102:
   .loc    1  45  is_stmt 1
        unpcklpd  %xmm0, %xmm0                                  #45.3
..LN103:
   .loc    1  62  is_stmt 1
        movaps    %xmm15, 192(%rsp)                             #62.19
..LN104:
        movaps    %xmm3, %xmm15                                 #62.19
..LN105:
   .loc    1  66  is_stmt 1
        unpcklpd  %xmm10, %xmm10                                #66.9
..LN106:
   .loc    1  67  is_stmt 1
        movaps    %xmm1, 48(%rsp)                               #67.33
..LN107:
   .loc    1  68  is_stmt 1
        movaps    %xmm2, %xmm1                                  #68.25
..LN108:
   .loc    1  62  is_stmt 1
        unpcklpd  %xmm15, %xmm15                                #62.19
..LN109:
        movaps    %xmm0, 128(%rsp)                              #62.19
..LN110:
        movaps    %xmm11, 144(%rsp)                             #62.19
..LN111:
        movsd     %xmm12, 312(%rsp)                             #62.19
..LN112:
        pxor      %xmm11, %xmm11                                #62.19
..LN113:
        movsd     %xmm13, 320(%rsp)                             #62.19
..LN114:
        movq      %r13, 408(%rsp)                               #62.19
..LN115:
        movq      %rsi, 400(%rsp)                               #62.19
..LN116:
   .loc    1  67  is_stmt 1
        subpd     %xmm10, %xmm5                                 #67.25
..LN117:
   .loc    1  68  is_stmt 1
        unpcklpd  %xmm1, %xmm1                                  #68.25
..LN118:
   .loc    1  62  is_stmt 1
        movaps    %xmm15, 208(%rsp)                             #62.19
..LN119:
        movsd     %xmm14, 328(%rsp)                             #62.19
..LN120:
        movl      %ebp, 104(%rsp)                               #62.19
..LN121:
        movaps    48(%rsp), %xmm0                               #62.19
..LN122:
        movsd     272(%rsp), %xmm13                             #62.19
..LN123:
        movaps    112(%rsp), %xmm12                             #62.19
..LN124:
        movl      344(%rsp), %esi                               #62.19
..LN125:
        movl      352(%rsp), %r13d                              #62.19
..LN126:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.8:                         # Preds ..B1.44 ..B1.7
..LN127:
   .loc    1  59  is_stmt 1
        testq     %r8, %r8                                      #59.39
..LN128:
        jle       ..B1.26       # Prob 50%                      #59.39
..LN129:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.9:                         # Preds ..B1.8
..LN130:
        cmpq      $2, %r8                                       #59.7
..LN131:
        jl        ..B1.152      # Prob 10%                      #59.7
..LN132:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.10:                        # Preds ..B1.9
..LN133:
        movq      240(%rsp), %rbx                               #59.7
..LN134:
        movl      $1, %ebp                                      #59.7
..LN135:
        testq     %rbx, %rbx                                    #59.7
..LN136:
        cmove     %rbx, %rbp                                    #59.7
..LN137:
        lea       2(%rbp), %r14                                 #59.7
..LN138:
        cmpq      %r14, %r8                                     #59.7
..LN139:
        jl        ..B1.152      # Prob 10%                      #59.7
..LN140:
                                # LOE rdx rcx rbp rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.11:                        # Preds ..B1.10
..LN141:
        movl      %ebp, %ebx                                    #59.7
..LN142:
        xorl      %r14d, %r14d                                  #59.7
..LN143:
        negl      %ebx                                          #59.7
        lea       (%r12,%r10), %r15                             #
..LN144:
        addl      %r11d, %ebx                                   #59.7
..LN145:
        andl      $1, %ebx                                      #59.7
..LN146:
        negl      %ebx                                          #59.7
..LN147:
        addl      %r11d, %ebx                                   #59.7
..LN148:
        movslq    %ebx, %rbx                                    #59.7
..LN149:
        testq     %rbp, %rbp                                    #59.7
..LN150:
        jbe       ..B1.15       # Prob 16%                      #59.7
..LN151:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r14 r15 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.12:                        # Preds ..B1.11
        movsd     %xmm7, 264(%rsp)                              #
        movabsq   $rhon, %r13                                   #
        movq      %r10, 248(%rsp)                               #
        movabsq   $cv, %r10                                     #
        movq      %rdi, 256(%rsp)                               #
        movabsq   $rho_i, %rdi                                  #
        movq      %rcx, 368(%rsp)                               #
        movq      %r12, 360(%rsp)                               #
        movabsq   $us, %r12                                     #
        movsd     312(%rsp), %xmm13                             #
        movsd     320(%rsp), %xmm14                             #
        movsd     328(%rsp), %xmm15                             #
        .align    16,0x90
..LN152:
                                # LOE rdx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm8 xmm9 xmm10 xmm13 xmm14 xmm15
..B1.13:                        # Preds ..B1.12 ..B1.13
..LN153:
   .loc    1  62  is_stmt 1
        movaps    %xmm13, %xmm12                                #62.19
..LN154:
   .loc    1  61  is_stmt 1
        lea       (%r15,%r14,8), %rsi                           #61.9
..LN155:
   .loc    1  60  is_stmt 1
        movsd     296(%rdi,%rsi), %xmm11                        #60.20
..LN156:
   .loc    1  62  is_stmt 1
        movaps    %xmm8, %xmm7                                  #62.19
..LN157:
   .loc    1  60  is_stmt 1
        mulsd     %xmm15, %xmm11                                #60.20
..LN158:
   .loc    1  62  is_stmt 1
        mulsd     %xmm11, %xmm12                                #62.19
..LN159:
        mulsd     %xmm11, %xmm7                                 #62.19
..LN160:
        addsd     %xmm4, %xmm11                                 #62.19
..LN161:
        addsd     %xmm14, %xmm12                                #62.19
..LN162:
        addsd     %xmm9, %xmm7                                  #62.19
..LN163:
        maxsd     %xmm3, %xmm11                                 #62.9
..LN164:
        maxsd     %xmm7, %xmm12                                 #62.9
..LN165:
   .loc    1  61  is_stmt 1
        movq      296(%r12,%rsi), %rcx                          #61.17
..LN166:
   .loc    1  62  is_stmt 1
        maxsd     %xmm11, %xmm12                                #62.9
..LN167:
   .loc    1  61  is_stmt 1
        movq      %rcx, (%r10,%r14,8)                           #61.9
..LN168:
   .loc    1  62  is_stmt 1
        movsd     %xmm12, (%r13,%r14,8)                         #62.9
..LN169:
   .loc    1  59  is_stmt 1
        incq      %r14                                          #59.7
..LN170:
        cmpq      %rbp, %r14                                    #59.7
..LN171:
        jb        ..B1.13       # Prob 97%                      #59.7
..LN172:
                                # LOE rdx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm8 xmm9 xmm10 xmm13 xmm14 xmm15
..B1.14:                        # Preds ..B1.13
        movsd     264(%rsp), %xmm7                              #
        movsd     272(%rsp), %xmm13                             #
        pxor      %xmm11, %xmm11                                #
        movaps    112(%rsp), %xmm12                             #
        movq      248(%rsp), %r10                               #
        movq      256(%rsp), %rdi                               #
        movq      368(%rsp), %rcx                               #
        movl      344(%rsp), %esi                               #
        movl      352(%rsp), %r13d                              #
        movq      360(%rsp), %r12                               #
..LN173:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r15 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.15:                        # Preds ..B1.11 ..B1.14
..LN174:
        movabsq   $cv, %r14                                     #59.7
..LN175:
        lea       (%r14,%rbp,8), %r14                           #59.7
..LN176:
        testq     $15, %r14                                     #59.7
..LN177:
        je        ..B1.19       # Prob 60%                      #59.7
..LN178:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r15 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.16:                        # Preds ..B1.15
        movsd     %xmm8, 280(%rsp)                              #
        movabsq   $us, %r13                                     #
        movsd     %xmm9, 288(%rsp)                              #
        movabsq   $rhon, %r14                                   #
        movsd     %xmm2, 296(%rsp)                              #
        movsd     %xmm6, 304(%rsp)                              #
        movsd     %xmm7, 264(%rsp)                              #
        movq      %r10, 248(%rsp)                               #
        movabsq   $rho_i, %r10                                  #
        movq      %rdi, 256(%rsp)                               #
        movq      %rcx, 368(%rsp)                               #
        movq      %r12, 360(%rsp)                               #
        movabsq   $cv, %r12                                     #
        movaps    208(%rsp), %xmm8                              #
        movaps    192(%rsp), %xmm9                              #
        movaps    176(%rsp), %xmm11                             #
        movaps    160(%rsp), %xmm12                             #
        movaps    128(%rsp), %xmm13                             #
        movaps    224(%rsp), %xmm14                             #
        movaps    144(%rsp), %xmm15                             #
        .align    16,0x90
..LN179:
                                # LOE rdx rbx rbp r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm3 xmm4 xmm5 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
..B1.17:                        # Preds ..B1.17 ..B1.16
..LN180:
   .loc    1  62  is_stmt 1
        movaps    %xmm13, %xmm7                                 #62.19
..LN181:
   .loc    1  61  is_stmt 1
        lea       (%r15,%rbp,8), %rdi                           #61.17
..LN182:
   .loc    1  60  is_stmt 1
        movsd     296(%r10,%rdi), %xmm6                         #60.20
..LN183:
   .loc    1  62  is_stmt 1
        movaps    %xmm11, %xmm2                                 #62.19
..LN184:
   .loc    1  60  is_stmt 1
        movhpd    304(%r10,%rdi), %xmm6                         #60.20
..LN185:
        mulpd     %xmm15, %xmm6                                 #60.20
..LN186:
   .loc    1  62  is_stmt 1
        mulpd     %xmm6, %xmm7                                  #62.19
..LN187:
        mulpd     %xmm6, %xmm2                                  #62.19
..LN188:
        addpd     %xmm14, %xmm7                                 #62.19
..LN189:
        addpd     %xmm12, %xmm2                                 #62.19
..LN190:
        addpd     %xmm9, %xmm6                                  #62.19
..LN191:
        maxpd     %xmm2, %xmm7                                  #62.19
..LN192:
        maxpd     %xmm8, %xmm6                                  #62.19
..LN193:
        maxpd     %xmm6, %xmm7                                  #62.9
..LN194:
   .loc    1  61  is_stmt 1
        movq      296(%r13,%rdi), %rcx                          #61.17
..LN195:
        movq      304(%r13,%rdi), %rsi                          #61.17
..LN196:
        movq      %rcx, (%r12,%rbp,8)                           #61.9
..LN197:
        movq      %rsi, 8(%r12,%rbp,8)                          #61.9
..LN198:
   .loc    1  62  is_stmt 1
        movaps    %xmm7, (%r14,%rbp,8)                          #62.9
..LN199:
   .loc    1  59  is_stmt 1
        addq      $2, %rbp                                      #59.7
..LN200:
        cmpq      %rbx, %rbp                                    #59.7
..LN201:
        jb        ..B1.17       # Prob 97%                      #59.7
..LN202:
                                # LOE rdx rbx rbp r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm3 xmm4 xmm5 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13 xmm14 xmm15
..B1.18:                        # Preds ..B1.17
        movsd     280(%rsp), %xmm8                              #
        movsd     288(%rsp), %xmm9                              #
        pxor      %xmm11, %xmm11                                #
        movsd     296(%rsp), %xmm2                              #
        movsd     304(%rsp), %xmm6                              #
        movsd     264(%rsp), %xmm7                              #
        movsd     272(%rsp), %xmm13                             #
        movaps    112(%rsp), %xmm12                             #
        movq      248(%rsp), %r10                               #
        movq      256(%rsp), %rdi                               #
        movq      368(%rsp), %rcx                               #
        movl      344(%rsp), %esi                               #
        movl      352(%rsp), %r13d                              #
        movq      360(%rsp), %r12                               #
        jmp       ..B1.22       # Prob 100%                     #
..LN203:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.19:                        # Preds ..B1.15
        movsd     %xmm8, 280(%rsp)                              #
        movabsq   $rho_i, %rsi                                  #
        movsd     %xmm9, 288(%rsp)                              #
        movabsq   $us, %r13                                     #
        movsd     %xmm2, 296(%rsp)                              #
        movabsq   $rhon, %r14                                   #
        movsd     %xmm6, 304(%rsp)                              #
        movsd     %xmm7, 264(%rsp)                              #
        movq      %rcx, 368(%rsp)                               #
        movq      %r12, 360(%rsp)                               #
        movabsq   $cv, %r12                                     #
        movaps    208(%rsp), %xmm2                              #
        movaps    192(%rsp), %xmm6                              #
        movaps    176(%rsp), %xmm7                              #
        movaps    160(%rsp), %xmm8                              #
        movaps    128(%rsp), %xmm9                              #
        movaps    224(%rsp), %xmm11                             #
        movaps    144(%rsp), %xmm12                             #
        .align    16,0x90
..LN204:
                                # LOE rdx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12
..B1.20:                        # Preds ..B1.20 ..B1.19
..LN205:
   .loc    1  62  is_stmt 1
        movaps    %xmm7, %xmm14                                 #62.19
..LN206:
   .loc    1  61  is_stmt 1
        lea       (%r15,%rbp,8), %rcx                           #61.17
..LN207:
   .loc    1  60  is_stmt 1
        movsd     296(%rsi,%rcx), %xmm15                        #60.20
..LN208:
        movhpd    304(%rsi,%rcx), %xmm15                        #60.20
..LN209:
        mulpd     %xmm12, %xmm15                                #60.20
..LN210:
   .loc    1  61  is_stmt 1
        movsd     296(%r13,%rcx), %xmm13                        #61.17
..LN211:
        movhpd    304(%r13,%rcx), %xmm13                        #61.17
..LN212:
        movaps    %xmm13, (%r12,%rbp,8)                         #61.9
..LN213:
   .loc    1  62  is_stmt 1
        movaps    %xmm9, %xmm13                                 #62.19
..LN214:
        mulpd     %xmm15, %xmm13                                #62.19
..LN215:
        mulpd     %xmm15, %xmm14                                #62.19
..LN216:
        addpd     %xmm11, %xmm13                                #62.19
..LN217:
        addpd     %xmm8, %xmm14                                 #62.19
..LN218:
        addpd     %xmm6, %xmm15                                 #62.19
..LN219:
        maxpd     %xmm14, %xmm13                                #62.19
..LN220:
        maxpd     %xmm2, %xmm15                                 #62.19
..LN221:
        maxpd     %xmm15, %xmm13                                #62.9
..LN222:
        movaps    %xmm13, (%r14,%rbp,8)                         #62.9
..LN223:
   .loc    1  59  is_stmt 1
        addq      $2, %rbp                                      #59.7
..LN224:
        cmpq      %rbx, %rbp                                    #59.7
..LN225:
        jb        ..B1.20       # Prob 97%                      #59.7
..LN226:
                                # LOE rdx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12
..B1.21:                        # Preds ..B1.20
        movsd     280(%rsp), %xmm8                              #
        movsd     288(%rsp), %xmm9                              #
        pxor      %xmm11, %xmm11                                #
        movsd     296(%rsp), %xmm2                              #
        movsd     304(%rsp), %xmm6                              #
        movsd     264(%rsp), %xmm7                              #
        movsd     272(%rsp), %xmm13                             #
        movaps    112(%rsp), %xmm12                             #
        movq      368(%rsp), %rcx                               #
        movl      344(%rsp), %esi                               #
        movl      352(%rsp), %r13d                              #
        movq      360(%rsp), %r12                               #
..LN227:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.22:                        # Preds ..B1.21 ..B1.18 ..B1.152
..LN228:
        cmpq      %r8, %rbx                                     #59.7
..LN229:
        jae       ..B1.26       # Prob 16%                      #59.7
..LN230:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.23:                        # Preds ..B1.22
..LN231:
   .loc    1  61  is_stmt 1
        movsd     %xmm7, 264(%rsp)                              #61.17
..LN232:
        movabsq   $us, %r15                                     #61.17
..LN233:
        movq      %r12, 360(%rsp)                               #61.17
..LN234:
        movabsq   $cv, %r14                                     #61.17
..LN235:
        movsd     312(%rsp), %xmm13                             #61.17
..LN236:
        movabsq   $rho_i, %rbp                                  #61.17
..LN237:
        movsd     320(%rsp), %xmm14                             #61.17
..LN238:
        movabsq   $rhon, %r13                                   #61.17
..LN239:
        movsd     328(%rsp), %xmm15                             #61.17
        .align    16,0x90
..LN240:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm8 xmm9 xmm10 xmm13 xmm14 xmm15
..B1.24:                        # Preds ..B1.24 ..B1.23
..LN241:
   .loc    1  62  is_stmt 1
        movaps    %xmm13, %xmm12                                #62.19
..LN242:
   .loc    1  61  is_stmt 1
        lea       (%r9,%rbx,8), %r12                            #61.9
..LN243:
   .loc    1  60  is_stmt 1
        movsd     296(%rbp,%r12), %xmm11                        #60.20
..LN244:
   .loc    1  62  is_stmt 1
        movaps    %xmm8, %xmm7                                  #62.19
..LN245:
   .loc    1  60  is_stmt 1
        mulsd     %xmm15, %xmm11                                #60.20
..LN246:
   .loc    1  62  is_stmt 1
        mulsd     %xmm11, %xmm12                                #62.19
..LN247:
        mulsd     %xmm11, %xmm7                                 #62.19
..LN248:
        addsd     %xmm4, %xmm11                                 #62.19
..LN249:
        addsd     %xmm14, %xmm12                                #62.19
..LN250:
        addsd     %xmm9, %xmm7                                  #62.19
..LN251:
        maxsd     %xmm3, %xmm11                                 #62.9
..LN252:
        maxsd     %xmm7, %xmm12                                 #62.9
..LN253:
   .loc    1  61  is_stmt 1
        movq      296(%r15,%r12), %rsi                          #61.17
..LN254:
   .loc    1  62  is_stmt 1
        maxsd     %xmm11, %xmm12                                #62.9
..LN255:
   .loc    1  61  is_stmt 1
        movq      %rsi, (%r14,%rbx,8)                           #61.9
..LN256:
   .loc    1  62  is_stmt 1
        movsd     %xmm12, (%r13,%rbx,8)                         #62.9
..LN257:
   .loc    1  59  is_stmt 1
        incq      %rbx                                          #59.7
..LN258:
        cmpq      %r8, %rbx                                     #59.7
..LN259:
        jb        ..B1.24       # Prob 97%                      #59.7
..LN260:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm8 xmm9 xmm10 xmm13 xmm14 xmm15
..B1.25:                        # Preds ..B1.24
        movsd     264(%rsp), %xmm7                              #
        movsd     272(%rsp), %xmm13                             #
        pxor      %xmm11, %xmm11                                #
        movaps    112(%rsp), %xmm12                             #
        movl      344(%rsp), %esi                               #
        movl      352(%rsp), %r13d                              #
        movq      360(%rsp), %r12                               #
..LN261:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.26:                        # Preds ..B1.8 ..B1.22 ..B1.25
..LN262:
   .loc    1  65  is_stmt 1
        testq     %rdx, %rdx                                    #65.24
..LN263:
        jle       ..B1.44       # Prob 50%                      #65.24
..LN264:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.27:                        # Preds ..B1.26
..LN265:
        cmpq      $4, %rdx                                      #65.7
..LN266:
        jl        ..B1.154      # Prob 10%                      #65.7
..LN267:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.28:                        # Preds ..B1.27
..LN268:
        testl     %r13d, %r13d                                  #65.7
..LN269:
        movl      %r13d, %ebp                                   #65.7
..LN270:
        cmovne    %esi, %ebp                                    #65.7
..LN271:
        movl      %ebp, %ebx                                    #65.7
..LN272:
        lea       4(%rbx), %r14                                 #65.7
..LN273:
        cmpq      %r14, %rdx                                    #65.7
..LN274:
        jl        ..B1.154      # Prob 10%                      #65.7
..LN275:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r12 eax ebp esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.29:                        # Preds ..B1.28
..LN276:
        negl      %ebp                                          #65.7
..LN277:
        xorl      %r15d, %r15d                                  #65.7
..LN278:
        addl      %eax, %ebp                                    #65.7
..LN279:
        andl      $3, %ebp                                      #65.7
..LN280:
        negl      %ebp                                          #65.7
..LN281:
        addl      %eax, %ebp                                    #65.7
..LN282:
        movslq    %ebp, %rbp                                    #65.7
..LN283:
        testq     %rbx, %rbx                                    #65.7
..LN284:
        jbe       ..B1.33       # Prob 10%                      #65.7
..LN285:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r15 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.30:                        # Preds ..B1.29
        movq      %rcx, 368(%rsp)                               #
        movq      %rdi, %r14                                    #
        movq      %r12, 360(%rsp)                               #
        movabsq   $lhs, %rcx                                    #
        movabsq   $cv, %rsi                                     #
        xorl      %r12d, %r12d                                  #
        movabsq   $rhon, %r13                                   #
..LN286:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.31:                        # Preds ..B1.31 ..B1.30
..LN287:
   .loc    1  67  is_stmt 1
..LN288:
        movsd     (%r13,%r15,8), %xmm14                         #67.51
..LN289:
        pxor      %xmm15, %xmm15                                #67.25
..LN290:
        mulsd     %xmm6, %xmm14                                 #67.51
..LN291:
        subsd     %xmm7, %xmm15                                 #67.25
..LN292:
        mulsd     (%rsi,%r15,8), %xmm15                         #67.33
..LN293:
   .loc    1  66  is_stmt 1
        movq      %r12, 1520(%r14,%rcx)                         #66.9
..LN294:
   .loc    1  67  is_stmt 1
        subsd     %xmm14, %xmm15                                #67.51
..LN295:
   .loc    1  68  is_stmt 1
        movsd     8(%r13,%r15,8), %xmm14                        #68.41
..LN296:
        mulsd     %xmm2, %xmm14                                 #68.41
..LN297:
   .loc    1  67  is_stmt 1
        movsd     %xmm15, 1528(%r14,%rcx)                       #67.9
..LN298:
   .loc    1  68  is_stmt 1
        addsd     %xmm13, %xmm14                                #68.41
..LN299:
        movsd     %xmm14, 1536(%r14,%rcx)                       #68.9
..LN300:
   .loc    1  69  is_stmt 1
        movsd     16(%rsi,%r15,8), %xmm14                       #69.33
..LN301:
        movsd     16(%r13,%r15,8), %xmm15                       #69.51
..LN302:
   .loc    1  65  is_stmt 1
        incq      %r15                                          #65.7
..LN303:
   .loc    1  69  is_stmt 1
        mulsd     %xmm7, %xmm14                                 #69.33
..LN304:
        mulsd     %xmm6, %xmm15                                 #69.51
..LN305:
   .loc    1  70  is_stmt 1
        movq      %r12, 1552(%r14,%rcx)                         #70.9
..LN306:
   .loc    1  69  is_stmt 1
        subsd     %xmm15, %xmm14                                #69.51
..LN307:
        movsd     %xmm14, 1544(%r14,%rcx)                       #69.9
..LN308:
   .loc    1  65  is_stmt 1
        addq      $40, %r14                                     #65.7
..LN309:
        cmpq      %rbx, %r15                                    #65.7
..LN310:
        jb        ..B1.31       # Prob 97%                      #65.7
..LN311:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r9 r10 r12 r13 r14 r15 eax r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.32:                        # Preds ..B1.31
        movq      368(%rsp), %rcx                               #
        movl      344(%rsp), %esi                               #
        movl      352(%rsp), %r13d                              #
        movq      360(%rsp), %r12                               #
..LN312:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.33:                        # Preds ..B1.29 ..B1.32
..LN313:
        movabsq   $cv, %r14                                     #65.7
..LN314:
   .loc    1  69  is_stmt 1
        lea       16(,%rbx,8), %r15                             #69.33
..LN315:
   .loc    1  65  is_stmt 1
        addq      %r14, %r15                                    #65.7
..LN316:
        testq     $15, %r15                                     #65.7
..LN317:
        je        ..B1.37       # Prob 60%                      #65.7
..LN318:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.34:                        # Preds ..B1.33
        movq      %r12, 360(%rsp)                               #
        lea       (%rbx,%rbx,4), %r14                           #
        movabsq   $lhs, %r12                                    #
        lea       (%rdi,%r14,8), %r14                           #
        movabsq   $cv, %r13                                     #
        movabsq   $rhon, %r15                                   #
..LN319:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax esi r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.35:                        # Preds ..B1.35 ..B1.34
..LN320:
   .loc    1  66  is_stmt 1
        movlpd    %xmm11, 1520(%r14,%r12)                       #66.9
..LN321:
        movhpd    %xmm11, 1560(%r14,%r12)                       #66.9
..LN322:
   .loc    1  67  is_stmt 1
        movsd     (%r13,%rbx,8), %xmm15                         #67.33
..LN323:
        movhpd    8(%r13,%rbx,8), %xmm15                        #67.33
..LN324:
        movaps    (%r15,%rbx,8), %xmm14                         #67.51
..LN325:
        mulpd     %xmm5, %xmm15                                 #67.33
..LN326:
        mulpd     %xmm0, %xmm14                                 #67.51
..LN327:
        subpd     %xmm14, %xmm15                                #67.51
..LN328:
        movlpd    %xmm15, 1528(%r14,%r12)                       #67.9
..LN329:
        movhpd    %xmm15, 1568(%r14,%r12)                       #67.9
..LN330:
   .loc    1  68  is_stmt 1
        movsd     8(%r15,%rbx,8), %xmm14                        #68.41
..LN331:
        movhpd    16(%r15,%rbx,8), %xmm14                       #68.41
..LN332:
        mulpd     %xmm1, %xmm14                                 #68.41
..LN333:
        addpd     %xmm12, %xmm14                                #68.41
..LN334:
        movlpd    %xmm14, 1536(%r14,%r12)                       #68.9
..LN335:
        movhpd    %xmm14, 1576(%r14,%r12)                       #68.9
..LN336:
   .loc    1  69  is_stmt 1
        movsd     16(%r13,%rbx,8), %xmm14                       #69.33
..LN337:
        movhpd    24(%r13,%rbx,8), %xmm14                       #69.33
..LN338:
        movaps    16(%r15,%rbx,8), %xmm15                       #69.51
..LN339:
        mulpd     %xmm10, %xmm14                                #69.33
..LN340:
        mulpd     %xmm0, %xmm15                                 #69.51
..LN341:
        subpd     %xmm15, %xmm14                                #69.51
..LN342:
        movlpd    %xmm14, 1544(%r14,%r12)                       #69.9
..LN343:
        movhpd    %xmm14, 1584(%r14,%r12)                       #69.9
..LN344:
   .loc    1  70  is_stmt 1
        movlpd    %xmm11, 1552(%r14,%r12)                       #70.9
..LN345:
        movhpd    %xmm11, 1592(%r14,%r12)                       #70.9
..LN346:
   .loc    1  66  is_stmt 1
        movlpd    %xmm11, 1600(%r14,%r12)                       #66.9
..LN347:
        movhpd    %xmm11, 1640(%r14,%r12)                       #66.9
..LN348:
   .loc    1  67  is_stmt 1
        movsd     16(%r13,%rbx,8), %xmm14                       #67.33
..LN349:
        movhpd    24(%r13,%rbx,8), %xmm14                       #67.33
..LN350:
        movaps    16(%r15,%rbx,8), %xmm15                       #67.51
..LN351:
        mulpd     %xmm5, %xmm14                                 #67.33
..LN352:
        mulpd     %xmm0, %xmm15                                 #67.51
..LN353:
        subpd     %xmm15, %xmm14                                #67.51
..LN354:
        movlpd    %xmm14, 1608(%r14,%r12)                       #67.9
..LN355:
        movhpd    %xmm14, 1648(%r14,%r12)                       #67.9
..LN356:
   .loc    1  68  is_stmt 1
        movsd     24(%r15,%rbx,8), %xmm15                       #68.41
..LN357:
        movhpd    32(%r15,%rbx,8), %xmm15                       #68.41
..LN358:
        mulpd     %xmm1, %xmm15                                 #68.41
..LN359:
        addpd     %xmm12, %xmm15                                #68.41
..LN360:
        movlpd    %xmm15, 1616(%r14,%r12)                       #68.9
..LN361:
        movhpd    %xmm15, 1656(%r14,%r12)                       #68.9
..LN362:
   .loc    1  69  is_stmt 1
        movsd     32(%r13,%rbx,8), %xmm15                       #69.33
..LN363:
        movhpd    40(%r13,%rbx,8), %xmm15                       #69.33
..LN364:
        movaps    32(%r15,%rbx,8), %xmm14                       #69.51
..LN365:
   .loc    1  65  is_stmt 1
        addq      $4, %rbx                                      #65.7
..LN366:
   .loc    1  69  is_stmt 1
        mulpd     %xmm10, %xmm15                                #69.33
..LN367:
        mulpd     %xmm0, %xmm14                                 #69.51
..LN368:
        subpd     %xmm14, %xmm15                                #69.51
..LN369:
        movlpd    %xmm15, 1624(%r14,%r12)                       #69.9
..LN370:
        movhpd    %xmm15, 1664(%r14,%r12)                       #69.9
..LN371:
   .loc    1  70  is_stmt 1
        movlpd    %xmm11, 1632(%r14,%r12)                       #70.9
..LN372:
        movhpd    %xmm11, 1672(%r14,%r12)                       #70.9
..LN373:
   .loc    1  65  is_stmt 1
        addq      $160, %r14                                    #65.7
..LN374:
        cmpq      %rbp, %rbx                                    #65.7
..LN375:
        jb        ..B1.35       # Prob 97%                      #65.7
..LN376:
        jmp       ..B1.39       # Prob 100%                     #65.7
..LN377:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax esi r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.37:                        # Preds ..B1.33
        movq      %r12, 360(%rsp)                               #
        lea       (%rbx,%rbx,4), %r14                           #
        movabsq   $lhs, %r12                                    #
        lea       (%rdi,%r14,8), %r14                           #
        movabsq   $cv, %r13                                     #
        movabsq   $rhon, %r15                                   #
..LN378:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax esi r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.38:                        # Preds ..B1.38 ..B1.37
..LN379:
   .loc    1  66  is_stmt 1
        movlpd    %xmm11, 1520(%r14,%r12)                       #66.9
..LN380:
        movhpd    %xmm11, 1560(%r14,%r12)                       #66.9
..LN381:
   .loc    1  67  is_stmt 1
        movaps    (%r13,%rbx,8), %xmm15                         #67.33
..LN382:
        movaps    (%r15,%rbx,8), %xmm14                         #67.51
..LN383:
        mulpd     %xmm5, %xmm15                                 #67.33
..LN384:
        mulpd     %xmm0, %xmm14                                 #67.51
..LN385:
        subpd     %xmm14, %xmm15                                #67.51
..LN386:
        movlpd    %xmm15, 1528(%r14,%r12)                       #67.9
..LN387:
        movhpd    %xmm15, 1568(%r14,%r12)                       #67.9
..LN388:
   .loc    1  68  is_stmt 1
        movsd     8(%r15,%rbx,8), %xmm14                        #68.41
..LN389:
        movhpd    16(%r15,%rbx,8), %xmm14                       #68.41
..LN390:
        mulpd     %xmm1, %xmm14                                 #68.41
..LN391:
        addpd     %xmm12, %xmm14                                #68.41
..LN392:
        movlpd    %xmm14, 1536(%r14,%r12)                       #68.9
..LN393:
        movhpd    %xmm14, 1576(%r14,%r12)                       #68.9
..LN394:
   .loc    1  69  is_stmt 1
        movaps    16(%r13,%rbx,8), %xmm14                       #69.33
..LN395:
        movaps    16(%r15,%rbx,8), %xmm15                       #69.51
..LN396:
        mulpd     %xmm10, %xmm14                                #69.33
..LN397:
        mulpd     %xmm0, %xmm15                                 #69.51
..LN398:
        subpd     %xmm15, %xmm14                                #69.51
..LN399:
        movlpd    %xmm14, 1544(%r14,%r12)                       #69.9
..LN400:
        movhpd    %xmm14, 1584(%r14,%r12)                       #69.9
..LN401:
   .loc    1  70  is_stmt 1
        movlpd    %xmm11, 1552(%r14,%r12)                       #70.9
..LN402:
        movhpd    %xmm11, 1592(%r14,%r12)                       #70.9
..LN403:
   .loc    1  66  is_stmt 1
        movlpd    %xmm11, 1600(%r14,%r12)                       #66.9
..LN404:
        movhpd    %xmm11, 1640(%r14,%r12)                       #66.9
..LN405:
   .loc    1  67  is_stmt 1
        movaps    16(%r13,%rbx,8), %xmm14                       #67.33
..LN406:
        movaps    16(%r15,%rbx,8), %xmm15                       #67.51
..LN407:
        mulpd     %xmm5, %xmm14                                 #67.33
..LN408:
        mulpd     %xmm0, %xmm15                                 #67.51
..LN409:
        subpd     %xmm15, %xmm14                                #67.51
..LN410:
        movlpd    %xmm14, 1608(%r14,%r12)                       #67.9
..LN411:
        movhpd    %xmm14, 1648(%r14,%r12)                       #67.9
..LN412:
   .loc    1  68  is_stmt 1
        movsd     24(%r15,%rbx,8), %xmm15                       #68.41
..LN413:
        movhpd    32(%r15,%rbx,8), %xmm15                       #68.41
..LN414:
        mulpd     %xmm1, %xmm15                                 #68.41
..LN415:
        addpd     %xmm12, %xmm15                                #68.41
..LN416:
        movlpd    %xmm15, 1616(%r14,%r12)                       #68.9
..LN417:
        movhpd    %xmm15, 1656(%r14,%r12)                       #68.9
..LN418:
   .loc    1  69  is_stmt 1
        movaps    32(%r13,%rbx,8), %xmm15                       #69.33
..LN419:
        movaps    32(%r15,%rbx,8), %xmm14                       #69.51
..LN420:
   .loc    1  65  is_stmt 1
        addq      $4, %rbx                                      #65.7
..LN421:
   .loc    1  69  is_stmt 1
        mulpd     %xmm10, %xmm15                                #69.33
..LN422:
        mulpd     %xmm0, %xmm14                                 #69.51
..LN423:
        subpd     %xmm14, %xmm15                                #69.51
..LN424:
        movlpd    %xmm15, 1624(%r14,%r12)                       #69.9
..LN425:
        movhpd    %xmm15, 1664(%r14,%r12)                       #69.9
..LN426:
   .loc    1  70  is_stmt 1
        movlpd    %xmm11, 1632(%r14,%r12)                       #70.9
..LN427:
        movhpd    %xmm11, 1672(%r14,%r12)                       #70.9
..LN428:
   .loc    1  65  is_stmt 1
        addq      $160, %r14                                    #65.7
..LN429:
        cmpq      %rbp, %rbx                                    #65.7
..LN430:
        jb        ..B1.38       # Prob 97%                      #65.7
..LN431:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax esi r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.39:                        # Preds ..B1.35 ..B1.38
        movl      352(%rsp), %r13d                              #
        movq      360(%rsp), %r12                               #
..LN432:
                                # LOE rdx rcx rbp rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.40:                        # Preds ..B1.39 ..B1.154
..LN433:
        cmpq      %rdx, %rbp                                    #65.7
        lea       (%rbp,%rbp,4), %rbx                           #
..LN434:
        jae       ..B1.44       # Prob 10%                      #65.7
..LN435:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.41:                        # Preds ..B1.40
        movq      %r12, 360(%rsp)                               #
        lea       (%rdi,%rbx,8), %r15                           #
        movabsq   $cv, %r14                                     #
        movabsq   $lhs, %rbx                                    #
        xorl      %r12d, %r12d                                  #
        movabsq   $rhon, %r13                                   #
..LN436:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax esi r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.42:                        # Preds ..B1.42 ..B1.41
..LN437:
   .loc    1  67  is_stmt 1
..LN438:
        movsd     (%r13,%rbp,8), %xmm14                         #67.51
..LN439:
        pxor      %xmm15, %xmm15                                #67.25
..LN440:
        mulsd     %xmm6, %xmm14                                 #67.51
..LN441:
        subsd     %xmm7, %xmm15                                 #67.25
..LN442:
        mulsd     (%r14,%rbp,8), %xmm15                         #67.33
..LN443:
   .loc    1  66  is_stmt 1
        movq      %r12, 1520(%r15,%rbx)                         #66.9
..LN444:
   .loc    1  67  is_stmt 1
        subsd     %xmm14, %xmm15                                #67.51
..LN445:
   .loc    1  68  is_stmt 1
        movsd     8(%r13,%rbp,8), %xmm14                        #68.41
..LN446:
        mulsd     %xmm2, %xmm14                                 #68.41
..LN447:
   .loc    1  67  is_stmt 1
        movsd     %xmm15, 1528(%r15,%rbx)                       #67.9
..LN448:
   .loc    1  68  is_stmt 1
        addsd     %xmm13, %xmm14                                #68.41
..LN449:
        movsd     %xmm14, 1536(%r15,%rbx)                       #68.9
..LN450:
   .loc    1  69  is_stmt 1
        movsd     16(%r14,%rbp,8), %xmm14                       #69.33
..LN451:
        movsd     16(%r13,%rbp,8), %xmm15                       #69.51
..LN452:
   .loc    1  65  is_stmt 1
        incq      %rbp                                          #65.7
..LN453:
   .loc    1  69  is_stmt 1
        mulsd     %xmm7, %xmm14                                 #69.33
..LN454:
        mulsd     %xmm6, %xmm15                                 #69.51
..LN455:
   .loc    1  70  is_stmt 1
        movq      %r12, 1552(%r15,%rbx)                         #70.9
..LN456:
   .loc    1  69  is_stmt 1
        subsd     %xmm15, %xmm14                                #69.51
..LN457:
        movsd     %xmm14, 1544(%r15,%rbx)                       #69.9
..LN458:
   .loc    1  65  is_stmt 1
        addq      $40, %r15                                     #65.7
..LN459:
        cmpq      %rdx, %rbp                                    #65.7
..LN460:
        jb        ..B1.42       # Prob 97%                      #65.7
..LN461:
                                # LOE rdx rcx rbx rbp rdi r8 r9 r10 r12 r13 r14 r15 eax esi r11d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.43:                        # Preds ..B1.42
        movl      352(%rsp), %r13d                              #
        movq      360(%rsp), %r12                               #
..LN462:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.44:                        # Preds ..B1.40 ..B1.43 ..B1.26
..LN463:
   .loc    1  58  is_stmt 1
        incq      %rcx                                          #58.5
..LN464:
        addq      $1480, %rdi                                   #58.5
..LN465:
        addq      $296, %r9                                     #58.5
..LN466:
        addq      $296, %r10                                    #58.5
..LN467:
        cmpq      400(%rsp), %rcx                               #58.5
..LN468:
        jb        ..B1.8        # Prob 97%                      #58.5
..LN469:
                                # LOE rdx rcx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.45:                        # Preds ..B1.44
        movq      400(%rsp), %rsi                               #
        xorl      %ebx, %ebx                                    #
        movq      408(%rsp), %r13                               #
..LN470:
        testq     %rsi, %rsi                                    #58.22
        movl      104(%rsp), %ebp                               #
..LN471:
                                # LOE rbx rsi r12 r13 ebp
..B1.46:                        # Preds ..B1.6 ..B1.45
..LN472:
   .loc    1  77  is_stmt 1
        movq      %rbx, %r10                                    #77.5
        movq      %r10, %r11                                    #
..LN473:
        jle       ..B1.66       # Prob 16%                      #77.22
..LN474:
                                # LOE rbx rsi r10 r11 r12 r13 ebp
..B1.47:                        # Preds ..B1.46
..LN475:
   .loc    1  80  is_stmt 1
        movabsq   $comz4, %r15                                  #80.37
..LN476:
   .loc    1  81  is_stmt 1
        movabsq   $comz1, %r14                                  #81.37
..LN477:
   .loc    1  84  is_stmt 1
        movabsq   $comz6, %rax                                  #84.41
..LN478:
   .loc    1  79  is_stmt 1
        movabsq   $comz5, %r9                                   #79.37
..LN479:
   .loc    1  93  is_stmt 1
        movabsq   $lhs, %rdx                                    #93.24
..LN480:
   .loc    1  80  is_stmt 1
        movsd     (%r15), %xmm2                                 #80.37
..LN481:
   .loc    1  90  is_stmt 1
        movabsq   $grid_points, %r15                            #90.24
..LN482:
   .loc    1  81  is_stmt 1
        movsd     (%r14), %xmm6                                 #81.37
..LN483:
   .loc    1  92  is_stmt 1
        movaps    %xmm2, %xmm5                                  #92.24
..LN484:
   .loc    1  84  is_stmt 1
        movsd     (%rax), %xmm4                                 #84.41
..LN485:
   .loc    1  91  is_stmt 1
        movaps    %xmm6, %xmm1                                  #91.24
..LN486:
   .loc    1  79  is_stmt 1
        movsd     (%r9), %xmm3                                  #79.37
..LN487:
   .loc    1  93  is_stmt 1
        movaps    %xmm4, %xmm0                                  #93.24
..LN488:
   .loc    1  90  is_stmt 1
        movl      (%r15), %r8d                                  #90.24
..LN489:
   .loc    1  91  is_stmt 1
        unpcklpd  %xmm1, %xmm1                                  #91.24
..LN490:
   .loc    1  92  is_stmt 1
        unpcklpd  %xmm5, %xmm5                                  #92.24
..LN491:
   .loc    1  93  is_stmt 1
        unpcklpd  %xmm0, %xmm0                                  #93.24
..LN492:
   .loc    1  90  is_stmt 1
        lea       -4(%r8), %r14d                                #90.39
..LN493:
        movslq    %r8d, %r8                                     #90.7
..LN494:
        addq      $-6, %r8                                      #90.7
..LN495:
        movl      %r8d, %r9d                                    #90.7
..LN496:
        andl      $-2, %r9d                                     #90.7
..LN497:
        movslq    %r9d, %r9                                     #90.7
..LN498:
                                # LOE rdx rbx rsi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.48:                        # Preds ..B1.57 ..B1.47
..LN499:
   .loc    1  79  is_stmt 1
        movsd     1536(%r11,%rdx), %xmm7                        #79.22
..LN500:
   .loc    1  90  is_stmt 1
        cmpl      $3, %r14d                                     #90.39
..LN501:
   .loc    1  80  is_stmt 1
        movsd     1544(%r11,%rdx), %xmm8                        #80.22
..LN502:
   .loc    1  79  is_stmt 1
        addsd     %xmm3, %xmm7                                  #79.37
..LN503:
   .loc    1  80  is_stmt 1
        subsd     %xmm2, %xmm8                                  #80.37
..LN504:
   .loc    1  81  is_stmt 1
        movsd     1552(%r11,%rdx), %xmm9                        #81.22
..LN505:
   .loc    1  83  is_stmt 1
        movsd     1568(%r11,%rdx), %xmm10                       #83.24
..LN506:
   .loc    1  81  is_stmt 1
        addsd     %xmm6, %xmm9                                  #81.37
..LN507:
   .loc    1  83  is_stmt 1
        subsd     %xmm2, %xmm10                                 #83.41
..LN508:
   .loc    1  84  is_stmt 1
        movsd     1576(%r11,%rdx), %xmm11                       #84.24
..LN509:
   .loc    1  85  is_stmt 1
        movsd     1584(%r11,%rdx), %xmm12                       #85.24
..LN510:
   .loc    1  84  is_stmt 1
        addsd     %xmm4, %xmm11                                 #84.41
..LN511:
   .loc    1  85  is_stmt 1
        subsd     %xmm2, %xmm12                                 #85.41
..LN512:
   .loc    1  86  is_stmt 1
        movsd     1592(%r11,%rdx), %xmm13                       #86.24
..LN513:
   .loc    1  79  is_stmt 1
        movsd     %xmm7, 1536(%r11,%rdx)                        #79.7
..LN514:
   .loc    1  86  is_stmt 1
        addsd     %xmm6, %xmm13                                 #86.41
..LN515:
   .loc    1  80  is_stmt 1
        movsd     %xmm8, 1544(%r11,%rdx)                        #80.7
..LN516:
   .loc    1  81  is_stmt 1
        movsd     %xmm9, 1552(%r11,%rdx)                        #81.7
..LN517:
   .loc    1  83  is_stmt 1
        movsd     %xmm10, 1568(%r11,%rdx)                       #83.7
..LN518:
   .loc    1  84  is_stmt 1
        movsd     %xmm11, 1576(%r11,%rdx)                       #84.7
..LN519:
   .loc    1  85  is_stmt 1
        movsd     %xmm12, 1584(%r11,%rdx)                       #85.7
..LN520:
   .loc    1  86  is_stmt 1
        movsd     %xmm13, 1592(%r11,%rdx)                       #86.7
..LN521:
   .loc    1  90  is_stmt 1
        jl        ..B1.57       # Prob 50%                      #90.39
..LN522:
                                # LOE rdx rbx rsi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.49:                        # Preds ..B1.48
..LN523:
        cmpq      $2, %r8                                       #90.7
..LN524:
        jl        ..B1.156      # Prob 10%                      #90.7
..LN525:
                                # LOE rdx rbx rsi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.50:                        # Preds ..B1.49
..LN526:
        movq      %r9, %rax                                     #90.7
..LN527:
        movq      %rbx, %rdi                                    #90.7
        movq      %r11, %rcx                                    #
..LN528:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.51:                        # Preds ..B1.51 ..B1.50
..LN529:
   .loc    1  91  is_stmt 1
        movsd     1600(%rcx,%rdx), %xmm7                        #91.24
..LN530:
   .loc    1  90  is_stmt 1
        addq      $2, %rdi                                      #90.7
..LN531:
   .loc    1  92  is_stmt 1
        movsd     1608(%rcx,%rdx), %xmm8                        #92.24
..LN532:
   .loc    1  93  is_stmt 1
        movsd     1616(%rcx,%rdx), %xmm9                        #93.24
..LN533:
   .loc    1  94  is_stmt 1
        movsd     1624(%rcx,%rdx), %xmm10                       #94.24
..LN534:
   .loc    1  95  is_stmt 1
        movsd     1632(%rcx,%rdx), %xmm11                       #95.24
..LN535:
   .loc    1  91  is_stmt 1
        movhpd    1640(%rcx,%rdx), %xmm7                        #91.24
..LN536:
   .loc    1  92  is_stmt 1
        movhpd    1648(%rcx,%rdx), %xmm8                        #92.24
..LN537:
   .loc    1  93  is_stmt 1
        movhpd    1656(%rcx,%rdx), %xmm9                        #93.24
..LN538:
   .loc    1  94  is_stmt 1
        movhpd    1664(%rcx,%rdx), %xmm10                       #94.24
..LN539:
   .loc    1  95  is_stmt 1
        movhpd    1672(%rcx,%rdx), %xmm11                       #95.24
..LN540:
   .loc    1  91  is_stmt 1
        addpd     %xmm1, %xmm7                                  #91.39
..LN541:
   .loc    1  92  is_stmt 1
        subpd     %xmm5, %xmm8                                  #92.39
..LN542:
   .loc    1  93  is_stmt 1
        addpd     %xmm0, %xmm9                                  #93.39
..LN543:
   .loc    1  94  is_stmt 1
        subpd     %xmm5, %xmm10                                 #94.39
..LN544:
   .loc    1  95  is_stmt 1
        addpd     %xmm1, %xmm11                                 #95.39
..LN545:
   .loc    1  91  is_stmt 1
        movlpd    %xmm7, 1600(%rcx,%rdx)                        #91.9
..LN546:
        movhpd    %xmm7, 1640(%rcx,%rdx)                        #91.9
..LN547:
   .loc    1  92  is_stmt 1
        movlpd    %xmm8, 1608(%rcx,%rdx)                        #92.9
..LN548:
        movhpd    %xmm8, 1648(%rcx,%rdx)                        #92.9
..LN549:
   .loc    1  93  is_stmt 1
        movlpd    %xmm9, 1616(%rcx,%rdx)                        #93.9
..LN550:
        movhpd    %xmm9, 1656(%rcx,%rdx)                        #93.9
..LN551:
   .loc    1  94  is_stmt 1
        movlpd    %xmm10, 1624(%rcx,%rdx)                       #94.9
..LN552:
        movhpd    %xmm10, 1664(%rcx,%rdx)                       #94.9
..LN553:
   .loc    1  95  is_stmt 1
        movlpd    %xmm11, 1632(%rcx,%rdx)                       #95.9
..LN554:
        movhpd    %xmm11, 1672(%rcx,%rdx)                       #95.9
..LN555:
   .loc    1  90  is_stmt 1
        addq      $80, %rcx                                     #90.7
..LN556:
        cmpq      %r9, %rdi                                     #90.7
..LN557:
        jb        ..B1.51       # Prob 97%                      #90.7
..LN558:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.53:                        # Preds ..B1.51 ..B1.156
..LN559:
        cmpq      %r8, %rax                                     #90.7
        lea       (%rax,%rax,4), %rcx                           #
        lea       (%r11,%rcx,8), %rcx                           #
..LN560:
        jae       ..B1.57       # Prob 10%                      #90.7
..LN561:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.55:                        # Preds ..B1.53 ..B1.55
..LN562:
   .loc    1  91  is_stmt 1
        movsd     1600(%rcx,%rdx), %xmm7                        #91.24
..LN563:
   .loc    1  90  is_stmt 1
        incq      %rax                                          #90.7
..LN564:
   .loc    1  92  is_stmt 1
        movsd     1608(%rcx,%rdx), %xmm8                        #92.24
..LN565:
   .loc    1  91  is_stmt 1
        addsd     %xmm6, %xmm7                                  #91.39
..LN566:
   .loc    1  92  is_stmt 1
        subsd     %xmm2, %xmm8                                  #92.39
..LN567:
   .loc    1  93  is_stmt 1
        movsd     1616(%rcx,%rdx), %xmm9                        #93.24
..LN568:
   .loc    1  94  is_stmt 1
        movsd     1624(%rcx,%rdx), %xmm10                       #94.24
..LN569:
   .loc    1  93  is_stmt 1
        addsd     %xmm4, %xmm9                                  #93.39
..LN570:
   .loc    1  94  is_stmt 1
        subsd     %xmm2, %xmm10                                 #94.39
..LN571:
   .loc    1  95  is_stmt 1
        movsd     1632(%rcx,%rdx), %xmm11                       #95.24
..LN572:
   .loc    1  91  is_stmt 1
        movsd     %xmm7, 1600(%rcx,%rdx)                        #91.9
..LN573:
   .loc    1  95  is_stmt 1
        addsd     %xmm6, %xmm11                                 #95.39
..LN574:
   .loc    1  92  is_stmt 1
        movsd     %xmm8, 1608(%rcx,%rdx)                        #92.9
..LN575:
   .loc    1  93  is_stmt 1
        movsd     %xmm9, 1616(%rcx,%rdx)                        #93.9
..LN576:
   .loc    1  94  is_stmt 1
        movsd     %xmm10, 1624(%rcx,%rdx)                       #94.9
..LN577:
   .loc    1  95  is_stmt 1
        movsd     %xmm11, 1632(%rcx,%rdx)                       #95.9
..LN578:
   .loc    1  90  is_stmt 1
        addq      $40, %rcx                                     #90.7
..LN579:
        cmpq      %r8, %rax                                     #90.7
..LN580:
        jb        ..B1.55       # Prob 97%                      #90.7
..LN581:
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.57:                        # Preds ..B1.55 ..B1.48 ..B1.53
..LN582:
   .loc    1  77  is_stmt 1
        incq      %r10                                          #77.5
..LN583:
        addq      $1480, %r11                                   #77.5
..LN584:
        cmpq      %rsi, %r10                                    #77.5
..LN585:
        jb        ..B1.48       # Prob 97%                      #77.5
..LN586:
                                # LOE rdx rbx rsi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.58:                        # Preds ..B1.57
..LN587:
   .loc    1  101  is_stmt 1
        movabsq   $comz1, %r9                                   #101.37
..LN588:
   .loc    1  102  is_stmt 1
        movabsq   $comz4, %r10                                  #102.37
..LN589:
   .loc    1  103  is_stmt 1
        movabsq   $comz6, %r11                                  #103.37
..LN590:
   .loc    1  108  is_stmt 1
        movabsq   $comz5, %r14                                  #108.41
..LN591:
   .loc    1  100  is_stmt 1
        movslq    (%r15), %rax                                  #100.11
..LN592:
   .loc    1  99  is_stmt 1
        cmpq      $2, %rsi                                      #99.5
..LN593:
   .loc    1  101  is_stmt 1
        movsd     (%r9), %xmm1                                  #101.37
..LN594:
   .loc    1  102  is_stmt 1
        movsd     (%r10), %xmm2                                 #102.37
..LN595:
   .loc    1  103  is_stmt 1
        movsd     (%r11), %xmm3                                 #103.37
..LN596:
   .loc    1  108  is_stmt 1
        movsd     (%r14), %xmm0                                 #108.41
..LN597:
   .loc    1  99  is_stmt 1
        jl        ..B1.167      # Prob 10%                      #99.5
..LN598:
                                # LOE rax rdx rbx rsi r12 r13 ebp xmm0 xmm1 xmm2 xmm3
..B1.59:                        # Preds ..B1.58
..LN599:
        movl      %esi, %r11d                                   #99.5
..LN600:
   .loc    1  101  is_stmt 1
        lea       (%rax,%rax,4), %r9                            #101.22
..LN601:
   .loc    1  99  is_stmt 1
        andl      $-2, %r11d                                    #99.5
..LN602:
   .loc    1  101  is_stmt 1
        movaps    %xmm1, %xmm7                                  #101.22
..LN603:
   .loc    1  102  is_stmt 1
        movaps    %xmm2, %xmm6                                  #102.22
..LN604:
   .loc    1  103  is_stmt 1
        movaps    %xmm3, %xmm5                                  #103.22
..LN605:
   .loc    1  108  is_stmt 1
        movaps    %xmm0, %xmm4                                  #108.24
..LN606:
   .loc    1  99  is_stmt 1
        movq      %rbx, %r10                                    #99.5
..LN607:
        movslq    %r11d, %r11                                   #99.5
..LN608:
   .loc    1  101  is_stmt 1
        shlq      $3, %r9                                       #101.22
..LN609:
        unpcklpd  %xmm7, %xmm7                                  #101.22
..LN610:
   .loc    1  102  is_stmt 1
        unpcklpd  %xmm6, %xmm6                                  #102.22
..LN611:
   .loc    1  103  is_stmt 1
        unpcklpd  %xmm5, %xmm5                                  #103.22
..LN612:
   .loc    1  108  is_stmt 1
        unpcklpd  %xmm4, %xmm4                                  #108.24
..LN613:
                                # LOE rax rdx rbx rsi r9 r10 r11 r12 r13 ebp xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7
..B1.60:                        # Preds ..B1.60 ..B1.59
..LN614:
   .loc    1  101  is_stmt 1
        movsd     1360(%r9,%rdx), %xmm8                         #101.22
..LN615:
   .loc    1  99  is_stmt 1
        addq      $2, %r10                                      #99.5
..LN616:
   .loc    1  102  is_stmt 1
        movsd     1368(%r9,%rdx), %xmm9                         #102.22
..LN617:
   .loc    1  103  is_stmt 1
        movsd     1376(%r9,%rdx), %xmm10                        #103.22
..LN618:
   .loc    1  104  is_stmt 1
        movsd     1384(%r9,%rdx), %xmm11                        #104.22
..LN619:
   .loc    1  106  is_stmt 1
        movsd     1400(%r9,%rdx), %xmm12                        #106.24
..LN620:
   .loc    1  107  is_stmt 1
        movsd     1408(%r9,%rdx), %xmm13                        #107.24
..LN621:
   .loc    1  108  is_stmt 1
        movsd     1416(%r9,%rdx), %xmm14                        #108.24
..LN622:
   .loc    1  101  is_stmt 1
        movhpd    2840(%r9,%rdx), %xmm8                         #101.22
..LN623:
   .loc    1  102  is_stmt 1
        movhpd    2848(%r9,%rdx), %xmm9                         #102.22
..LN624:
   .loc    1  103  is_stmt 1
        movhpd    2856(%r9,%rdx), %xmm10                        #103.22
..LN625:
   .loc    1  104  is_stmt 1
        movhpd    2864(%r9,%rdx), %xmm11                        #104.22
..LN626:
   .loc    1  106  is_stmt 1
        movhpd    2880(%r9,%rdx), %xmm12                        #106.24
..LN627:
   .loc    1  107  is_stmt 1
        movhpd    2888(%r9,%rdx), %xmm13                        #107.24
..LN628:
   .loc    1  108  is_stmt 1
        movhpd    2896(%r9,%rdx), %xmm14                        #108.24
..LN629:
   .loc    1  101  is_stmt 1
        addpd     %xmm7, %xmm8                                  #101.37
..LN630:
   .loc    1  102  is_stmt 1
        subpd     %xmm6, %xmm9                                  #102.37
..LN631:
   .loc    1  103  is_stmt 1
        addpd     %xmm5, %xmm10                                 #103.37
..LN632:
   .loc    1  104  is_stmt 1
        subpd     %xmm6, %xmm11                                 #104.37
..LN633:
   .loc    1  106  is_stmt 1
        addpd     %xmm7, %xmm12                                 #106.41
..LN634:
   .loc    1  107  is_stmt 1
        subpd     %xmm6, %xmm13                                 #107.41
..LN635:
   .loc    1  108  is_stmt 1
        addpd     %xmm4, %xmm14                                 #108.41
..LN636:
   .loc    1  101  is_stmt 1
        movlpd    %xmm8, 1360(%r9,%rdx)                         #101.7
..LN637:
        movhpd    %xmm8, 2840(%r9,%rdx)                         #101.7
..LN638:
   .loc    1  102  is_stmt 1
        movlpd    %xmm9, 1368(%r9,%rdx)                         #102.7
..LN639:
        movhpd    %xmm9, 2848(%r9,%rdx)                         #102.7
..LN640:
   .loc    1  103  is_stmt 1
        movlpd    %xmm10, 1376(%r9,%rdx)                        #103.7
..LN641:
        movhpd    %xmm10, 2856(%r9,%rdx)                        #103.7
..LN642:
   .loc    1  104  is_stmt 1
        movlpd    %xmm11, 1384(%r9,%rdx)                        #104.7
..LN643:
        movhpd    %xmm11, 2864(%r9,%rdx)                        #104.7
..LN644:
   .loc    1  106  is_stmt 1
        movlpd    %xmm12, 1400(%r9,%rdx)                        #106.7
..LN645:
        movhpd    %xmm12, 2880(%r9,%rdx)                        #106.7
..LN646:
   .loc    1  107  is_stmt 1
        movlpd    %xmm13, 1408(%r9,%rdx)                        #107.7
..LN647:
        movhpd    %xmm13, 2888(%r9,%rdx)                        #107.7
..LN648:
   .loc    1  108  is_stmt 1
        movlpd    %xmm14, 1416(%r9,%rdx)                        #108.7
..LN649:
        movhpd    %xmm14, 2896(%r9,%rdx)                        #108.7
..LN650:
   .loc    1  99  is_stmt 1
        addq      $2960, %r9                                    #99.5
..LN651:
        cmpq      %r11, %r10                                    #99.5
..LN652:
        jb        ..B1.60       # Prob 97%                      #99.5
..LN653:
                                # LOE rax rdx rbx rsi r9 r10 r11 r12 r13 ebp xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7
..B1.62:                        # Preds ..B1.60 ..B1.167
        imulq     $1480, %r11, %r9                              #
..LN654:
        cmpq      %rsi, %r11                                    #99.5
..LN655:
        jae       ..B1.65       # Prob 16%                      #99.5
..LN656:
                                # LOE rax rdx rbx rsi r9 r11 r12 r13 ebp xmm0 xmm1 xmm2 xmm3
..B1.63:                        # Preds ..B1.62
..LN657:
   .loc    1  101  is_stmt 1
        lea       (%rax,%rax,4), %rax                           #101.22
        lea       (%r9,%rax,8), %rax                            #
..LN658:
                                # LOE rax rdx rbx rsi r11 r12 r13 ebp xmm0 xmm1 xmm2 xmm3
..B1.64:                        # Preds ..B1.64 ..B1.63
..LN659:
        movsd     1360(%rax,%rdx), %xmm4                        #101.22
..LN660:
   .loc    1  99  is_stmt 1
        incq      %r11                                          #99.5
..LN661:
   .loc    1  102  is_stmt 1
        movsd     1368(%rax,%rdx), %xmm5                        #102.22
..LN662:
   .loc    1  101  is_stmt 1
        addsd     %xmm1, %xmm4                                  #101.37
..LN663:
   .loc    1  102  is_stmt 1
        subsd     %xmm2, %xmm5                                  #102.37
..LN664:
   .loc    1  103  is_stmt 1
        movsd     1376(%rax,%rdx), %xmm6                        #103.22
..LN665:
   .loc    1  104  is_stmt 1
        movsd     1384(%rax,%rdx), %xmm7                        #104.22
..LN666:
   .loc    1  103  is_stmt 1
        addsd     %xmm3, %xmm6                                  #103.37
..LN667:
   .loc    1  104  is_stmt 1
        subsd     %xmm2, %xmm7                                  #104.37
..LN668:
   .loc    1  106  is_stmt 1
        movsd     1400(%rax,%rdx), %xmm8                        #106.24
..LN669:
   .loc    1  107  is_stmt 1
        movsd     1408(%rax,%rdx), %xmm9                        #107.24
..LN670:
   .loc    1  106  is_stmt 1
        addsd     %xmm1, %xmm8                                  #106.41
..LN671:
   .loc    1  107  is_stmt 1
        subsd     %xmm2, %xmm9                                  #107.41
..LN672:
   .loc    1  108  is_stmt 1
        movsd     1416(%rax,%rdx), %xmm10                       #108.24
..LN673:
   .loc    1  101  is_stmt 1
        movsd     %xmm4, 1360(%rax,%rdx)                        #101.7
..LN674:
   .loc    1  108  is_stmt 1
        addsd     %xmm0, %xmm10                                 #108.41
..LN675:
   .loc    1  102  is_stmt 1
        movsd     %xmm5, 1368(%rax,%rdx)                        #102.7
..LN676:
   .loc    1  103  is_stmt 1
        movsd     %xmm6, 1376(%rax,%rdx)                        #103.7
..LN677:
   .loc    1  104  is_stmt 1
        movsd     %xmm7, 1384(%rax,%rdx)                        #104.7
..LN678:
   .loc    1  106  is_stmt 1
        movsd     %xmm8, 1400(%rax,%rdx)                        #106.7
..LN679:
   .loc    1  107  is_stmt 1
        movsd     %xmm9, 1408(%rax,%rdx)                        #107.7
..LN680:
   .loc    1  108  is_stmt 1
        movsd     %xmm10, 1416(%rax,%rdx)                       #108.7
..LN681:
   .loc    1  99  is_stmt 1
        addq      $1480, %rax                                   #99.5
..LN682:
        cmpq      %rsi, %r11                                    #99.5
..LN683:
        jb        ..B1.64       # Prob 97%                      #99.5
..LN684:
                                # LOE rax rdx rbx rsi r11 r12 r13 ebp xmm0 xmm1 xmm2 xmm3
..B1.65:                        # Preds ..B1.62 ..B1.64
..LN685:
   .loc    1  58  is_stmt 1
        testq     %rsi, %rsi                                    #58.22
..LN686:
                                # LOE rbx rsi r12 r13 ebp
..B1.66:                        # Preds ..B1.46 ..B1.65
..LN687:
   .loc    1  115  is_stmt 1
        movq      %rbx, %rdi                                    #115.5
        movq      %rdi, %rdx                                    #
..LN688:
        jle       ..B1.124      # Prob 16%                      #115.22
..LN689:
                                # LOE rdx rbx rsi rdi r12 r13 ebp
..B1.67:                        # Preds ..B1.66
..LN690:
   .loc    1  116  is_stmt 1
        movabsq   $nx2, %rax                                    #116.24
..LN691:
   .loc    1  118  is_stmt 1
        movabsq   $dttx2, %r9                                   #118.40
..LN692:
   .loc    1  116  is_stmt 1
        movslq    (%rax), %r8                                   #116.24
..LN693:
        testq     %r8, %r8                                      #116.24
..LN694:
   .loc    1  118  is_stmt 1
        movsd     (%r9), %xmm1                                  #118.40
..LN695:
   .loc    1  116  is_stmt 1
        jg        ..B1.137      # Prob 50%                      #116.24
..LN696:
                                # LOE rdx rbx rsi rdi r8 r12 r13 ebp xmm1
..B1.68:                        # Preds ..B1.151 ..B1.164 ..B1.67
..LN697:
   .loc    1  138  is_stmt 1
        movabsq   $grid_points, %rdi                            #138.24
..LN698:
   .loc    1  137  is_stmt 1
        cmpq      $2, %rsi                                      #137.5
..LN699:
   .loc    1  138  is_stmt 1
        movl      (%rdi), %eax                                  #138.24
..LN700:
        movl      %eax, %r10d                                   #138.24
..LN701:
   .loc    1  137  is_stmt 1
        jl        ..B1.162      # Prob 10%                      #137.5
..LN702:
                                # LOE rbx rsi rdi r12 r13 eax ebp r10d
..B1.69:                        # Preds ..B1.68
..LN703:
        movl      %esi, %r8d                                    #137.5
..LN704:
        movq      %rbx, %rcx                                    #137.5
..LN705:
        andl      $-2, %r8d                                     #137.5
..LN706:
   .loc    1  138  is_stmt 1
        lea       -3(%rax), %r9d                                #138.39
..LN707:
        movslq    %eax, %rax                                    #138.7
        movq      %rcx, %rdx                                    #
..LN708:
   .loc    1  137  is_stmt 1
        movslq    %r8d, %r8                                     #137.5
..LN709:
   .loc    1  138  is_stmt 1
        addq      $-2, %rax                                     #138.39
        movl      %r10d, 64(%rsp)                               #
        movq      %r12, 360(%rsp)                               #
        movl      %ebp, 104(%rsp)                               #
        movq      %rsi, 400(%rsp)                               #
        movaps    112(%rsp), %xmm1                              #
..LN710:
                                # LOE rax rdx rcx rbx r8 r13 r9d xmm1
..B1.70:                        # Preds ..B1.74 ..B1.69
..LN711:
        movq      %rbx, %r10                                    #138.7
..LN712:
        testl     %r9d, %r9d                                    #138.39
        movq      %r10, %rdi                                    #
..LN713:
        js        ..B1.74       # Prob 10%                      #138.39
..LN714:
                                # LOE rax rdx rcx rbx rdi r8 r10 r13 r9d xmm1
..B1.71:                        # Preds ..B1.70
        movq      %r13, 408(%rsp)                               #
        lea       (%r13,%rdx), %r11                             #
        movabsq   $lhs, %r12                                    #
        movabsq   $rhs, %r14                                    #
..LN715:
                                # LOE rax rdx rcx rdi r8 r10 r11 r12 r14 r9d xmm1
..B1.72:                        # Preds ..B1.72 ..B1.71
..LN716:
   .loc    1  141  is_stmt 1
        movaps    %xmm1, %xmm0                                  #141.20
..LN717:
        lea       1496(%rdx,%rdi), %rbp                         #141.20
..LN718:
        addq      %r12, %rbp                                    #141.20
..LN719:
   .loc    1  143  is_stmt 1
        lea       1512(%rdx,%rdi), %r15                         #143.29
..LN720:
        addq      %r12, %r15                                    #143.29
..LN721:
   .loc    1  147  is_stmt 1
        lea       1528(%rdx,%rdi), %rsi                         #147.41
..LN722:
        addq      %r12, %rsi                                    #147.41
..LN723:
        lea       1536(%rdx,%rdi), %rbx                         #147.25
..LN724:
        addq      %r12, %rbx                                    #147.25
..LN725:
   .loc    1  148  is_stmt 1
        lea       1544(%rdx,%rdi), %r13                         #148.25
..LN726:
   .loc    1  141  is_stmt 1
        movsd     (%rbp), %xmm2                                 #141.20
..LN727:
   .loc    1  148  is_stmt 1
        addq      %r12, %r13                                    #148.25
..LN728:
   .loc    1  141  is_stmt 1
        movhpd    1480(%rbp), %xmm2                             #141.20
..LN729:
   .loc    1  142  is_stmt 1
        lea       1504(%rdx,%rdi), %rbp                         #142.29
..LN730:
   .loc    1  141  is_stmt 1
        divpd     %xmm2, %xmm0                                  #141.20
..LN731:
   .loc    1  142  is_stmt 1
        addq      %r12, %rbp                                    #142.29
..LN732:
   .loc    1  138  is_stmt 1
        incq      %r10                                          #138.7
..LN733:
   .loc    1  142  is_stmt 1
        movsd     (%rbp), %xmm3                                 #142.29
..LN734:
        movhpd    1480(%rbp), %xmm3                             #142.29
..LN735:
        mulpd     %xmm0, %xmm3                                  #142.29
..LN736:
        movlpd    %xmm3, (%rbp)                                 #142.9
..LN737:
        movhpd    %xmm3, 1480(%rbp)                             #142.9
..LN738:
   .loc    1  143  is_stmt 1
        movsd     (%r15), %xmm4                                 #143.29
..LN739:
        movhpd    1480(%r15), %xmm4                             #143.29
..LN740:
        mulpd     %xmm0, %xmm4                                  #143.29
..LN741:
        movlpd    %xmm4, (%r15)                                 #143.9
..LN742:
        movhpd    %xmm4, 1480(%r15)                             #143.9
..LN743:
   .loc    1  147  is_stmt 1
        movsd     (%rsi), %xmm6                                 #147.41
..LN744:
        movsd     (%rbp), %xmm5                                 #147.55
..LN745:
        movhpd    1480(%rsi), %xmm6                             #147.41
..LN746:
        movhpd    1480(%rbp), %xmm5                             #147.55
..LN747:
        mulpd     %xmm5, %xmm6                                  #147.55
..LN748:
        movsd     (%rbx), %xmm7                                 #147.25
..LN749:
        movhpd    1480(%rbx), %xmm7                             #147.25
..LN750:
        subpd     %xmm6, %xmm7                                  #147.55
..LN751:
        movlpd    %xmm7, (%rbx)                                 #147.9
..LN752:
        movhpd    %xmm7, 1480(%rbx)                             #147.9
..LN753:
   .loc    1  153  is_stmt 1
        lea       1560(%rdx,%rdi), %rbx                         #153.41
..LN754:
   .loc    1  148  is_stmt 1
        movsd     (%rsi), %xmm9                                 #148.41
..LN755:
   .loc    1  153  is_stmt 1
        addq      %r12, %rbx                                    #153.41
..LN756:
   .loc    1  148  is_stmt 1
        movsd     (%r15), %xmm8                                 #148.55
..LN757:
        movhpd    1480(%rsi), %xmm9                             #148.41
..LN758:
        movhpd    1480(%r15), %xmm8                             #148.55
..LN759:
        mulpd     %xmm8, %xmm9                                  #148.55
..LN760:
        movsd     (%r13), %xmm10                                #148.25
..LN761:
        movhpd    1480(%r13), %xmm10                            #148.25
..LN762:
        subpd     %xmm9, %xmm10                                 #148.55
..LN763:
        movlpd    %xmm10, (%r13)                                #148.9
..LN764:
        movhpd    %xmm10, 1480(%r13)                            #148.9
..LN765:
   .loc    1  153  is_stmt 1
        lea       1576(%rdx,%rdi), %r13                         #153.25
..LN766:
        movsd     (%rbx), %xmm12                                #153.41
..LN767:
        addq      %r12, %r13                                    #153.25
..LN768:
        movsd     (%r15), %xmm11                                #153.55
..LN769:
        movhpd    1480(%rbx), %xmm12                            #153.41
..LN770:
        movhpd    1480(%r15), %xmm11                            #153.55
..LN771:
   .loc    1  150  is_stmt 1
        lea       1520(%r11,%rdi), %r15                         #150.30
..LN772:
   .loc    1  153  is_stmt 1
        mulpd     %xmm11, %xmm12                                #153.55
..LN773:
        movsd     (%r13), %xmm13                                #153.25
..LN774:
   .loc    1  150  is_stmt 1
        addq      %r14, %r15                                    #150.30
..LN775:
   .loc    1  153  is_stmt 1
        movhpd    1480(%r13), %xmm13                            #153.25
..LN776:
        subpd     %xmm12, %xmm13                                #153.55
..LN777:
        movlpd    %xmm13, (%r13)                                #153.9
..LN778:
        movhpd    %xmm13, 1480(%r13)                            #153.9
..LN779:
   .loc    1  145  is_stmt 1
        lea       1480(%r11,%rdi), %r13                         #145.34
..LN780:
        addq      %r14, %r13                                    #145.34
..LN781:
        movsd     (%r13), %xmm14                                #145.34
..LN782:
        movhpd    1480(%r13), %xmm14                            #145.34
..LN783:
        mulpd     %xmm0, %xmm14                                 #145.34
..LN784:
        movlpd    %xmm14, (%r13)                                #145.11
..LN785:
        movhpd    %xmm14, 1480(%r13)                            #145.11
..LN786:
   .loc    1  150  is_stmt 1
        movsd     (%rsi), %xmm2                                 #150.49
..LN787:
        movsd     (%r13), %xmm15                                #150.63
..LN788:
        movhpd    1480(%rsi), %xmm2                             #150.49
..LN789:
        movhpd    1480(%r13), %xmm15                            #150.63
..LN790:
        mulpd     %xmm15, %xmm2                                 #150.63
..LN791:
        movsd     (%r15), %xmm3                                 #150.30
..LN792:
        movhpd    1480(%r15), %xmm3                             #150.30
..LN793:
        subpd     %xmm2, %xmm3                                  #150.63
..LN794:
        movlpd    %xmm3, (%r15)                                 #150.11
..LN795:
        movhpd    %xmm3, 1480(%r15)                             #150.11
..LN796:
   .loc    1  155  is_stmt 1
        lea       1560(%r11,%rdi), %r15                         #155.30
..LN797:
        movsd     (%rbx), %xmm5                                 #155.49
..LN798:
        addq      %r14, %r15                                    #155.30
..LN799:
        movsd     (%r13), %xmm4                                 #155.63
..LN800:
        .byte     144                                           #155.49
..LN801:
        movhpd    1480(%rbx), %xmm5                             #155.49
..LN802:
        movhpd    1480(%r13), %xmm4                             #155.63
..LN803:
   .loc    1  150  is_stmt 1
        lea       1528(%r11,%rdi), %r13                         #150.30
..LN804:
   .loc    1  155  is_stmt 1
        mulpd     %xmm4, %xmm5                                  #155.63
..LN805:
        movsd     (%r15), %xmm6                                 #155.30
..LN806:
   .loc    1  150  is_stmt 1
        addq      %r14, %r13                                    #150.30
..LN807:
   .loc    1  155  is_stmt 1
        movhpd    1480(%r15), %xmm6                             #155.30
..LN808:
        subpd     %xmm5, %xmm6                                  #155.63
..LN809:
        movlpd    %xmm6, (%r15)                                 #155.11
..LN810:
        movhpd    %xmm6, 1480(%r15)                             #155.11
..LN811:
   .loc    1  145  is_stmt 1
        lea       1488(%r11,%rdi), %r15                         #145.34
..LN812:
        addq      %r14, %r15                                    #145.34
..LN813:
        movsd     (%r15), %xmm7                                 #145.34
..LN814:
        movhpd    1480(%r15), %xmm7                             #145.34
..LN815:
        mulpd     %xmm0, %xmm7                                  #145.34
..LN816:
        movlpd    %xmm7, (%r15)                                 #145.11
..LN817:
        movhpd    %xmm7, 1480(%r15)                             #145.11
..LN818:
   .loc    1  150  is_stmt 1
        movsd     (%rsi), %xmm9                                 #150.49
..LN819:
        movsd     (%r15), %xmm8                                 #150.63
..LN820:
        movhpd    1480(%rsi), %xmm9                             #150.49
..LN821:
        movhpd    1480(%r15), %xmm8                             #150.63
..LN822:
        mulpd     %xmm8, %xmm9                                  #150.63
..LN823:
        movsd     (%r13), %xmm10                                #150.30
..LN824:
        movhpd    1480(%r13), %xmm10                            #150.30
..LN825:
        subpd     %xmm9, %xmm10                                 #150.63
..LN826:
        movlpd    %xmm10, (%r13)                                #150.11
..LN827:
        movhpd    %xmm10, 1480(%r13)                            #150.11
..LN828:
   .loc    1  155  is_stmt 1
        lea       1568(%r11,%rdi), %r13                         #155.30
..LN829:
        .byte     144                                           #155.49
..LN830:
        movsd     (%rbx), %xmm12                                #155.49
..LN831:
        addq      %r14, %r13                                    #155.30
..LN832:
        movsd     (%r15), %xmm11                                #155.63
..LN833:
        movhpd    1480(%rbx), %xmm12                            #155.49
..LN834:
        movhpd    1480(%r15), %xmm11                            #155.63
..LN835:
   .loc    1  150  is_stmt 1
        lea       1536(%r11,%rdi), %r15                         #150.30
..LN836:
   .loc    1  155  is_stmt 1
        mulpd     %xmm11, %xmm12                                #155.63
..LN837:
        movsd     (%r13), %xmm13                                #155.30
..LN838:
   .loc    1  150  is_stmt 1
        addq      %r14, %r15                                    #150.30
..LN839:
   .loc    1  155  is_stmt 1
        movhpd    1480(%r13), %xmm13                            #155.30
..LN840:
        subpd     %xmm12, %xmm13                                #155.63
..LN841:
        movlpd    %xmm13, (%r13)                                #155.11
..LN842:
        movhpd    %xmm13, 1480(%r13)                            #155.11
..LN843:
   .loc    1  145  is_stmt 1
        lea       1496(%r11,%rdi), %r13                         #145.34
..LN844:
        addq      %r14, %r13                                    #145.34
..LN845:
        movsd     (%r13), %xmm14                                #145.34
..LN846:
        movhpd    1480(%r13), %xmm14                            #145.34
..LN847:
        mulpd     %xmm14, %xmm0                                 #145.34
..LN848:
        movlpd    %xmm0, (%r13)                                 #145.11
..LN849:
        movhpd    %xmm0, 1480(%r13)                             #145.11
..LN850:
   .loc    1  150  is_stmt 1
        movsd     (%rsi), %xmm2                                 #150.49
..LN851:
        movsd     (%r13), %xmm0                                 #150.63
..LN852:
        .byte     15                                            #150.49
..LN853:
        .byte     31                                            #150.49
..LN854:
        .byte     0                                             #150.49
..LN855:
        movhpd    1480(%rsi), %xmm2                             #150.49
..LN856:
   .loc    1  155  is_stmt 1
        lea       1576(%r11,%rdi), %rsi                         #155.30
..LN857:
   .loc    1  150  is_stmt 1
        movhpd    1480(%r13), %xmm0                             #150.63
..LN858:
   .loc    1  155  is_stmt 1
        addq      %r14, %rsi                                    #155.30
..LN859:
   .loc    1  150  is_stmt 1
        mulpd     %xmm0, %xmm2                                  #150.63
..LN860:
        movsd     (%r15), %xmm3                                 #150.30
..LN861:
        movhpd    1480(%r15), %xmm3                             #150.30
..LN862:
        subpd     %xmm2, %xmm3                                  #150.63
..LN863:
        movlpd    %xmm3, (%r15)                                 #150.11
..LN864:
        movhpd    %xmm3, 1480(%r15)                             #150.11
..LN865:
   .loc    1  155  is_stmt 1
        movsd     (%rbx), %xmm5                                 #155.49
..LN866:
        movsd     (%r13), %xmm4                                 #155.63
..LN867:
        movhpd    1480(%rbx), %xmm5                             #155.49
..LN868:
        movhpd    1480(%r13), %xmm4                             #155.63
..LN869:
   .loc    1  152  is_stmt 1
        lea       1568(%rdx,%rdi), %r13                         #152.25
..LN870:
   .loc    1  155  is_stmt 1
        mulpd     %xmm4, %xmm5                                  #155.63
..LN871:
        movsd     (%rsi), %xmm6                                 #155.30
..LN872:
   .loc    1  152  is_stmt 1
        addq      %r12, %r13                                    #152.25
..LN873:
   .loc    1  155  is_stmt 1
        movhpd    1480(%rsi), %xmm6                             #155.30
..LN874:
   .loc    1  138  is_stmt 1
        addq      $40, %rdi                                     #138.7
..LN875:
   .loc    1  155  is_stmt 1
        subpd     %xmm5, %xmm6                                  #155.63
..LN876:
        movlpd    %xmm6, (%rsi)                                 #155.11
..LN877:
   .loc    1  138  is_stmt 1
        cmpq      %rax, %r10                                    #138.7
..LN878:
   .loc    1  155  is_stmt 1
        movhpd    %xmm6, 1480(%rsi)                             #155.11
..LN879:
   .loc    1  152  is_stmt 1
        movsd     (%rbx), %xmm8                                 #152.41
..LN880:
        movsd     (%rbp), %xmm7                                 #152.55
..LN881:
        movhpd    1480(%rbx), %xmm8                             #152.41
..LN882:
        movhpd    1480(%rbp), %xmm7                             #152.55
..LN883:
        mulpd     %xmm7, %xmm8                                  #152.55
..LN884:
        .byte     102                                           #152.25
..LN885:
        .byte     144                                           #152.25
..LN886:
        movsd     (%r13), %xmm9                                 #152.25
..LN887:
        movhpd    1480(%r13), %xmm9                             #152.25
..LN888:
        subpd     %xmm8, %xmm9                                  #152.55
..LN889:
        movlpd    %xmm9, (%r13)                                 #152.9
..LN890:
        movhpd    %xmm9, 1480(%r13)                             #152.9
..LN891:
   .loc    1  138  is_stmt 1
        jb        ..B1.72       # Prob 97%                      #138.7
..LN892:
                                # LOE rax rdx rcx rdi r8 r10 r11 r12 r14 r9d xmm1
..B1.73:                        # Preds ..B1.72
        movq      408(%rsp), %r13                               #
        xorl      %ebx, %ebx                                    #
..LN893:
                                # LOE rax rdx rcx rbx r8 r13 r9d xmm1
..B1.74:                        # Preds ..B1.70 ..B1.73
..LN894:
   .loc    1  137  is_stmt 1
        addq      $2, %rcx                                      #137.5
..LN895:
        addq      $2960, %rdx                                   #137.5
..LN896:
        cmpq      %r8, %rcx                                     #137.5
..LN897:
        jb        ..B1.70       # Prob 97%                      #137.5
..LN898:
                                # LOE rax rdx rcx rbx r8 r13 r9d xmm1
..B1.75:                        # Preds ..B1.74
        movabsq   $grid_points, %rdi                            #
        movl      64(%rsp), %r10d                               #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
        movq      400(%rsp), %rsi                               #
..LN899:
   .loc    1  166  is_stmt 1
        movl      (%rdi), %eax                                  #166.12
..LN900:
                                # LOE rbx rsi rdi r8 r12 r13 eax ebp r10d
..B1.76:                        # Preds ..B1.75 ..B1.162
..LN901:
        imulq     $1480, %r8, %r9                               #
..LN902:
   .loc    1  137  is_stmt 1
        cmpq      %rsi, %r8                                     #137.5
..LN903:
        jae       ..B1.84       # Prob 16%                      #137.5
..LN904:
                                # LOE rbx rsi rdi r8 r9 r12 r13 eax ebp r10d
..B1.77:                        # Preds ..B1.76
..LN905:
   .loc    1  138  is_stmt 1
        movq      %r12, 360(%rsp)                               #138.39
..LN906:
        lea       -3(%r10), %r11d                               #138.39
..LN907:
        movslq    %r10d, %r10                                   #138.7
..LN908:
        movl      %ebp, 104(%rsp)                               #138.39
..LN909:
        addq      $-2, %r10                                     #138.39
..LN910:
        movsd     272(%rsp), %xmm13                             #138.39
..LN911:
                                # LOE rbx rsi r8 r9 r10 r13 eax r11d xmm13
..B1.78:                        # Preds ..B1.82 ..B1.77
..LN912:
        movq      %rbx, %r14                                    #138.7
..LN913:
        testl     %r11d, %r11d                                  #138.39
        movq      %r14, %r12                                    #
..LN914:
        js        ..B1.82       # Prob 10%                      #138.39
..LN915:
                                # LOE rbx rsi r8 r9 r10 r12 r13 r14 eax r11d xmm13
..B1.79:                        # Preds ..B1.78
..LN916:
   .loc    1  152  is_stmt 1
        movabsq   $lhs, %rcx                                    #152.25
..LN917:
   .loc    1  155  is_stmt 1
        movabsq   $rhs, %rdx                                    #155.30
..LN918:
   .loc    1  138  is_stmt 1
        lea       (%r13,%r9), %rbp                              #138.7
..LN919:
   .loc    1  152  is_stmt 1
        movsd     1528(%r9,%rcx), %xmm4                         #152.25
..LN920:
   .loc    1  153  is_stmt 1
        movsd     1536(%r9,%rcx), %xmm2                         #153.25
..LN921:
        movsd     1496(%r9,%rcx), %xmm3                         #153.25
..LN922:
   .loc    1  148  is_stmt 1
        movsd     1504(%r9,%rcx), %xmm1                         #148.25
..LN923:
   .loc    1  155  is_stmt 1
        movsd     1536(%rdx,%rbp), %xmm11                       #155.30
..LN924:
        movsd     1496(%rdx,%rbp), %xmm9                        #155.30
..LN925:
        movsd     1528(%rdx,%rbp), %xmm6                        #155.30
..LN926:
        movsd     1488(%rdx,%rbp), %xmm7                        #155.30
..LN927:
        movsd     1520(%rdx,%rbp), %xmm5                        #155.30
..LN928:
        movsd     1480(%rdx,%rbp), %xmm14                       #155.30
..LN929:
                                # LOE rdx rcx rbx rbp rsi r8 r9 r10 r12 r13 r14 eax r11d xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm9 xmm11 xmm13 xmm14
..B1.80:                        # Preds ..B1.80 ..B1.79
..LN930:
   .loc    1  141  is_stmt 1
        movaps    %xmm13, %xmm8                                 #141.20
..LN931:
   .loc    1  142  is_stmt 1
        movaps    %xmm1, %xmm10                                 #142.29
..LN932:
   .loc    1  141  is_stmt 1
        divsd     %xmm3, %xmm8                                  #141.20
..LN933:
   .loc    1  142  is_stmt 1
        mulsd     %xmm8, %xmm10                                 #142.29
..LN934:
   .loc    1  138  is_stmt 1
        lea       (%r9,%r12), %rdi                              #138.7
..LN935:
   .loc    1  143  is_stmt 1
        movsd     1512(%rcx,%rdi), %xmm12                       #143.29
..LN936:
   .loc    1  147  is_stmt 1
        movaps    %xmm4, %xmm1                                  #147.55
..LN937:
   .loc    1  143  is_stmt 1
        mulsd     %xmm8, %xmm12                                 #143.29
..LN938:
   .loc    1  147  is_stmt 1
        movaps    %xmm2, %xmm3                                  #147.55
..LN939:
        mulsd     %xmm10, %xmm1                                 #147.55
..LN940:
   .loc    1  148  is_stmt 1
        movaps    %xmm4, %xmm2                                  #148.55
..LN941:
   .loc    1  138  is_stmt 1
        lea       (%rbp,%r12), %r15                             #138.7
..LN942:
   .loc    1  153  is_stmt 1
        movsd     1560(%rcx,%rdi), %xmm0                        #153.41
..LN943:
   .loc    1  150  is_stmt 1
        movaps    %xmm4, %xmm15                                 #150.63
..LN944:
   .loc    1  148  is_stmt 1
        mulsd     %xmm12, %xmm2                                 #148.55
..LN945:
   .loc    1  147  is_stmt 1
        subsd     %xmm1, %xmm3                                  #147.55
..LN946:
   .loc    1  143  is_stmt 1
        movsd     %xmm12, 1512(%rcx,%rdi)                       #143.9
..LN947:
   .loc    1  138  is_stmt 1
        incq      %r14                                          #138.7
..LN948:
   .loc    1  153  is_stmt 1
        mulsd     %xmm0, %xmm12                                 #153.55
..LN949:
   .loc    1  138  is_stmt 1
        addq      $40, %r12                                     #138.7
..LN950:
   .loc    1  148  is_stmt 1
        movsd     1544(%rcx,%rdi), %xmm1                        #148.25
..LN951:
   .loc    1  138  is_stmt 1
        cmpq      %r10, %r14                                    #138.7
..LN952:
   .loc    1  142  is_stmt 1
        movsd     %xmm10, 1504(%rcx,%rdi)                       #142.9
..LN953:
   .loc    1  148  is_stmt 1
        subsd     %xmm2, %xmm1                                  #148.55
..LN954:
   .loc    1  152  is_stmt 1
        mulsd     %xmm0, %xmm10                                 #152.55
..LN955:
   .loc    1  153  is_stmt 1
        movsd     1576(%rcx,%rdi), %xmm2                        #153.25
..LN956:
   .loc    1  147  is_stmt 1
        movsd     %xmm3, 1536(%rcx,%rdi)                        #147.9
..LN957:
   .loc    1  153  is_stmt 1
        subsd     %xmm12, %xmm2                                 #153.55
..LN958:
   .loc    1  145  is_stmt 1
        movaps    %xmm14, %xmm12                                #145.34
..LN959:
   .loc    1  150  is_stmt 1
        movaps    %xmm5, %xmm14                                 #150.63
..LN960:
   .loc    1  145  is_stmt 1
        mulsd     %xmm8, %xmm12                                 #145.34
..LN961:
        movsd     %xmm12, 1480(%rdx,%r15)                       #145.11
..LN962:
   .loc    1  150  is_stmt 1
        mulsd     %xmm12, %xmm15                                #150.63
..LN963:
   .loc    1  155  is_stmt 1
        mulsd     %xmm0, %xmm12                                 #155.63
..LN964:
   .loc    1  150  is_stmt 1
        subsd     %xmm15, %xmm14                                #150.63
..LN965:
   .loc    1  155  is_stmt 1
        movsd     1560(%rdx,%r15), %xmm5                        #155.30
..LN966:
   .loc    1  150  is_stmt 1
        movaps    %xmm4, %xmm15                                 #150.63
..LN967:
   .loc    1  155  is_stmt 1
        subsd     %xmm12, %xmm5                                 #155.63
..LN968:
   .loc    1  145  is_stmt 1
        movaps    %xmm7, %xmm12                                 #145.34
..LN969:
        mulsd     %xmm8, %xmm12                                 #145.34
..LN970:
        mulsd     %xmm9, %xmm8                                  #145.34
..LN971:
   .loc    1  150  is_stmt 1
        mulsd     %xmm12, %xmm15                                #150.63
..LN972:
        mulsd     %xmm8, %xmm4                                  #150.63
..LN973:
        movaps    %xmm11, %xmm9                                 #150.63
..LN974:
        movaps    %xmm6, %xmm7                                  #150.63
..LN975:
   .loc    1  145  is_stmt 1
        movsd     %xmm12, 1488(%rdx,%r15)                       #145.11
..LN976:
   .loc    1  150  is_stmt 1
        subsd     %xmm4, %xmm9                                  #150.63
..LN977:
   .loc    1  155  is_stmt 1
        mulsd     %xmm0, %xmm12                                 #155.63
..LN978:
   .loc    1  150  is_stmt 1
        subsd     %xmm15, %xmm7                                 #150.63
..LN979:
   .loc    1  152  is_stmt 1
        movsd     1568(%rcx,%rdi), %xmm4                        #152.25
..LN980:
   .loc    1  145  is_stmt 1
        movsd     %xmm8, 1496(%rdx,%r15)                        #145.11
..LN981:
   .loc    1  152  is_stmt 1
        subsd     %xmm10, %xmm4                                 #152.55
..LN982:
   .loc    1  155  is_stmt 1
        mulsd     %xmm0, %xmm8                                  #155.63
..LN983:
        movsd     1568(%rdx,%r15), %xmm6                        #155.30
..LN984:
        movsd     1576(%rdx,%r15), %xmm11                       #155.30
..LN985:
        subsd     %xmm12, %xmm6                                 #155.63
..LN986:
        subsd     %xmm8, %xmm11                                 #155.63
..LN987:
   .loc    1  152  is_stmt 1
        movsd     %xmm4, 1568(%rcx,%rdi)                        #152.9
..LN988:
   .loc    1  138  is_stmt 1
        jb        ..B1.80       # Prob 97%                      #138.7
..LN989:
                                # LOE rdx rcx rbx rbp rsi r8 r9 r10 r12 r13 r14 eax r11d xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm9 xmm11 xmm13 xmm14
..B1.81:                        # Preds ..B1.80
..LN990:
   .loc    1  155  is_stmt 1
        lea       (%r14,%r14,4), %r12                           #155.30
..LN991:
        lea       (%r13,%r12,8), %rbp                           #155.30
..LN992:
   .loc    1  138  is_stmt 1
        addq      %r9, %rbp                                     #138.7
..LN993:
   .loc    1  155  is_stmt 1
        movsd     %xmm11, 1536(%rdx,%rbp)                       #155.30
..LN994:
   .loc    1  150  is_stmt 1
        movsd     %xmm9, 1496(%rdx,%rbp)                        #150.30
..LN995:
   .loc    1  155  is_stmt 1
        movsd     %xmm6, 1528(%rdx,%rbp)                        #155.30
..LN996:
   .loc    1  150  is_stmt 1
        movsd     %xmm7, 1488(%rdx,%rbp)                        #150.30
..LN997:
   .loc    1  155  is_stmt 1
        movsd     %xmm5, 1520(%rdx,%rbp)                        #155.30
..LN998:
   .loc    1  150  is_stmt 1
        movsd     %xmm14, 1480(%rdx,%rbp)                       #150.30
..LN999:
   .loc    1  138  is_stmt 1
        lea       (%r9,%r12,8), %rdx                            #138.7
..LN1000:
   .loc    1  153  is_stmt 1
        movsd     %xmm2, 1536(%rcx,%rdx)                        #153.25
..LN1001:
   .loc    1  148  is_stmt 1
        movsd     %xmm1, 1504(%rcx,%rdx)                        #148.25
..LN1002:
                                # LOE rbx rsi r8 r9 r10 r13 eax r11d xmm13
..B1.82:                        # Preds ..B1.78 ..B1.81
..LN1003:
   .loc    1  137  is_stmt 1
        incq      %r8                                           #137.5
..LN1004:
        addq      $1480, %r9                                    #137.5
..LN1005:
        cmpq      %rsi, %r8                                     #137.5
..LN1006:
        jb        ..B1.78       # Prob 97%                      #137.5
..LN1007:
                                # LOE rbx rsi r8 r9 r10 r13 eax r11d xmm13
..B1.83:                        # Preds ..B1.82
        movq      360(%rsp), %r12                               #
        movabsq   $grid_points, %rdi                            #
        movl      104(%rsp), %ebp                               #
..LN1008:
                                # LOE rbx rsi rdi r12 r13 eax ebp
..B1.84:                        # Preds ..B1.76 ..B1.83
..LN1009:
   .loc    1  166  is_stmt 1
        movslq    %eax, %rcx                                    #166.12
..LN1010:
   .loc    1  165  is_stmt 1
        cmpq      $2, %rsi                                      #165.5
..LN1011:
        jl        ..B1.161      # Prob 10%                      #165.5
..LN1012:
                                # LOE rcx rbx rsi rdi r12 r13 eax ebp
..B1.85:                        # Preds ..B1.84
..LN1013:
        movl      %esi, %edx                                    #165.5
..LN1014:
        movq      %rbx, %r14                                    #165.5
..LN1015:
        andl      $-2, %edx                                     #165.5
..LN1016:
   .loc    1  172  is_stmt 1
        lea       (%rcx,%rcx,4), %r10                           #172.32
..LN1017:
   .loc    1  165  is_stmt 1
        movslq    %edx, %rdx                                    #165.5
..LN1018:
   .loc    1  168  is_stmt 1
        lea       -10(%rcx,%rcx,4), %r11                        #168.18
        movq      %rcx, 72(%rsp)                                #
        lea       (%r13,%r10,8), %r9                            #
        movq      %r13, 408(%rsp)                               #
..LN1019:
   .loc    1  174  is_stmt 1
        lea       -5(%rcx,%rcx,4), %r15                         #174.23
        movq      %r12, 360(%rsp)                               #
        movq      %r14, %r8                                     #
        movl      %ebp, 104(%rsp)                               #
        movabsq   $lhs, %rax                                    #
        movq      %rsi, 400(%rsp)                               #
        movabsq   $rhs, %rcx                                    #
        movaps    112(%rsp), %xmm0                              #
..LN1020:
                                # LOE rax rdx rcx r8 r9 r10 r11 r14 r15 xmm0
..B1.86:                        # Preds ..B1.86 ..B1.85
..LN1021:
   .loc    1  168  is_stmt 1
        movaps    %xmm0, %xmm7                                  #168.18
..LN1022:
        lea       (%r8,%r11,8), %rdi                            #168.18
..LN1023:
        movsd     1496(%rax,%rdi), %xmm1                        #168.18
..LN1024:
   .loc    1  172  is_stmt 1
        lea       1400(%r9,%r8), %r13                           #172.32
..LN1025:
   .loc    1  168  is_stmt 1
        movhpd    2976(%rax,%rdi), %xmm1                        #168.18
..LN1026:
   .loc    1  172  is_stmt 1
        addq      %rcx, %r13                                    #172.32
..LN1027:
   .loc    1  168  is_stmt 1
        divpd     %xmm1, %xmm7                                  #168.18
..LN1028:
   .loc    1  169  is_stmt 1
        movsd     1504(%rax,%rdi), %xmm2                        #169.27
..LN1029:
   .loc    1  172  is_stmt 1
        lea       1408(%r9,%r8), %rbx                           #172.32
..LN1030:
   .loc    1  170  is_stmt 1
        movsd     1512(%rax,%rdi), %xmm3                        #170.27
..LN1031:
   .loc    1  172  is_stmt 1
        addq      %rcx, %rbx                                    #172.32
..LN1032:
   .loc    1  169  is_stmt 1
        movhpd    2984(%rax,%rdi), %xmm2                        #169.27
..LN1033:
   .loc    1  172  is_stmt 1
        lea       1416(%r9,%r8), %rbp                           #172.32
..LN1034:
   .loc    1  170  is_stmt 1
        movhpd    2992(%rax,%rdi), %xmm3                        #170.27
..LN1035:
   .loc    1  172  is_stmt 1
        addq      %rcx, %rbp                                    #172.32
..LN1036:
   .loc    1  169  is_stmt 1
        mulpd     %xmm7, %xmm2                                  #169.27
..LN1037:
   .loc    1  170  is_stmt 1
        mulpd     %xmm7, %xmm3                                  #170.27
..LN1038:
   .loc    1  169  is_stmt 1
        movlpd    %xmm2, 1504(%rax,%rdi)                        #169.7
..LN1039:
   .loc    1  174  is_stmt 1
        lea       (%r8,%r15,8), %rsi                            #174.23
..LN1040:
   .loc    1  169  is_stmt 1
        movhpd    %xmm2, 2984(%rax,%rdi)                        #169.7
..LN1041:
   .loc    1  177  is_stmt 1
        lea       (%r8,%r10,8), %r12                            #177.47
..LN1042:
   .loc    1  170  is_stmt 1
        movlpd    %xmm3, 1512(%rax,%rdi)                        #170.7
..LN1043:
   .loc    1  165  is_stmt 1
        addq      $2, %r14                                      #165.5
..LN1044:
   .loc    1  170  is_stmt 1
        movhpd    %xmm3, 2992(%rax,%rdi)                        #170.7
..LN1045:
   .loc    1  172  is_stmt 1
        movsd     (%r13), %xmm4                                 #172.32
..LN1046:
        movhpd    1480(%r13), %xmm4                             #172.32
..LN1047:
        mulpd     %xmm7, %xmm4                                  #172.32
..LN1048:
        movlpd    %xmm4, (%r13)                                 #172.9
..LN1049:
        movhpd    %xmm4, 1480(%r13)                             #172.9
..LN1050:
        movsd     (%rbx), %xmm5                                 #172.32
..LN1051:
        movhpd    1480(%rbx), %xmm5                             #172.32
..LN1052:
        mulpd     %xmm7, %xmm5                                  #172.32
..LN1053:
        movlpd    %xmm5, (%rbx)                                 #172.9
..LN1054:
        movhpd    %xmm5, 1480(%rbx)                             #172.9
..LN1055:
        movsd     (%rbp), %xmm6                                 #172.32
..LN1056:
        movhpd    1480(%rbp), %xmm6                             #172.32
..LN1057:
        mulpd     %xmm6, %xmm7                                  #172.32
..LN1058:
        movlpd    %xmm7, (%rbp)                                 #172.9
..LN1059:
        movhpd    %xmm7, 1480(%rbp)                             #172.9
..LN1060:
   .loc    1  174  is_stmt 1
        movsd     1504(%rax,%rdi), %xmm8                        #174.53
..LN1061:
        movsd     1488(%rax,%rsi), %xmm10                       #174.39
..LN1062:
        movhpd    2984(%rax,%rdi), %xmm8                        #174.53
..LN1063:
        movhpd    2968(%rax,%rsi), %xmm10                       #174.39
..LN1064:
        mulpd     %xmm10, %xmm8                                 #174.53
..LN1065:
        movsd     1496(%rax,%rsi), %xmm9                        #174.23
..LN1066:
        movhpd    2976(%rax,%rsi), %xmm9                        #174.23
..LN1067:
        subpd     %xmm8, %xmm9                                  #174.53
..LN1068:
        movlpd    %xmm9, 1496(%rax,%rsi)                        #174.7
..LN1069:
        movhpd    %xmm9, 2976(%rax,%rsi)                        #174.7
..LN1070:
   .loc    1  175  is_stmt 1
        movsd     1512(%rax,%rdi), %xmm11                       #175.53
..LN1071:
        movhpd    2992(%rax,%rdi), %xmm11                       #175.53
..LN1072:
   .loc    1  177  is_stmt 1
        lea       1440(%r9,%r8), %rdi                           #177.28
..LN1073:
   .loc    1  175  is_stmt 1
        mulpd     %xmm10, %xmm11                                #175.53
..LN1074:
        movsd     1504(%rax,%rsi), %xmm12                       #175.23
..LN1075:
   .loc    1  177  is_stmt 1
        addq      %rcx, %rdi                                    #177.28
..LN1076:
   .loc    1  175  is_stmt 1
        movhpd    2984(%rax,%rsi), %xmm12                       #175.23
..LN1077:
        subpd     %xmm11, %xmm12                                #175.53
..LN1078:
        movlpd    %xmm12, 1504(%rax,%rsi)                       #175.7
..LN1079:
   .loc    1  183  is_stmt 1
        movaps    %xmm0, %xmm11                                 #183.18
..LN1080:
   .loc    1  175  is_stmt 1
        movhpd    %xmm12, 2984(%rax,%rsi)                       #175.7
..LN1081:
   .loc    1  177  is_stmt 1
        movsd     1448(%rax,%r12), %xmm14                       #177.47
..LN1082:
        movsd     (%r13), %xmm13                                #177.61
..LN1083:
        movhpd    2928(%rax,%r12), %xmm14                       #177.47
..LN1084:
        movhpd    1480(%r13), %xmm13                            #177.61
..LN1085:
        lea       1448(%r9,%r8), %r13                           #177.28
..LN1086:
        mulpd     %xmm13, %xmm14                                #177.61
..LN1087:
        movsd     (%rdi), %xmm15                                #177.28
..LN1088:
        addq      %rcx, %r13                                    #177.28
..LN1089:
        .byte     144                                           #177.28
..LN1090:
        movhpd    1480(%rdi), %xmm15                            #177.28
..LN1091:
        subpd     %xmm14, %xmm15                                #177.61
..LN1092:
        movlpd    %xmm15, (%rdi)                                #177.9
..LN1093:
        movhpd    %xmm15, 1480(%rdi)                            #177.9
..LN1094:
        movsd     1448(%rax,%r12), %xmm2                        #177.47
..LN1095:
        movsd     (%rbx), %xmm1                                 #177.61
..LN1096:
        movhpd    2928(%rax,%r12), %xmm2                        #177.47
..LN1097:
        movhpd    1480(%rbx), %xmm1                             #177.61
..LN1098:
        lea       1456(%r9,%r8), %rbx                           #177.28
..LN1099:
        mulpd     %xmm1, %xmm2                                  #177.61
..LN1100:
        movsd     (%r13), %xmm3                                 #177.28
..LN1101:
        addq      %rcx, %rbx                                    #177.28
..LN1102:
        movhpd    1480(%r13), %xmm3                             #177.28
..LN1103:
   .loc    1  165  is_stmt 1
        addq      $2960, %r8                                    #165.5
..LN1104:
   .loc    1  177  is_stmt 1
        subpd     %xmm2, %xmm3                                  #177.61
..LN1105:
        movlpd    %xmm3, (%r13)                                 #177.9
..LN1106:
   .loc    1  165  is_stmt 1
        cmpq      %rdx, %r14                                    #165.5
..LN1107:
   .loc    1  177  is_stmt 1
        movhpd    %xmm3, 1480(%r13)                             #177.9
..LN1108:
        movsd     1448(%rax,%r12), %xmm5                        #177.47
..LN1109:
        movsd     (%rbp), %xmm4                                 #177.61
..LN1110:
        movhpd    2928(%rax,%r12), %xmm5                        #177.47
..LN1111:
        movhpd    1480(%rbp), %xmm4                             #177.61
..LN1112:
        mulpd     %xmm4, %xmm5                                  #177.61
..LN1113:
        movsd     (%rbx), %xmm6                                 #177.28
..LN1114:
        .byte     102                                           #177.28
..LN1115:
        .byte     144                                           #177.28
..LN1116:
        movhpd    1480(%rbx), %xmm6                             #177.28
..LN1117:
        subpd     %xmm5, %xmm6                                  #177.61
..LN1118:
        movlpd    %xmm6, (%rbx)                                 #177.9
..LN1119:
        movhpd    %xmm6, 1480(%rbx)                             #177.9
..LN1120:
   .loc    1  183  is_stmt 1
        movsd     1496(%rax,%rsi), %xmm7                        #183.18
..LN1121:
        movhpd    2976(%rax,%rsi), %xmm7                        #183.18
..LN1122:
        divpd     %xmm7, %xmm11                                 #183.18
..LN1123:
   .loc    1  185  is_stmt 1
        .byte     15                                            #185.33
..LN1124:
        .byte     31                                            #185.33
..LN1125:
        .byte     64                                            #185.33
..LN1126:
        .byte     0                                             #185.33
..LN1127:
        movsd     (%rdi), %xmm8                                 #185.33
..LN1128:
        movhpd    1480(%rdi), %xmm8                             #185.33
..LN1129:
        mulpd     %xmm11, %xmm8                                 #185.33
..LN1130:
        movlpd    %xmm8, (%rdi)                                 #185.9
..LN1131:
        movhpd    %xmm8, 1480(%rdi)                             #185.9
..LN1132:
        movsd     (%r13), %xmm9                                 #185.33
..LN1133:
        movhpd    1480(%r13), %xmm9                             #185.33
..LN1134:
        mulpd     %xmm11, %xmm9                                 #185.33
..LN1135:
        movlpd    %xmm9, (%r13)                                 #185.9
..LN1136:
        movhpd    %xmm9, 1480(%r13)                             #185.9
..LN1137:
        movsd     (%rbx), %xmm10                                #185.33
..LN1138:
        movhpd    1480(%rbx), %xmm10                            #185.33
..LN1139:
        mulpd     %xmm10, %xmm11                                #185.33
..LN1140:
        movlpd    %xmm11, (%rbx)                                #185.9
..LN1141:
        movhpd    %xmm11, 1480(%rbx)                            #185.9
..LN1142:
   .loc    1  165  is_stmt 1
        jb        ..B1.86       # Prob 97%                      #165.5
..LN1143:
                                # LOE rax rdx rcx r8 r9 r10 r11 r14 r15 xmm0
..B1.87:                        # Preds ..B1.86
        movabsq   $grid_points, %rdi                            #
        xorl      %ebx, %ebx                                    #
        movq      72(%rsp), %rcx                                #
        movq      408(%rsp), %r13                               #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
        movq      400(%rsp), %rsi                               #
..LN1144:
   .loc    1  193  is_stmt 1
        movl      (%rdi), %eax                                  #193.24
..LN1145:
                                # LOE rdx rcx rbx rsi rdi r12 r13 eax ebp
..B1.88:                        # Preds ..B1.87 ..B1.161
..LN1146:
        imulq     $1480, %rdx, %r8                              #
..LN1147:
   .loc    1  165  is_stmt 1
        cmpq      %rsi, %rdx                                    #165.5
..LN1148:
        jae       ..B1.92       # Prob 16%                      #165.5
..LN1149:
                                # LOE rdx rcx rbx rsi rdi r8 r12 r13 eax ebp
..B1.89:                        # Preds ..B1.88
..LN1150:
   .loc    1  174  is_stmt 1
        movq      %r13, 408(%rsp)                               #174.23
..LN1151:
   .loc    1  172  is_stmt 1
        lea       (%rcx,%rcx,4), %r10                           #172.32
..LN1152:
   .loc    1  174  is_stmt 1
        movq      %r12, 360(%rsp)                               #174.23
..LN1153:
   .loc    1  168  is_stmt 1
        lea       -10(%rcx,%rcx,4), %r9                         #168.18
..LN1154:
   .loc    1  174  is_stmt 1
        movl      %ebp, 104(%rsp)                               #174.23
        lea       (%r13,%r10,8), %r11                           #
..LN1155:
        movsd     272(%rsp), %xmm15                             #174.23
..LN1156:
        lea       -5(%rcx,%rcx,4), %r15                         #174.23
..LN1157:
        movabsq   $lhs, %rcx                                    #174.23
..LN1158:
        movabsq   $rhs, %r14                                    #174.23
..LN1159:
                                # LOE rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 eax xmm15
..B1.90:                        # Preds ..B1.90 ..B1.89
..LN1160:
   .loc    1  168  is_stmt 1
        movaps    %xmm15, %xmm8                                 #168.18
..LN1161:
        lea       (%r8,%r9,8), %r12                             #168.7
..LN1162:
        divsd     1496(%rcx,%r12), %xmm8                        #168.18
..LN1163:
   .loc    1  169  is_stmt 1
        movsd     1504(%rcx,%r12), %xmm2                        #169.27
..LN1164:
   .loc    1  174  is_stmt 1
        lea       (%r8,%r15,8), %r13                            #174.7
..LN1165:
   .loc    1  170  is_stmt 1
        movsd     1512(%rcx,%r12), %xmm0                        #170.27
..LN1166:
   .loc    1  183  is_stmt 1
        movaps    %xmm15, %xmm14                                #183.18
..LN1167:
   .loc    1  169  is_stmt 1
        mulsd     %xmm8, %xmm2                                  #169.27
..LN1168:
   .loc    1  172  is_stmt 1
        lea       (%r11,%r8), %rbp                              #172.9
..LN1169:
   .loc    1  170  is_stmt 1
        mulsd     %xmm8, %xmm0                                  #170.27
..LN1170:
   .loc    1  169  is_stmt 1
        movsd     %xmm2, 1504(%rcx,%r12)                        #169.7
..LN1171:
   .loc    1  165  is_stmt 1
        incq      %rdx                                          #165.5
..LN1172:
   .loc    1  170  is_stmt 1
        movsd     %xmm0, 1512(%rcx,%r12)                        #170.7
..LN1173:
   .loc    1  174  is_stmt 1
        movsd     1488(%rcx,%r13), %xmm3                        #174.39
..LN1174:
        mulsd     %xmm3, %xmm2                                  #174.53
..LN1175:
        movsd     1496(%rcx,%r13), %xmm10                       #174.23
..LN1176:
   .loc    1  175  is_stmt 1
        movsd     1504(%rcx,%r13), %xmm5                        #175.23
..LN1177:
   .loc    1  174  is_stmt 1
        subsd     %xmm2, %xmm10                                 #174.53
..LN1178:
   .loc    1  183  is_stmt 1
        divsd     %xmm10, %xmm14                                #183.18
..LN1179:
   .loc    1  174  is_stmt 1
        movsd     %xmm10, 1496(%rcx,%r13)                       #174.7
..LN1180:
   .loc    1  175  is_stmt 1
        movsd     1512(%rcx,%r12), %xmm4                        #175.53
..LN1181:
   .loc    1  177  is_stmt 1
        lea       (%r8,%r10,8), %r12                            #177.9
..LN1182:
   .loc    1  175  is_stmt 1
        mulsd     %xmm3, %xmm4                                  #175.53
..LN1183:
   .loc    1  165  is_stmt 1
        addq      $1480, %r8                                    #165.5
..LN1184:
   .loc    1  172  is_stmt 1
        movsd     1400(%r14,%rbp), %xmm6                        #172.32
..LN1185:
   .loc    1  165  is_stmt 1
        cmpq      %rsi, %rdx                                    #165.5
..LN1186:
   .loc    1  172  is_stmt 1
        movsd     1408(%r14,%rbp), %xmm7                        #172.32
..LN1187:
   .loc    1  175  is_stmt 1
        subsd     %xmm4, %xmm5                                  #175.53
..LN1188:
   .loc    1  172  is_stmt 1
        mulsd     %xmm8, %xmm6                                  #172.32
..LN1189:
        mulsd     %xmm8, %xmm7                                  #172.32
..LN1190:
        movsd     1416(%r14,%rbp), %xmm1                        #172.32
..LN1191:
        mulsd     %xmm1, %xmm8                                  #172.32
..LN1192:
   .loc    1  175  is_stmt 1
        movsd     %xmm5, 1504(%rcx,%r13)                        #175.7
..LN1193:
   .loc    1  177  is_stmt 1
        movsd     1448(%rcx,%r12), %xmm9                        #177.47
..LN1194:
   .loc    1  172  is_stmt 1
        movsd     %xmm6, 1400(%r14,%rbp)                        #172.9
..LN1195:
        movsd     %xmm7, 1408(%r14,%rbp)                        #172.9
..LN1196:
   .loc    1  177  is_stmt 1
        mulsd     %xmm9, %xmm6                                  #177.61
..LN1197:
        mulsd     %xmm9, %xmm7                                  #177.61
..LN1198:
        mulsd     %xmm8, %xmm9                                  #177.61
..LN1199:
        movsd     1440(%r14,%rbp), %xmm11                       #177.28
..LN1200:
        movsd     1448(%r14,%rbp), %xmm12                       #177.28
..LN1201:
        subsd     %xmm6, %xmm11                                 #177.61
..LN1202:
        subsd     %xmm7, %xmm12                                 #177.61
..LN1203:
   .loc    1  185  is_stmt 1
        mulsd     %xmm14, %xmm11                                #185.33
..LN1204:
        mulsd     %xmm14, %xmm12                                #185.33
..LN1205:
   .loc    1  177  is_stmt 1
        movsd     1456(%r14,%rbp), %xmm13                       #177.28
..LN1206:
   .loc    1  172  is_stmt 1
        movsd     %xmm8, 1416(%r14,%rbp)                        #172.9
..LN1207:
   .loc    1  177  is_stmt 1
        subsd     %xmm9, %xmm13                                 #177.61
..LN1208:
   .loc    1  185  is_stmt 1
        mulsd     %xmm13, %xmm14                                #185.33
..LN1209:
        movsd     %xmm11, 1440(%r14,%rbp)                       #185.9
..LN1210:
        movsd     %xmm12, 1448(%r14,%rbp)                       #185.9
..LN1211:
        movsd     %xmm14, 1456(%r14,%rbp)                       #185.9
..LN1212:
   .loc    1  165  is_stmt 1
        jb        ..B1.90       # Prob 97%                      #165.5
..LN1213:
                                # LOE rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15 eax xmm15
..B1.91:                        # Preds ..B1.90
        movq      408(%rsp), %r13                               #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
..LN1214:
                                # LOE rbx rsi rdi r12 r13 eax ebp
..B1.92:                        # Preds ..B1.88 ..B1.91
..LN1215:
   .loc    1  193  is_stmt 1
        movl      %eax, %r8d                                    #193.24
..LN1216:
   .loc    1  192  is_stmt 1
        cmpq      $2, %rsi                                      #192.5
..LN1217:
        jl        ..B1.160      # Prob 10%                      #192.5
..LN1218:
                                # LOE rbx rsi rdi r12 r13 eax ebp r8d
..B1.93:                        # Preds ..B1.92
..LN1219:
        movl      %esi, %ecx                                    #192.5
..LN1220:
   .loc    1  193  is_stmt 1
        lea       -3(%rax), %r11d                               #193.39
..LN1221:
        movslq    %eax, %rax                                    #193.7
..LN1222:
   .loc    1  192  is_stmt 1
        andl      $-2, %ecx                                     #192.5
..LN1223:
        movq      %rbx, %r10                                    #192.5
..LN1224:
   .loc    1  193  is_stmt 1
        addq      $-2, %rax                                     #193.39
..LN1225:
   .loc    1  192  is_stmt 1
        movslq    %ecx, %rcx                                    #192.5
        movq      %r10, %r9                                     #
        movq      %rax, 456(%rsp)                               #
        movl      %r8d, 80(%rsp)                                #
        movq      %r12, 360(%rsp)                               #
        movl      %ebp, 104(%rsp)                               #
        movq      %rsi, 400(%rsp)                               #
        movaps    112(%rsp), %xmm0                              #
..LN1226:
                                # LOE rcx rbx r9 r10 r13 r11d xmm0
..B1.94:                        # Preds ..B1.98 ..B1.93
..LN1227:
   .loc    1  193  is_stmt 1
        movq      %rbx, %r14                                    #193.7
..LN1228:
        testl     %r11d, %r11d                                  #193.39
        movq      %r14, %rdx                                    #
..LN1229:
        js        ..B1.98       # Prob 10%                      #193.39
..LN1230:
                                # LOE rdx rcx rbx r9 r10 r13 r14 r11d xmm0
..B1.95:                        # Preds ..B1.94
        movq      %rcx, 392(%rsp)                               #
        lea       (%r13,%r9), %rax                              #
        movq      %r14, 464(%rsp)                               #
        movq      %r9, 472(%rsp)                                #
        movl      %r11d, 384(%rsp)                              #
        movq      %r10, 376(%rsp)                               #
        movq      %r13, 408(%rsp)                               #
..LN1231:
                                # LOE rax rdx xmm0
..B1.96:                        # Preds ..B1.96 ..B1.95
..LN1232:
   .loc    1  210  is_stmt 1
        movq      472(%rsp), %rcx                               #210.20
..LN1233:
        movabsq   $lhsm, %rdi                                   #210.20
..LN1234:
        movaps    %xmm0, %xmm4                                  #210.20
..LN1235:
   .loc    1  213  is_stmt 1
        lea       1512(%rax,%rdx), %r11                         #213.33
..LN1236:
        movabsq   $rhs, %r10                                    #213.33
..LN1237:
   .loc    1  216  is_stmt 1
        lea       1552(%rax,%rdx), %r15                         #216.28
..LN1238:
   .loc    1  213  is_stmt 1
        addq      %r10, %r11                                    #213.33
..LN1239:
   .loc    1  210  is_stmt 1
        lea       1496(%rcx,%rdx), %rsi                         #210.20
..LN1240:
        movsd     (%rdi,%rsi), %xmm1                            #210.20
..LN1241:
   .loc    1  211  is_stmt 1
        lea       1504(%rcx,%rdx), %r8                          #211.33
..LN1242:
   .loc    1  210  is_stmt 1
        movhpd    1480(%rdi,%rsi), %xmm1                        #210.20
..LN1243:
   .loc    1  212  is_stmt 1
        lea       1512(%rcx,%rdx), %r9                          #212.33
..LN1244:
   .loc    1  210  is_stmt 1
        divpd     %xmm1, %xmm4                                  #210.20
..LN1245:
   .loc    1  211  is_stmt 1
        movsd     (%rdi,%r8), %xmm2                             #211.33
..LN1246:
   .loc    1  214  is_stmt 1
        lea       1528(%rcx,%rdx), %r13                         #214.45
..LN1247:
   .loc    1  211  is_stmt 1
        movhpd    1480(%rdi,%r8), %xmm2                         #211.33
..LN1248:
   .loc    1  214  is_stmt 1
        lea       1536(%rcx,%rdx), %r12                         #214.28
..LN1249:
   .loc    1  211  is_stmt 1
        mulpd     %xmm4, %xmm2                                  #211.33
..LN1250:
        movlpd    %xmm2, (%rdi,%r8)                             #211.9
..LN1251:
   .loc    1  215  is_stmt 1
        lea       1544(%rcx,%rdx), %r14                         #215.28
..LN1252:
   .loc    1  211  is_stmt 1
        movhpd    %xmm2, 1480(%rdi,%r8)                         #211.9
..LN1253:
   .loc    1  216  is_stmt 1
        addq      %r10, %r15                                    #216.28
..LN1254:
   .loc    1  212  is_stmt 1
        movsd     (%rdi,%r9), %xmm3                             #212.33
..LN1255:
   .loc    1  217  is_stmt 1
        lea       1560(%rcx,%rdx), %rbx                         #217.45
..LN1256:
   .loc    1  212  is_stmt 1
        movhpd    1480(%rdi,%r9), %xmm3                         #212.33
..LN1257:
   .loc    1  217  is_stmt 1
        lea       1568(%rcx,%rdx), %rbp                         #217.28
..LN1258:
   .loc    1  212  is_stmt 1
        mulpd     %xmm4, %xmm3                                  #212.33
..LN1259:
        movlpd    %xmm3, (%rdi,%r9)                             #212.9
..LN1260:
   .loc    1  218  is_stmt 1
        lea       1576(%rcx,%rdx), %rcx                         #218.28
..LN1261:
   .loc    1  212  is_stmt 1
        movhpd    %xmm3, 1480(%rdi,%r9)                         #212.9
..LN1262:
   .loc    1  213  is_stmt 1
        movsd     (%r11), %xmm5                                 #213.33
..LN1263:
        movhpd    1480(%r11), %xmm5                             #213.33
..LN1264:
        mulpd     %xmm4, %xmm5                                  #213.33
..LN1265:
        movlpd    %xmm5, (%r11)                                 #213.9
..LN1266:
        movhpd    %xmm5, 1480(%r11)                             #213.9
..LN1267:
   .loc    1  214  is_stmt 1
        movsd     (%rdi,%r13), %xmm7                            #214.45
..LN1268:
        movsd     (%rdi,%r8), %xmm6                             #214.60
..LN1269:
        movhpd    1480(%rdi,%r13), %xmm7                        #214.45
..LN1270:
        movhpd    1480(%rdi,%r8), %xmm6                         #214.60
..LN1271:
        mulpd     %xmm6, %xmm7                                  #214.60
..LN1272:
        movsd     (%rdi,%r12), %xmm8                            #214.28
..LN1273:
        movhpd    1480(%rdi,%r12), %xmm8                        #214.28
..LN1274:
        subpd     %xmm7, %xmm8                                  #214.60
..LN1275:
        movlpd    %xmm8, (%rdi,%r12)                            #214.9
..LN1276:
        movhpd    %xmm8, 1480(%rdi,%r12)                        #214.9
..LN1277:
   .loc    1  215  is_stmt 1
        movsd     (%rdi,%r13), %xmm10                           #215.45
..LN1278:
        movsd     (%rdi,%r9), %xmm9                             #215.60
..LN1279:
        movhpd    1480(%rdi,%r13), %xmm10                       #215.45
..LN1280:
        movhpd    1480(%rdi,%r9), %xmm9                         #215.60
..LN1281:
        mulpd     %xmm9, %xmm10                                 #215.60
..LN1282:
        movsd     (%rdi,%r14), %xmm11                           #215.28
..LN1283:
        movhpd    1480(%rdi,%r14), %xmm11                       #215.28
..LN1284:
        subpd     %xmm10, %xmm11                                #215.60
..LN1285:
        movlpd    %xmm11, (%rdi,%r14)                           #215.9
..LN1286:
        movhpd    %xmm11, 1480(%rdi,%r14)                       #215.9
..LN1287:
   .loc    1  216  is_stmt 1
        movsd     (%rdi,%r13), %xmm13                           #216.47
..LN1288:
        movsd     (%r11), %xmm12                                #216.62
..LN1289:
        movhpd    1480(%rdi,%r13), %xmm13                       #216.47
..LN1290:
        movhpd    1480(%r11), %xmm12                            #216.62
..LN1291:
        mulpd     %xmm12, %xmm13                                #216.62
..LN1292:
        movsd     (%r15), %xmm14                                #216.28
..LN1293:
   .loc    1  198  is_stmt 1
        movaps    %xmm0, %xmm12                                 #198.20
..LN1294:
   .loc    1  216  is_stmt 1
        movhpd    1480(%r15), %xmm14                            #216.28
..LN1295:
        subpd     %xmm13, %xmm14                                #216.62
..LN1296:
        movlpd    %xmm14, (%r15)                                #216.9
..LN1297:
        movhpd    %xmm14, 1480(%r15)                            #216.9
..LN1298:
   .loc    1  219  is_stmt 1
        lea       1592(%rax,%rdx), %r15                         #219.28
..LN1299:
   .loc    1  217  is_stmt 1
        movsd     (%rdi,%rbx), %xmm1                            #217.45
..LN1300:
   .loc    1  219  is_stmt 1
        addq      %r10, %r15                                    #219.28
..LN1301:
   .loc    1  217  is_stmt 1
        movsd     (%rdi,%r8), %xmm15                            #217.60
..LN1302:
        movhpd    1480(%rdi,%rbx), %xmm1                        #217.45
..LN1303:
        movhpd    1480(%rdi,%r8), %xmm15                        #217.60
..LN1304:
        mulpd     %xmm15, %xmm1                                 #217.60
..LN1305:
        .byte     15                                            #217.28
..LN1306:
        .byte     31                                            #217.28
..LN1307:
        .byte     64                                            #217.28
..LN1308:
        .byte     0                                             #217.28
..LN1309:
        movsd     (%rdi,%rbp), %xmm2                            #217.28
..LN1310:
        movhpd    1480(%rdi,%rbp), %xmm2                        #217.28
..LN1311:
        subpd     %xmm1, %xmm2                                  #217.60
..LN1312:
        movlpd    %xmm2, (%rdi,%rbp)                            #217.9
..LN1313:
        movhpd    %xmm2, 1480(%rdi,%rbp)                        #217.9
..LN1314:
   .loc    1  218  is_stmt 1
        movsd     (%rdi,%rbx), %xmm4                            #218.45
..LN1315:
        movsd     (%rdi,%r9), %xmm3                             #218.60
..LN1316:
        movhpd    1480(%rdi,%rbx), %xmm4                        #218.45
..LN1317:
        movhpd    1480(%rdi,%r9), %xmm3                         #218.60
..LN1318:
        mulpd     %xmm3, %xmm4                                  #218.60
..LN1319:
        .byte     102                                           #218.28
..LN1320:
        .byte     144                                           #218.28
..LN1321:
        movsd     (%rdi,%rcx), %xmm5                            #218.28
..LN1322:
        movhpd    1480(%rdi,%rcx), %xmm5                        #218.28
..LN1323:
        subpd     %xmm4, %xmm5                                  #218.60
..LN1324:
        movlpd    %xmm5, (%rdi,%rcx)                            #218.9
..LN1325:
        movhpd    %xmm5, 1480(%rdi,%rcx)                        #218.9
..LN1326:
   .loc    1  219  is_stmt 1
        movsd     (%rdi,%rbx), %xmm7                            #219.47
..LN1327:
        movsd     (%r11), %xmm6                                 #219.62
..LN1328:
        movhpd    1480(%rdi,%rbx), %xmm7                        #219.47
..LN1329:
   .loc    1  198  is_stmt 1
        movabsq   $lhsp, %rdi                                   #198.20
..LN1330:
   .loc    1  219  is_stmt 1
        movhpd    1480(%r11), %xmm6                             #219.62
..LN1331:
   .loc    1  198  is_stmt 1
        addq      %rdi, %rsi                                    #198.20
..LN1332:
   .loc    1  219  is_stmt 1
        mulpd     %xmm6, %xmm7                                  #219.62
..LN1333:
        .byte     15                                            #219.28
..LN1334:
        .byte     31                                            #219.28
..LN1335:
        .byte     64                                            #219.28
..LN1336:
        .byte     0                                             #219.28
..LN1337:
        movsd     (%r15), %xmm8                                 #219.28
..LN1338:
   .loc    1  199  is_stmt 1
        addq      %rdi, %r8                                     #199.33
..LN1339:
   .loc    1  219  is_stmt 1
        movhpd    1480(%r15), %xmm8                             #219.28
..LN1340:
   .loc    1  200  is_stmt 1
        addq      %rdi, %r9                                     #200.33
..LN1341:
   .loc    1  219  is_stmt 1
        subpd     %xmm7, %xmm8                                  #219.62
..LN1342:
        movlpd    %xmm8, (%r15)                                 #219.9
..LN1343:
   .loc    1  202  is_stmt 1
        addq      %rdi, %r13                                    #202.45
..LN1344:
   .loc    1  219  is_stmt 1
        movhpd    %xmm8, 1480(%r15)                             #219.9
..LN1345:
   .loc    1  202  is_stmt 1
        addq      %rdi, %r12                                    #202.28
..LN1346:
   .loc    1  198  is_stmt 1
        movsd     (%rsi), %xmm9                                 #198.20
..LN1347:
   .loc    1  203  is_stmt 1
        addq      %rdi, %r14                                    #203.28
..LN1348:
   .loc    1  198  is_stmt 1
        movhpd    1480(%rsi), %xmm9                             #198.20
..LN1349:
   .loc    1  201  is_stmt 1
        lea       1504(%rax,%rdx), %rsi                         #201.33
..LN1350:
   .loc    1  198  is_stmt 1
        divpd     %xmm9, %xmm12                                 #198.20
..LN1351:
   .loc    1  199  is_stmt 1
        movsd     (%r8), %xmm10                                 #199.33
..LN1352:
   .loc    1  201  is_stmt 1
        addq      %r10, %rsi                                    #201.33
..LN1353:
   .loc    1  199  is_stmt 1
        movhpd    1480(%r8), %xmm10                             #199.33
..LN1354:
   .loc    1  205  is_stmt 1
        addq      %rdi, %rbx                                    #205.45
..LN1355:
   .loc    1  199  is_stmt 1
        mulpd     %xmm12, %xmm10                                #199.33
..LN1356:
        movlpd    %xmm10, (%r8)                                 #199.9
..LN1357:
   .loc    1  205  is_stmt 1
        addq      %rdi, %rbp                                    #205.28
..LN1358:
   .loc    1  199  is_stmt 1
        movhpd    %xmm10, 1480(%r8)                             #199.9
..LN1359:
   .loc    1  206  is_stmt 1
        addq      %rdi, %rcx                                    #206.28
..LN1360:
   .loc    1  200  is_stmt 1
        movsd     (%r9), %xmm11                                 #200.33
..LN1361:
        movhpd    1480(%r9), %xmm11                             #200.33
..LN1362:
        mulpd     %xmm12, %xmm11                                #200.33
..LN1363:
        movlpd    %xmm11, (%r9)                                 #200.9
..LN1364:
        movhpd    %xmm11, 1480(%r9)                             #200.9
..LN1365:
   .loc    1  201  is_stmt 1
        movsd     (%rsi), %xmm13                                #201.33
..LN1366:
        movhpd    1480(%rsi), %xmm13                            #201.33
..LN1367:
        mulpd     %xmm12, %xmm13                                #201.33
..LN1368:
        movlpd    %xmm13, (%rsi)                                #201.9
..LN1369:
        movhpd    %xmm13, 1480(%rsi)                            #201.9
..LN1370:
   .loc    1  202  is_stmt 1
        movsd     (%r13), %xmm1                                 #202.45
..LN1371:
        movsd     (%r8), %xmm14                                 #202.60
..LN1372:
        movhpd    1480(%r13), %xmm1                             #202.45
..LN1373:
        movhpd    1480(%r8), %xmm14                             #202.60
..LN1374:
        mulpd     %xmm14, %xmm1                                 #202.60
..LN1375:
        movsd     (%r12), %xmm2                                 #202.28
..LN1376:
        movhpd    1480(%r12), %xmm2                             #202.28
..LN1377:
        subpd     %xmm1, %xmm2                                  #202.60
..LN1378:
        movlpd    %xmm2, (%r12)                                 #202.9
..LN1379:
        movhpd    %xmm2, 1480(%r12)                             #202.9
..LN1380:
   .loc    1  204  is_stmt 1
        lea       1544(%rax,%rdx), %r12                         #204.28
..LN1381:
   .loc    1  203  is_stmt 1
        .byte     144                                           #203.45
..LN1382:
        movsd     (%r13), %xmm4                                 #203.45
..LN1383:
   .loc    1  204  is_stmt 1
        addq      %r10, %r12                                    #204.28
..LN1384:
   .loc    1  203  is_stmt 1
        movsd     (%r9), %xmm3                                  #203.60
..LN1385:
        movhpd    1480(%r13), %xmm4                             #203.45
..LN1386:
        movhpd    1480(%r9), %xmm3                              #203.60
..LN1387:
        mulpd     %xmm3, %xmm4                                  #203.60
..LN1388:
        .byte     15                                            #203.28
..LN1389:
        .byte     31                                            #203.28
..LN1390:
        .byte     64                                            #203.28
..LN1391:
        .byte     0                                             #203.28
..LN1392:
        movsd     (%r14), %xmm5                                 #203.28
..LN1393:
        movhpd    1480(%r14), %xmm5                             #203.28
..LN1394:
        subpd     %xmm4, %xmm5                                  #203.60
..LN1395:
        movlpd    %xmm5, (%r14)                                 #203.9
..LN1396:
        movhpd    %xmm5, 1480(%r14)                             #203.9
..LN1397:
   .loc    1  204  is_stmt 1
        movsd     (%r13), %xmm7                                 #204.47
..LN1398:
        movsd     (%rsi), %xmm6                                 #204.62
..LN1399:
        movhpd    1480(%r13), %xmm7                             #204.47
..LN1400:
        .byte     102                                           #204.62
..LN1401:
        .byte     144                                           #204.62
..LN1402:
        movhpd    1480(%rsi), %xmm6                             #204.62
..LN1403:
        mulpd     %xmm6, %xmm7                                  #204.62
..LN1404:
        movsd     (%r12), %xmm8                                 #204.28
..LN1405:
        .byte     15                                            #204.28
..LN1406:
        .byte     31                                            #204.28
..LN1407:
        .byte     64                                            #204.28
..LN1408:
        .byte     0                                             #204.28
..LN1409:
        movhpd    1480(%r12), %xmm8                             #204.28
..LN1410:
        subpd     %xmm7, %xmm8                                  #204.62
..LN1411:
        movlpd    %xmm8, (%r12)                                 #204.9
..LN1412:
        movhpd    %xmm8, 1480(%r12)                             #204.9
..LN1413:
   .loc    1  205  is_stmt 1
        movsd     (%rbx), %xmm10                                #205.45
..LN1414:
        movsd     (%r8), %xmm9                                  #205.60
..LN1415:
        movhpd    1480(%rbx), %xmm10                            #205.45
..LN1416:
        .byte     15                                            #205.60
..LN1417:
        .byte     31                                            #205.60
..LN1418:
        .byte     64                                            #205.60
..LN1419:
        .byte     0                                             #205.60
..LN1420:
        movhpd    1480(%r8), %xmm9                              #205.60
..LN1421:
        mulpd     %xmm9, %xmm10                                 #205.60
..LN1422:
        .byte     102                                           #205.28
..LN1423:
        .byte     144                                           #205.28
..LN1424:
        movsd     (%rbp), %xmm11                                #205.28
..LN1425:
        movhpd    1480(%rbp), %xmm11                            #205.28
..LN1426:
        subpd     %xmm10, %xmm11                                #205.60
..LN1427:
        movlpd    %xmm11, (%rbp)                                #205.9
..LN1428:
        movhpd    %xmm11, 1480(%rbp)                            #205.9
..LN1429:
   .loc    1  207  is_stmt 1
        lea       1584(%rax,%rdx), %rbp                         #207.28
..LN1430:
   .loc    1  206  is_stmt 1
        movsd     (%rbx), %xmm13                                #206.45
..LN1431:
   .loc    1  207  is_stmt 1
        addq      %r10, %rbp                                    #207.28
..LN1432:
   .loc    1  206  is_stmt 1
        movsd     (%r9), %xmm12                                 #206.60
..LN1433:
   .loc    1  193  is_stmt 1
        addq      $40, %rdx                                     #193.7
..LN1434:
   .loc    1  206  is_stmt 1
        movhpd    1480(%rbx), %xmm13                            #206.45
..LN1435:
        movhpd    1480(%r9), %xmm12                             #206.60
..LN1436:
        mulpd     %xmm12, %xmm13                                #206.60
..LN1437:
        movsd     (%rcx), %xmm15                                #206.28
..LN1438:
        movhpd    1480(%rcx), %xmm15                            #206.28
..LN1439:
        subpd     %xmm13, %xmm15                                #206.60
..LN1440:
        movlpd    %xmm15, (%rcx)                                #206.9
..LN1441:
        movhpd    %xmm15, 1480(%rcx)                            #206.9
..LN1442:
   .loc    1  207  is_stmt 1
        .byte     102                                           #207.47
..LN1443:
        .byte     144                                           #207.47
..LN1444:
        movsd     (%rbx), %xmm2                                 #207.47
..LN1445:
        movsd     (%rsi), %xmm1                                 #207.62
..LN1446:
        movhpd    1480(%rbx), %xmm2                             #207.47
..LN1447:
        movhpd    1480(%rsi), %xmm1                             #207.62
..LN1448:
        mulpd     %xmm1, %xmm2                                  #207.62
..LN1449:
        movsd     (%rbp), %xmm3                                 #207.28
..LN1450:
        movhpd    1480(%rbp), %xmm3                             #207.28
..LN1451:
        subpd     %xmm2, %xmm3                                  #207.62
..LN1452:
   .loc    1  193  is_stmt 1
        movq      464(%rsp), %rbx                               #193.7
..LN1453:
        incq      %rbx                                          #193.7
..LN1454:
   .loc    1  207  is_stmt 1
        movlpd    %xmm3, (%rbp)                                 #207.9
..LN1455:
        movhpd    %xmm3, 1480(%rbp)                             #207.9
..LN1456:
   .loc    1  193  is_stmt 1
        .byte     144                                           #193.7
..LN1457:
        movq      %rbx, 464(%rsp)                               #193.7
..LN1458:
        cmpq      456(%rsp), %rbx                               #193.7
..LN1459:
        jb        ..B1.96       # Prob 97%                      #193.7
..LN1460:
                                # LOE rax rdx xmm0
..B1.97:                        # Preds ..B1.96
        movq      392(%rsp), %rcx                               #
        xorl      %ebx, %ebx                                    #
        movq      472(%rsp), %r9                                #
        movl      384(%rsp), %r11d                              #
        movq      376(%rsp), %r10                               #
        movq      408(%rsp), %r13                               #
..LN1461:
                                # LOE rcx rbx r9 r10 r13 r11d xmm0
..B1.98:                        # Preds ..B1.94 ..B1.97
..LN1462:
   .loc    1  192  is_stmt 1
        addq      $2, %r10                                      #192.5
..LN1463:
        addq      $2960, %r9                                    #192.5
..LN1464:
        cmpq      %rcx, %r10                                    #192.5
..LN1465:
        jb        ..B1.94       # Prob 97%                      #192.5
..LN1466:
                                # LOE rcx rbx r9 r10 r13 r11d xmm0
..B1.99:                        # Preds ..B1.98
        movabsq   $grid_points, %rdi                            #
        movl      80(%rsp), %r8d                                #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
        movq      400(%rsp), %rsi                               #
..LN1467:
   .loc    1  227  is_stmt 1
        movl      (%rdi), %eax                                  #227.12
..LN1468:
                                # LOE rcx rbx rsi rdi r12 r13 eax ebp r8d
..B1.100:                       # Preds ..B1.99 ..B1.160
..LN1469:
        imulq     $1480, %rcx, %r9                              #
..LN1470:
   .loc    1  192  is_stmt 1
        cmpq      %rsi, %rcx                                    #192.5
..LN1471:
        jae       ..B1.108      # Prob 16%                      #192.5
..LN1472:
                                # LOE rcx rbx rsi rdi r9 r12 r13 eax ebp r8d
..B1.101:                       # Preds ..B1.100
..LN1473:
   .loc    1  193  is_stmt 1
        movl      %eax, 88(%rsp)                                #193.39
..LN1474:
        lea       -3(%r8), %r10d                                #193.39
..LN1475:
        movslq    %r8d, %r8                                     #193.7
..LN1476:
        movq      %r12, 360(%rsp)                               #193.39
..LN1477:
        addq      $-2, %r8                                      #193.39
..LN1478:
        movl      %ebp, 104(%rsp)                               #193.39
..LN1479:
        movsd     272(%rsp), %xmm7                              #193.39
..LN1480:
                                # LOE rcx rbx rsi r8 r9 r13 r10d xmm7
..B1.102:                       # Preds ..B1.106 ..B1.101
..LN1481:
        movq      %rbx, %r14                                    #193.7
..LN1482:
        testl     %r10d, %r10d                                  #193.39
        movq      %r14, %r12                                    #
..LN1483:
        js        ..B1.106      # Prob 10%                      #193.39
..LN1484:
                                # LOE rcx rbx rsi r8 r9 r12 r13 r14 r10d xmm7
..B1.103:                       # Preds ..B1.102
..LN1485:
   .loc    1  205  is_stmt 1
        movabsq   $lhsp, %rbp                                   #205.28
..LN1486:
   .loc    1  207  is_stmt 1
        movabsq   $rhs, %rdx                                    #207.28
..LN1487:
   .loc    1  217  is_stmt 1
        movabsq   $lhsm, %rax                                   #217.28
..LN1488:
   .loc    1  193  is_stmt 1
        lea       (%r13,%r9), %r11                              #193.7
..LN1489:
   .loc    1  205  is_stmt 1
        movsd     1528(%r9,%rbp), %xmm10                        #205.28
..LN1490:
   .loc    1  206  is_stmt 1
        movsd     1536(%r9,%rbp), %xmm4                         #206.28
..LN1491:
        movsd     1496(%r9,%rbp), %xmm12                        #206.28
..LN1492:
   .loc    1  203  is_stmt 1
        movsd     1504(%r9,%rbp), %xmm11                        #203.28
..LN1493:
   .loc    1  207  is_stmt 1
        movsd     1544(%rdx,%r11), %xmm5                        #207.28
..LN1494:
        movsd     1504(%rdx,%r11), %xmm9                        #207.28
..LN1495:
   .loc    1  219  is_stmt 1
        movsd     1552(%rdx,%r11), %xmm1                        #219.28
..LN1496:
        movsd     1512(%rdx,%r11), %xmm6                        #219.28
..LN1497:
   .loc    1  217  is_stmt 1
        movsd     1528(%r9,%rax), %xmm3                         #217.28
..LN1498:
   .loc    1  218  is_stmt 1
        movsd     1536(%r9,%rax), %xmm2                         #218.28
..LN1499:
        movsd     1496(%r9,%rax), %xmm0                         #218.28
..LN1500:
   .loc    1  215  is_stmt 1
        movsd     1504(%r9,%rax), %xmm8                         #215.28
..LN1501:
                                # LOE rax rdx rcx rbx rbp rsi r8 r9 r11 r12 r13 r14 r10d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12
..B1.104:                       # Preds ..B1.104 ..B1.103
..LN1502:
   .loc    1  210  is_stmt 1
        movaps    %xmm7, %xmm14                                 #210.20
..LN1503:
   .loc    1  193  is_stmt 1
        lea       (%r9,%r12), %r15                              #193.7
..LN1504:
   .loc    1  210  is_stmt 1
        divsd     %xmm0, %xmm14                                 #210.20
..LN1505:
   .loc    1  212  is_stmt 1
        movsd     1512(%rax,%r15), %xmm15                       #212.33
..LN1506:
   .loc    1  211  is_stmt 1
        movaps    %xmm8, %xmm13                                 #211.33
..LN1507:
        mulsd     %xmm14, %xmm13                                #211.33
..LN1508:
   .loc    1  193  is_stmt 1
        lea       (%r11,%r12), %rdi                             #193.7
..LN1509:
   .loc    1  212  is_stmt 1
        mulsd     %xmm14, %xmm15                                #212.33
..LN1510:
   .loc    1  213  is_stmt 1
        mulsd     %xmm6, %xmm14                                 #213.33
..LN1511:
   .loc    1  216  is_stmt 1
        movaps    %xmm1, %xmm6                                  #216.62
..LN1512:
   .loc    1  214  is_stmt 1
        movaps    %xmm3, %xmm8                                  #214.60
..LN1513:
   .loc    1  217  is_stmt 1
        movsd     1560(%rax,%r15), %xmm1                        #217.45
..LN1514:
   .loc    1  214  is_stmt 1
        movaps    %xmm2, %xmm0                                  #214.60
..LN1515:
   .loc    1  213  is_stmt 1
        movsd     %xmm14, 1512(%rdx,%rdi)                       #213.9
..LN1516:
   .loc    1  215  is_stmt 1
        movaps    %xmm3, %xmm2                                  #215.60
..LN1517:
   .loc    1  216  is_stmt 1
        mulsd     %xmm14, %xmm3                                 #216.62
..LN1518:
   .loc    1  193  is_stmt 1
        incq      %r14                                          #193.7
..LN1519:
   .loc    1  219  is_stmt 1
        mulsd     %xmm1, %xmm14                                 #219.62
..LN1520:
   .loc    1  214  is_stmt 1
        mulsd     %xmm13, %xmm8                                 #214.60
..LN1521:
   .loc    1  216  is_stmt 1
        subsd     %xmm3, %xmm6                                  #216.62
..LN1522:
   .loc    1  215  is_stmt 1
        mulsd     %xmm15, %xmm2                                 #215.60
..LN1523:
   .loc    1  214  is_stmt 1
        subsd     %xmm8, %xmm0                                  #214.60
..LN1524:
   .loc    1  211  is_stmt 1
        movsd     %xmm13, 1504(%rax,%r15)                       #211.9
..LN1525:
   .loc    1  193  is_stmt 1
        addq      $40, %r12                                     #193.7
..LN1526:
   .loc    1  212  is_stmt 1
        movsd     %xmm15, 1512(%rax,%r15)                       #212.9
..LN1527:
   .loc    1  193  is_stmt 1
        cmpq      %r8, %r14                                     #193.7
..LN1528:
   .loc    1  217  is_stmt 1
        mulsd     %xmm1, %xmm13                                 #217.60
..LN1529:
   .loc    1  218  is_stmt 1
        mulsd     %xmm1, %xmm15                                 #218.60
..LN1530:
   .loc    1  219  is_stmt 1
        movsd     1592(%rdx,%rdi), %xmm1                        #219.28
..LN1531:
   .loc    1  215  is_stmt 1
        movsd     1544(%rax,%r15), %xmm8                        #215.28
..LN1532:
   .loc    1  219  is_stmt 1
        subsd     %xmm14, %xmm1                                 #219.62
..LN1533:
   .loc    1  215  is_stmt 1
        subsd     %xmm2, %xmm8                                  #215.60
..LN1534:
   .loc    1  198  is_stmt 1
        movaps    %xmm7, %xmm14                                 #198.20
..LN1535:
        divsd     %xmm12, %xmm14                                #198.20
..LN1536:
   .loc    1  217  is_stmt 1
        movsd     1568(%rax,%r15), %xmm3                        #217.28
..LN1537:
   .loc    1  202  is_stmt 1
        movaps    %xmm4, %xmm12                                 #202.60
..LN1538:
   .loc    1  218  is_stmt 1
        movsd     1576(%rax,%r15), %xmm2                        #218.28
..LN1539:
   .loc    1  203  is_stmt 1
        movaps    %xmm10, %xmm4                                 #203.60
..LN1540:
   .loc    1  214  is_stmt 1
        movsd     %xmm0, 1536(%rax,%r15)                        #214.9
..LN1541:
   .loc    1  217  is_stmt 1
        subsd     %xmm13, %xmm3                                 #217.60
..LN1542:
   .loc    1  218  is_stmt 1
        subsd     %xmm15, %xmm2                                 #218.60
..LN1543:
   .loc    1  200  is_stmt 1
        movsd     1512(%rbp,%r15), %xmm15                       #200.33
..LN1544:
   .loc    1  199  is_stmt 1
        movaps    %xmm11, %xmm13                                #199.33
..LN1545:
        mulsd     %xmm14, %xmm13                                #199.33
..LN1546:
   .loc    1  202  is_stmt 1
        movaps    %xmm10, %xmm11                                #202.60
..LN1547:
   .loc    1  200  is_stmt 1
        mulsd     %xmm14, %xmm15                                #200.33
..LN1548:
   .loc    1  201  is_stmt 1
        mulsd     %xmm9, %xmm14                                 #201.33
..LN1549:
   .loc    1  202  is_stmt 1
        mulsd     %xmm13, %xmm11                                #202.60
..LN1550:
   .loc    1  203  is_stmt 1
        mulsd     %xmm15, %xmm4                                 #203.60
..LN1551:
   .loc    1  204  is_stmt 1
        mulsd     %xmm14, %xmm10                                #204.62
..LN1552:
   .loc    1  202  is_stmt 1
        subsd     %xmm11, %xmm12                                #202.60
..LN1553:
   .loc    1  204  is_stmt 1
        movaps    %xmm5, %xmm9                                  #204.62
..LN1554:
   .loc    1  205  is_stmt 1
        movsd     1560(%rbp,%r15), %xmm5                        #205.45
..LN1555:
   .loc    1  204  is_stmt 1
        subsd     %xmm10, %xmm9                                 #204.62
..LN1556:
   .loc    1  199  is_stmt 1
        movsd     %xmm13, 1504(%rbp,%r15)                       #199.9
..LN1557:
   .loc    1  205  is_stmt 1
        mulsd     %xmm5, %xmm13                                 #205.60
..LN1558:
        movsd     1568(%rbp,%r15), %xmm10                       #205.28
..LN1559:
   .loc    1  200  is_stmt 1
        movsd     %xmm15, 1512(%rbp,%r15)                       #200.9
..LN1560:
   .loc    1  205  is_stmt 1
        subsd     %xmm13, %xmm10                                #205.60
..LN1561:
   .loc    1  206  is_stmt 1
        mulsd     %xmm5, %xmm15                                 #206.60
..LN1562:
   .loc    1  201  is_stmt 1
        movsd     %xmm14, 1504(%rdx,%rdi)                       #201.9
..LN1563:
   .loc    1  207  is_stmt 1
        mulsd     %xmm5, %xmm14                                 #207.62
..LN1564:
   .loc    1  203  is_stmt 1
        movsd     1544(%rbp,%r15), %xmm11                       #203.28
..LN1565:
   .loc    1  207  is_stmt 1
        movsd     1584(%rdx,%rdi), %xmm5                        #207.28
..LN1566:
   .loc    1  203  is_stmt 1
        subsd     %xmm4, %xmm11                                 #203.60
..LN1567:
   .loc    1  207  is_stmt 1
        subsd     %xmm14, %xmm5                                 #207.62
..LN1568:
   .loc    1  206  is_stmt 1
        movsd     1576(%rbp,%r15), %xmm4                        #206.28
..LN1569:
   .loc    1  217  is_stmt 1
        movsd     %xmm3, 1568(%rax,%r15)                        #217.9
..LN1570:
   .loc    1  206  is_stmt 1
        subsd     %xmm15, %xmm4                                 #206.60
..LN1571:
   .loc    1  202  is_stmt 1
        movsd     %xmm12, 1536(%rbp,%r15)                       #202.9
..LN1572:
   .loc    1  205  is_stmt 1
        movsd     %xmm10, 1568(%rbp,%r15)                       #205.9
..LN1573:
   .loc    1  193  is_stmt 1
        jb        ..B1.104      # Prob 97%                      #193.7
..LN1574:
                                # LOE rax rdx rcx rbx rbp rsi r8 r9 r11 r12 r13 r14 r10d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12
..B1.105:                       # Preds ..B1.104
..LN1575:
   .loc    1  206  is_stmt 1
        lea       (%r14,%r14,4), %r11                           #206.28
..LN1576:
   .loc    1  207  is_stmt 1
        lea       (%r13,%r11,8), %r12                           #207.28
..LN1577:
   .loc    1  193  is_stmt 1
        addq      %r9, %r12                                     #193.7
..LN1578:
        lea       (%r9,%r11,8), %r14                            #193.7
..LN1579:
   .loc    1  206  is_stmt 1
        movsd     %xmm4, 1536(%rbp,%r14)                        #206.28
..LN1580:
   .loc    1  203  is_stmt 1
        movsd     %xmm11, 1504(%rbp,%r14)                       #203.28
..LN1581:
   .loc    1  218  is_stmt 1
        movsd     %xmm2, 1536(%rax,%r14)                        #218.28
..LN1582:
   .loc    1  207  is_stmt 1
        movsd     %xmm5, 1544(%rdx,%r12)                        #207.28
..LN1583:
   .loc    1  204  is_stmt 1
        movsd     %xmm9, 1504(%rdx,%r12)                        #204.28
..LN1584:
   .loc    1  219  is_stmt 1
        movsd     %xmm1, 1552(%rdx,%r12)                        #219.28
..LN1585:
   .loc    1  216  is_stmt 1
        movsd     %xmm6, 1512(%rdx,%r12)                        #216.28
..LN1586:
   .loc    1  215  is_stmt 1
        movsd     %xmm8, 1504(%rax,%r14)                        #215.28
..LN1587:
                                # LOE rcx rbx rsi r8 r9 r13 r10d xmm7
..B1.106:                       # Preds ..B1.102 ..B1.105
..LN1588:
   .loc    1  192  is_stmt 1
        incq      %rcx                                          #192.5
..LN1589:
        addq      $1480, %r9                                    #192.5
..LN1590:
        cmpq      %rsi, %rcx                                    #192.5
..LN1591:
        jb        ..B1.102      # Prob 97%                      #192.5
..LN1592:
                                # LOE rcx rbx rsi r8 r9 r13 r10d xmm7
..B1.107:                       # Preds ..B1.106
        movl      88(%rsp), %eax                                #
        movabsq   $grid_points, %rdi                            #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
..LN1593:
                                # LOE rbx rsi rdi r12 r13 eax ebp
..B1.108:                       # Preds ..B1.100 ..B1.107
..LN1594:
   .loc    1  227  is_stmt 1
        movslq    %eax, %rax                                    #227.12
..LN1595:
   .loc    1  226  is_stmt 1
        cmpq      $2, %rsi                                      #226.5
..LN1596:
   .loc    1  227  is_stmt 1
        movq      %rax, %r8                                     #227.12
..LN1597:
   .loc    1  226  is_stmt 1
        jl        ..B1.159      # Prob 10%                      #226.5
..LN1598:
                                # LOE rax rbx rsi rdi r8 r12 r13 ebp
..B1.109:                       # Preds ..B1.108
..LN1599:
        movl      %esi, %edx                                    #226.5
..LN1600:
        movq      %rbx, %rcx                                    #226.5
..LN1601:
        andl      $-2, %edx                                     #226.5
..LN1602:
   .loc    1  231  is_stmt 1
        lea       (%rax,%rax,4), %r15                           #231.18
..LN1603:
   .loc    1  226  is_stmt 1
        movslq    %edx, %rdx                                    #226.5
        lea       (%r13,%r15,8), %rax                           #
        movq      %r13, 408(%rsp)                               #
        movq      %rcx, %r10                                    #
        movq      %r12, 360(%rsp)                               #
        movabsq   $rhs, %r11                                    #
        movl      %ebp, 104(%rsp)                               #
        movabsq   $lhsm, %r14                                   #
        movq      %rsi, 400(%rsp)                               #
        movabsq   $lhsp, %r9                                    #
        movaps    112(%rsp), %xmm0                              #
..LN1604:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r14 r15 xmm0
..B1.110:                       # Preds ..B1.110 ..B1.109
..LN1605:
   .loc    1  231  is_stmt 1
        movaps    %xmm0, %xmm5                                  #231.18
..LN1606:
        lea       (%r10,%r15,8), %rbp                           #231.18
..LN1607:
        movsd     1416(%r9,%rbp), %xmm1                         #231.18
..LN1608:
   .loc    1  234  is_stmt 1
        lea       1424(%rax,%r10), %r12                         #234.31
..LN1609:
   .loc    1  231  is_stmt 1
        movhpd    2896(%r9,%rbp), %xmm1                         #231.18
..LN1610:
   .loc    1  234  is_stmt 1
        addq      %r11, %r12                                    #234.31
..LN1611:
   .loc    1  231  is_stmt 1
        divpd     %xmm1, %xmm5                                  #231.18
..LN1612:
   .loc    1  232  is_stmt 1
        movsd     1424(%r9,%rbp), %xmm2                         #232.31
..LN1613:
   .loc    1  237  is_stmt 1
        lea       1464(%rax,%r10), %rsi                         #237.26
..LN1614:
   .loc    1  233  is_stmt 1
        movsd     1432(%r9,%rbp), %xmm3                         #233.31
..LN1615:
   .loc    1  237  is_stmt 1
        addq      %r11, %rsi                                    #237.26
..LN1616:
   .loc    1  232  is_stmt 1
        movhpd    2904(%r9,%rbp), %xmm2                         #232.31
..LN1617:
   .loc    1  240  is_stmt 1
        movaps    %xmm0, %xmm1                                  #240.18
..LN1618:
   .loc    1  233  is_stmt 1
        movhpd    2912(%r9,%rbp), %xmm3                         #233.31
..LN1619:
   .loc    1  243  is_stmt 1
        lea       1432(%rax,%r10), %r13                         #243.31
..LN1620:
   .loc    1  232  is_stmt 1
        mulpd     %xmm5, %xmm2                                  #232.31
..LN1621:
   .loc    1  233  is_stmt 1
        mulpd     %xmm5, %xmm3                                  #233.31
..LN1622:
   .loc    1  232  is_stmt 1
        movlpd    %xmm2, 1424(%r9,%rbp)                         #232.7
..LN1623:
   .loc    1  243  is_stmt 1
        addq      %r11, %r13                                    #243.31
..LN1624:
   .loc    1  232  is_stmt 1
        movhpd    %xmm2, 2904(%r9,%rbp)                         #232.7
..LN1625:
   .loc    1  226  is_stmt 1
        addq      $2, %rcx                                      #226.5
..LN1626:
   .loc    1  233  is_stmt 1
        movlpd    %xmm3, 1432(%r9,%rbp)                         #233.7
..LN1627:
        movhpd    %xmm3, 2912(%r9,%rbp)                         #233.7
..LN1628:
   .loc    1  234  is_stmt 1
        movsd     (%r12), %xmm4                                 #234.31
..LN1629:
        movhpd    1480(%r12), %xmm4                             #234.31
..LN1630:
        mulpd     %xmm4, %xmm5                                  #234.31
..LN1631:
        movlpd    %xmm5, (%r12)                                 #234.7
..LN1632:
        movhpd    %xmm5, 1480(%r12)                             #234.7
..LN1633:
   .loc    1  235  is_stmt 1
        movsd     1424(%r9,%rbp), %xmm6                         #235.58
..LN1634:
        movsd     1448(%r9,%rbp), %xmm10                        #235.43
..LN1635:
   .loc    1  236  is_stmt 1
        movsd     1432(%r9,%rbp), %xmm8                         #236.58
..LN1636:
   .loc    1  235  is_stmt 1
        movhpd    2904(%r9,%rbp), %xmm6                         #235.58
..LN1637:
        movhpd    2928(%r9,%rbp), %xmm10                        #235.43
..LN1638:
   .loc    1  236  is_stmt 1
        movhpd    2912(%r9,%rbp), %xmm8                         #236.58
..LN1639:
   .loc    1  235  is_stmt 1
        mulpd     %xmm10, %xmm6                                 #235.58
..LN1640:
   .loc    1  236  is_stmt 1
        mulpd     %xmm10, %xmm8                                 #236.58
..LN1641:
   .loc    1  235  is_stmt 1
        movsd     1456(%r9,%rbp), %xmm7                         #235.26
..LN1642:
   .loc    1  236  is_stmt 1
        movsd     1464(%r9,%rbp), %xmm9                         #236.26
..LN1643:
   .loc    1  235  is_stmt 1
        movhpd    2936(%r9,%rbp), %xmm7                         #235.26
..LN1644:
   .loc    1  236  is_stmt 1
        movhpd    2944(%r9,%rbp), %xmm9                         #236.26
..LN1645:
   .loc    1  235  is_stmt 1
        subpd     %xmm6, %xmm7                                  #235.58
..LN1646:
   .loc    1  236  is_stmt 1
        subpd     %xmm8, %xmm9                                  #236.58
..LN1647:
   .loc    1  235  is_stmt 1
        movlpd    %xmm7, 1456(%r9,%rbp)                         #235.7
..LN1648:
        movhpd    %xmm7, 2936(%r9,%rbp)                         #235.7
..LN1649:
   .loc    1  236  is_stmt 1
        movlpd    %xmm9, 1464(%r9,%rbp)                         #236.7
..LN1650:
        movhpd    %xmm9, 2944(%r9,%rbp)                         #236.7
..LN1651:
   .loc    1  237  is_stmt 1
        movsd     (%r12), %xmm11                                #237.60
..LN1652:
        movhpd    1480(%r12), %xmm11                            #237.60
..LN1653:
   .loc    1  246  is_stmt 1
        lea       1472(%rax,%r10), %r12                         #246.26
..LN1654:
   .loc    1  237  is_stmt 1
        mulpd     %xmm10, %xmm11                                #237.60
..LN1655:
        movsd     (%rsi), %xmm12                                #237.26
..LN1656:
   .loc    1  246  is_stmt 1
        addq      %r11, %r12                                    #246.26
..LN1657:
   .loc    1  237  is_stmt 1
        movhpd    1480(%rsi), %xmm12                            #237.26
..LN1658:
   .loc    1  226  is_stmt 1
        addq      $2960, %r10                                   #226.5
..LN1659:
   .loc    1  237  is_stmt 1
        subpd     %xmm11, %xmm12                                #237.60
..LN1660:
        movlpd    %xmm12, (%rsi)                                #237.7
..LN1661:
   .loc    1  226  is_stmt 1
        cmpq      %rdx, %rcx                                    #226.5
..LN1662:
   .loc    1  237  is_stmt 1
        movhpd    %xmm12, 1480(%rsi)                            #237.7
..LN1663:
   .loc    1  240  is_stmt 1
        movsd     1416(%r14,%rbp), %xmm13                       #240.18
..LN1664:
        movhpd    2896(%r14,%rbp), %xmm13                       #240.18
..LN1665:
        divpd     %xmm13, %xmm1                                 #240.18
..LN1666:
   .loc    1  241  is_stmt 1
        movsd     1424(%r14,%rbp), %xmm14                       #241.31
..LN1667:
   .loc    1  242  is_stmt 1
        movsd     1432(%r14,%rbp), %xmm15                       #242.31
..LN1668:
   .loc    1  241  is_stmt 1
        movhpd    2904(%r14,%rbp), %xmm14                       #241.31
..LN1669:
   .loc    1  242  is_stmt 1
        movhpd    2912(%r14,%rbp), %xmm15                       #242.31
..LN1670:
   .loc    1  241  is_stmt 1
        mulpd     %xmm1, %xmm14                                 #241.31
..LN1671:
   .loc    1  242  is_stmt 1
        mulpd     %xmm1, %xmm15                                 #242.31
..LN1672:
   .loc    1  241  is_stmt 1
        movlpd    %xmm14, 1424(%r14,%rbp)                       #241.7
..LN1673:
        movhpd    %xmm14, 2904(%r14,%rbp)                       #241.7
..LN1674:
   .loc    1  242  is_stmt 1
        movlpd    %xmm15, 1432(%r14,%rbp)                       #242.7
..LN1675:
        movhpd    %xmm15, 2912(%r14,%rbp)                       #242.7
..LN1676:
   .loc    1  243  is_stmt 1
        movsd     (%r13), %xmm13                                #243.31
..LN1677:
        movhpd    1480(%r13), %xmm13                            #243.31
..LN1678:
        mulpd     %xmm13, %xmm1                                 #243.31
..LN1679:
        movlpd    %xmm1, (%r13)                                 #243.7
..LN1680:
        movhpd    %xmm1, 1480(%r13)                             #243.7
..LN1681:
   .loc    1  244  is_stmt 1
        movsd     1424(%r14,%rbp), %xmm2                        #244.58
..LN1682:
        movsd     1448(%r14,%rbp), %xmm6                        #244.43
..LN1683:
   .loc    1  245  is_stmt 1
        movsd     1432(%r14,%rbp), %xmm4                        #245.58
..LN1684:
   .loc    1  244  is_stmt 1
        movhpd    2904(%r14,%rbp), %xmm2                        #244.58
..LN1685:
        movhpd    2928(%r14,%rbp), %xmm6                        #244.43
..LN1686:
   .loc    1  245  is_stmt 1
        movhpd    2912(%r14,%rbp), %xmm4                        #245.58
..LN1687:
   .loc    1  244  is_stmt 1
        mulpd     %xmm6, %xmm2                                  #244.58
..LN1688:
   .loc    1  245  is_stmt 1
        mulpd     %xmm6, %xmm4                                  #245.58
..LN1689:
   .loc    1  244  is_stmt 1
        .byte     15                                            #244.26
..LN1690:
        .byte     31                                            #244.26
..LN1691:
        .byte     0                                             #244.26
..LN1692:
        movsd     1456(%r14,%rbp), %xmm3                        #244.26
..LN1693:
   .loc    1  245  is_stmt 1
        movsd     1464(%r14,%rbp), %xmm5                        #245.26
..LN1694:
   .loc    1  244  is_stmt 1
        movhpd    2936(%r14,%rbp), %xmm3                        #244.26
..LN1695:
   .loc    1  245  is_stmt 1
        movhpd    2944(%r14,%rbp), %xmm5                        #245.26
..LN1696:
   .loc    1  244  is_stmt 1
        subpd     %xmm2, %xmm3                                  #244.58
..LN1697:
   .loc    1  245  is_stmt 1
        subpd     %xmm4, %xmm5                                  #245.58
..LN1698:
   .loc    1  244  is_stmt 1
        movlpd    %xmm3, 1456(%r14,%rbp)                        #244.7
..LN1699:
        movhpd    %xmm3, 2936(%r14,%rbp)                        #244.7
..LN1700:
   .loc    1  245  is_stmt 1
        movlpd    %xmm5, 1464(%r14,%rbp)                        #245.7
..LN1701:
        movhpd    %xmm5, 2944(%r14,%rbp)                        #245.7
..LN1702:
   .loc    1  246  is_stmt 1
        movsd     (%r13), %xmm7                                 #246.60
..LN1703:
        movhpd    1480(%r13), %xmm7                             #246.60
..LN1704:
        mulpd     %xmm6, %xmm7                                  #246.60
..LN1705:
        .byte     15                                            #246.26
..LN1706:
        .byte     31                                            #246.26
..LN1707:
        .byte     64                                            #246.26
..LN1708:
        .byte     0                                             #246.26
..LN1709:
        movsd     (%r12), %xmm8                                 #246.26
..LN1710:
        movhpd    1480(%r12), %xmm8                             #246.26
..LN1711:
        subpd     %xmm7, %xmm8                                  #246.60
..LN1712:
        movlpd    %xmm8, (%r12)                                 #246.7
..LN1713:
        movhpd    %xmm8, 1480(%r12)                             #246.7
..LN1714:
   .loc    1  251  is_stmt 1
        movsd     (%rsi), %xmm10                                #251.26
..LN1715:
        movsd     1456(%r9,%rbp), %xmm9                         #251.43
..LN1716:
        movhpd    1480(%rsi), %xmm10                            #251.26
..LN1717:
        movhpd    2936(%r9,%rbp), %xmm9                         #251.43
..LN1718:
        divpd     %xmm9, %xmm10                                 #251.43
..LN1719:
        movlpd    %xmm10, (%rsi)                                #251.7
..LN1720:
        movhpd    %xmm10, 1480(%rsi)                            #251.7
..LN1721:
   .loc    1  252  is_stmt 1
        movsd     (%r12), %xmm12                                #252.26
..LN1722:
        movsd     1456(%r14,%rbp), %xmm11                       #252.43
..LN1723:
        movhpd    1480(%r12), %xmm12                            #252.26
..LN1724:
        movhpd    2936(%r14,%rbp), %xmm11                       #252.43
..LN1725:
        divpd     %xmm11, %xmm12                                #252.43
..LN1726:
        movlpd    %xmm12, (%r12)                                #252.7
..LN1727:
        movhpd    %xmm12, 1480(%r12)                            #252.7
..LN1728:
   .loc    1  226  is_stmt 1
        jb        ..B1.110      # Prob 97%                      #226.5
..LN1729:
                                # LOE rax rdx rcx rbx rdi r8 r9 r10 r11 r14 r15 xmm0
..B1.111:                       # Preds ..B1.110
        movq      408(%rsp), %r13                               #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
        movq      400(%rsp), %rsi                               #
..LN1730:
   .loc    1  259  is_stmt 1
        movslq    (%rdi), %rax                                  #259.12
..LN1731:
                                # LOE rax rdx rbx rsi r8 r12 r13 ebp
..B1.112:                       # Preds ..B1.111 ..B1.159
        imulq     $1480, %rdx, %r9                              #
..LN1732:
   .loc    1  226  is_stmt 1
        cmpq      %rsi, %rdx                                    #226.5
..LN1733:
        jae       ..B1.116      # Prob 16%                      #226.5
..LN1734:
                                # LOE rax rdx rbx rsi r8 r9 r12 r13 ebp
..B1.113:                       # Preds ..B1.112
        movsd     272(%rsp), %xmm0                              #
..LN1735:
   .loc    1  231  is_stmt 1
        lea       (%r8,%r8,4), %rcx                             #231.18
        movabsq   $rhs, %r14                                    #
        lea       (%r13,%rcx,8), %r15                           #
        movabsq   $lhsm, %r11                                   #
        movabsq   $lhsp, %r10                                   #
..LN1736:
                                # LOE rax rdx rcx rbx rsi r9 r10 r11 r12 r13 r14 r15 ebp xmm0
..B1.114:                       # Preds ..B1.114 ..B1.113
..LN1737:
        movaps    %xmm0, %xmm6                                  #231.18
..LN1738:
        lea       (%r9,%rcx,8), %rdi                            #231.7
..LN1739:
   .loc    1  240  is_stmt 1
        movaps    %xmm0, %xmm12                                 #240.18
..LN1740:
   .loc    1  234  is_stmt 1
        lea       (%r15,%r9), %r8                               #234.7
..LN1741:
   .loc    1  231  is_stmt 1
        divsd     1416(%r10,%rdi), %xmm6                        #231.18
..LN1742:
   .loc    1  240  is_stmt 1
        divsd     1416(%r11,%rdi), %xmm12                       #240.18
..LN1743:
   .loc    1  241  is_stmt 1
        movsd     1424(%r11,%rdi), %xmm8                        #241.31
..LN1744:
   .loc    1  226  is_stmt 1
        incq      %rdx                                          #226.5
..LN1745:
   .loc    1  242  is_stmt 1
        movsd     1432(%r11,%rdi), %xmm9                        #242.31
..LN1746:
   .loc    1  226  is_stmt 1
        addq      $1480, %r9                                    #226.5
..LN1747:
   .loc    1  232  is_stmt 1
        movsd     1424(%r10,%rdi), %xmm2                        #232.31
..LN1748:
   .loc    1  226  is_stmt 1
        cmpq      %rsi, %rdx                                    #226.5
..LN1749:
   .loc    1  233  is_stmt 1
        movsd     1432(%r10,%rdi), %xmm3                        #233.31
..LN1750:
   .loc    1  234  is_stmt 1
        movsd     1424(%r14,%r8), %xmm1                         #234.31
..LN1751:
   .loc    1  243  is_stmt 1
        movsd     1432(%r14,%r8), %xmm7                         #243.31
..LN1752:
   .loc    1  232  is_stmt 1
        mulsd     %xmm6, %xmm2                                  #232.31
..LN1753:
   .loc    1  233  is_stmt 1
        mulsd     %xmm6, %xmm3                                  #233.31
..LN1754:
   .loc    1  234  is_stmt 1
        mulsd     %xmm1, %xmm6                                  #234.31
..LN1755:
   .loc    1  241  is_stmt 1
        mulsd     %xmm12, %xmm8                                 #241.31
..LN1756:
   .loc    1  242  is_stmt 1
        mulsd     %xmm12, %xmm9                                 #242.31
..LN1757:
   .loc    1  243  is_stmt 1
        mulsd     %xmm7, %xmm12                                 #243.31
..LN1758:
   .loc    1  235  is_stmt 1
        movsd     1448(%r10,%rdi), %xmm5                        #235.43
..LN1759:
   .loc    1  244  is_stmt 1
        movsd     1448(%r11,%rdi), %xmm11                       #244.43
..LN1760:
   .loc    1  232  is_stmt 1
        movsd     %xmm2, 1424(%r10,%rdi)                        #232.7
..LN1761:
   .loc    1  234  is_stmt 1
        movsd     %xmm6, 1424(%r14,%r8)                         #234.7
..LN1762:
   .loc    1  235  is_stmt 1
        mulsd     %xmm5, %xmm2                                  #235.58
..LN1763:
   .loc    1  237  is_stmt 1
        mulsd     %xmm5, %xmm6                                  #237.60
..LN1764:
   .loc    1  241  is_stmt 1
        movsd     %xmm8, 1424(%r11,%rdi)                        #241.7
..LN1765:
   .loc    1  243  is_stmt 1
        movsd     %xmm12, 1432(%r14,%r8)                        #243.7
..LN1766:
   .loc    1  244  is_stmt 1
        mulsd     %xmm11, %xmm8                                 #244.58
..LN1767:
   .loc    1  246  is_stmt 1
        mulsd     %xmm11, %xmm12                                #246.60
..LN1768:
   .loc    1  235  is_stmt 1
        movsd     1456(%r10,%rdi), %xmm13                       #235.26
..LN1769:
   .loc    1  237  is_stmt 1
        movsd     1464(%r14,%r8), %xmm14                        #237.26
..LN1770:
   .loc    1  235  is_stmt 1
        subsd     %xmm2, %xmm13                                 #235.58
..LN1771:
   .loc    1  237  is_stmt 1
        subsd     %xmm6, %xmm14                                 #237.60
..LN1772:
   .loc    1  246  is_stmt 1
        movsd     1472(%r14,%r8), %xmm1                         #246.26
..LN1773:
   .loc    1  244  is_stmt 1
        movsd     1456(%r11,%rdi), %xmm15                       #244.26
..LN1774:
   .loc    1  246  is_stmt 1
        subsd     %xmm12, %xmm1                                 #246.60
..LN1775:
   .loc    1  244  is_stmt 1
        subsd     %xmm8, %xmm15                                 #244.58
..LN1776:
   .loc    1  251  is_stmt 1
        divsd     %xmm13, %xmm14                                #251.43
..LN1777:
   .loc    1  252  is_stmt 1
        divsd     %xmm15, %xmm1                                 #252.43
..LN1778:
   .loc    1  233  is_stmt 1
        movsd     %xmm3, 1432(%r10,%rdi)                        #233.7
..LN1779:
   .loc    1  236  is_stmt 1
        mulsd     %xmm5, %xmm3                                  #236.58
..LN1780:
   .loc    1  242  is_stmt 1
        movsd     %xmm9, 1432(%r11,%rdi)                        #242.7
..LN1781:
   .loc    1  245  is_stmt 1
        mulsd     %xmm11, %xmm9                                 #245.58
..LN1782:
   .loc    1  236  is_stmt 1
        movsd     1464(%r10,%rdi), %xmm4                        #236.26
..LN1783:
   .loc    1  245  is_stmt 1
        movsd     1464(%r11,%rdi), %xmm10                       #245.26
..LN1784:
   .loc    1  236  is_stmt 1
        subsd     %xmm3, %xmm4                                  #236.58
..LN1785:
   .loc    1  245  is_stmt 1
        subsd     %xmm9, %xmm10                                 #245.58
..LN1786:
   .loc    1  235  is_stmt 1
        movsd     %xmm13, 1456(%r10,%rdi)                       #235.7
..LN1787:
   .loc    1  236  is_stmt 1
        movsd     %xmm4, 1464(%r10,%rdi)                        #236.7
..LN1788:
   .loc    1  244  is_stmt 1
        movsd     %xmm15, 1456(%r11,%rdi)                       #244.7
..LN1789:
   .loc    1  245  is_stmt 1
        movsd     %xmm10, 1464(%r11,%rdi)                       #245.7
..LN1790:
   .loc    1  251  is_stmt 1
        movsd     %xmm14, 1464(%r14,%r8)                        #251.7
..LN1791:
   .loc    1  252  is_stmt 1
        movsd     %xmm1, 1472(%r14,%r8)                         #252.7
..LN1792:
   .loc    1  226  is_stmt 1
        jb        ..B1.114      # Prob 97%                      #226.5
..LN1793:
                                # LOE rax rdx rcx rbx rsi r9 r10 r11 r12 r13 r14 r15 ebp xmm0
..B1.116:                       # Preds ..B1.114 ..B1.112
..LN1794:
   .loc    1  258  is_stmt 1
        cmpq      $2, %rsi                                      #258.5
..LN1795:
        jl        ..B1.158      # Prob 10%                      #258.5
..LN1796:
                                # LOE rax rbx rsi r12 r13 ebp
..B1.117:                       # Preds ..B1.116
..LN1797:
        movl      %esi, %r10d                                   #258.5
..LN1798:
        movq      %rbx, %r9                                     #258.5
..LN1799:
        andl      $-2, %r10d                                    #258.5
..LN1800:
   .loc    1  262  is_stmt 1
        lea       (%rax,%rax,4), %r8                            #262.27
..LN1801:
   .loc    1  258  is_stmt 1
        movslq    %r10d, %r10                                   #258.5
..LN1802:
   .loc    1  265  is_stmt 1
        lea       -10(%rax,%rax,4), %rcx                        #265.25
        movq      %rax, 96(%rsp)                                #
..LN1803:
        lea       -5(%rax,%rax,4), %r11                         #265.57
        movq      %r13, 408(%rsp)                               #
        lea       (%r13,%r8,8), %rdi                            #
        movq      %r12, 360(%rsp)                               #
        lea       (%r13,%rcx,8), %r14                           #
        movl      %ebp, 104(%rsp)                               #
        lea       (%r13,%r11,8), %r11                           #
        movq      %rsi, 400(%rsp)                               #
        movq      %r9, %r15                                     #
        movabsq   $lhsm, %rdx                                   #
        movabsq   $lhsp, %r12                                   #
        movabsq   $rhs, %rsi                                    #
        movabsq   $lhs, %rbp                                    #
..LN1804:
                                # LOE rdx rcx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15
..B1.118:                       # Preds ..B1.118 ..B1.117
..LN1805:
   .loc    1  258  is_stmt 1
        addq      $2, %r9                                       #258.5
..LN1806:
   .loc    1  262  is_stmt 1
        lea       1440(%rdi,%r15), %r13                         #262.58
..LN1807:
        addq      %rsi, %r13                                    #262.58
..LN1808:
        lea       (%r15,%r8,8), %rbx                            #262.45
..LN1809:
        movsd     1424(%rbp,%rbx), %xmm1                        #262.45
..LN1810:
        lea       1400(%rdi,%r15), %rax                         #262.27
..LN1811:
        movhpd    2904(%rbp,%rbx), %xmm1                        #262.45
..LN1812:
        addq      %rsi, %rax                                    #262.27
..LN1813:
        movsd     (%r13), %xmm0                                 #262.58
..LN1814:
        movhpd    1480(%r13), %xmm0                             #262.58
..LN1815:
        lea       1448(%rdi,%r15), %r13                         #262.58
..LN1816:
        mulpd     %xmm0, %xmm1                                  #262.58
..LN1817:
        movsd     (%rax), %xmm2                                 #262.27
..LN1818:
        addq      %rsi, %r13                                    #262.58
..LN1819:
        movhpd    1480(%rax), %xmm2                             #262.27
..LN1820:
        subpd     %xmm1, %xmm2                                  #262.58
..LN1821:
        movlpd    %xmm2, (%rax)                                 #262.9
..LN1822:
        movhpd    %xmm2, 1480(%rax)                             #262.9
..LN1823:
        lea       1408(%rdi,%r15), %rax                         #262.27
..LN1824:
        movsd     1424(%rbp,%rbx), %xmm4                        #262.45
..LN1825:
        addq      %rsi, %rax                                    #262.27
..LN1826:
        movsd     (%r13), %xmm3                                 #262.58
..LN1827:
        movhpd    2904(%rbp,%rbx), %xmm4                        #262.45
..LN1828:
        movhpd    1480(%r13), %xmm3                             #262.58
..LN1829:
        lea       1416(%rdi,%r15), %r13                         #262.27
..LN1830:
        mulpd     %xmm3, %xmm4                                  #262.58
..LN1831:
        movsd     (%rax), %xmm5                                 #262.27
..LN1832:
        addq      %rsi, %r13                                    #262.27
..LN1833:
        movhpd    1480(%rax), %xmm5                             #262.27
..LN1834:
        subpd     %xmm4, %xmm5                                  #262.58
..LN1835:
        movlpd    %xmm5, (%rax)                                 #262.9
..LN1836:
        movhpd    %xmm5, 1480(%rax)                             #262.9
..LN1837:
   .loc    1  265  is_stmt 1
        lea       (%r15,%rcx,8), %rax                           #265.43
..LN1838:
   .loc    1  262  is_stmt 1
        movsd     1424(%rbp,%rbx), %xmm7                        #262.45
..LN1839:
        movhpd    2904(%rbp,%rbx), %xmm7                        #262.45
..LN1840:
        lea       1456(%rdi,%r15), %rbx                         #262.58
..LN1841:
        addq      %rsi, %rbx                                    #262.58
..LN1842:
        movsd     (%r13), %xmm8                                 #262.27
..LN1843:
        movhpd    1480(%r13), %xmm8                             #262.27
..LN1844:
        movsd     (%rbx), %xmm6                                 #262.58
..LN1845:
        movhpd    1480(%rbx), %xmm6                             #262.58
..LN1846:
   .loc    1  265  is_stmt 1
        lea       1504(%r11,%r15), %rbx                         #265.57
..LN1847:
   .loc    1  262  is_stmt 1
        mulpd     %xmm6, %xmm7                                  #262.58
..LN1848:
        subpd     %xmm7, %xmm8                                  #262.58
..LN1849:
   .loc    1  265  is_stmt 1
        addq      %rsi, %rbx                                    #265.57
..LN1850:
   .loc    1  262  is_stmt 1
        movlpd    %xmm8, (%r13)                                 #262.9
..LN1851:
        movhpd    %xmm8, 1480(%r13)                             #262.9
..LN1852:
   .loc    1  265  is_stmt 1
        lea       1504(%r14,%r15), %r13                         #265.25
..LN1853:
        movsd     1504(%r12,%rax), %xmm10                       #265.43
..LN1854:
        addq      %rsi, %r13                                    #265.25
..LN1855:
        movsd     (%rbx), %xmm9                                 #265.57
..LN1856:
        movhpd    2984(%r12,%rax), %xmm10                       #265.43
..LN1857:
        movhpd    1480(%rbx), %xmm9                             #265.57
..LN1858:
   .loc    1  266  is_stmt 1
        lea       1512(%r14,%r15), %rbx                         #266.25
..LN1859:
   .loc    1  265  is_stmt 1
        mulpd     %xmm9, %xmm10                                 #265.57
..LN1860:
        movsd     (%r13), %xmm11                                #265.25
..LN1861:
   .loc    1  266  is_stmt 1
        addq      %rsi, %rbx                                    #266.25
..LN1862:
   .loc    1  265  is_stmt 1
        movhpd    1480(%r13), %xmm11                            #265.25
..LN1863:
        subpd     %xmm10, %xmm11                                #265.57
..LN1864:
        movlpd    %xmm11, (%r13)                                #265.7
..LN1865:
        movhpd    %xmm11, 1480(%r13)                            #265.7
..LN1866:
   .loc    1  266  is_stmt 1
        movsd     1504(%rdx,%rax), %xmm13                       #266.43
..LN1867:
        movhpd    2984(%rdx,%rax), %xmm13                       #266.43
..LN1868:
        lea       1512(%r11,%r15), %rax                         #266.57
..LN1869:
        addq      %rsi, %rax                                    #266.57
..LN1870:
   .loc    1  258  is_stmt 1
        addq      $2960, %r15                                   #258.5
..LN1871:
   .loc    1  266  is_stmt 1
        movsd     (%rbx), %xmm14                                #266.25
..LN1872:
   .loc    1  258  is_stmt 1
        cmpq      %r10, %r9                                     #258.5
..LN1873:
   .loc    1  266  is_stmt 1
        movhpd    1480(%rbx), %xmm14                            #266.25
..LN1874:
        movsd     (%rax), %xmm12                                #266.57
..LN1875:
        movhpd    1480(%rax), %xmm12                            #266.57
..LN1876:
        mulpd     %xmm12, %xmm13                                #266.57
..LN1877:
        subpd     %xmm13, %xmm14                                #266.57
..LN1878:
        movlpd    %xmm14, (%rbx)                                #266.7
..LN1879:
        movhpd    %xmm14, 1480(%rbx)                            #266.7
..LN1880:
   .loc    1  258  is_stmt 1
        jb        ..B1.118      # Prob 97%                      #258.5
..LN1881:
                                # LOE rdx rcx rbp rsi rdi r8 r9 r10 r11 r12 r14 r15
..B1.119:                       # Preds ..B1.118
        movq      96(%rsp), %rax                                #
        xorl      %ebx, %ebx                                    #
        movq      408(%rsp), %r13                               #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
        movq      400(%rsp), %rsi                               #
..LN1882:
                                # LOE rax rbx rsi r10 r12 r13 ebp
..B1.120:                       # Preds ..B1.119 ..B1.158
        imulq     $1480, %r10, %rcx                             #
..LN1883:
        cmpq      %rsi, %r10                                    #258.5
..LN1884:
        jae       ..B1.170      # Prob 16%                      #258.5
..LN1885:
                                # LOE rax rcx rbx rsi r10 r12 r13 ebp
..B1.121:                       # Preds ..B1.120
        movq      %r13, 408(%rsp)                               #
..LN1886:
   .loc    1  262  is_stmt 1
        lea       (%rax,%rax,4), %rdx                           #262.58
        movq      %r12, 360(%rsp)                               #
..LN1887:
   .loc    1  265  is_stmt 1
        lea       -10(%rax,%rax,4), %r8                         #265.25
        movl      %ebp, 104(%rsp)                               #
..LN1888:
        lea       -5(%rax,%rax,4), %rax                         #265.57
        movabsq   $lhsm, %r11                                   #
        lea       (%r13,%rdx,8), %rdi                           #
        movabsq   $lhsp, %r15                                   #
        lea       (%r13,%r8,8), %r9                             #
        movabsq   $lhs, %rbx                                    #
        lea       (%r13,%rax,8), %r14                           #
        movabsq   $rhs, %rax                                    #
..LN1889:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15
..B1.122:                       # Preds ..B1.122 ..B1.121
..LN1890:
   .loc    1  258  is_stmt 1
        incq      %r10                                          #258.5
..LN1891:
   .loc    1  262  is_stmt 1
        lea       (%rcx,%rdx,8), %rbp                           #262.9
..LN1892:
        movsd     1424(%rbx,%rbp), %xmm5                        #262.45
..LN1893:
        lea       (%rdi,%rcx), %r12                             #262.9
..LN1894:
        movsd     1440(%rax,%r12), %xmm0                        #262.58
..LN1895:
   .loc    1  265  is_stmt 1
        lea       (%rcx,%r8,8), %r13                            #265.7
..LN1896:
   .loc    1  262  is_stmt 1
        movsd     1448(%rax,%r12), %xmm2                        #262.58
..LN1897:
   .loc    1  265  is_stmt 1
        lea       (%r14,%rcx), %rbp                             #265.7
..LN1898:
   .loc    1  262  is_stmt 1
        movsd     1456(%rax,%r12), %xmm4                        #262.58
..LN1899:
        mulsd     %xmm5, %xmm0                                  #262.58
..LN1900:
        mulsd     %xmm5, %xmm2                                  #262.58
..LN1901:
        mulsd     %xmm4, %xmm5                                  #262.58
..LN1902:
        movsd     1400(%rax,%r12), %xmm1                        #262.27
..LN1903:
        movsd     1408(%rax,%r12), %xmm3                        #262.27
..LN1904:
        subsd     %xmm0, %xmm1                                  #262.58
..LN1905:
        subsd     %xmm2, %xmm3                                  #262.58
..LN1906:
        movsd     1416(%rax,%r12), %xmm6                        #262.27
..LN1907:
        movsd     %xmm1, 1400(%rax,%r12)                        #262.9
..LN1908:
        subsd     %xmm5, %xmm6                                  #262.58
..LN1909:
        movsd     %xmm3, 1408(%rax,%r12)                        #262.9
..LN1910:
        movsd     %xmm6, 1416(%rax,%r12)                        #262.9
..LN1911:
   .loc    1  265  is_stmt 1
        lea       (%r9,%rcx), %r12                              #265.7
..LN1912:
        movsd     1504(%r15,%r13), %xmm7                        #265.43
..LN1913:
   .loc    1  258  is_stmt 1
        addq      $1480, %rcx                                   #258.5
..LN1914:
   .loc    1  265  is_stmt 1
        mulsd     1504(%rax,%rbp), %xmm7                        #265.57
..LN1915:
   .loc    1  258  is_stmt 1
        cmpq      %rsi, %r10                                    #258.5
..LN1916:
   .loc    1  265  is_stmt 1
        movsd     1504(%rax,%r12), %xmm8                        #265.25
..LN1917:
   .loc    1  266  is_stmt 1
        movsd     1504(%r11,%r13), %xmm9                        #266.43
..LN1918:
   .loc    1  265  is_stmt 1
        subsd     %xmm7, %xmm8                                  #265.57
..LN1919:
        movsd     %xmm8, 1504(%rax,%r12)                        #265.7
..LN1920:
   .loc    1  266  is_stmt 1
        mulsd     1512(%rax,%rbp), %xmm9                        #266.57
..LN1921:
        movsd     1512(%rax,%r12), %xmm10                       #266.25
..LN1922:
        subsd     %xmm9, %xmm10                                 #266.57
..LN1923:
        movsd     %xmm10, 1512(%rax,%r12)                       #266.7
..LN1924:
   .loc    1  258  is_stmt 1
        jb        ..B1.122      # Prob 97%                      #258.5
..LN1925:
                                # LOE rax rdx rcx rbx rsi rdi r8 r9 r10 r11 r14 r15
..B1.123:                       # Preds ..B1.122
        movq      408(%rsp), %r13                               #
        xorl      %ebx, %ebx                                    #
        movq      360(%rsp), %r12                               #
..LN1926:
   .loc    1  58  is_stmt 1
        testq     %rsi, %rsi                                    #58.22
        movl      104(%rsp), %ebp                               #
..LN1927:
                                # LOE rbx rsi r12 r13 ebp
..B1.124:                       # Preds ..B1.66 ..B1.170 ..B1.123
..LN1928:
   .loc    1  272  is_stmt 1
        movq      %rbx, %r9                                     #272.5
        movq      %r9, %rcx                                     #
..LN1929:
        jle       ..B1.132      # Prob 10%                      #272.22
..LN1930:
                                # LOE rcx rbx rsi r9 r12 r13 ebp
..B1.125:                       # Preds ..B1.124
..LN1931:
   .loc    1  273  is_stmt 1
        movabsq   $grid_points, %rax                            #273.16
..LN1932:
        movq      %r12, 360(%rsp)                               #273.12
..LN1933:
        movl      %ebp, 104(%rsp)                               #273.12
..LN1934:
        movslq    (%rax), %r10                                  #273.16
..LN1935:
        movl      %r10d, %edx                                   #273.7
..LN1936:
   .loc    1  44  is_stmt 1
        addl      $-3, %edx                                     #44.3
..LN1937:
   .loc    1  277  is_stmt 1
        lea       (%r10,%r10,4), %rdi                           #277.29
..LN1938:
   .loc    1  273  is_stmt 1
        lea       -2(%r10), %r11                                #273.12
..LN1939:
        movq      %r11, 448(%rsp)                               #273.12
        lea       (%r13,%rdi,8), %rax                           #
..LN1940:
        lea       -15(%r10,%r10,4), %r8                         #273.12
..LN1941:
                                # LOE rax rcx rsi rdi r8 r9 r13 edx
..B1.126:                       # Preds ..B1.130 ..B1.125
..LN1942:
        xorl      %r15d, %r15d                                  #273.7
        lea       (,%r8,8), %r14                                #
        xorl      %r11d, %r11d                                  #
..LN1943:
        testl     %edx, %edx                                    #273.39
..LN1944:
        js        ..B1.130      # Prob 3%                       #273.39
..LN1945:
                                # LOE rax rcx rsi rdi r8 r9 r11 r13 r14 r15 edx
..B1.127:                       # Preds ..B1.126
..LN1946:
   .loc    1  277  is_stmt 1
        movabsq   $rhs, %rbp                                    #277.29
..LN1947:
   .loc    1  273  is_stmt 1
        lea       (%rax,%rcx), %r10                             #273.7
        movl      %edx, 424(%rsp)                               #
..LN1948:
   .loc    1  279  is_stmt 1
        lea       (%rcx,%rdi,8), %rbx                           #279.29
        movq      %rax, 440(%rsp)                               #
        lea       (%r13,%rcx), %r12                             #
        movq      %rdi, 432(%rsp)                               #
        movabsq   $lhsp, %rax                                   #
..LN1949:
   .loc    1  277  is_stmt 1
        movsd     1416(%rbp,%r10), %xmm3                        #277.29
        movabsq   $lhsm, %rdi                                   #
..LN1950:
        movsd     1456(%rbp,%r10), %xmm6                        #277.29
..LN1951:
        movsd     1408(%rbp,%r10), %xmm2                        #277.29
..LN1952:
        movsd     1448(%rbp,%r10), %xmm5                        #277.29
..LN1953:
        movsd     1400(%rbp,%r10), %xmm4                        #277.29
..LN1954:
        movsd     1440(%rbp,%r10), %xmm0                        #277.29
        movq      %r9, 416(%rsp)                                #
        movq      %r13, 408(%rsp)                               #
        movq      %rsi, 400(%rsp)                               #
        movabsq   $lhs, %rsi                                    #
        movq      448(%rsp), %rdx                               #
..LN1955:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r11 r12 r14 r15 xmm0 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.128:                       # Preds ..B1.128 ..B1.127
..LN1956:
   .loc    1  278  is_stmt 1
        movaps    %xmm4, %xmm7                                  #278.42
..LN1957:
   .loc    1  277  is_stmt 1
        lea       (%rbx,%r11), %r9                              #277.11
..LN1958:
   .loc    1  278  is_stmt 1
        movsd     1384(%rsi,%r9), %xmm9                         #278.29
..LN1959:
   .loc    1  277  is_stmt 1
        lea       (%r10,%r11), %r13                             #277.11
..LN1960:
   .loc    1  278  is_stmt 1
        mulsd     %xmm9, %xmm7                                  #278.42
..LN1961:
        movaps    %xmm2, %xmm8                                  #278.42
..LN1962:
        mulsd     %xmm9, %xmm8                                  #278.42
..LN1963:
        mulsd     %xmm3, %xmm9                                  #278.42
..LN1964:
   .loc    1  279  is_stmt 1
        movsd     1392(%rsi,%r9), %xmm10                        #279.29
..LN1965:
   .loc    1  285  is_stmt 1
        lea       (%rcx,%r14), %r9                              #285.9
..LN1966:
   .loc    1  277  is_stmt 1
        movsd     1360(%rbp,%r13), %xmm1                        #277.29
..LN1967:
   .loc    1  273  is_stmt 1
        incq      %r15                                          #273.7
..LN1968:
   .loc    1  279  is_stmt 1
        mulsd     %xmm10, %xmm0                                 #279.42
..LN1969:
   .loc    1  278  is_stmt 1
        subsd     %xmm7, %xmm1                                  #278.42
..LN1970:
   .loc    1  279  is_stmt 1
        mulsd     %xmm10, %xmm5                                 #279.42
..LN1971:
        mulsd     %xmm6, %xmm10                                 #279.42
..LN1972:
        subsd     %xmm0, %xmm1                                  #279.42
..LN1973:
   .loc    1  277  is_stmt 1
        movsd     1368(%rbp,%r13), %xmm0                        #277.29
..LN1974:
   .loc    1  273  is_stmt 1
        addq      $-40, %r11                                    #273.7
..LN1975:
   .loc    1  277  is_stmt 1
        movsd     1376(%rbp,%r13), %xmm15                       #277.29
..LN1976:
   .loc    1  278  is_stmt 1
        subsd     %xmm8, %xmm0                                  #278.42
..LN1977:
        subsd     %xmm9, %xmm15                                 #278.42
..LN1978:
   .loc    1  279  is_stmt 1
        subsd     %xmm5, %xmm0                                  #279.42
..LN1979:
        subsd     %xmm10, %xmm15                                #279.42
..LN1980:
   .loc    1  277  is_stmt 1
        movsd     %xmm1, 1360(%rbp,%r13)                        #277.11
..LN1981:
        movsd     %xmm0, 1368(%rbp,%r13)                        #277.11
..LN1982:
        movsd     %xmm15, 1376(%rbp,%r13)                       #277.11
..LN1983:
   .loc    1  285  is_stmt 1
        lea       (%r12,%r14), %r13                             #285.9
..LN1984:
   .loc    1  286  is_stmt 1
        movsd     1504(%rax,%r9), %xmm6                         #286.27
..LN1985:
   .loc    1  273  is_stmt 1
        addq      $-40, %r14                                    #273.42
..LN1986:
   .loc    1  289  is_stmt 1
        movsd     1504(%rdi,%r9), %xmm12                        #289.27
..LN1987:
   .loc    1  273  is_stmt 1
        cmpq      %rdx, %r15                                    #273.7
..LN1988:
   .loc    1  286  is_stmt 1
        mulsd     1544(%rbp,%r13), %xmm6                        #286.41
..LN1989:
   .loc    1  289  is_stmt 1
        mulsd     1552(%rbp,%r13), %xmm12                       #289.41
..LN1990:
   .loc    1  285  is_stmt 1
        movsd     1504(%rbp,%r13), %xmm11                       #285.27
..LN1991:
   .loc    1  288  is_stmt 1
        movsd     1512(%rbp,%r13), %xmm14                       #288.27
..LN1992:
   .loc    1  286  is_stmt 1
        subsd     %xmm6, %xmm11                                 #286.41
..LN1993:
   .loc    1  289  is_stmt 1
        subsd     %xmm12, %xmm14                                #289.41
..LN1994:
   .loc    1  287  is_stmt 1
        movsd     1512(%rax,%r9), %xmm5                         #287.27
..LN1995:
   .loc    1  273  is_stmt 1
        movaps    %xmm3, %xmm6                                  #273.7
..LN1996:
   .loc    1  290  is_stmt 1
        movsd     1512(%rdi,%r9), %xmm13                        #290.27
..LN1997:
   .loc    1  273  is_stmt 1
        movaps    %xmm15, %xmm3                                 #273.7
..LN1998:
   .loc    1  287  is_stmt 1
        mulsd     1584(%rbp,%r13), %xmm5                        #287.41
..LN1999:
   .loc    1  290  is_stmt 1
        mulsd     1592(%rbp,%r13), %xmm13                       #290.41
..LN2000:
   .loc    1  287  is_stmt 1
        subsd     %xmm5, %xmm11                                 #287.41
..LN2001:
   .loc    1  290  is_stmt 1
        subsd     %xmm13, %xmm14                                #290.41
..LN2002:
   .loc    1  285  is_stmt 1
        movsd     %xmm11, 1504(%rbp,%r13)                       #285.9
..LN2003:
   .loc    1  273  is_stmt 1
        movaps    %xmm2, %xmm5                                  #273.7
..LN2004:
   .loc    1  288  is_stmt 1
        movsd     %xmm14, 1512(%rbp,%r13)                       #288.9
..LN2005:
   .loc    1  273  is_stmt 1
        movaps    %xmm0, %xmm2                                  #273.7
..LN2006:
        movaps    %xmm4, %xmm0                                  #273.7
..LN2007:
        movaps    %xmm1, %xmm4                                  #273.7
..LN2008:
        jb        ..B1.128      # Prob 97%                      #273.7
..LN2009:
                                # LOE rax rdx rcx rbx rbp rsi rdi r8 r10 r11 r12 r14 r15 xmm0 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.129:                       # Preds ..B1.128
        movq      440(%rsp), %rax                               #
        movq      432(%rsp), %rdi                               #
        movl      424(%rsp), %edx                               #
        movq      416(%rsp), %r9                                #
        movq      408(%rsp), %r13                               #
        movq      400(%rsp), %rsi                               #
..LN2010:
                                # LOE rax rcx rsi rdi r8 r9 r13 edx
..B1.130:                       # Preds ..B1.126 ..B1.129
..LN2011:
   .loc    1  272  is_stmt 1
        incq      %r9                                           #272.5
..LN2012:
        addq      $1480, %rcx                                   #272.5
..LN2013:
        cmpq      %rsi, %r9                                     #272.5
..LN2014:
        jb        ..B1.126      # Prob 97%                      #272.5
..LN2015:
                                # LOE rax rcx rsi rdi r8 r9 r13 edx
..B1.131:                       # Preds ..B1.130
        movq      360(%rsp), %r12                               #
        xorl      %ebx, %ebx                                    #
        movl      104(%rsp), %ebp                               #
..LN2016:
                                # LOE rbx rsi r12 r13 ebp
..B1.132:                       # Preds ..B1.124 ..B1.131
..LN2017:
   .loc    1  48  is_stmt 1
        movabsq   $nz2, %rax                                    #48.20
..LN2018:
   .loc    1  44  is_stmt 1
        incl      %ebp                                          #44.3
..LN2019:
        addq      $54760, %r13                                  #44.3
..LN2020:
        addq      $10952, %r12                                  #44.3
..LN2021:
   .loc    1  48  is_stmt 1
        cmpl      (%rax), %ebp                                  #48.20
..LN2022:
        jle       ..B1.5        # Prob 97%                      #48.20
..LN2023:
                                # LOE rbx rsi r12 r13 ebp
..B1.133:                       # Preds ..B1.132
        movq      (%rsp), %r12                                  #
..___tag_value_x_solve.14:                                      #
        movq      8(%rsp), %r13                                 #
..___tag_value_x_solve.15:                                      #
        movq      16(%rsp), %r14                                #
..___tag_value_x_solve.16:                                      #
        movq      24(%rsp), %r15                                #
..___tag_value_x_solve.17:                                      #
        movq      32(%rsp), %rbx                                #
..___tag_value_x_solve.18:                                      #
        movq      40(%rsp), %rbp                                #
..___tag_value_x_solve.19:                                      #
..LN2024:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.134:                       # Preds ..B1.3 ..B1.133
..LN2025:
   .loc    1  294  is_stmt 1
        movabsq   $timeron, %rax                                #294.7
..LN2026:
        cmpl      $0, (%rax)                                    #294.7
..LN2027:
        jne       ..B1.157      # Prob 5%                       #294.7
..LN2028:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.135:                       # Preds ..B1.134 ..B1.157
..LN2029:
   .loc    1  299  is_stmt 1
        xorl      %eax, %eax                                    #299.3
..LN2030:
        addq      $488, %rsp                                    #299.3
..___tag_value_x_solve.20:                                      #
..LN2031:
        jmp       ninvr                                         #299.3
..___tag_value_x_solve.21:                                      #
..LN2032:
                                # LOE
..B1.137:                       # Preds ..B1.67
..LN2033:
   .loc    1  118  is_stmt 1
        movaps    %xmm1, %xmm0                                  #118.25
        movq      %r12, %rcx                                    #
..LN2034:
        unpcklpd  %xmm0, %xmm0                                  #118.25
..LN2035:
   .loc    1  116  is_stmt 1
        movl      %r8d, %eax                                    #116.7
..LN2036:
   .loc    1  118  is_stmt 1
        movq      %r13, 408(%rsp)                               #118.25
..LN2037:
        movq      %r12, 360(%rsp)                               #118.25
..LN2038:
        movl      %ebp, 104(%rsp)                               #118.25
..LN2039:
                                # LOE rdx rcx rbx rsi rdi r8 eax xmm0 xmm1
..B1.138:                       # Preds ..B1.150 ..B1.163 ..B1.137
..LN2040:
   .loc    1  116  is_stmt 1
        cmpq      $2, %r8                                       #116.7
..LN2041:
        jl        ..B1.165      # Prob 10%                      #116.7
..LN2042:
                                # LOE rdx rcx rbx rsi rdi r8 eax xmm0 xmm1
..B1.139:                       # Preds ..B1.138
..LN2043:
   .loc    1  120  is_stmt 1
        movabsq   $speed, %r13                                  #120.48
..LN2044:
   .loc    1  116  is_stmt 1
        movl      $1, %ebp                                      #116.7
..LN2045:
        lea       312(%rcx,%r13), %r10                          #116.7
..LN2046:
        andq      $15, %r10                                     #116.7
..LN2047:
        cmovne    %rbp, %r10                                    #116.7
..LN2048:
        lea       2(%r10), %r9                                  #116.7
..LN2049:
        cmpq      %r9, %r8                                      #116.7
..LN2050:
        jl        ..B1.165      # Prob 10%                      #116.7
..LN2051:
                                # LOE rdx rcx rbx rsi rdi r8 r10 r13 eax xmm0 xmm1
..B1.140:                       # Preds ..B1.139
..LN2052:
        movl      %r10d, %r15d                                  #116.7
..LN2053:
        movq      %rbx, %rbp                                    #116.7
..LN2054:
        negl      %r15d                                         #116.7
..LN2055:
        addl      %eax, %r15d                                   #116.7
..LN2056:
        andl      $1, %r15d                                     #116.7
..LN2057:
        negl      %r15d                                         #116.7
..LN2058:
        addl      %eax, %r15d                                   #116.7
..LN2059:
        movslq    %r15d, %r15                                   #116.7
..LN2060:
        testq     %r10, %r10                                    #116.7
..LN2061:
        jbe       ..B1.174      # Prob 10%                      #116.7
..LN2062:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r10 r13 r15 eax xmm0 xmm1
..B1.141:                       # Preds ..B1.140
        movq      %rdi, 336(%rsp)                               #
        movq      %rdx, %r9                                     #
        movq      %rsi, 400(%rsp)                               #
        movabsq   $lhs, %r11                                    #
        movabsq   $lhsm, %r12                                   #
        movabsq   $lhsp, %r14                                   #
..LN2063:
                                # LOE rdx rcx rbp r8 r9 r10 r11 r12 r13 r14 r15 eax xmm0 xmm1
..B1.142:                       # Preds ..B1.142 ..B1.141
..LN2064:
   .loc    1  118  is_stmt 1
        movsd     1528(%r9,%r11), %xmm5                         #118.25
..LN2065:
        lea       (%rcx,%rbp,8), %rdi                           #118.9
..LN2066:
        movsd     296(%r13,%rdi), %xmm4                         #118.48
..LN2067:
        movaps    %xmm5, %xmm2                                  #118.48
..LN2068:
   .loc    1  120  is_stmt 1
        movsd     312(%r13,%rdi), %xmm6                         #120.48
..LN2069:
   .loc    1  116  is_stmt 1
        incq      %rbp                                          #116.7
..LN2070:
   .loc    1  118  is_stmt 1
        mulsd     %xmm1, %xmm4                                  #118.48
..LN2071:
   .loc    1  120  is_stmt 1
        mulsd     %xmm1, %xmm6                                  #120.48
..LN2072:
   .loc    1  118  is_stmt 1
        subsd     %xmm4, %xmm2                                  #118.48
..LN2073:
   .loc    1  123  is_stmt 1
        addsd     %xmm4, %xmm5                                  #123.48
..LN2074:
   .loc    1  120  is_stmt 1
        movsd     1544(%r9,%r11), %xmm7                         #120.25
..LN2075:
        movaps    %xmm7, %xmm3                                  #120.48
..LN2076:
   .loc    1  125  is_stmt 1
        subsd     %xmm6, %xmm7                                  #125.48
..LN2077:
   .loc    1  120  is_stmt 1
        addsd     %xmm6, %xmm3                                  #120.48
..LN2078:
   .loc    1  117  is_stmt 1
        movq      1520(%r9,%r11), %rsi                          #117.25
..LN2079:
   .loc    1  119  is_stmt 1
        movq      1536(%r9,%r11), %rbx                          #119.25
..LN2080:
   .loc    1  121  is_stmt 1
        movq      1552(%r9,%r11), %rdi                          #121.25
..LN2081:
   .loc    1  117  is_stmt 1
        movq      %rsi, 1520(%r9,%r14)                          #117.9
..LN2082:
   .loc    1  118  is_stmt 1
        movsd     %xmm2, 1528(%r9,%r14)                         #118.9
..LN2083:
   .loc    1  119  is_stmt 1
        movq      %rbx, 1536(%r9,%r14)                          #119.9
..LN2084:
   .loc    1  120  is_stmt 1
        movsd     %xmm3, 1544(%r9,%r14)                         #120.9
..LN2085:
   .loc    1  121  is_stmt 1
        movq      %rdi, 1552(%r9,%r14)                          #121.9
..LN2086:
   .loc    1  122  is_stmt 1
        movq      %rsi, 1520(%r9,%r12)                          #122.9
..LN2087:
   .loc    1  123  is_stmt 1
        movsd     %xmm5, 1528(%r9,%r12)                         #123.9
..LN2088:
   .loc    1  124  is_stmt 1
        movq      %rbx, 1536(%r9,%r12)                          #124.9
..LN2089:
   .loc    1  125  is_stmt 1
        movsd     %xmm7, 1544(%r9,%r12)                         #125.9
..LN2090:
   .loc    1  126  is_stmt 1
        movq      %rdi, 1552(%r9,%r12)                          #126.9
..LN2091:
   .loc    1  116  is_stmt 1
        addq      $40, %r9                                      #116.7
..LN2092:
        cmpq      %r10, %rbp                                    #116.7
..LN2093:
        jb        ..B1.142      # Prob 97%                      #116.7
..LN2094:
                                # LOE rdx rcx rbp r8 r9 r10 r11 r12 r13 r14 r15 eax xmm0 xmm1
..B1.143:                       # Preds ..B1.142
        movq      336(%rsp), %rdi                               #
        xorl      %ebx, %ebx                                    #
        movq      400(%rsp), %rsi                               #
..LN2095:
                                # LOE rdx rcx rbx rsi rdi r8 r10 r11 r12 r13 r14 r15 eax xmm0 xmm1
..B1.144:                       # Preds ..B1.174 ..B1.143
        movq      %rsi, 400(%rsp)                               #
        lea       (%r10,%r10,4), %rbp                           #
        lea       (%rdx,%rbp,8), %r9                            #
..LN2096:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 eax xmm0 xmm1
..B1.145:                       # Preds ..B1.145 ..B1.144
..LN2097:
   .loc    1  117  is_stmt 1
        movsd     1520(%r9,%r11), %xmm2                         #117.25
..LN2098:
   .loc    1  118  is_stmt 1
        lea       (%rcx,%r10,8), %rbp                           #118.48
..LN2099:
   .loc    1  117  is_stmt 1
        movq      1560(%r9,%r11), %rsi                          #117.25
..LN2100:
   .loc    1  116  is_stmt 1
        addq      $2, %r10                                      #116.7
..LN2101:
   .loc    1  117  is_stmt 1
        movlpd    %xmm2, 1520(%r9,%r14)                         #117.9
..LN2102:
        movq      %rsi, 1560(%r9,%r14)                          #117.9
..LN2103:
   .loc    1  118  is_stmt 1
        movaps    296(%r13,%rbp), %xmm3                         #118.48
..LN2104:
        mulpd     %xmm0, %xmm3                                  #118.48
..LN2105:
        movsd     1528(%r9,%r11), %xmm4                         #118.25
..LN2106:
        movhpd    1568(%r9,%r11), %xmm4                         #118.25
..LN2107:
        subpd     %xmm3, %xmm4                                  #118.48
..LN2108:
        movlpd    %xmm4, 1528(%r9,%r14)                         #118.9
..LN2109:
        movhpd    %xmm4, 1568(%r9,%r14)                         #118.9
..LN2110:
   .loc    1  119  is_stmt 1
        movsd     1536(%r9,%r11), %xmm5                         #119.25
..LN2111:
        movq      1576(%r9,%r11), %rsi                          #119.25
..LN2112:
        movlpd    %xmm5, 1536(%r9,%r14)                         #119.9
..LN2113:
        movq      %rsi, 1576(%r9,%r14)                          #119.9
..LN2114:
   .loc    1  120  is_stmt 1
        movaps    312(%r13,%rbp), %xmm6                         #120.48
..LN2115:
        mulpd     %xmm0, %xmm6                                  #120.48
..LN2116:
        movsd     1544(%r9,%r11), %xmm7                         #120.25
..LN2117:
        movhpd    1584(%r9,%r11), %xmm7                         #120.25
..LN2118:
        addpd     %xmm6, %xmm7                                  #120.48
..LN2119:
        movlpd    %xmm7, 1544(%r9,%r14)                         #120.9
..LN2120:
        movhpd    %xmm7, 1584(%r9,%r14)                         #120.9
..LN2121:
   .loc    1  121  is_stmt 1
        movsd     1552(%r9,%r11), %xmm8                         #121.25
..LN2122:
        movq      1592(%r9,%r11), %rsi                          #121.25
..LN2123:
        movlpd    %xmm8, 1552(%r9,%r14)                         #121.9
..LN2124:
        movq      %rsi, 1592(%r9,%r14)                          #121.9
..LN2125:
   .loc    1  122  is_stmt 1
        movsd     1520(%r9,%r11), %xmm9                         #122.25
..LN2126:
        movq      1560(%r9,%r11), %rsi                          #122.25
..LN2127:
        movlpd    %xmm9, 1520(%r9,%r12)                         #122.9
..LN2128:
        movq      %rsi, 1560(%r9,%r12)                          #122.9
..LN2129:
   .loc    1  123  is_stmt 1
        movaps    296(%r13,%rbp), %xmm10                        #123.48
..LN2130:
        mulpd     %xmm0, %xmm10                                 #123.48
..LN2131:
        movsd     1528(%r9,%r11), %xmm11                        #123.25
..LN2132:
        movhpd    1568(%r9,%r11), %xmm11                        #123.25
..LN2133:
        addpd     %xmm10, %xmm11                                #123.48
..LN2134:
        movlpd    %xmm11, 1528(%r9,%r12)                        #123.9
..LN2135:
        movhpd    %xmm11, 1568(%r9,%r12)                        #123.9
..LN2136:
   .loc    1  124  is_stmt 1
        movsd     1536(%r9,%r11), %xmm12                        #124.25
..LN2137:
        movq      1576(%r9,%r11), %rsi                          #124.25
..LN2138:
        movlpd    %xmm12, 1536(%r9,%r12)                        #124.9
..LN2139:
        movq      %rsi, 1576(%r9,%r12)                          #124.9
..LN2140:
   .loc    1  125  is_stmt 1
        movaps    312(%r13,%rbp), %xmm13                        #125.48
..LN2141:
        mulpd     %xmm0, %xmm13                                 #125.48
..LN2142:
        movsd     1544(%r9,%r11), %xmm14                        #125.25
..LN2143:
        .byte     144                                           #125.25
..LN2144:
        movhpd    1584(%r9,%r11), %xmm14                        #125.25
..LN2145:
        subpd     %xmm13, %xmm14                                #125.48
..LN2146:
        movlpd    %xmm14, 1544(%r9,%r12)                        #125.9
..LN2147:
        movhpd    %xmm14, 1584(%r9,%r12)                        #125.9
..LN2148:
   .loc    1  126  is_stmt 1
        movsd     1552(%r9,%r11), %xmm15                        #126.25
..LN2149:
        movq      1592(%r9,%r11), %rbp                          #126.25
..LN2150:
        movlpd    %xmm15, 1552(%r9,%r12)                        #126.9
..LN2151:
        movq      %rbp, 1592(%r9,%r12)                          #126.9
..LN2152:
   .loc    1  116  is_stmt 1
        addq      $80, %r9                                      #116.7
..LN2153:
        cmpq      %r15, %r10                                    #116.7
..LN2154:
        jb        ..B1.145      # Prob 97%                      #116.7
..LN2155:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r14 r15 eax xmm0 xmm1
..B1.146:                       # Preds ..B1.145
        movq      400(%rsp), %rsi                               #
..LN2156:
                                # LOE rdx rcx rbx rsi rdi r8 r15 eax xmm0 xmm1
..B1.147:                       # Preds ..B1.146 ..B1.165
..LN2157:
        cmpq      %r8, %r15                                     #116.7
        lea       (%r15,%r15,4), %rbp                           #
..LN2158:
        jae       ..B1.163      # Prob 10%                      #116.7
..LN2159:
                                # LOE rdx rcx rbx rbp rsi rdi r8 r15 eax xmm0 xmm1
..B1.148:                       # Preds ..B1.147
        movq      %rsi, 400(%rsp)                               #
        lea       (%rdx,%rbp,8), %r11                           #
        movabsq   $lhs, %r12                                    #
        movabsq   $lhsm, %r13                                   #
        movabsq   $lhsp, %r10                                   #
        movabsq   $speed, %r9                                   #
..LN2160:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r15 eax xmm0 xmm1
..B1.149:                       # Preds ..B1.149 ..B1.148
..LN2161:
   .loc    1  118  is_stmt 1
        movsd     1528(%r11,%r12), %xmm5                        #118.25
..LN2162:
        lea       (%rcx,%r15,8), %r14                           #118.9
..LN2163:
        movsd     296(%r9,%r14), %xmm4                          #118.48
..LN2164:
        movaps    %xmm5, %xmm2                                  #118.48
..LN2165:
   .loc    1  120  is_stmt 1
        movsd     312(%r9,%r14), %xmm6                          #120.48
..LN2166:
   .loc    1  116  is_stmt 1
        incq      %r15                                          #116.7
..LN2167:
   .loc    1  118  is_stmt 1
        mulsd     %xmm1, %xmm4                                  #118.48
..LN2168:
   .loc    1  120  is_stmt 1
        mulsd     %xmm1, %xmm6                                  #120.48
..LN2169:
   .loc    1  118  is_stmt 1
        subsd     %xmm4, %xmm2                                  #118.48
..LN2170:
   .loc    1  123  is_stmt 1
        addsd     %xmm4, %xmm5                                  #123.48
..LN2171:
   .loc    1  120  is_stmt 1
        movsd     1544(%r11,%r12), %xmm7                        #120.25
..LN2172:
        movaps    %xmm7, %xmm3                                  #120.48
..LN2173:
   .loc    1  125  is_stmt 1
        subsd     %xmm6, %xmm7                                  #125.48
..LN2174:
   .loc    1  120  is_stmt 1
        addsd     %xmm6, %xmm3                                  #120.48
..LN2175:
   .loc    1  117  is_stmt 1
        movq      1520(%r11,%r12), %rsi                         #117.25
..LN2176:
   .loc    1  119  is_stmt 1
        movq      1536(%r11,%r12), %rbp                         #119.25
..LN2177:
   .loc    1  121  is_stmt 1
        movq      1552(%r11,%r12), %r14                         #121.25
..LN2178:
   .loc    1  117  is_stmt 1
        movq      %rsi, 1520(%r11,%r10)                         #117.9
..LN2179:
   .loc    1  118  is_stmt 1
        movsd     %xmm2, 1528(%r11,%r10)                        #118.9
..LN2180:
   .loc    1  119  is_stmt 1
        movq      %rbp, 1536(%r11,%r10)                         #119.9
..LN2181:
   .loc    1  120  is_stmt 1
        movsd     %xmm3, 1544(%r11,%r10)                        #120.9
..LN2182:
   .loc    1  121  is_stmt 1
        movq      %r14, 1552(%r11,%r10)                         #121.9
..LN2183:
   .loc    1  122  is_stmt 1
        movq      %rsi, 1520(%r11,%r13)                         #122.9
..LN2184:
   .loc    1  123  is_stmt 1
        movsd     %xmm5, 1528(%r11,%r13)                        #123.9
..LN2185:
   .loc    1  124  is_stmt 1
        movq      %rbp, 1536(%r11,%r13)                         #124.9
..LN2186:
   .loc    1  125  is_stmt 1
        movsd     %xmm7, 1544(%r11,%r13)                        #125.9
..LN2187:
   .loc    1  126  is_stmt 1
        movq      %r14, 1552(%r11,%r13)                         #126.9
..LN2188:
   .loc    1  116  is_stmt 1
        addq      $40, %r11                                     #116.7
..LN2189:
        cmpq      %r8, %r15                                     #116.7
..LN2190:
        jb        ..B1.149      # Prob 97%                      #116.7
..LN2191:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r11 r12 r13 r15 eax xmm0 xmm1
..B1.150:                       # Preds ..B1.149
..LN2192:
   .loc    1  115  is_stmt 1
        incq      %rdi                                          #115.5
..LN2193:
        addq      $1480, %rdx                                   #115.5
        movq      400(%rsp), %rsi                               #
..LN2194:
        addq      $296, %rcx                                    #115.5
..LN2195:
        cmpq      %rsi, %rdi                                    #115.5
..LN2196:
        jb        ..B1.138      # Prob 97%                      #115.5
..LN2197:
                                # LOE rdx rcx rbx rsi rdi r8 eax xmm0 xmm1
..B1.151:                       # Preds ..B1.150                # Infreq
        movq      408(%rsp), %r13                               #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
        jmp       ..B1.68       # Prob 100%                     #
..LN2198:
                                # LOE rbx rsi r12 r13 ebp
..B1.152:                       # Preds ..B1.9 ..B1.10          # Infreq
..LN2199:
   .loc    1  59  is_stmt 1
        xorl      %ebx, %ebx                                    #59.7
..LN2200:
        jmp       ..B1.22       # Prob 100%                     #59.7
..LN2201:
                                # LOE rdx rcx rbx rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.154:                       # Preds ..B1.27 ..B1.28         # Infreq
..LN2202:
   .loc    1  65  is_stmt 1
        xorl      %ebp, %ebp                                    #65.7
..LN2203:
        jmp       ..B1.40       # Prob 100%                     #65.7
..LN2204:
                                # LOE rdx rcx rbp rdi r8 r9 r10 r12 eax esi r11d r13d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6 xmm7 xmm8 xmm9 xmm10 xmm11 xmm12 xmm13
..B1.156:                       # Preds ..B1.49                 # Infreq
..LN2205:
   .loc    1  90  is_stmt 1
        movq      %rbx, %rax                                    #90.7
..LN2206:
        jmp       ..B1.53       # Prob 100%                     #90.7
..___tag_value_x_solve.28:                                      #
..LN2207:
                                # LOE rax rdx rbx rsi r8 r9 r10 r11 r12 r13 r15 ebp r14d xmm0 xmm1 xmm2 xmm3 xmm4 xmm5 xmm6
..B1.157:                       # Preds ..B1.134                # Infreq
..LN2208:
   .loc    1  294  is_stmt 1
        movl      $6, %edi                                      #294.16
..___tag_value_x_solve.34:                                      #294.16
..LN2209:
        call      timer_stop                                    #294.16
..___tag_value_x_solve.35:                                      #
..LN2210:
        jmp       ..B1.135      # Prob 100%                     #294.16
..___tag_value_x_solve.36:                                      #
..LN2211:
                                # LOE rbx rbp r12 r13 r14 r15
..B1.158:                       # Preds ..B1.116                # Infreq
..LN2212:
   .loc    1  258  is_stmt 1
        movq      %rbx, %r10                                    #258.5
..LN2213:
        jmp       ..B1.120      # Prob 100%                     #258.5
..LN2214:
                                # LOE rax rbx rsi r10 r12 r13 ebp
..B1.159:                       # Preds ..B1.108                # Infreq
..LN2215:
   .loc    1  226  is_stmt 1
        movq      %rbx, %rdx                                    #226.5
..LN2216:
        jmp       ..B1.112      # Prob 100%                     #226.5
..LN2217:
                                # LOE rax rdx rbx rsi r8 r12 r13 ebp
..B1.160:                       # Preds ..B1.92                 # Infreq
..LN2218:
   .loc    1  192  is_stmt 1
        movq      %rbx, %rcx                                    #192.5
..LN2219:
        jmp       ..B1.100      # Prob 100%                     #192.5
..LN2220:
                                # LOE rcx rbx rsi rdi r12 r13 eax ebp r8d
..B1.161:                       # Preds ..B1.84                 # Infreq
..LN2221:
   .loc    1  165  is_stmt 1
        movq      %rbx, %rdx                                    #165.5
..LN2222:
        jmp       ..B1.88       # Prob 100%                     #165.5
..LN2223:
                                # LOE rdx rcx rbx rsi rdi r12 r13 eax ebp
..B1.162:                       # Preds ..B1.68                 # Infreq
..LN2224:
   .loc    1  137  is_stmt 1
        movq      %rbx, %r8                                     #137.5
..LN2225:
        jmp       ..B1.76       # Prob 100%                     #137.5
..LN2226:
                                # LOE rbx rsi rdi r8 r12 r13 eax ebp r10d
..B1.163:                       # Preds ..B1.147                # Infreq
..LN2227:
   .loc    1  115  is_stmt 1
        incq      %rdi                                          #115.5
..LN2228:
        addq      $1480, %rdx                                   #115.5
..LN2229:
        addq      $296, %rcx                                    #115.5
..LN2230:
        cmpq      %rsi, %rdi                                    #115.5
..LN2231:
        jb        ..B1.138      # Prob 97%                      #115.5
..LN2232:
                                # LOE rdx rcx rbx rsi rdi r8 eax xmm0 xmm1
..B1.164:                       # Preds ..B1.163                # Infreq
        movq      408(%rsp), %r13                               #
        movq      360(%rsp), %r12                               #
        movl      104(%rsp), %ebp                               #
        jmp       ..B1.68       # Prob 100%                     #
..LN2233:
                                # LOE rbx rsi r12 r13 ebp
..B1.165:                       # Preds ..B1.138 ..B1.139       # Infreq
..LN2234:
   .loc    1  116  is_stmt 1
        movq      %rbx, %r15                                    #116.7
..LN2235:
        jmp       ..B1.147      # Prob 100%                     #116.7
..LN2236:
                                # LOE rdx rcx rbx rsi rdi r8 r15 eax xmm0 xmm1
..B1.167:                       # Preds ..B1.58                 # Infreq
..LN2237:
   .loc    1  99  is_stmt 1
        movq      %rbx, %r11                                    #99.5
..LN2238:
        jmp       ..B1.62       # Prob 100%                     #99.5
..LN2239:
                                # LOE rax rdx rbx rsi r11 r12 r13 ebp xmm0 xmm1 xmm2 xmm3
..B1.170:                       # Preds ..B1.120                # Infreq
..LN2240:
   .loc    1  58  is_stmt 1
        testq     %rsi, %rsi                                    #58.22
..LN2241:
        jmp       ..B1.124      # Prob 100%                     #58.22
..LN2242:
                                # LOE rbx rsi r12 r13 ebp
..B1.174:                       # Preds ..B1.140                # Infreq
..LN2243:
   .loc    1  66  is_stmt 1
        movabsq   $lhs, %r11                                    #66.9
..LN2244:
        movabsq   $lhsm, %r12                                   #66.9
..LN2245:
        movabsq   $lhsp, %r14                                   #66.9
..LN2246:
        jmp       ..B1.144      # Prob 100%                     #66.9
        .align    16,0x90
..___tag_value_x_solve.42:                                      #
..LN2247:
                                # LOE rdx rcx rbx rsi rdi r8 r10 r11 r12 r13 r14 r15 eax xmm0 xmm1
..LN2248:
# mark_end;
	.type	x_solve,@function
	.size	x_solve,.-x_solve
..LNx_solve.2249:
.LNx_solve:
	.data
# -- End  x_solve
	.section .rodata, "a"
	.align 16
	.align 16
.L_2il0floatpacket.0:
	.long	0x00000000,0x3ff00000,0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.0,@object
	.size	.L_2il0floatpacket.0,16
	.align 8
.L_2il0floatpacket.1:
	.long	0x00000000,0x3ff00000
	.type	.L_2il0floatpacket.1,@object
	.size	.L_2il0floatpacket.1,8
	.data
	.section .note.GNU-stack, ""
# End
