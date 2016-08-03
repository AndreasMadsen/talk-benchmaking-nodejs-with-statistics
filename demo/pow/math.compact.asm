> B6:
for (var i = 0; i < 1000000; i++) {
> CompareNumericAndBranch LT i39 i46 goto (B7, B9) Tagged
cmp rax,0xf4240         ;; debug: position 56
jge 189

cmpq rsp,[r13+0xa88]    ;; debug: position 40
jc 328

sum += Math.pow(i, 2);
> Change i39 i to d allow-undefined-as-nan TaggedNumber
vxorpd xmm2,xmm2,xmm2    ;; debug: position 92
vcvtlsi2sd xmm2,xmm2,rax

> Mul d84 d84 ! TaggedNumber
vmulsd xmm2,xmm2,xmm2

sum += Math.pow(i, 2);
> Add d38 d63 ! TaggedNumber
vaddsd xmm1,xmm2,xmm1    ;; debug: position 85

for (var i = 0; i < 1000000; i++) {
> Add i39 i69 TaggedNumber
addl rax,0x1            ;; debug: position 70

> Goto B6 Tagged
jmp 144;; debug: position 40
