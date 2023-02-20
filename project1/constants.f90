module constants

  implicit none

  integer, parameter:: nx = 128
  integer, parameter:: ny = 128

  real, parameter:: km = 1000

  real, parameter:: gravity = 1.
  real, parameter:: f0 = 1e-4
  real, parameter:: Hlayer = 1.
  real, parameter:: Lx = 1.
  real, parameter:: Ly = 1.

  real, parameter:: dx = Lx/nx
  real, parameter:: dy = Ly/ny
  real, parameter:: idx = nx/Lx
  real, parameter:: idy = ny/Ly
  real, parameter:: dt = 0.1*sqrt(gravity*Hlayer)*2/dx

end module constants
