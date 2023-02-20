! Fortran can declare arrays, with arbitrary number of dimensions
! All elements of an array have the same type.
! Fortran arrays are very close to Numpy arrays. Except that they have no
! method attached to them. It's just plain data.
!
program arrays

  implicit none
  !
  ! a vector of 10 floats
  real, dimension(10) :: x
  !
  ! a 3 x 5 array of integers
  integer, dimension(3, 5) :: phi
  integer:: i, j, n

  print*, x
  x(:) = 0.
  print*, x

  ! THE MOST IMPORTANT RULE: arrays are 1-based indexed (contrary to
  ! Python which are 0-based).
  !
  ! Elements are addressed with curly brackets x(1) (and not x[0])
  !
  n = 10
  do i = 1, n
     x(i) = i
  enddo
  print*, x
  !
  ! Also note that there is no easy syntax to address the last element
  ! in a dimension that would mimick the x[-1] of Python. To hit the
  ! last element of x the only possibility is to know the length of
  ! the axis, here n, and to use 'x(n)' explicitely.
  !
  print*, "last element of x is", x(n)

  ! Nested loops
  do j = 1, 5
     do i = 1, 3
        phi(i,j)=i+(j-1)*3
     enddo
     ! Fortran allows to use colon to indicate: "all elements of this axis"
     print*, phi(:, j)
  enddo

  print*, "-----------"
  print*, phi

end program arrays
!
! In this example, the shape of arrays is defined at the cmpilation,
! i.e. the shape is "hard-coded".
!
! Is it possible to declare an array, but to postpone the declaration
! of its exact size at runtime ?
!
! YES (fortunately!), see arrays2.f90
