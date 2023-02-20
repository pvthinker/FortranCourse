program summary

  implicit none

  print*,""
  print*,"  Fortran Course"
  print*,"  --------------"
  print*,""
  print*,"   by Guillaume Roullet, February 2023"
  print*,""
  print*,"  Learn Fortran by going through this sequence of Fortran programs."
  print*,"  Follow the order, there is a logical progression."
  print*,""

  call print_item('hello.f90')
  call print_item('syntax.f90')
  call print_item('datatypes.f90')
  call print_item('math.f90')
  call print_item('parameters.f90')
  call print_item('pi.f90')
  call print_item('constants.f90')
  call print_item('controlflow.f90')
  call print_item('arrays.f90')
  call print_item('arrays2.f90')
  call print_item('compile.py')
  call print_item('subroutines.f90')
  call print_item('summary.f90')
  call print_item('references.f90')

  print*,""

end program summary

subroutine print_item(string)

  implicit none

  character(len=*), intent(in):: string

  ! i is initialized to 0 and have the SAVE attribute
  ! meaning, the subroutine will remember its value
  ! at later calls
  integer, save:: i=0

  i = i +1
  print '("  ",(i2), ") ",(A))', i, string

end subroutine print_item
