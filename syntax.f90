! The basic of syntax is described here
!
program syntax

  implicit none

  real:: x
  integer:: i, sum


  ! COMMENTS start with a "!"
  print*, "hello world!" ! comments can be added at the end of a line

  ! INDENTING : there is no mandatory rule (contrary to Python)
  !
  ! Old FORTRAN code had strict rules: instructions should start at 7th column
  ! and lines should end at 72th column !
  !
  ! This is no longer the case with modern Fortran
  !
  ! Old FORTRAN code have suffix "myprog.F" whereas now it is "myprog.f90"

  ! Anyway it's good to introduce a bit of indendation to visualize
  ! the blocks
  sum = 0
  do i = 1, 10
     sum = sum + i
  enddo

  ! Fortran is CASE INSENSITIVE
  i = 1
  ! is the same as
  I = 1

  ! CONTINUATION MARK : instructions can extend on several lines

  ! example (quite stupid)
  x = 1. &
       +2 &
       +3 &
       +4 &
       +5
  ! is identical to
  x = 1.+2.+3.+4.+5

  ! TYPE OF CONSTANTS : note above the dot after the number to make
  ! them "REAL", not "INTEGER" but

  x = 1+2+3+4+5 ! also works fine and x is REAL, because it has been
                ! declared REAL



end program syntax
