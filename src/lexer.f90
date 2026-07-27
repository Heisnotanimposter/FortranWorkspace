module LexerModule
    implicit none
    private
    public :: LexerInit, GetNextToken, Token, EOF_TOKEN, ID_TOKEN, NUM_TOKEN, OP_TOKEN

    integer, parameter :: EOF_TOKEN = 0
    integer, parameter :: ID_TOKEN = 1
    integer, parameter :: NUM_TOKEN = 2
    integer, parameter :: OP_TOKEN = 3

    type Token
        integer :: token_type
        character(len=20) :: lexeme
    end type Token

    character(len=100) :: source_code
    integer :: current_pos
    integer :: source_len

contains

    subroutine LexerInit(input_string)
        character(len=*), intent(in) :: input_string
        source_code = input_string
        source_len = len_trim(source_code)
        current_pos = 1
    end subroutine LexerInit

    subroutine SkipWhitespace()
        do while (current_pos <= source_len .and. source_code(current_pos:current_pos) == ' ')
            current_pos = current_pos + 1
        end do
    end subroutine SkipWhitespace

    function GetNextToken() result(t)
        type(Token) :: t
        character(len=1) :: c
        integer :: start_pos

        call SkipWhitespace()

        if (current_pos > source_len) then
            t%token_type = EOF_TOKEN
            t%lexeme = 'EOF'
            return
        end if

        c = source_code(current_pos:current_pos)

        ! Naive identifier/keyword check (a-z)
        if ((c >= 'a' .and. c <= 'z') .or. (c >= 'A' .and. c <= 'Z')) then
            start_pos = current_pos
            do while (current_pos <= source_len)
                c = source_code(current_pos:current_pos)
                if ((c >= 'a' .and. c <= 'z') .or. (c >= 'A' .and. c <= 'Z') .or. (c >= '0' .and. c <= '9')) then
                    current_pos = current_pos + 1
                else
                    exit
                end if
            end do
            t%token_type = ID_TOKEN
            t%lexeme = source_code(start_pos:current_pos-1)
            return
        end if

        ! Naive number check (0-9)
        if (c >= '0' .and. c <= '9') then
            start_pos = current_pos
            do while (current_pos <= source_len)
                c = source_code(current_pos:current_pos)
                if (c >= '0' .and. c <= '9') then
                    current_pos = current_pos + 1
                else
                    exit
                end if
            end do
            t%token_type = NUM_TOKEN
            t%lexeme = source_code(start_pos:current_pos-1)
            return
        end if

        ! Operator check
        if (index("+-*/=", c) > 0) then
            t%token_type = OP_TOKEN
            t%lexeme = c
            current_pos = current_pos + 1
            return
        end if

        ! Unknown char, just skip for this mock
        current_pos = current_pos + 1
        t = GetNextToken()

    end function GetNextToken

end module LexerModule
