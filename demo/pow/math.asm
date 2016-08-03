--- FUNCTION SOURCE (pow) id{0,0} ---
(k,l){
return %_MathPow((%_ToNumber(k)),(%_ToNumber(l)));
}
--- END ---
--- Raw source ---
(k,l){
return %_MathPow((%_ToNumber(k)),(%_ToNumber(l)));
}


--- Optimized code ---
optimization_id = 0
source_position = 470
kind = OPTIMIZED_FUNCTION
name = pow
stack_slots = 7
compiler = crankshaft
Instructions (size = 360)
0x20a317c42aa0     0  55             push rbp
0x20a317c42aa1     1  4889e5         REX.W movq rbp,rsp
0x20a317c42aa4     4  56             push rsi
0x20a317c42aa5     5  57             push rdi
0x20a317c42aa6     6  4883ec18       REX.W subq rsp,0x18
                  ;;; <@0,#0> -------------------- B0 --------------------
                  ;;; <@8,#5> prologue
                  ;;; Prologue begin
                  ;;; Prologue end
                  ;;; <@12,#7> -------------------- B1 --------------------
                  ;;; <@14,#8> context
0x20a317c42aaa    10  488b45f8       REX.W movq rax,[rbp-0x8]    ;; debug: position 470
                  ;;; <@15,#8> gap
0x20a317c42aae    14  488945e8       REX.W movq [rbp-0x18],rax
                  ;;; <@18,#12> -------------------- B2 --------------------
                  ;;; <@19,#12> gap
0x20a317c42ab2    18  488bf0         REX.W movq rsi,rax
                  ;;; <@20,#14> stack-check
0x20a317c42ab5    21  493ba5880a0000 REX.W cmpq rsp,[r13+0xa88]
0x20a317c42abc    28  7305           jnc 35  (0x20a317c42ac3)
0x20a317c42abe    30  e81da1ffff     call StackCheck  (0x20a317c3cbe0)    ;; code: BUILTIN
                  ;;; <@22,#14> lazy-bailout
                  ;;; <@23,#14> gap
0x20a317c42ac3    35  488b75e8       REX.W movq rsi,[rbp-0x18]
0x20a317c42ac7    39  488b4518       REX.W movq rax,[rbp+0x18]
                  ;;; <@24,#17> call-with-descriptor
0x20a317c42acb    43  0f1f440000     nop
0x20a317c42ad0    48  e8eb09feff     call 0x20a317c234c0     ;; debug: position 495
                                                             ;; code: STUB, ToNumberStub, minor: 0
                  ;;; <@25,#17> gap
0x20a317c42ad5    53  488945e0       REX.W movq [rbp-0x20],rax
0x20a317c42ad9    57  488bd8         REX.W movq rbx,rax
                  ;;; <@26,#18> lazy-bailout
                  ;;; <@27,#18> gap
0x20a317c42adc    60  488b75e8       REX.W movq rsi,[rbp-0x18]
0x20a317c42ae0    64  488b4510       REX.W movq rax,[rbp+0x10]
                  ;;; <@28,#20> call-with-descriptor
0x20a317c42ae4    68  0f1f440000     nop
0x20a317c42ae9    73  e8d209feff     call 0x20a317c234c0     ;; debug: position 511
                                                             ;; code: STUB, ToNumberStub, minor: 0
                  ;;; <@29,#20> gap
0x20a317c42aee    78  488945d8       REX.W movq [rbp-0x28],rax
                  ;;; <@30,#21> lazy-bailout
                  ;;; <@31,#21> gap
0x20a317c42af2    82  488b5de0       REX.W movq rbx,[rbp-0x20]
                  ;;; <@32,#26> double-untag
0x20a317c42af6    86  f6c301         testb rbx,0x1           ;; debug: position 484
0x20a317c42af9    89  7415           jz 112  (0x20a317c42b10)
0x20a317c42afb    91  4d8b55f8       REX.W movq r10,[r13-0x8]
0x20a317c42aff    95  4c3953ff       REX.W cmpq [rbx-0x1],r10
0x20a317c42b03    99  c5fb105307     vmovsd xmm2,[rbx+0x7]
0x20a317c42b08   104  0f85b9000000   jnz 295  (0x20a317c42bc7)
0x20a317c42b0e   110  eb10           jmp 128  (0x20a317c42b20)
0x20a317c42b10   112  4c8bd3         REX.W movq r10,rbx
0x20a317c42b13   115  49c1ea20       REX.W shrq r10, 32
0x20a317c42b17   119  c5e957d2       vxorpd xmm2,xmm2,xmm2
0x20a317c42b1b   123  c4c16b2ad2     vcvtlsi2sd xmm2,xmm2,r10
                  ;;; <@33,#26> gap
0x20a317c42b20   128  488bd0         REX.W movq rdx,rax
                  ;;; <@34,#22> power
0x20a317c42b23   131  f6c201         testb rdx,0x1
0x20a317c42b26   134  740e           jz 150  (0x20a317c42b36)
0x20a317c42b28   136  488b4aff       REX.W movq rcx,[rdx-0x1]
0x20a317c42b2c   140  80790b81       cmpb [rcx+0xb],0x81
0x20a317c42b30   144  0f8596000000   jnz 300  (0x20a317c42bcc)
0x20a317c42b36   150  e8e5fdffff     call 0x20a317c42920     ;; code: STUB, MathPowStub, minor: 2
                  ;;; <@36,#22> lazy-bailout
                  ;;; <@38,#27> number-tag-d
0x20a317c42b3b   155  498b9d480f0000 REX.W movq rbx,[r13+0xf48]    ;; debug: position 477
0x20a317c42b42   162  488bc3         REX.W movq rax,rbx
0x20a317c42b45   165  4883c010       REX.W addq rax,0x10
0x20a317c42b49   169  0f822e000000   jc 221  (0x20a317c42b7d)
0x20a317c42b4f   175  493b85500f0000 REX.W cmpq rax,[r13+0xf50]
0x20a317c42b56   182  0f8721000000   ja 221  (0x20a317c42b7d)
0x20a317c42b5c   188  498985480f0000 REX.W movq [r13+0xf48],rax
0x20a317c42b63   195  48ffc3         REX.W incq rbx
0x20a317c42b66   198  4d8b55f8       REX.W movq r10,[r13-0x8]
0x20a317c42b6a   202  4c8953ff       REX.W movq [rbx-0x1],r10
0x20a317c42b6e   206  c5fb115b07     vmovsd [rbx+0x7],xmm3
                  ;;; <@39,#27> gap
0x20a317c42b73   211  488bc3         REX.W movq rax,rbx
                  ;;; <@40,#24> return
0x20a317c42b76   214  488be5         REX.W movq rsp,rbp
0x20a317c42b79   217  5d             pop rbp
0x20a317c42b7a   218  c21800         ret 0x18
                  ;;; <@38,#27> -------------------- Deferred number-tag-d --------------------
0x20a317c42b7d   221  33db           xorl rbx,rbx
0x20a317c42b7f   223  50             push rax
0x20a317c42b80   224  51             push rcx
0x20a317c42b81   225  52             push rdx
0x20a317c42b82   226  53             push rbx
0x20a317c42b83   227  56             push rsi
0x20a317c42b84   228  57             push rdi
0x20a317c42b85   229  4150           push r8
0x20a317c42b87   231  4151           push r9
0x20a317c42b89   233  4153           push r11
0x20a317c42b8b   235  4154           push r12
0x20a317c42b8d   237  4156           push r14
0x20a317c42b8f   239  4157           push r15
0x20a317c42b91   241  488d6424e0     REX.W leaq rsp,[rsp-0x20]
0x20a317c42b96   246  488b75f8       REX.W movq rsi,[rbp-0x8]
0x20a317c42b9a   250  33c0           xorl rax,rax
0x20a317c42b9c   252  498d9d58e7dffe REX.W leaq rbx,[r13-0x12018a8]
0x20a317c42ba3   259  e8384dfcff     call 0x20a317c078e0     ;; code: STUB, CEntryStub, minor: 5
0x20a317c42ba8   264  4c8bd0         REX.W movq r10,rax
0x20a317c42bab   267  488d642420     REX.W leaq rsp,[rsp+0x20]
0x20a317c42bb0   272  415f           pop r15
0x20a317c42bb2   274  415e           pop r14
0x20a317c42bb4   276  415c           pop r12
0x20a317c42bb6   278  415b           pop r11
0x20a317c42bb8   280  4159           pop r9
0x20a317c42bba   282  4158           pop r8
0x20a317c42bbc   284  5f             pop rdi
0x20a317c42bbd   285  5e             pop rsi
0x20a317c42bbe   286  5b             pop rbx
0x20a317c42bbf   287  5a             pop rdx
0x20a317c42bc0   288  59             pop rcx
0x20a317c42bc1   289  58             pop rax
0x20a317c42bc2   290  498bda         REX.W movq rbx,r10
0x20a317c42bc5   293  eba7           jmp 206  (0x20a317c42b6e)
                  ;;; -------------------- Jump table --------------------
0x20a317c42bc7   295  e85234ccff     call 0x20a31790601e     ;; debug: position 7168
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 3
0x20a317c42bcc   300  e85734ccff     call 0x20a317906028     ;; debug: position 7168
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 4
0x20a317c42bd1   305  0f1f00         nop
                  ;;; Safepoint table.

Inlined functions (count = 0)

Deoptimization Input Data (deopt points = 6)
 index  ast id    argc     pc
     0       4       0     35
     1       8       0     60
     2      14       0     82
     3      14       0     -1
     4      14       0     -1
     5      14       0    155

Safepoints (size = 52)
0x20a317c42ac3    35  0010000 (sp -> fp)       0
0x20a317c42ad5    53  0010000 (sp -> fp)       1
0x20a317c42aee    78  0110000 (sp -> fp)       2
0x20a317c42ba8   264  0000000 | rbx (sp -> fp)  <none>

RelocInfo (size = 335)
0x20a317c42aaa  position  (470)
0x20a317c42aaa  comment  (;;; <@0,#0> -------------------- B0 --------------------)
0x20a317c42aaa  comment  (;;; <@8,#5> prologue)
0x20a317c42aaa  comment  (;;; Prologue begin)
0x20a317c42aaa  comment  (;;; Prologue end)
0x20a317c42aaa  comment  (;;; <@12,#7> -------------------- B1 --------------------)
0x20a317c42aaa  comment  (;;; <@14,#8> context)
0x20a317c42aae  comment  (;;; <@15,#8> gap)
0x20a317c42ab2  comment  (;;; <@18,#12> -------------------- B2 --------------------)
0x20a317c42ab2  comment  (;;; <@19,#12> gap)
0x20a317c42ab5  comment  (;;; <@20,#14> stack-check)
0x20a317c42abf  code target (BUILTIN)  (0x20a317c3cbe0)
0x20a317c42ac3  comment  (;;; <@22,#14> lazy-bailout)
0x20a317c42ac3  comment  (;;; <@23,#14> gap)
0x20a317c42acb  comment  (;;; <@24,#17> call-with-descriptor)
0x20a317c42ad0  position  (495)
0x20a317c42ad1  code target (STUB)  (0x20a317c234c0)
0x20a317c42ad5  comment  (;;; <@25,#17> gap)
0x20a317c42adc  comment  (;;; <@26,#18> lazy-bailout)
0x20a317c42adc  comment  (;;; <@27,#18> gap)
0x20a317c42ae4  comment  (;;; <@28,#20> call-with-descriptor)
0x20a317c42ae9  position  (511)
0x20a317c42aea  code target (STUB)  (0x20a317c234c0)
0x20a317c42aee  comment  (;;; <@29,#20> gap)
0x20a317c42af2  comment  (;;; <@30,#21> lazy-bailout)
0x20a317c42af2  comment  (;;; <@31,#21> gap)
0x20a317c42af6  comment  (;;; <@32,#26> double-untag)
0x20a317c42af6  position  (484)
0x20a317c42b20  comment  (;;; <@33,#26> gap)
0x20a317c42b23  comment  (;;; <@34,#22> power)
0x20a317c42b37  code target (STUB)  (0x20a317c42920)
0x20a317c42b3b  comment  (;;; <@36,#22> lazy-bailout)
0x20a317c42b3b  comment  (;;; <@38,#27> number-tag-d)
0x20a317c42b3b  position  (477)
0x20a317c42b73  comment  (;;; <@39,#27> gap)
0x20a317c42b76  comment  (;;; <@40,#24> return)
0x20a317c42b7d  comment  (;;; <@38,#27> -------------------- Deferred number-tag-d --------------------)
0x20a317c42ba4  code target (STUB)  (0x20a317c078e0)
0x20a317c42bc7  comment  (;;; -------------------- Jump table --------------------)
0x20a317c42bc7  position  (7168)
0x20a317c42bc7  deopt reason  (not a heap number)
0x20a317c42bc8  runtime entry  (deoptimization bailout 3)
0x20a317c42bcc  position  (7168)
0x20a317c42bcc  deopt reason  (not a heap number)
0x20a317c42bcd  runtime entry  (deoptimization bailout 4)
0x20a317c42bd4  comment  (;;; Safepoint table.)

--- End code ---
--- FUNCTION SOURCE (benchmark) id{1,0} ---
() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += Math.pow(i, 2);
  }
  return sum;
}
--- END ---
--- Raw source ---
() {
  var sum = 0;
  for (var i = 0; i < 1000000; i++) {
    sum += Math.pow(i, 2);
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
0x20a317c42ec0     0  55             push rbp
0x20a317c42ec1     1  4889e5         REX.W movq rbp,rsp
0x20a317c42ec4     4  56             push rsi
0x20a317c42ec5     5  57             push rdi
0x20a317c42ec6     6  4883ec18       REX.W subq rsp,0x18
                  ;;; <@0,#0> -------------------- B0 --------------------
                  ;;; <@4,#3> prologue
                  ;;; Prologue begin
                  ;;; Prologue end
                  ;;; <@8,#5> -------------------- B1 --------------------
                  ;;; <@10,#6> context
0x20a317c42eca    10  488b45f8       REX.W movq rax,[rbp-0x8]    ;; debug: position 18
                  ;;; <@11,#6> gap
0x20a317c42ece    14  488945d8       REX.W movq [rbp-0x28],rax
                  ;;; <@14,#10> -------------------- B2 --------------------
                  ;;; <@15,#10> gap
0x20a317c42ed2    18  488bf0         REX.W movq rsi,rax
                  ;;; <@16,#12> stack-check
0x20a317c42ed5    21  493ba5880a0000 REX.W cmpq rsp,[r13+0xa88]
0x20a317c42edc    28  7305           jnc 35  (0x20a317c42ee3)
0x20a317c42ede    30  e8fd9cffff     call StackCheck  (0x20a317c3cbe0)    ;; code: BUILTIN
                  ;;; <@18,#12> lazy-bailout
                  ;;; <@21,#18> goto
0x20a317c42ee3    35  e95a000000     jmp 130  (0x20a317c42f42)    ;; debug: position 40
                  ;;; <@22,#22> -------------------- B3 (OSR entry) --------------------
0x20a317c42ee8    40  4883ec08       REX.W subq rsp,0x8
                  ;;; <@34,#29> context
0x20a317c42eec    44  488b45f8       REX.W movq rax,[rbp-0x8]
                  ;;; <@35,#29> gap
0x20a317c42ef0    48  488b5de8       REX.W movq rbx,[rbp-0x18]
                  ;;; <@36,#81> double-untag
0x20a317c42ef4    52  f6c301         testb rbx,0x1
0x20a317c42ef7    55  7415           jz 78  (0x20a317c42f0e)
0x20a317c42ef9    57  4d8b55f8       REX.W movq r10,[r13-0x8]
0x20a317c42efd    61  4c3953ff       REX.W cmpq [rbx-0x1],r10
0x20a317c42f01    65  c5fb105307     vmovsd xmm2,[rbx+0x7]
0x20a317c42f06    70  0f858e010000   jnz 474  (0x20a317c4309a)
0x20a317c42f0c    76  eb10           jmp 94  (0x20a317c42f1e)
0x20a317c42f0e    78  4c8bd3         REX.W movq r10,rbx
0x20a317c42f11    81  49c1ea20       REX.W shrq r10, 32
0x20a317c42f15    85  c5e957d2       vxorpd xmm2,xmm2,xmm2
0x20a317c42f19    89  c4c16b2ad2     vcvtlsi2sd xmm2,xmm2,r10
                  ;;; <@37,#81> gap
0x20a317c42f1e    94  488b55e0       REX.W movq rdx,[rbp-0x20]
                  ;;; <@38,#82> tagged-to-i
0x20a317c42f22    98  f6c201         testb rdx,0x1
0x20a317c42f25   101  0f8594000000   jnz 255  (0x20a317c42fbf)
0x20a317c42f2b   107  48c1ea20       REX.W shrq rdx, 32
                  ;;; <@40,#31> gap
0x20a317c42f2f   111  488bd8         REX.W movq rbx,rax
0x20a317c42f32   114  488bc2         REX.W movq rax,rdx
0x20a317c42f35   117  488b5510       REX.W movq rdx,[rbp+0x10]
0x20a317c42f39   121  c5f928ca       vmovapd xmm1,xmm2
                  ;;; <@41,#31> goto
0x20a317c42f3d   125  e90e000000     jmp 144  (0x20a317c42f50)
                  ;;; <@42,#19> -------------------- B4 --------------------
                  ;;; <@44,#80> constant-d
0x20a317c42f42   130  c5f157c9       vxorpd xmm1,xmm1,xmm1
                  ;;; <@46,#21> gap
0x20a317c42f46   134  488b5510       REX.W movq rdx,[rbp+0x10]
0x20a317c42f4a   138  488b5dd8       REX.W movq rbx,[rbp-0x28]
0x20a317c42f4e   142  33c0           xorl rax,rax
                  ;;; <@48,#40> -------------------- B5 --------------------
                  ;;; <@50,#59> check-maps
                  ;;; <@54,#43> -------------------- B6 (loop header) --------------------
                  ;;; <@57,#47> compare-numeric-and-branch
0x20a317c42f50   144  3d40420f00     cmp rax,0xf4240         ;; debug: position 56
                                                             ;; debug: position 58
0x20a317c42f55   149  0f8d22000000   jge 189  (0x20a317c42f7d)
                  ;;; <@58,#48> -------------------- B7 (unreachable/replaced) --------------------
                  ;;; <@62,#54> -------------------- B8 --------------------
                  ;;; <@64,#56> stack-check
0x20a317c42f5b   155  493ba5880a0000 REX.W cmpq rsp,[r13+0xa88]    ;; debug: position 40
0x20a317c42f62   162  0f82a0000000   jc 328  (0x20a317c43008)
                  ;;; <@66,#84> int32-to-double
0x20a317c42f68   168  c5e957d2       vxorpd xmm2,xmm2,xmm2    ;; debug: position 92
0x20a317c42f6c   172  c5eb2ad0       vcvtlsi2sd xmm2,xmm2,rax
                  ;;; <@68,#63> mul-d
0x20a317c42f70   176  c5eb59d2       vmulsd xmm2,xmm2,xmm2
                  ;;; <@70,#65> add-d
0x20a317c42f74   180  c5eb58c9       vaddsd xmm1,xmm2,xmm1    ;; debug: position 85
                  ;;; <@72,#70> add-i
0x20a317c42f78   184  83c001         addl rax,0x1            ;; debug: position 70
                  ;;; <@75,#73> goto
0x20a317c42f7b   187  ebd3           jmp 144  (0x20a317c42f50)    ;; debug: position 40
                  ;;; <@76,#51> -------------------- B9 (unreachable/replaced) --------------------
                  ;;; <@80,#74> -------------------- B10 --------------------
                  ;;; <@82,#83> number-tag-d
0x20a317c42f7d   189  498b9d480f0000 REX.W movq rbx,[r13+0xf48]    ;; debug: position 116
                                                             ;; debug: position 109
0x20a317c42f84   196  488bc3         REX.W movq rax,rbx
0x20a317c42f87   199  4883c010       REX.W addq rax,0x10
0x20a317c42f8b   203  0f82bc000000   jc 397  (0x20a317c4304d)
0x20a317c42f91   209  493b85500f0000 REX.W cmpq rax,[r13+0xf50]
0x20a317c42f98   216  0f87af000000   ja 397  (0x20a317c4304d)
0x20a317c42f9e   222  498985480f0000 REX.W movq [r13+0xf48],rax
0x20a317c42fa5   229  48ffc3         REX.W incq rbx
0x20a317c42fa8   232  4d8b55f8       REX.W movq r10,[r13-0x8]
0x20a317c42fac   236  4c8953ff       REX.W movq [rbx-0x1],r10
0x20a317c42fb0   240  c5fb114b07     vmovsd [rbx+0x7],xmm1
                  ;;; <@83,#83> gap
0x20a317c42fb5   245  488bc3         REX.W movq rax,rbx
                  ;;; <@84,#77> return
0x20a317c42fb8   248  488be5         REX.W movq rsp,rbp
0x20a317c42fbb   251  5d             pop rbp
0x20a317c42fbc   252  c20800         ret 0x8
                  ;;; <@38,#82> -------------------- Deferred tagged-to-i --------------------
0x20a317c42fbf   255  4d8b55f8       REX.W movq r10,[r13-0x8]    ;; debug: position 40
0x20a317c42fc3   259  4c3952ff       REX.W cmpq [rdx-0x1],r10
0x20a317c42fc7   263  0f85d2000000   jnz 479  (0x20a317c4309f)
0x20a317c42fcd   269  c5fb104207     vmovsd xmm0,[rdx+0x7]
0x20a317c42fd2   274  c5fb2cd0       vcvttsd2si rdx,xmm0
0x20a317c42fd6   278  c5f157c9       vxorpd xmm1,xmm1,xmm1
0x20a317c42fda   282  c5f32aca       vcvtlsi2sd xmm1,xmm1,rdx
0x20a317c42fde   286  c5f92ec1       vucomisd xmm0,xmm1
0x20a317c42fe2   290  0f85bc000000   jnz 484  (0x20a317c430a4)
0x20a317c42fe8   296  0f8abb000000   jpe 489  (0x20a317c430a9)
0x20a317c42fee   302  85d2           testl rdx,rdx
0x20a317c42ff0   304  0f8539ffffff   jnz 111  (0x20a317c42f2f)
0x20a317c42ff6   310  c5f950d0       vmovmskpd rdx,xmm0
0x20a317c42ffa   314  83e201         andl rdx,0x1
0x20a317c42ffd   317  0f85ab000000   jnz 494  (0x20a317c430ae)
0x20a317c43003   323  e927ffffff     jmp 111  (0x20a317c42f2f)
                  ;;; <@64,#56> -------------------- Deferred stack-check --------------------
0x20a317c43008   328  50             push rax
0x20a317c43009   329  51             push rcx
0x20a317c4300a   330  52             push rdx
0x20a317c4300b   331  53             push rbx
0x20a317c4300c   332  56             push rsi
0x20a317c4300d   333  57             push rdi
0x20a317c4300e   334  4150           push r8
0x20a317c43010   336  4151           push r9
0x20a317c43012   338  4153           push r11
0x20a317c43014   340  4154           push r12
0x20a317c43016   342  4156           push r14
0x20a317c43018   344  4157           push r15
0x20a317c4301a   346  488d6424e0     REX.W leaq rsp,[rsp-0x20]
0x20a317c4301f   351  488b75f8       REX.W movq rsi,[rbp-0x8]
0x20a317c43023   355  33c0           xorl rax,rax
0x20a317c43025   357  498d9da8f6ddfe REX.W leaq rbx,[r13-0x1220958]
0x20a317c4302c   364  e8af48fcff     call 0x20a317c078e0     ;; code: STUB, CEntryStub, minor: 5
0x20a317c43031   369  488d642420     REX.W leaq rsp,[rsp+0x20]
0x20a317c43036   374  415f           pop r15
0x20a317c43038   376  415e           pop r14
0x20a317c4303a   378  415c           pop r12
0x20a317c4303c   380  415b           pop r11
0x20a317c4303e   382  4159           pop r9
0x20a317c43040   384  4158           pop r8
0x20a317c43042   386  5f             pop rdi
0x20a317c43043   387  5e             pop rsi
0x20a317c43044   388  5b             pop rbx
0x20a317c43045   389  5a             pop rdx
0x20a317c43046   390  59             pop rcx
0x20a317c43047   391  58             pop rax
0x20a317c43048   392  e91bffffff     jmp 168  (0x20a317c42f68)
                  ;;; <@82,#83> -------------------- Deferred number-tag-d --------------------
0x20a317c4304d   397  33db           xorl rbx,rbx            ;; debug: position 109
0x20a317c4304f   399  50             push rax
0x20a317c43050   400  51             push rcx
0x20a317c43051   401  52             push rdx
0x20a317c43052   402  53             push rbx
0x20a317c43053   403  56             push rsi
0x20a317c43054   404  57             push rdi
0x20a317c43055   405  4150           push r8
0x20a317c43057   407  4151           push r9
0x20a317c43059   409  4153           push r11
0x20a317c4305b   411  4154           push r12
0x20a317c4305d   413  4156           push r14
0x20a317c4305f   415  4157           push r15
0x20a317c43061   417  488d6424e0     REX.W leaq rsp,[rsp-0x20]
0x20a317c43066   422  488b75f8       REX.W movq rsi,[rbp-0x8]
0x20a317c4306a   426  33c0           xorl rax,rax
0x20a317c4306c   428  498d9d58e7dffe REX.W leaq rbx,[r13-0x12018a8]
0x20a317c43073   435  e86848fcff     call 0x20a317c078e0     ;; code: STUB, CEntryStub, minor: 5
0x20a317c43078   440  4c8bd0         REX.W movq r10,rax
0x20a317c4307b   443  488d642420     REX.W leaq rsp,[rsp+0x20]
0x20a317c43080   448  415f           pop r15
0x20a317c43082   450  415e           pop r14
0x20a317c43084   452  415c           pop r12
0x20a317c43086   454  415b           pop r11
0x20a317c43088   456  4159           pop r9
0x20a317c4308a   458  4158           pop r8
0x20a317c4308c   460  5f             pop rdi
0x20a317c4308d   461  5e             pop rsi
0x20a317c4308e   462  5b             pop rbx
0x20a317c4308f   463  5a             pop rdx
0x20a317c43090   464  59             pop rcx
0x20a317c43091   465  58             pop rax
0x20a317c43092   466  498bda         REX.W movq rbx,r10
0x20a317c43095   469  e916ffffff     jmp 240  (0x20a317c42fb0)
                  ;;; -------------------- Jump table --------------------
0x20a317c4309a   474  e8752fccff     call 0x20a317906014     ;; debug: position 11264
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 2
0x20a317c4309f   479  e8842fccff     call 0x20a317906028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'not a heap number'
                                                             ;; deoptimization bailout 4
0x20a317c430a4   484  e87f2fccff     call 0x20a317906028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'lost precision'
                                                             ;; deoptimization bailout 4
0x20a317c430a9   489  e87a2fccff     call 0x20a317906028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'NaN'
                                                             ;; deoptimization bailout 4
0x20a317c430ae   494  e8752fccff     call 0x20a317906028     ;; debug: position 11264
                                                             ;; debug: deopt reason 'minus zero'
                                                             ;; deoptimization bailout 4
0x20a317c430b3   499  90             nop
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
0x20a317c42ee3    35  1000000 (sp -> fp)       0
0x20a317c43031   369  0000000 | rdx | rbx (sp -> fp)       3
0x20a317c43078   440  0000000 | rbx (sp -> fp)  <none>

RelocInfo (size = 531)
0x20a317c42eca  position  (18)
0x20a317c42eca  comment  (;;; <@0,#0> -------------------- B0 --------------------)
0x20a317c42eca  comment  (;;; <@4,#3> prologue)
0x20a317c42eca  comment  (;;; Prologue begin)
0x20a317c42eca  comment  (;;; Prologue end)
0x20a317c42eca  comment  (;;; <@8,#5> -------------------- B1 --------------------)
0x20a317c42eca  comment  (;;; <@10,#6> context)
0x20a317c42ece  comment  (;;; <@11,#6> gap)
0x20a317c42ed2  comment  (;;; <@14,#10> -------------------- B2 --------------------)
0x20a317c42ed2  comment  (;;; <@15,#10> gap)
0x20a317c42ed5  comment  (;;; <@16,#12> stack-check)
0x20a317c42edf  code target (BUILTIN)  (0x20a317c3cbe0)
0x20a317c42ee3  comment  (;;; <@18,#12> lazy-bailout)
0x20a317c42ee3  position  (40)
0x20a317c42ee3  comment  (;;; <@21,#18> goto)
0x20a317c42ee8  comment  (;;; <@22,#22> -------------------- B3 (OSR entry) --------------------)
0x20a317c42eec  comment  (;;; <@34,#29> context)
0x20a317c42ef0  comment  (;;; <@35,#29> gap)
0x20a317c42ef4  comment  (;;; <@36,#81> double-untag)
0x20a317c42f1e  comment  (;;; <@37,#81> gap)
0x20a317c42f22  comment  (;;; <@38,#82> tagged-to-i)
0x20a317c42f2f  comment  (;;; <@40,#31> gap)
0x20a317c42f3d  comment  (;;; <@41,#31> goto)
0x20a317c42f42  comment  (;;; <@42,#19> -------------------- B4 --------------------)
0x20a317c42f42  comment  (;;; <@44,#80> constant-d)
0x20a317c42f46  comment  (;;; <@46,#21> gap)
0x20a317c42f50  comment  (;;; <@48,#40> -------------------- B5 --------------------)
0x20a317c42f50  comment  (;;; <@50,#59> check-maps)
0x20a317c42f50  position  (56)
0x20a317c42f50  comment  (;;; <@54,#43> -------------------- B6 (loop header) --------------------)
0x20a317c42f50  position  (58)
0x20a317c42f50  comment  (;;; <@57,#47> compare-numeric-and-branch)
0x20a317c42f5b  comment  (;;; <@58,#48> -------------------- B7 (unreachable/replaced) --------------------)
0x20a317c42f5b  position  (40)
0x20a317c42f5b  comment  (;;; <@62,#54> -------------------- B8 --------------------)
0x20a317c42f5b  comment  (;;; <@64,#56> stack-check)
0x20a317c42f68  comment  (;;; <@66,#84> int32-to-double)
0x20a317c42f68  position  (92)
0x20a317c42f70  comment  (;;; <@68,#63> mul-d)
0x20a317c42f74  comment  (;;; <@70,#65> add-d)
0x20a317c42f74  position  (85)
0x20a317c42f78  comment  (;;; <@72,#70> add-i)
0x20a317c42f78  position  (70)
0x20a317c42f7b  position  (40)
0x20a317c42f7b  comment  (;;; <@75,#73> goto)
0x20a317c42f7d  comment  (;;; <@76,#51> -------------------- B9 (unreachable/replaced) --------------------)
0x20a317c42f7d  position  (116)
0x20a317c42f7d  comment  (;;; <@80,#74> -------------------- B10 --------------------)
0x20a317c42f7d  comment  (;;; <@82,#83> number-tag-d)
0x20a317c42f7d  position  (109)
0x20a317c42fb5  comment  (;;; <@83,#83> gap)
0x20a317c42fb8  comment  (;;; <@84,#77> return)
0x20a317c42fbf  position  (40)
0x20a317c42fbf  comment  (;;; <@38,#82> -------------------- Deferred tagged-to-i --------------------)
0x20a317c43008  comment  (;;; <@64,#56> -------------------- Deferred stack-check --------------------)
0x20a317c4302d  code target (STUB)  (0x20a317c078e0)
0x20a317c4304d  position  (109)
0x20a317c4304d  comment  (;;; <@82,#83> -------------------- Deferred number-tag-d --------------------)
0x20a317c43074  code target (STUB)  (0x20a317c078e0)
0x20a317c4309a  comment  (;;; -------------------- Jump table --------------------)
0x20a317c4309a  position  (11264)
0x20a317c4309a  deopt reason  (not a heap number)
0x20a317c4309b  runtime entry  (deoptimization bailout 2)
0x20a317c4309f  position  (11264)
0x20a317c4309f  deopt reason  (not a heap number)
0x20a317c430a0  runtime entry  (deoptimization bailout 4)
0x20a317c430a4  position  (11264)
0x20a317c430a4  deopt reason  (lost precision)
0x20a317c430a5  runtime entry  (deoptimization bailout 4)
0x20a317c430a9  position  (11264)
0x20a317c430a9  deopt reason  (NaN)
0x20a317c430aa  runtime entry  (deoptimization bailout 4)
0x20a317c430ae  position  (11264)
0x20a317c430ae  deopt reason  (minus zero)
0x20a317c430af  runtime entry  (deoptimization bailout 4)
0x20a317c430b4  comment  (;;; Safepoint table.)

--- End code ---
