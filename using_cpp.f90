! cpp allow to introduce macros
!
! to have the compiler interpret them
! you need to add the '-cpp' option
!
#define MULT
#define SIZE 10

program arrays

  implicit none

  real:: x, y, z
  ! the size of vector is defined at the compilation
  real,dimension(SIZE):: vector
  integer:: i

  x = 2
  y = 3
#ifdef MULT
  z = x*y
  print*,"do multiplication"
#else
  z = 1
  print*,"skip multiplication"
#endif

  print*,"z=",z

  do i = 1, SIZE
     vector(i) = i
  enddo
  print*,"vector=",vector


end program arrays
