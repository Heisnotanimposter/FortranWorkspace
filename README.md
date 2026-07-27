# Graduate Level Algorithm Portfolio: Fortran

This project contains the foundational code for a base compiler frontend and an LR(0) parser implemented in Fortran. 

## Overview

The LR parsing method is a cornerstone of compiler design. While the original version only initialized placeholder states and symbols, this graduate-level enhancement introduces a functional **Lexer/Scanner Frontend**, evolving the project into a more complete representation of a "Base Compiler."

## Architecture & Features

The architecture is divided into clear modular stages of compilation:

1.  **Lexical Analysis (`lexer.f90`)**:
    *   \[NEW] A raw character scanner that processes source code strings.
    *   Tokenizes the input securely into fundamental compiler symbols (`ID_TOKEN`, `NUM_TOKEN`, `OP_TOKEN`, `EOF_TOKEN`).
    *   Ignores whitespace and gracefully bounds checks the source buffer.
2.  **Syntax Analysis / Parsing (`LRParser.f90`)**:
    *   The main entry point that drives the lexer to consume tokens.
    *   Prepares state for the LR(0) (Left-to-right, Rightmost derivation) automaton.
3.  **Data Structures (`handling.f90`, `managing.f90`)**:
    *   Robust Fortran modules for `StackOperations` and `SymbolTable` management, vital for both keeping track of terminal scopes and parser state backtracking.

## Getting Started

### Prerequisites
*   A Fortran compiler (e.g., GNU Fortran `gfortran`)
*   `make`

### Building and Running

The project has been restructured with a dedicated `Makefile` handling module dependencies and object compilation natively.

```bash
# To build the base compiler pipeline natively:
make

# To run the compiler simulation demonstrating the new lexer feeding into the parser:
make run

# Clean build artifacts:
make clean
```
