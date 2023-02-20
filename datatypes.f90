! Fortran comes with basic types
!
! We have seen integer and real, let's see others
!
program datatypes

  implicit none

  integer:: n
  integer:: nlarge
  real:: x
  real*8 :: y

  !
  ! This a string with exactly 10 characters (8 bits characters)
  character*10:: word

  ! Fortran has build-in complex numbers !
  complex:: z, w

  !
  ! Boolean are
  logical:: ok

  n = 7
  nlarge = 2**30

  x = 4*atan(1.)
  y = 4*atan(1.d0)

  word = "Hello !"

  ! Assignement of complex numbers needs the real part and the
  ! imaginary part
  z = complex(1, 1)
  ! w is therefore the complex imaginary 'i'
  w = complex(0, 1)

  !
  ! Boolean instructions are decorated with two dots
  ok = .true.
  ok = .false.

  write(*,*) "n=", n
  write(*,*) "2**30=", nlarge

  write(*,*) "x=", x
  write(*,*) "y=", y

  print*, word
  !
  ! Fortran is quite bad at working with strings.  It's doable but it
  ! is much more painful than with Python.  We will come on it later.
  !
  ! Here are two simple string operations: len and trim, that removes
  ! the trailing white spaces.
  print*, "declared length for word    :", len(word)
  print*, "number of characters in word:", len(trim(word))

  print*, "z=", z
  print*, "z*i=", z*w

  print*, "ok=", ok

  !
  ! Pythoners are used with 'list', 'dict', 'tuple' In Fortran there
  ! is no such thing. This makes Fortran quite uncomfortable when
  ! going beyond pure calculus with number.
  !
  ! But after all, Fortran stands for "FORmula TRANslator".

end program datatypes
