target triple = "x86_64-apple-macosx10.15.0"

define i32 @main (i32 %argc, i8** %argv) #0 {
entry:
    %tobool = icmp eq i32 %argc, 2
    br i1 %tobool, label %if.then, label %if.end

if.then:
    br label %if.end

if.end:
    %x.0 = phi i32 [1,%entry], [1,%if.then]
    ret i32 %x.0
}