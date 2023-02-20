program parameters

  implicit none

  ! variables can be assigned default value at compilation time
  real:: g = 9.81
  real:: f0 = 1e-4
  real:: H = 4000.
  ! their value can still be changed at runtime

  ! other values can be hard-coded, the variable become a PARAMETER
  real:: pi
  parameter(pi=4*atan(1.))


  print*, "pi=",pi

  print*, "g=",g
  print*, "f=",f0
  print*, "H=",H

  g = 1
  f0 = 10
  H = 1

  print*, "g=",g
  print*, "f=",f0
  print*, "H=",H

end program parameters
