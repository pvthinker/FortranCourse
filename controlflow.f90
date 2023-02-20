! Let us illustrate the main control flow instructions
!
program flow

  implicit none

  integer:: i,n
  real :: x

  integer:: BC = 1

  ! The FOR loop
  n = 10
  x = 0.
  ! is a block of do / enddo
  ! i will takes all values from 1 to n included
  do i = 1, n
     x = x+i
  enddo
  print*, "sum =", x, "truth=", real(n*(n+1)/2)
  ! at the exit of the loop i is equal to 11 (n+1)
  print*, "i=",i

  ! For Pythoners, note that FOR loops can only loop over integers
  ! Fortran cannot loop over a list, over the characters of a string
  ! etc.


  ! The WHILE loop
  ! loops until a certain condition becomes false
  x = 0
  i = 0
  ! Boolean conditions should be bracketed
  ! the less or equal 'le' is surronded with two dots
  do while(i.le.n)
     x = x+i
     i = i+1
  end do
  print*, "sum =", x

  ! The IF block
  x = 0.
  do i = 1, n
     ! IF THEN statement.  Again the boolean expression is bracketed,
     ! the equal ".eq." is surrounded with two dots.
     !
     if (mod(i, 2).eq.0) then
        x = x+i
     endif
  enddo
  print*, "sum (even) =", x

  do i = 1, n
     ! IF ELSE statement
     if (mod(i, 2).eq.0) then
        print*, i, " is even"
     else
        print*, i, " is odd"
     endif
  enddo

  ! Several tests can be combined with the ELSEIF
  if(i.lt.10) then
     print*, "i < 10"

  elseif(i.lt.100) then
     print*, "10 <= i < 100"

  elseif(i.lt.1000) then
     print*, "100 <= i < 1000"

  else
     print*, "i > 1000"

  endif

  ! Fortran has a CASE statement
  select case(BC)
  case(0)
     print*,"BC type is Neumann"

  case(1)
     print*,"BC type is Dirichlet"

  case default
     print*,"BC type is unknown"

  end select

end program flow
