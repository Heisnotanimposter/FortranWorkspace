module StackModule
    implicit none
    integer, parameter :: MAX_STACK_SIZE = 100
    type :: StackType
        type(GrammarSymbol), dimension(MAX_STACK_SIZE) :: items
        integer :: top = 0
    end type StackType

contains
    subroutine Push(stack, symbol)
        type(StackType), intent(inout) :: stack
        type(GrammarSymbol), intent(in) :: symbol

        if (stack%top < MAX_STACK_SIZE) then
            stack%top = stack%top + 1
            stack%items(stack%top) = symbol
        else
            print *, 'Stack Overflow'
        endif
    end subroutine Push

    subroutine Pop(stack, symbol)
        type(StackType), intent(inout) :: stack
        type(GrammarSymbol), intent(out) :: symbol

        if (stack%top > 0) then
            symbol = stack%items(stack%top)
            stack%top = stack%top - 1
        else
            print *, 'Stack Underflow'
        endif
    end subroutine Pop
end module StackModule

! Main program uses StackModule
use StackModule
type(StackType) :: stack
call Push(stack, symbols(1))
call Pop(stack, symbol)
