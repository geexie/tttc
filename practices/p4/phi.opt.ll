; ModuleID = 'qq.bc'
source_filename = "toy-m.ll"
target triple = "x86_64-apple-macosx10.15.0"

define i32 @main(i32 %argc, i8** %argv) {
entry:
  %tobool = icmp eq i32 %argc, 2
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret i32 1
}