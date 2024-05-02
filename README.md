# fortranWorkspace
## Simplified LR Parser in Fortran

This project contains the foundational code for a simplified LR(0) parser implemented in Fortran. The LR parsing method is a cornerstone of compiler design, standing for "Left-to-right, Rightmost derivation" parsing. It is instrumental in understanding how compilers interpret and process programming languages. Our implementation is a basic illustration aimed at providing a conceptual framework rather than a fully functioning parser.

### Overview

The code sets up essential structures necessary for LR parsing, including states and symbols which are fundamental to the parsing process. This simplified version lays the groundwork for a more complex parser that could be developed to handle a specific grammar.

### Features

- **Parser States**: Represents various states the parser can be in during the parsing process.
- **Grammar Symbols**: Represents terminals and non-terminals in the grammar.
- **Error Handling**: Implements basic error reporting functionalities.
- **Stack Operations**: Includes a stack module for managing parser symbols, crucial for managing the parser's state during execution.
- **Symbol Table**: Adds a symbol table management module for storing and retrieving symbol information efficiently.

### Structure

The project is structured as follows:

- **LRParser Program**: The main program that initializes the parser states and symbols, preparing the ground for parsing logic.
- **InitializeStates Subroutine**: A subroutine dedicated to initializing parser states with dummy values.
- **InitializeSymbols Subroutine**: A subroutine for initializing grammar symbols with example values.
- **ErrorHandler Subroutine**: Handles errors that might occur during the parsing process.
- **StackModule**: A module that implements stack operations necessary for managing the parsing process.
- **SymbolTableModule**: A module that manages a symbol table, essential for complex parsing tasks.

### Getting Started

This section will guide you through the basic steps to understand and interact with the code.

#### Prerequisites

To run this Fortran code, you will need:

- A Fortran compiler (e.g., GNU Fortran (gfortran), Intel Fortran)
- Basic understanding of compiler theory and LR parsing

#### Running the Code

- **Compile the Code**: Use your Fortran compiler to compile the source file. With gfortran, the command would be:

```bash
gfortran -o lrparser LRParser.f90
