# Setting up for practices

The goal for this practice is to give an overview of tools which are going to be used during this course. Some knowledge of c++, CMake and git is assumed.

1. Download & install [VScode](https://code.visualstudio.com/download)
1. Install the following plugins (strictly recommended)
    1. c/c++ - for c++ intellisense
    1. CMake/CMakeTools - for CMake source highlighting and autocomplete
    1. LLVM - for LLVM IR syntax highlighting
    1. Ocaml Platform - for Ocaml source highlighting and autocomplete (will be used later in this course)
    1. Remote - accessing remove hosts over SSH inside VScode (if host and client going to be different)
1. Clone llvm repo from [GitHub](https://github.com/llvm/llvm-project)
1. build llvm from sources following [instruction](https://llvm.org/docs/GettingStarted.html#getting-the-source-code-and-building-llvm)
1. Verify your setup following [instruction](https://llvm.org/docs/GettingStarted.html#simple-example)

For more information please see [LLVM documentation](https://llvm.org/docs/GettingStarted.html). Those links might be especially useful
    1. [LLVM IR language spec](https://llvm.org/docs/LangRef.html)
    1. [Project structure overview](https://llvm.org/docs/GettingStarted.html#directory-layout)
