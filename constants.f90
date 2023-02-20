program constants

  implicit none

  integer,parameter:: nx = 10
  real, parameter:: gravity = 9.81
  real,dimension(3), parameter:: c = [1, 2, 3]

  ! before Fortran 2003, the syntax was

  !real,dimension(3), parameter:: c = (/1,2,3/)

  print*,nx
  print*, c

end program constants
