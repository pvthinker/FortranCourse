! Fortran is a *static typed* language
!
! it means that all variables should declare their *type*
!
program pi

  ! For historical reason, Fortran also has an implicit rule of typing
  ! which means that Fortran assumes the type of certain variables.
  ! This is considered as a bad practice and should be avoided.
  ! To force the compiler to check the type of all variables, all
  ! programs (and modules, subroutines, etc, see later) should start
  ! with this 'implicit none'
  !
  implicit none

  ! a 32-bits signed integer
  integer:: n
  !
  ! a 32-bits float (simple precision)
  real:: x
  !
  ! a 64-bits float (double precision)
  real*8 :: y

  !
  ! Assignement
  n = 7

  ! Fortran has a lot of built-in mathematical functions
  ! 'atan' is the arc tangent function
  x = 4*atan(1.)
  y = 4*atan(1.d0)

  ! write(*,*) is an alternative to print,* to display on screen
  write(*,*) "n=", n
  ! x and y are both equal to pi
  ! but look how many digits they have
  !
  !  x=   3.14159274
  !  y=   3.1415926535897931
  !
  ! x has 7 digits (the last one is rounded)
  ! y has 15 digits
  !
  write(*,*) "x=", x
  write(*,*) "y=", y

end program pi
