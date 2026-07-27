module SymbolTableModule
    implicit none
    integer, parameter :: MAX_SYMBOL_TABLE_SIZE = 100
    type :: SymbolTableEntry
        character(len=32) :: identifier
        integer :: type_code
        ! Additional fields like scope, line number, etc., can be added
    end type SymbolTableEntry

    type(SymbolTableEntry), dimension(MAX_SYMBOL_TABLE_SIZE) :: SymbolTable
    integer :: symbolCount = 0

contains
    subroutine AddSymbol(identifier, type_code)
        character(len=*), intent(in) :: identifier
        integer, intent(in) :: type_code

        if (symbolCount < MAX_SYMBOL_TABLE_SIZE) then
            symbolCount = symbolCount + 1
            SymbolTable(symbolCount)%identifier = identifier
            SymbolTable(symbolCount)%type_code = type_code
        else
            print *, 'Symbol Table Overflow'
        endif
    end subroutine AddSymbol
end module SymbolTableModule

! Main program uses SymbolTableModule
use SymbolTableModule
call AddSymbol('x', 1)
call AddSymbol('y', 2)

