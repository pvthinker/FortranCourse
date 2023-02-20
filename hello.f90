! The program X / end program X delimits the content
!
program hello

  ! The simplest way to print a string on the screen
  print*, "hello world!"

end program hello
!
! To execute this program we need first to
! *compile* it
!
! > gfortran hello.f90
!
! this creates an *executable*, by default it is called 'a.out'
!
! execute it with
!
! > ./a.out
!
! You have just produced your first Fortran code!
