! Fortran has quite a lot of built-in mathematical functions, a.k.a. INTRINSICS
! meaning, there are part of the language itself, not an extension of it
!
! but not as much as numpy
!
! https://gcc.gnu.org/onlinedocs/gfortran/Intrinsic-Procedures.html#Intrinsic-Procedures
!
program math



  implicit none

  real:: x,y,z
  real:: a,b,c,d,e,f

  x = sin(1.)

  y = cos(x)

  z = x**2 + y**2

  a = z/sqrt(1.+z)

  b = log(1+z)

  c = exp(a)

  d = z**0.2

  e = bessel_j0(x)

  f = erf(1.)

  f = tanh(1.)

end program math
