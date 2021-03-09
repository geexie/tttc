# Building llvm from sources

1. Clone llvm repo from [GitHub](https://github.com/llvm/llvm-project)
    ```
    git clone git@github.com:llvm/llvm-project.git
    ```
1. Ninja and make build systems are both supported. make is default for *nix. In-tree build is not supported, you have to create special directory first
    ```
    mkdir build
    cd build
    ```
1. configure CMake with the following options
    1. enable `clang` build with `-DLLVM_ENABLE_PROJECTS=clang`. It's disabled by default, but will be used during our experiments. All llvm related components are build by default
    1. llvm is a huge project. You can reduce number of backends with option `-DLLVM_TARGETS_TO_BUILD="X86"`to just your native machine, for example X86, if you building llvm for desktop. X86 should be used even if system is 64bit. I will build both.
    1. provide the path to `llvm` source folder. In this assignment the following structure is assumed
        ```
        llvm-project
            |-- build
        ```
    1. for more information about CMake please see [the following information](https://cmake.org/cmake/help/v3.19/manual/cmake.1.html#manual:cmake(1))
    ```
    1. The following command configures llvm+clang for debug build, which is fine for your experiments. If you curious to benchmark compiler performance change build type to release by adding `-DCMAKE_BUILD_TYPE=Release`
    cmake -DLLVM_ENABLE_PROJECTS=clang -DLLVM_TARGETS_TO_BUILD="X86" ../llvm
    ```
1. build llvm from sources. (`-j4` means number of threads used by make. Adjust this number according to you setup)
    ```
    make -j4
    ```
    1. Use the this [instruction](https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm) and this [instruction](https://clang.llvm.org/get_started.html) for **Windows** related specific.
1. After build is done. you should see `bin` directory inside you `build` folder. It should contain all required tools and libraries. Check if it contains `clang`, `opt`, `llvm-objdump`, `llc`
1. Verify your setup following [instruction](https://llvm.org/docs/GettingStarted.html#an-example-using-the-llvm-tool-chain)
    1. Create a simple C file, name it toy.c’:
    ```
    #include <stdio.h>

    int main() {
        printf("hello world\n");
        return 0;
    }
    ```
    1. Compile the C file into a **native executable**. (Flags -S and -c arguments produce a native .s or .o file, respectively) `toy.c` assumed to be to your `build` directory
    ```
    ./bin/clang toy.c -o toy
    ```
    1. run toy program to see "Hello world as an output.
    ```
    ./toy
    ```

**Windows**  
1. Get all the stuff:  
Git.  
CMake.   
Visual Studio 2017 or later  
GnuWin32 tools  

2.
```  
git clone --config core.autocrlf=false https://github.com/llvm/llvm-project
cd llvm-project
mkdir build
cd build
cmake -DLLVM_ENABLE_PROJECTS=clang -G "Visual Studio 16 2019" -A x64 -Thost=x64 ../llvm  
```  
Notes:   
	a) in "Visual Studio 16 2019" you have to use your Visual Studio version  
	b) it has to be the first build with this parameters for llvm-project directory (you can get an error of CmakeCache)  
	
3. Open LLVM.sln in Visual Studio, in VS open CMakePredefinedTargets, right click on ALL_BUILD and choose build.  

4. Check out Debug/bin in build directory. clang and other tools have to be there.  

5. For a quick build, after changing the passes, you only need to rebuild `opt` project. Open LLVM.sln in Visual Studio, and choose `opt` for build. `Build`-> `Projects`-> `opt` 


### Troubleshooting

It might ask to explicitly specify path to your system header directory to clang since we run clang not from installation directory.

1. You can find them running
```
clang -E -x c - -v /dev/null
```
and looking to output for lines which contains include. The command above prints something similar to
```
#include "..." search starts here:
#include <...> search starts here:
/usr/local/include
/Library/Developer/CommandLineTools/usr/lib/clang/11.0.3/include
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include
/Library/Developer/CommandLineTools/usr/include
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks (framework directory)
```
1. Verifying that `stdio.h` is actually present.
1. Compile the C file into a **native executable**. (Flags -S and -c arguments produce a native .s or .o file, respectively) with path to *your* standard library headers. Note to use full path to executable to ensure local (just built version is executed) rather than system
```
./bin/clang toy.c -isystem/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include -o toy
```
1. run toy program to see "Hello world as an output.
```
./toy
```

### Resources

For more information please see [LLVM documentation](https://llvm.org/docs/GettingStarted.html). Those links might be especially useful
    1. [LLVM IR language spec](https://llvm.org/docs/LangRef.html)
    1. [Project structure overview](https://llvm.org/docs/GettingStarted.html#directory-layout)