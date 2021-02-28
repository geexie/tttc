; ModuleID = 'acr.ll'
source_filename = "ac.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

; Function Attrs: noinline nounwind ssp uwtable
define dso_local float @foo(float %x) #0 {
entry:
  ret float %x
}

; Function Attrs: noinline nounwind ssp uwtable
define dso_local float @bar(float %x) #0 {
entry:
  %mul = fmul float %x, 1.000000e+00
  ret float %mul
}

; Function Attrs: noinline nounwind ssp uwtable
define dso_local float @pows(float %a, float %b, float %c, float %d, float %e, float %f, float %x) #0 {
entry:
  %0 = call float @llvm.pow.f32(float %x, float 5.000000e+00)
  %mul = fmul float %a, %0
  %1 = call float @llvm.pow.f32(float %x, float 4.000000e+00)
  %mul1 = fmul float %b, %1
  %add = fadd float %mul, %mul1
  %2 = call float @llvm.pow.f32(float %x, float 3.000000e+00)
  %mul2 = fmul float %c, %2
  %add3 = fadd float %add, %mul2
  %3 = call float @llvm.pow.f32(float %x, float 2.000000e+00)
  %mul4 = fmul float %d, %3
  %add5 = fadd float %add3, %mul4
  %mul6 = fmul float %e, %x
  %add7 = fadd float %add5, %mul6
  %add8 = fadd float %add7, %f
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
