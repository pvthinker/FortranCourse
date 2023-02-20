!
! Array size can be postponed to runtime (instead of being hard-coded
! at compile time)
!
program arrays2

  implicit none

  integer:: nx, ny

  ! the shape has to be declared: here (:,:) meaning 2D
  ! but the size is set later
  real,dimension(:,:), allocatable:: q

  integer:: i

  nx = 3
  ny = 5

  ! this is where the array is allocated
  allocate(q(nx, ny))

  do i = 1, nx
     q(i,:) = i
  enddo

  print*, q


end program arrays2
