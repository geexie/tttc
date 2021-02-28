; ModuleID = 'ac.c'
source_filename = "ac.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

; Function Attrs: noinline nounwind ssp uwtable
define dso_local float @foo(float %x) #0 {
entry:
  %x.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  %0 = load float, float* %x.addr, align 4
  %add = fadd float %0, 0.000000e+00
  ret float %add
}

; Function Attrs: noinline nounwind ssp uwtable
define dso_local float @bar(float %x) #0 {
entry:
  %x.addr = alloca float, align 4
  store float %x, float* %x.addr, align 4
  %0 = load float, float* %x.addr, align 4
  %mul = fmul float %0, 1.000000e+00
  ret float %mul
}

; Function Attrs: noinline nounwind ssp uwtable
define dso_local float @pows(float %a, float %b, float %c, float %d, float %e, float %f, float %x) #0 {
entry:
  %a.addr = alloca float, align 4
  %b.addr = alloca float, align 4
  %c.addr = alloca float, align 4
  %d.addr = alloca float, align 4
  %e.addr = alloca float, align 4
  %f.addr = alloca float, align 4
  %x.addr = alloca float, align 4
  store float %a, float* %a.addr, align 4
  store float %b, float* %b.addr, align 4
  store float %c, float* %c.addr, align 4
  store float %d, float* %d.addr, align 4
  store float %e, float* %e.addr, align 4
  store float %f, float* %f.addr, align 4
  store float %x, float* %x.addr, align 4
  %0 = load float, float* %a.addr, align 4
  %1 = load float, float* %x.addr, align 4
  %2 = call float @llvm.pow.f32(float %1, float 5.000000e+00)
  %mul = fmul float %0, %2
  %3 = load float, float* %b.addr, align 4
  %4 = load float, float* %x.addr, align 4
  %5 = call float @llvm.pow.f32(float %4, float 4.000000e+00)
  %mul1 = fmul float %3, %5
  %add = fadd float %mul, %mul1
  %6 = load float, float* %c.addr, align 4
  %7 = load float, float* %x.addr, align 4
  %8 = call float @llvm.pow.f32(float %7, float 3.000000e+00)
  %mul2 = fmul float %6, %8
  %add3 = fadd float %add, %mul2
  %9 = load float, float* %d.addr, align 4
  %10 = load float, float* %x.addr, align 4
  %11 = call float @llvm.pow.f32(float %10, float 2.000000e+00)
  %mul4 = fmul float %9, %11
  %add5 = fadd float %add3, %mul4
  %12 = load float, float* %e.addr, align 4
  %13 = load float, float* %x.addr, align 4
  %mul6 = fmul float %12, %13
  %add7 = fadd float %add5, %mul6
  %14 = load float, float* %f.addr, align 4
  %add8 = fadd float %add7, %14
  ret float %add8
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.pow.f32(float, float) #1

attributes #0 = { noinline nounwind ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 13.0.0 (https://github.com/llvm/llvm-project.git 82189730b024e8496f7989214f81c22cbf44d75d)"}
