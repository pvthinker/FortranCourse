! Fortran proposes 'subroutines' and 'functions'
!
! both have arguments
!
! subroutine: arguments are a combination of input/output + in-place modified
!
! functions: all arguments are input, the result is the function itself
!
!
! a VERY IMPORTANT information: arrays are passed by address, not by value
!
! which means: Fortran only passes the memory address of the first
! element of an array, not all the data of the array
!
! other arguments (integer, floats, boolean) are passed by value
!
subroutine gradient(phi, gx, gy, nx, ny)

  implicit none

  integer:: nx, ny
  real,dimension(nx, ny):: phi
  real,dimension(nx+1, ny):: gx
  real,dimension(nx, ny+1):: gy

  intent(in):: phi
  intent(out):: gx,gy

  ! local variables
  integer:: i, j

  do j = 1, ny
     gx(1, j) = 0.
     do i = 2, nx
        gx(i, j) = phi(i, j)-phi(i-1, j)
     enddo
     gx(nx+1, j) = 0.
  enddo

  gy(:, 1)=0.
  gy(:, ny+1)=0.
  do j = 2, ny
     do i = 1, nx
        gy(i, j) = phi(i, j)-phi(i, j-1)
     enddo
  enddo

end subroutine gradient

subroutine kineticenergy(ke, u, v, nx, ny)

  implicit none

  integer:: nx, ny
  real,dimension(nx, ny):: ke
  real,dimension(nx+1, ny):: u
  real,dimension(nx, ny+1):: v

  integer:: i, j

  do j = 1, ny
     do i = 1, nx
        ke(i, j) = 0.25*(&
             +u(i, j)**2+u(i+1, j)**2 &
             +v(i, j)**2+v(i, j+1)**2 )
     enddo
  enddo

end subroutine kineticenergy

function capitain_age(ship_size)
  integer:: capitain_age
  real:: ship_size

  ! the formula is riculous
  capitain_age = 42 + int(ship_size)

end function capitain_age



program main

  implicit none

  integer,parameter:: nx=5
  integer,parameter:: ny=7

  real,dimension(nx, ny):: phi, ke
  real,dimension(nx+1, ny):: gx
  real,dimension(nx, ny+1):: gy

  integer:: capitain_age

  integer:: i,j

  do j = 1, ny
     do i = 1, nx
        phi(i,:) = i+(j-1)*nx
     enddo
  enddo

  call gradient(phi, gx, gy, nx, ny)

  call kineticenergy(ke, gx, gy, nx, ny)

  print*, "gx=",gx
  print*, "gy=",gy
  print*, ke

  print*, "capitain's age is", capitain_age(15.)

end program main
