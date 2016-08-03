--- FUNCTION SOURCE (benchmark) id{0,0} ---
() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += i * i;
  }
  return sum;
}
--- END ---
--- Raw source ---
() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += i * i;
  }
  return sum;
}


--- Optimized code ---
optimization_id = 0
source_position = 18
kind = OPTIMIZED_FUNCTION
name = benchmark
stack_slots = 7
compiler = crankshaft
Instructions (size = 577)
0x17ca2a3429c0     0  55             push rbp
0x17ca2a3429c1     1  4889e5         REX.W movq rbp,rsp
0x17ca2a3429c4     4  56             push rsi
0x17ca2a3429c5     5  57             push rdi
0x17ca2a3429c6     6  4883ec18       REX.W subq rsp,0x18
                  ;;; <@0,#0> -------------------- B0 --------------------
                  ;;; <@4,#3> prologue
                  ;;; Prologue begin
                  ;;; Prologue end
                  ;;; <@8,#5> -------------------- B1 --------------------
                  ;;; <@10,#6> context
0x17ca2a3429ca    10  488b45f8       REX.W movq rax,[rbp-0x8]    ;; debug: position 18
                  ;;; <@11,#6> gap
0x17ca2a3429ce    14  488945d8       REX.W movq [rbp-0x28],rax
                  ;;; <@14,#10> -------------------- B2 --------------------
                  ;;; <@15,#10> gap
0x17ca2a3429d2    18  488bf0         REX.W movq rsi,rax
                  ;;; <@16,#12> stack-check
0x17ca2a3429d5    21  493ba5880a0000 REX.W cmpq rsp,[r13+0xa88]
0x17ca2a3429dc    28  7305           jnc 35  (0x17ca2a3429e3)
0x17ca2a3429de    30  e8fda1ffff     call StackCheck  (0x17ca2a33cbe0)    ;; code: BUILTIN
                  ;;; <@18,#12> lazy-bailout
                  ;;; <@21,#18> goto
0x17ca2a3429e3    35  e95a000000     jmp 130  (0x17ca2a342a42)    ;; debug: position 40
                  ;;; <@22,#22> -------------------- B3 (OSR entry) --------------------
0x17ca2a3429e8    40  4883ec08       REX.W subq rsp,0x8
                  ;;; <@34,#29> context
0x17ca2a3429ec    44  488b45f8       REX.W movq rax,[rbp-0x8]
                  ;;; <@35,#29> gap
0x17ca2a3429f0    48  488b5de8       REX.W movq rbx,[rbp-0x18]
                  ;;; <@36,#78> double-untag
0x17ca2a3429f4    52  f6c301         testb rbx,0x1
0x17ca2a3429f7    55  7415           jz 78  (0x17ca2a342a0e)
0x17ca2a3429f9    57  4d8b55f8       REX.W movq r10,[r13-0x8]
0x17ca2a3429fd    61  4c3953ff       REX.W cmpq [rbx-0x1],r10
0x17ca2a342a01    65  c5fb105307     vmovsd xmm2,[rbx+0x7]
0x17ca2a342a06    70  0f85a6010000   jnz 498  (0x17ca2a342bb2)
0x17ca2a342a0c    76  eb10           jmp 94  (0x17ca2a342a1e)
0x17ca2a342a0e    78  4c8bd3         REX.W movq r10,rbx
0x17ca2a342a11    81  49c1ea20       REX.W shrq r10, 32
0x17ca2a342a15    85  c5e957d2       vxorpd xmm2,xmm2,xmm2
0x17ca2a342a19    89  c4c16b2ad2     vcvtlsi2sd xmm2,xmm2,r10
                  ;;; <@37,#78> gap
0x17ca2a342a1e    94  488b55e0       REX.W movq rdx,[rbp-0x20]
                  ;;; <@38,#79> tagged-to-i
0x17ca2a342a22    98  f6c201         testb rdx,0x1
0x17ca2a342a25   101  0f85ac000000   jnz 279  (0x17ca2a342ad7)
0x17ca2a342a2b   107  48c1ea20       REX.W shrq rdx, 32
                  ;;; <@40,#31> gap
0x17ca2a342a2f   111  488bd8         REX.W movq rbx,rax
0x17ca2a342a32   114  488bc2         REX.W movq rax,rdx
0x17ca2a342a35   117  488b5510       REX.W movq rdx,[rbp+0x10]
0x17ca2a342a39   121  c5f928ca       vmovapd xmm1,xmm2
                  ;;; <@41,#31> goto
0x17ca2a342a3d   125  e90e000000     jmp 144  (0x17ca2a342a50)
                  ;;; <@42,#19> -------------------- B4 --------------------
                  ;;; <@44,#77> constant-d
0x17ca2a342a42   130  c5f157c9       vxorpd xmm1,xmm1,xmm1
                  ;;; <@46,#21> gap
0x17ca2a342a46   134  488b5510       REX.W movq rdx,[rbp+0x10]
0x17ca2a342a4a   138  488b5dd8       REX.W movq rbx,[rbp-0x28]
0x17ca2a342a4e   142  33c0           xorl rax,rax
                  ;;; <@48,#40> -------------------- B5 (unreachable/replaced) --------------------
                  ;;; <@52,#43> -------------------- B6 (loop header) --------------------
                  ;;; <@55,#47> compare-numeric-and-branch
0x17ca2a342a50   144  3d40420f00     cmp rax,0xf4240         ;; debug: position 56
                                                             ;; debug: position 58
0x17ca2a342a55   149  0f8d3a000000   jge 213  (0x17ca2a342a95)
                  ;;; <@56,#48> -------------------- B7 (unreachable/replaced) --------------------
                  ;;; <@60,#54> -------------------- B8 --------------------
                  ;;; <@62,#56> stack-check
0x17ca2a342a5b   155  493ba5880a0000 REX.W cmpq rsp,[r13+0xa88]    ;; debug: position 40
0x17ca2a342a62   162  0f82b8000000   jc 352  (0x17ca2a342b20)
                  ;;; <@63,#56> gap
0x17ca2a342a68   168  488bc8         REX.W movq rcx,rax
                  ;;; <@64,#60> mul-i
0x17ca2a342a6b   171  448bd1         movl r10,rcx            ;; debug: position 89
0x17ca2a342a6e   174  0fafc8         imull rcx,rax
0x17ca2a342a71   177  0f8040010000   jo 503  (0x17ca2a342bb7)
0x17ca2a342a77   183  85c9           testl rcx,rcx
0x17ca2a342a79   185  7509           jnz 196  (0x17ca2a342a84)
0x17ca2a342a7b   187  440bd0         orl r10,rax
0x17ca2a342a7e   190  0f8838010000   js 508  (0x17ca2a342bbc)
                  ;;; <@66,#81> int32-to-double
0x17ca2a342a84   196  c5e957d2       vxorpd xmm2,xmm2,xmm2
0x17ca2a342a88   200  c5eb2ad1       vcvtlsi2sd xmm2,xmm2,rcx
                  ;;; <@68,#62> add-d
0x17ca2a342a8c   204  c5eb58c9       vaddsd xmm1,xmm2,xmm1    ;; debug: position 85
                  ;;; <@70,#67> add-i
0x17ca2a342a90   208  83c001         addl rax,0x1            ;; debug: position 70
                  ;;; <@73,#70> goto
0x17ca2a342a93   211  ebbb           jmp 144  (0x17ca2a342a50)    ;; debug: position 40
                  ;;; <@74,#51> -------------------- B9 (unreachable/replaced) --------------------
                  ;;; <@78,#71> -------------------- B10 --------------------
                  ;;; <@80,#80> number-tag-d
0x17ca2a342a95   213  498b9d480f0000 REX.W movq rbx,[r13+0xf48]    ;; debug: position 107
                                                             ;; debug: position 100
0x17ca2a342a9c   220  488bc3         REX.W movq rax,rbx
0x17ca2a342a9f   223  4883c010       REX.W addq rax,0x10
0x17ca2a342aa3   227  0f82bc000000   jc 421  (0x17ca2a342b65)
0x17ca2a342aa9   233  493b85500f0000 REX.W cmpq rax,[r13+0xf50]
0x17ca2a342ab0   240  0f87af000000   ja 421  (0x17ca2a342b65)
0x17ca2a342ab6   246  498985480f0000 REX.W movq [r13+0xf48],rax
0x17ca2a342abd   253  48ffc3         REX.W incq rbx
0x17ca2a342ac0   256  4d8b55f8       REX.W movq r10,[r13-0x8]
0x17ca2a342ac4   260  4c8953ff       REX.W movq [rbx-0x1],r10
0x17ca2a342ac8   264  c5fb114b07     vmovsd [rbx+0x7],xmm1
                  ;;; <@81,#80> gap
0x17ca2a342acd   269  488bc3         REX.W movq rax,rbx
                  ;;; <@82,#74> return
0x17ca2a342ad0   272  488be5         REX.W movq rsp,rbp
0x17ca2a342ad3   275  5d             pop rbp
0x17ca2a342ad4   276  c20800         ret 0x8
                  ;;; <@38,#79> -------------------- Deferred tagged-to-i --------------------
0x17ca2a342ad7   279  4d8b55f8       REX.W movq r10,[r13-0x8]    ;; debug: position 40
0x17ca2a342adb   283  4c3952ff       REX.W cmpq [rdx-0x1],r10
0x17ca2a342adf   287  0f85dc000000   jnz 513  (0x17ca2a342bc1)
0x17ca2a342ae5   293  c5fb104207     vmovsd xmm0,[rdx+0x7]
0x17ca2a342aea   298  c5fb2cd0       vcvttsd2si rdx,xmm0
0x17ca2a342aee   302  c5f157c9       vxorpd xmm1,xmm1,xmm1
0x17ca2a342af2   306  c5f32aca       vcvtlsi2sd xmm1,xmm1,rdx
0x17ca2a342af6   310  c5f92ec1       vucomisd xmm0,xmm1
0x17ca2a342afa   314  0f85c6000000   jnz 518  (0x17ca2a342bc6)
0x17ca2a342b00   320  0f8ac5000000   jpe 523  (0x17ca2a342bcb)
0x17ca2a342b06   326  85d2           testl rdx,rdx
0x17ca2a342b08   328  0f8521ffffff   jnz 111  (0x17ca2a342a2f)
0x17ca2a342b0e   334  c5f950d0       vmovmskpd rdx,xmm0
0x17ca2a342b12   338  83e201         andl rdx,0x1
0x17ca2a342b15   341  0f85b5000000   jnz 528  (0x17ca2a342bd0)
0x17ca2a342b1b   347  e90fffffff     jmp 111  (0x17ca2a342a2f)
                  ;;; <@62,#56> -------------------- Deferred stack-check --------------------
0x17ca2a342b20   352  50             push rax
0x17ca2a342b21   353  51             push rcx
0x17ca2a342b22   354  52             push rdx
0x17ca2a342b23   355  53             push rbx
0x17ca2a342b24   356  56             push rsi
0x17ca2a342b25   357  57             push rdi
0x17ca2a342b26   358  4150           push r8
0x17ca2a342b28   360  4151           push r9
0x17ca2a342b2a   362  4153           push r11
0x17ca2a342b2c   364  4154           push r12
0x17ca2a342b2e   366  4156           push r14
0x17ca2a342b30   368  4157           push r15
0x17ca2a342b32   370  488d6424e0     REX.W leaq rsp,[rsp-0x20]
0x17ca2a342b37   375  488b75f8       REX.W movq rsi,[rbp-0x8]
0x17ca2a342b3b   379  33c0           xorl rax,rax
0x17ca2a342b3d   381  498d9da8f6ddfe REX.W leaq rbx,[r13-0x1220958]
0x17ca2a342b44   388  e8974dfcff     call 0x17ca2a3078e0     ;; code: STUB, CEntryStub, minor: 5
0x17ca2a342b49   393  488d642420     REX.W leaq rsp,[rsp+0x20]
0x17ca2a342b4e   398  415f           pop r15
0x17ca2a342b50   400  415e           pop r14
0x17ca2a342b52   402  415c           pop r12
0x17ca2a342b54   404  415b           pop r11
0x17ca2a342b56   406  4159           pop r9
0x17ca2a342b58   408  4158           pop r8
0x17ca2a342b5a   410  5f             pop rdi
0x17ca2a342b5b   411  5e             pop rsi
0x17ca2a342b5c   412  5b             pop rbx
0x17ca2a342b5d   413  5a             pop rdx
0x17ca2a342b5e   414  59             pop rcx
0x17ca2a342b5f   415  58             pop rax
0x17ca2a342b60   416  e903ffffff     jmp 168  (0x17ca2a342a68)
                  ;;; <@80,#80> -------------------- Deferred number-tag-d --------------------
0x17ca2a342b65   421  33db           xorl rbx,rbx            ;; debug: position 100
0x17ca2a342b67   423  50             push rax
0x17ca2a342b68   424  51             push rcx
0x17ca2a342b69   425  52             push rdx
0x17ca2a342b6a   426  53             push rbx
0x17ca2a342b6b   427  56             push rsi
0x17ca2a342b6c   428  57             push rdi
0x17ca2a342b6d   429  4150           push r8
0x17ca2a342b6f   431  4151           push r9
0x17ca2a342b71   433  4153           push r11
0x17ca2a342b73   435  4154           push r12
0x17ca2a342b75   437  4156           push r14
0x17ca2a342b77   439  4157           push r15
0x17ca2a342b79   441  488d6424e0     REX.W leaq rsp,[rsp-0x20]
0x17ca2a342b7e   446  488b75f8       REX.W movq rsi,[rbp-0x8]
0x17ca2a342b82   450  33c0           xorl rax,rax
0x17ca2a342b84   452  498d9d58e7dffe REX.W leaq rbx,[r13-0x12018a8]
0x17ca2a342b8b   459  e8504dfcff     call 0x17ca2a3078e0     ;; code: STUB, CEntryStub, minor: 5
0x17ca2a342b90   464  4c8bd0         REX.W movq r10,rax
0x17ca2a342b93   467  488d642420     REX.W leaq rsp,[rsp+0x20]
0x17ca2a342b98   472  415f           pop r15
0x17ca2a342b9a   474  415e           pop r14
0x17ca2a342b9c   476  415c           pop r12
0x17ca2a342b9e   478  415b           pop r11
0x17ca2a342ba0   480  4159           pop r9
0x17ca2a342ba2   482  4158           pop r8
0x17ca2a342ba4   484  5f             pop rdi
0x17ca2a342ba5   485  5e             pop rsi
0x17ca2a342ba6   486  5b             pop rbx
0x17ca2a342ba7   487  5a             pop rdx
0x17ca2a342ba8   488  59             pop rcx
0x17ca2a342ba9   489  58             pop rax
0x17ca2a342baa   490  498bda         REX.W movq rbx,r10
0x17ca2a342bad   493  e916ffffff     jmp 264  (0x17ca2a342ac8)
                  ;;; -------------------- Jump table --------------------
0x17ca2a342bb2   498  e85d34ccff     call 0x17ca2a006014     ;; debug: position 11264
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 2
0x17ca2a342bb7   503  e86c34ccff     call 0x17ca2a006028     ;; debug: position 36352
                                                             ;; debug: deopt reason 'overflow'
                                                             ;; deoptimization bailout 4
0x17ca2a342bbc   508  e86734ccff     call 0x17ca2a006028     ;; debug: position 36352
                                                             ;; debug: deopt reason 'minus zero'
                                                             ;; deoptimization bailout 4
0x17ca2a342bc1   513  e86c34ccff     call 0x17ca2a006032     ;; debug: position 11264
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 5
0x17ca2a342bc6   518  e86734ccff     call 0x17ca2a006032     ;; debug: position 11264
                                                             ;; debug: deopt reason 'lost precision'
                                                             ;; deoptimization bailout 5
0x17ca2a342bcb   523  e86234ccff     call 0x17ca2a006032     ;; debug: position 11264
                                                             ;; debug: deopt reason 'NaN'
                                                             ;; deoptimization bailout 5
0x17ca2a342bd0   528  e85d34ccff     call 0x17ca2a006032     ;; debug: position 11264
                                                             ;; debug: deopt reason 'minus zero'
                                                             ;; deoptimization bailout 5
0x17ca2a342bd5   533  0f1f00         nop
                  ;;; Safepoint table.

Inlined functions (count = 0)

Deoptimization Input Data (deopt points = 6)
 index  ast id    argc     pc
     0       4       0     35
     1      26       0     -1
     2      24       0     -1
     3      28       0    168
     4      28       0     -1
     5      24       0     -1

Safepoints (size = 41)
0x17ca2a3429e3    35  1000000 (sp -> fp)       0
0x17ca2a342b49   393  0000000 | rdx | rbx (sp -> fp)       3
0x17ca2a342b90   464  0000000 | rbx (sp -> fp)  <none>

RelocInfo (size = 551)
0x17ca2a3429ca  position  (18)
0x17ca2a3429ca  comment  (;;; <@0,#0> -------------------- B0 --------------------)
0x17ca2a3429ca  comment  (;;; <@4,#3> prologue)
0x17ca2a3429ca  comment  (;;; Prologue begin)
0x17ca2a3429ca  comment  (;;; Prologue end)
0x17ca2a3429ca  comment  (;;; <@8,#5> -------------------- B1 --------------------)
0x17ca2a3429ca  comment  (;;; <@10,#6> context)
0x17ca2a3429ce  comment  (;;; <@11,#6> gap)
0x17ca2a3429d2  comment  (;;; <@14,#10> -------------------- B2 --------------------)
0x17ca2a3429d2  comment  (;;; <@15,#10> gap)
0x17ca2a3429d5  comment  (;;; <@16,#12> stack-check)
0x17ca2a3429df  code target (BUILTIN)  (0x17ca2a33cbe0)
0x17ca2a3429e3  comment  (;;; <@18,#12> lazy-bailout)
0x17ca2a3429e3  position  (40)
0x17ca2a3429e3  comment  (;;; <@21,#18> goto)
0x17ca2a3429e8  comment  (;;; <@22,#22> -------------------- B3 (OSR entry) --------------------)
0x17ca2a3429ec  comment  (;;; <@34,#29> context)
0x17ca2a3429f0  comment  (;;; <@35,#29> gap)
0x17ca2a3429f4  comment  (;;; <@36,#78> double-untag)
0x17ca2a342a1e  comment  (;;; <@37,#78> gap)
0x17ca2a342a22  comment  (;;; <@38,#79> tagged-to-i)
0x17ca2a342a2f  comment  (;;; <@40,#31> gap)
0x17ca2a342a3d  comment  (;;; <@41,#31> goto)
0x17ca2a342a42  comment  (;;; <@42,#19> -------------------- B4 --------------------)
0x17ca2a342a42  comment  (;;; <@44,#77> constant-d)
0x17ca2a342a46  comment  (;;; <@46,#21> gap)
0x17ca2a342a50  comment  (;;; <@48,#40> -------------------- B5 (unreachable/replaced) --------------------)
0x17ca2a342a50  position  (56)
0x17ca2a342a50  comment  (;;; <@52,#43> -------------------- B6 (loop header) --------------------)
0x17ca2a342a50  position  (58)
0x17ca2a342a50  comment  (;;; <@55,#47> compare-numeric-and-branch)
0x17ca2a342a5b  comment  (;;; <@56,#48> -------------------- B7 (unreachable/replaced) --------------------)
0x17ca2a342a5b  position  (40)
0x17ca2a342a5b  comment  (;;; <@60,#54> -------------------- B8 --------------------)
0x17ca2a342a5b  comment  (;;; <@62,#56> stack-check)
0x17ca2a342a68  comment  (;;; <@63,#56> gap)
0x17ca2a342a6b  comment  (;;; <@64,#60> mul-i)
0x17ca2a342a6b  position  (89)
0x17ca2a342a84  comment  (;;; <@66,#81> int32-to-double)
0x17ca2a342a8c  comment  (;;; <@68,#62> add-d)
0x17ca2a342a8c  position  (85)
0x17ca2a342a90  comment  (;;; <@70,#67> add-i)
0x17ca2a342a90  position  (70)
0x17ca2a342a93  position  (40)
0x17ca2a342a93  comment  (;;; <@73,#70> goto)
0x17ca2a342a95  comment  (;;; <@74,#51> -------------------- B9 (unreachable/replaced) --------------------)
0x17ca2a342a95  position  (107)
0x17ca2a342a95  comment  (;;; <@78,#71> -------------------- B10 --------------------)
0x17ca2a342a95  comment  (;;; <@80,#80> number-tag-d)
0x17ca2a342a95  position  (100)
0x17ca2a342acd  comment  (;;; <@81,#80> gap)
0x17ca2a342ad0  comment  (;;; <@82,#74> return)
0x17ca2a342ad7  position  (40)
0x17ca2a342ad7  comment  (;;; <@38,#79> -------------------- Deferred tagged-to-i --------------------)
0x17ca2a342b20  comment  (;;; <@62,#56> -------------------- Deferred stack-check --------------------)
0x17ca2a342b45  code target (STUB)  (0x17ca2a3078e0)
0x17ca2a342b65  position  (100)
0x17ca2a342b65  comment  (;;; <@80,#80> -------------------- Deferred number-tag-d --------------------)
0x17ca2a342b8c  code target (STUB)  (0x17ca2a3078e0)
0x17ca2a342bb2  comment  (;;; -------------------- Jump table --------------------)
0x17ca2a342bb2  position  (11264)
0x17ca2a342bb2  deopt reason  (not a heap number)
0x17ca2a342bb3  runtime entry  (deoptimization bailout 2)
0x17ca2a342bb7  position  (36352)
0x17ca2a342bb7  deopt reason  (overflow)
0x17ca2a342bb8  runtime entry  (deoptimization bailout 4)
0x17ca2a342bbc  position  (36352)
0x17ca2a342bbc  deopt reason  (minus zero)
0x17ca2a342bbd  runtime entry  (deoptimization bailout 4)
0x17ca2a342bc1  position  (11264)
0x17ca2a342bc1  deopt reason  (not a heap number)
0x17ca2a342bc2  runtime entry  (deoptimization bailout 5)
0x17ca2a342bc6  position  (11264)
0x17ca2a342bc6  deopt reason  (lost precision)
0x17ca2a342bc7  runtime entry  (deoptimization bailout 5)
0x17ca2a342bcb  position  (11264)
0x17ca2a342bcb  deopt reason  (NaN)
0x17ca2a342bcc  runtime entry  (deoptimization bailout 5)
0x17ca2a342bd0  position  (11264)
0x17ca2a342bd0  deopt reason  (minus zero)
0x17ca2a342bd1  runtime entry  (deoptimization bailout 5)
0x17ca2a342bd8  comment  (;;; Safepoint table.)

--- End code ---
[deoptimizing (DEOPT eager): begin 0x3264862d9de1 <JS Function benchmark (SharedFunctionInfo 0x3264862d9a41)> (opt #0) @4, FP to SP delta: 40, caller sp: 0x7fff5fbff2a8]
            ;;; deoptimize at 0_71: overflow
  reading input frame benchmark => node=28, args=1, height=3; inputs:
      0: 0x3264862d9de1 ; [fp - 16] 0x3264862d9de1 <JS Function benchmark (SharedFunctionInfo 0x3264862d9a41)>
      1: 0x2dde18b05341 ; rdx 0x2dde18b05341 <JS Global Object>
      2: 0x3264862b0791 ; rbx 0x3264862b0791 <FixedArray[173]>
      3: 3.317118e+13 ; xmm1 (bool)
      4: 46341 ; rax 
  translating frame benchmark => node=28, height=16
    0x7fff5fbff2a0: [top + 48] <- 0x2dde18b05341 ;  0x2dde18b05341 <JS Global Object>  (input #1)
    0x7fff5fbff298: [top + 40] <- 0x17ca2a3421a0 ;  caller's pc
    0x7fff5fbff290: [top + 32] <- 0x7fff5fbff2d8 ;  caller's fp
    0x7fff5fbff288: [top + 24] <- 0x3264862b0791 ;  context    0x3264862b0791 <FixedArray[173]>  (input #2)
    0x7fff5fbff280: [top + 16] <- 0x3264862d9de1 ;  function    0x3264862d9de1 <JS Function benchmark (SharedFunctionInfo 0x3264862d9a41)>  (input #0)
    0x7fff5fbff278: [top + 8] <- 0x3264862044f1 ;  0x3264862044f1 <Odd Oddball>  (input #3)
    0x7fff5fbff270: [top + 0] <- 0xb50500000000 ;  46341  (input #4)
[deoptimizing (eager): end 0x3264862d9de1 <JS Function benchmark (SharedFunctionInfo 0x3264862d9a41)> @4 => node=28, pc=0x17ca2a34240b, caller sp=0x7fff5fbff2a8, state=NO_REGISTERS, took 0.051 ms]
0x2dde18b50541 <Number: 3.31712e+13>
--- FUNCTION SOURCE (benchmark) id{1,0} ---
() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += i * i;
  }
  return sum;
}
--- END ---
--- Raw source ---
() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += i * i;
  }
  return sum;
}


--- Optimized code ---
optimization_id = 1
source_position = 18
kind = OPTIMIZED_FUNCTION
name = benchmark
stack_slots = 7
compiler = crankshaft
Instructions (size = 541)
0x17ca2a342c80     0  55             push rbp
0x17ca2a342c81     1  4889e5         REX.W movq rbp,rsp
0x17ca2a342c84     4  56             push rsi
0x17ca2a342c85     5  57             push rdi
0x17ca2a342c86     6  4883ec18       REX.W subq rsp,0x18
                  ;;; <@0,#0> -------------------- B0 --------------------
                  ;;; <@4,#3> prologue
                  ;;; Prologue begin
                  ;;; Prologue end
                  ;;; <@8,#5> -------------------- B1 --------------------
                  ;;; <@10,#6> context
0x17ca2a342c8a    10  488b45f8       REX.W movq rax,[rbp-0x8]    ;; debug: position 18
                  ;;; <@11,#6> gap
0x17ca2a342c8e    14  488945d8       REX.W movq [rbp-0x28],rax
                  ;;; <@14,#10> -------------------- B2 --------------------
                  ;;; <@15,#10> gap
0x17ca2a342c92    18  488bf0         REX.W movq rsi,rax
                  ;;; <@16,#12> stack-check
0x17ca2a342c95    21  493ba5880a0000 REX.W cmpq rsp,[r13+0xa88]
0x17ca2a342c9c    28  7305           jnc 35  (0x17ca2a342ca3)
0x17ca2a342c9e    30  e83d9fffff     call StackCheck  (0x17ca2a33cbe0)    ;; code: BUILTIN
                  ;;; <@18,#12> lazy-bailout
                  ;;; <@21,#18> goto
0x17ca2a342ca3    35  e95a000000     jmp 130  (0x17ca2a342d02)    ;; debug: position 40
                  ;;; <@22,#22> -------------------- B3 (OSR entry) --------------------
0x17ca2a342ca8    40  4883ec08       REX.W subq rsp,0x8
                  ;;; <@34,#29> context
0x17ca2a342cac    44  488b45f8       REX.W movq rax,[rbp-0x8]
                  ;;; <@35,#29> gap
0x17ca2a342cb0    48  488b5de8       REX.W movq rbx,[rbp-0x18]
                  ;;; <@36,#78> double-untag
0x17ca2a342cb4    52  f6c301         testb rbx,0x1
0x17ca2a342cb7    55  7415           jz 78  (0x17ca2a342cce)
0x17ca2a342cb9    57  4d8b55f8       REX.W movq r10,[r13-0x8]
0x17ca2a342cbd    61  4c3953ff       REX.W cmpq [rbx-0x1],r10
0x17ca2a342cc1    65  c5fb105307     vmovsd xmm2,[rbx+0x7]
0x17ca2a342cc6    70  0f858e010000   jnz 474  (0x17ca2a342e5a)
0x17ca2a342ccc    76  eb10           jmp 94  (0x17ca2a342cde)
0x17ca2a342cce    78  4c8bd3         REX.W movq r10,rbx
0x17ca2a342cd1    81  49c1ea20       REX.W shrq r10, 32
0x17ca2a342cd5    85  c5e957d2       vxorpd xmm2,xmm2,xmm2
0x17ca2a342cd9    89  c4c16b2ad2     vcvtlsi2sd xmm2,xmm2,r10
                  ;;; <@37,#78> gap
0x17ca2a342cde    94  488b55e0       REX.W movq rdx,[rbp-0x20]
                  ;;; <@38,#79> tagged-to-i
0x17ca2a342ce2    98  f6c201         testb rdx,0x1
0x17ca2a342ce5   101  0f8594000000   jnz 255  (0x17ca2a342d7f)
0x17ca2a342ceb   107  48c1ea20       REX.W shrq rdx, 32
                  ;;; <@40,#31> gap
0x17ca2a342cef   111  488bd8         REX.W movq rbx,rax
0x17ca2a342cf2   114  488bc2         REX.W movq rax,rdx
0x17ca2a342cf5   117  488b5510       REX.W movq rdx,[rbp+0x10]
0x17ca2a342cf9   121  c5f928ca       vmovapd xmm1,xmm2
                  ;;; <@41,#31> goto
0x17ca2a342cfd   125  e90e000000     jmp 144  (0x17ca2a342d10)
                  ;;; <@42,#19> -------------------- B4 --------------------
                  ;;; <@44,#77> constant-d
0x17ca2a342d02   130  c5f157c9       vxorpd xmm1,xmm1,xmm1
                  ;;; <@46,#21> gap
0x17ca2a342d06   134  488b5510       REX.W movq rdx,[rbp+0x10]
0x17ca2a342d0a   138  488b5dd8       REX.W movq rbx,[rbp-0x28]
0x17ca2a342d0e   142  33c0           xorl rax,rax
                  ;;; <@48,#40> -------------------- B5 (unreachable/replaced) --------------------
                  ;;; <@52,#43> -------------------- B6 (loop header) --------------------
                  ;;; <@55,#47> compare-numeric-and-branch
0x17ca2a342d10   144  3d40420f00     cmp rax,0xf4240         ;; debug: position 56
                                                             ;; debug: position 58
0x17ca2a342d15   149  0f8d22000000   jge 189  (0x17ca2a342d3d)
                  ;;; <@56,#48> -------------------- B7 (unreachable/replaced) --------------------
                  ;;; <@60,#54> -------------------- B8 --------------------
                  ;;; <@62,#56> stack-check
0x17ca2a342d1b   155  493ba5880a0000 REX.W cmpq rsp,[r13+0xa88]    ;; debug: position 40
0x17ca2a342d22   162  0f82a0000000   jc 328  (0x17ca2a342dc8)
                  ;;; <@64,#81> int32-to-double
0x17ca2a342d28   168  c5e957d2       vxorpd xmm2,xmm2,xmm2    ;; debug: position 91
0x17ca2a342d2c   172  c5eb2ad0       vcvtlsi2sd xmm2,xmm2,rax
                  ;;; <@66,#60> mul-d
0x17ca2a342d30   176  c5eb59d2       vmulsd xmm2,xmm2,xmm2    ;; debug: position 89
                  ;;; <@68,#62> add-d
0x17ca2a342d34   180  c5eb58c9       vaddsd xmm1,xmm2,xmm1    ;; debug: position 85
                  ;;; <@70,#67> add-i
0x17ca2a342d38   184  83c001         addl rax,0x1            ;; debug: position 70
                  ;;; <@73,#70> goto
0x17ca2a342d3b   187  ebd3           jmp 144  (0x17ca2a342d10)    ;; debug: position 40
                  ;;; <@74,#51> -------------------- B9 (unreachable/replaced) --------------------
                  ;;; <@78,#71> -------------------- B10 --------------------
                  ;;; <@80,#80> number-tag-d
0x17ca2a342d3d   189  498b9d480f0000 REX.W movq rbx,[r13+0xf48]    ;; debug: position 107
                                                             ;; debug: position 100
0x17ca2a342d44   196  488bc3         REX.W movq rax,rbx
0x17ca2a342d47   199  4883c010       REX.W addq rax,0x10
0x17ca2a342d4b   203  0f82bc000000   jc 397  (0x17ca2a342e0d)
0x17ca2a342d51   209  493b85500f0000 REX.W cmpq rax,[r13+0xf50]
0x17ca2a342d58   216  0f87af000000   ja 397  (0x17ca2a342e0d)
0x17ca2a342d5e   222  498985480f0000 REX.W movq [r13+0xf48],rax
0x17ca2a342d65   229  48ffc3         REX.W incq rbx
0x17ca2a342d68   232  4d8b55f8       REX.W movq r10,[r13-0x8]
0x17ca2a342d6c   236  4c8953ff       REX.W movq [rbx-0x1],r10
0x17ca2a342d70   240  c5fb114b07     vmovsd [rbx+0x7],xmm1
                  ;;; <@81,#80> gap
0x17ca2a342d75   245  488bc3         REX.W movq rax,rbx
                  ;;; <@82,#74> return
0x17ca2a342d78   248  488be5         REX.W movq rsp,rbp
0x17ca2a342d7b   251  5d             pop rbp
0x17ca2a342d7c   252  c20800         ret 0x8
                  ;;; <@38,#79> -------------------- Deferred tagged-to-i --------------------
0x17ca2a342d7f   255  4d8b55f8       REX.W movq r10,[r13-0x8]    ;; debug: position 40
0x17ca2a342d83   259  4c3952ff       REX.W cmpq [rdx-0x1],r10
0x17ca2a342d87   263  0f85d2000000   jnz 479  (0x17ca2a342e5f)
0x17ca2a342d8d   269  c5fb104207     vmovsd xmm0,[rdx+0x7]
0x17ca2a342d92   274  c5fb2cd0       vcvttsd2si rdx,xmm0
0x17ca2a342d96   278  c5f157c9       vxorpd xmm1,xmm1,xmm1
0x17ca2a342d9a   282  c5f32aca       vcvtlsi2sd xmm1,xmm1,rdx
0x17ca2a342d9e   286  c5f92ec1       vucomisd xmm0,xmm1
0x17ca2a342da2   290  0f85bc000000   jnz 484  (0x17ca2a342e64)
0x17ca2a342da8   296  0f8abb000000   jpe 489  (0x17ca2a342e69)
0x17ca2a342dae   302  85d2           testl rdx,rdx
0x17ca2a342db0   304  0f8539ffffff   jnz 111  (0x17ca2a342cef)
0x17ca2a342db6   310  c5f950d0       vmovmskpd rdx,xmm0
0x17ca2a342dba   314  83e201         andl rdx,0x1
0x17ca2a342dbd   317  0f85ab000000   jnz 494  (0x17ca2a342e6e)
0x17ca2a342dc3   323  e927ffffff     jmp 111  (0x17ca2a342cef)
                  ;;; <@62,#56> -------------------- Deferred stack-check --------------------
0x17ca2a342dc8   328  50             push rax
0x17ca2a342dc9   329  51             push rcx
0x17ca2a342dca   330  52             push rdx
0x17ca2a342dcb   331  53             push rbx
0x17ca2a342dcc   332  56             push rsi
0x17ca2a342dcd   333  57             push rdi
0x17ca2a342dce   334  4150           push r8
0x17ca2a342dd0   336  4151           push r9
0x17ca2a342dd2   338  4153           push r11
0x17ca2a342dd4   340  4154           push r12
0x17ca2a342dd6   342  4156           push r14
0x17ca2a342dd8   344  4157           push r15
0x17ca2a342dda   346  488d6424e0     REX.W leaq rsp,[rsp-0x20]
0x17ca2a342ddf   351  488b75f8       REX.W movq rsi,[rbp-0x8]
0x17ca2a342de3   355  33c0           xorl rax,rax
0x17ca2a342de5   357  498d9da8f6ddfe REX.W leaq rbx,[r13-0x1220958]
0x17ca2a342dec   364  e8ef4afcff     call 0x17ca2a3078e0     ;; code: STUB, CEntryStub, minor: 5
0x17ca2a342df1   369  488d642420     REX.W leaq rsp,[rsp+0x20]
0x17ca2a342df6   374  415f           pop r15
0x17ca2a342df8   376  415e           pop r14
0x17ca2a342dfa   378  415c           pop r12
0x17ca2a342dfc   380  415b           pop r11
0x17ca2a342dfe   382  4159           pop r9
0x17ca2a342e00   384  4158           pop r8
0x17ca2a342e02   386  5f             pop rdi
0x17ca2a342e03   387  5e             pop rsi
0x17ca2a342e04   388  5b             pop rbx
0x17ca2a342e05   389  5a             pop rdx
0x17ca2a342e06   390  59             pop rcx
0x17ca2a342e07   391  58             pop rax
0x17ca2a342e08   392  e91bffffff     jmp 168  (0x17ca2a342d28)
                  ;;; <@80,#80> -------------------- Deferred number-tag-d --------------------
0x17ca2a342e0d   397  33db           xorl rbx,rbx            ;; debug: position 100
0x17ca2a342e0f   399  50             push rax
0x17ca2a342e10   400  51             push rcx
0x17ca2a342e11   401  52             push rdx
0x17ca2a342e12   402  53             push rbx
0x17ca2a342e13   403  56             push rsi
0x17ca2a342e14   404  57             push rdi
0x17ca2a342e15   405  4150           push r8
0x17ca2a342e17   407  4151           push r9
0x17ca2a342e19   409  4153           push r11
0x17ca2a342e1b   411  4154           push r12
0x17ca2a342e1d   413  4156           push r14
0x17ca2a342e1f   415  4157           push r15
0x17ca2a342e21   417  488d6424e0     REX.W leaq rsp,[rsp-0x20]
0x17ca2a342e26   422  488b75f8       REX.W movq rsi,[rbp-0x8]
0x17ca2a342e2a   426  33c0           xorl rax,rax
0x17ca2a342e2c   428  498d9d58e7dffe REX.W leaq rbx,[r13-0x12018a8]
0x17ca2a342e33   435  e8a84afcff     call 0x17ca2a3078e0     ;; code: STUB, CEntryStub, minor: 5
0x17ca2a342e38   440  4c8bd0         REX.W movq r10,rax
0x17ca2a342e3b   443  488d642420     REX.W leaq rsp,[rsp+0x20]
0x17ca2a342e40   448  415f           pop r15
0x17ca2a342e42   450  415e           pop r14
0x17ca2a342e44   452  415c           pop r12
0x17ca2a342e46   454  415b           pop r11
0x17ca2a342e48   456  4159           pop r9
0x17ca2a342e4a   458  4158           pop r8
0x17ca2a342e4c   460  5f             pop rdi
0x17ca2a342e4d   461  5e             pop rsi
0x17ca2a342e4e   462  5b             pop rbx
0x17ca2a342e4f   463  5a             pop rdx
0x17ca2a342e50   464  59             pop rcx
0x17ca2a342e51   465  58             pop rax
0x17ca2a342e52   466  498bda         REX.W movq rbx,r10
0x17ca2a342e55   469  e916ffffff     jmp 240  (0x17ca2a342d70)
                  ;;; -------------------- Jump table --------------------
0x17ca2a342e5a   474  e8b531ccff     call 0x17ca2a006014     ;; debug: position 11264
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 2
0x17ca2a342e5f   479  e8c431ccff     call 0x17ca2a006028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 4
0x17ca2a342e64   484  e8bf31ccff     call 0x17ca2a006028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'lost precision'
                                                             ;; deoptimization bailout 4
0x17ca2a342e69   489  e8ba31ccff     call 0x17ca2a006028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'NaN'
                                                             ;; deoptimization bailout 4
0x17ca2a342e6e   494  e8b531ccff     call 0x17ca2a006028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'minus zero'
                                                             ;; deoptimization bailout 4
0x17ca2a342e73   499  90             nop
                  ;;; Safepoint table.

Inlined functions (count = 0)

Deoptimization Input Data (deopt points = 5)
 index  ast id    argc     pc
     0       4       0     35
     1      26       0     -1
     2      24       0     -1
     3      28       0    168
     4      24       0     -1

Safepoints (size = 41)
0x17ca2a342ca3    35  1000000 (sp -> fp)       0
0x17ca2a342df1   369  0000000 | rdx | rbx (sp -> fp)       3
0x17ca2a342e38   440  0000000 | rbx (sp -> fp)  <none>

RelocInfo (size = 523)
0x17ca2a342c8a  position  (18)
0x17ca2a342c8a  comment  (;;; <@0,#0> -------------------- B0 --------------------)
0x17ca2a342c8a  comment  (;;; <@4,#3> prologue)
0x17ca2a342c8a  comment  (;;; Prologue begin)
0x17ca2a342c8a  comment  (;;; Prologue end)
0x17ca2a342c8a  comment  (;;; <@8,#5> -------------------- B1 --------------------)
0x17ca2a342c8a  comment  (;;; <@10,#6> context)
0x17ca2a342c8e  comment  (;;; <@11,#6> gap)
0x17ca2a342c92  comment  (;;; <@14,#10> -------------------- B2 --------------------)
0x17ca2a342c92  comment  (;;; <@15,#10> gap)
0x17ca2a342c95  comment  (;;; <@16,#12> stack-check)
0x17ca2a342c9f  code target (BUILTIN)  (0x17ca2a33cbe0)
0x17ca2a342ca3  comment  (;;; <@18,#12> lazy-bailout)
0x17ca2a342ca3  position  (40)
0x17ca2a342ca3  comment  (;;; <@21,#18> goto)
0x17ca2a342ca8  comment  (;;; <@22,#22> -------------------- B3 (OSR entry) --------------------)
0x17ca2a342cac  comment  (;;; <@34,#29> context)
0x17ca2a342cb0  comment  (;;; <@35,#29> gap)
0x17ca2a342cb4  comment  (;;; <@36,#78> double-untag)
0x17ca2a342cde  comment  (;;; <@37,#78> gap)
0x17ca2a342ce2  comment  (;;; <@38,#79> tagged-to-i)
0x17ca2a342cef  comment  (;;; <@40,#31> gap)
0x17ca2a342cfd  comment  (;;; <@41,#31> goto)
0x17ca2a342d02  comment  (;;; <@42,#19> -------------------- B4 --------------------)
0x17ca2a342d02  comment  (;;; <@44,#77> constant-d)
0x17ca2a342d06  comment  (;;; <@46,#21> gap)
0x17ca2a342d10  comment  (;;; <@48,#40> -------------------- B5 (unreachable/replaced) --------------------)
0x17ca2a342d10  position  (56)
0x17ca2a342d10  comment  (;;; <@52,#43> -------------------- B6 (loop header) --------------------)
0x17ca2a342d10  position  (58)
0x17ca2a342d10  comment  (;;; <@55,#47> compare-numeric-and-branch)
0x17ca2a342d1b  comment  (;;; <@56,#48> -------------------- B7 (unreachable/replaced) --------------------)
0x17ca2a342d1b  position  (40)
0x17ca2a342d1b  comment  (;;; <@60,#54> -------------------- B8 --------------------)
0x17ca2a342d1b  comment  (;;; <@62,#56> stack-check)
0x17ca2a342d28  comment  (;;; <@64,#81> int32-to-double)
0x17ca2a342d28  position  (91)
0x17ca2a342d30  comment  (;;; <@66,#60> mul-d)
0x17ca2a342d30  position  (89)
0x17ca2a342d34  comment  (;;; <@68,#62> add-d)
0x17ca2a342d34  position  (85)
0x17ca2a342d38  comment  (;;; <@70,#67> add-i)
0x17ca2a342d38  position  (70)
0x17ca2a342d3b  position  (40)
0x17ca2a342d3b  comment  (;;; <@73,#70> goto)
0x17ca2a342d3d  comment  (;;; <@74,#51> -------------------- B9 (unreachable/replaced) --------------------)
0x17ca2a342d3d  position  (107)
0x17ca2a342d3d  comment  (;;; <@78,#71> -------------------- B10 --------------------)
0x17ca2a342d3d  comment  (;;; <@80,#80> number-tag-d)
0x17ca2a342d3d  position  (100)
0x17ca2a342d75  comment  (;;; <@81,#80> gap)
0x17ca2a342d78  comment  (;;; <@82,#74> return)
0x17ca2a342d7f  position  (40)
0x17ca2a342d7f  comment  (;;; <@38,#79> -------------------- Deferred tagged-to-i --------------------)
0x17ca2a342dc8  comment  (;;; <@62,#56> -------------------- Deferred stack-check --------------------)
0x17ca2a342ded  code target (STUB)  (0x17ca2a3078e0)
0x17ca2a342e0d  position  (100)
0x17ca2a342e0d  comment  (;;; <@80,#80> -------------------- Deferred number-tag-d --------------------)
0x17ca2a342e34  code target (STUB)  (0x17ca2a3078e0)
0x17ca2a342e5a  comment  (;;; -------------------- Jump table --------------------)
0x17ca2a342e5a  position  (11264)
0x17ca2a342e5a  deopt reason  (not a heap number)
0x17ca2a342e5b  runtime entry  (deoptimization bailout 2)
0x17ca2a342e5f  position  (11264)
0x17ca2a342e5f  deopt reason  (not a heap number)
0x17ca2a342e60  runtime entry  (deoptimization bailout 4)
0x17ca2a342e64  position  (11264)
0x17ca2a342e64  deopt reason  (lost precision)
0x17ca2a342e65  runtime entry  (deoptimization bailout 4)
0x17ca2a342e69  position  (11264)
0x17ca2a342e69  deopt reason  (NaN)
0x17ca2a342e6a  runtime entry  (deoptimization bailout 4)
0x17ca2a342e6e  position  (11264)
0x17ca2a342e6e  deopt reason  (minus zero)
0x17ca2a342e6f  runtime entry  (deoptimization bailout 4)
0x17ca2a342e74  comment  (;;; Safepoint table.)

--- End code ---
