module variables

  use constants

  implicit none

  type state
     real,dimension(nx+1,ny)::u, fu
     real,dimension(nx,ny+1)::v, fv
     real,dimension(nx,ny):: h, p, ke, ber
     real,dimension(nx+1,ny+1)::vor
  end type state

  interface operator(+)
     module procedure state_plus_state
  end interface operator(+)

  interface operator(*)
     module procedure coef_times_state
  end interface operator(*)

  type(state):: s, ds0, ds1, ds2

contains

  function state_plus_state(a,b)
    type(state),intent(in) :: a,b
    type(state) :: state_plus_state

    state_plus_state%u = a%u+b%u
    state_plus_state%v = a%v+b%v
    state_plus_state%h = a%h+b%h
  end function state_plus_state

  function coef_times_state(coef, a)
    type(state),intent(in) :: a
    real,intent(in):: coef
    type(state) :: coef_times_state

    coef_times_state%u = a%u * coef
    coef_times_state%v = a%v * coef
    coef_times_state%h = a%h * coef
  end function coef_times_state

  subroutine set_state(u,v,h)
    implicit none

     real,dimension(nx+1,ny)::u
     real,dimension(nx,ny+1)::v
     real,dimension(nx,ny):: h

     s%u = u
     s%v = v
     s%h = h

  end subroutine set_state

  subroutine get_state(u,v,h)
    implicit none

     real,dimension(nx+1,ny)::u
     real,dimension(nx,ny+1)::v
     real,dimension(nx,ny):: h

     u = s%u
     v= s%v
     h = s%h

  end subroutine get_state

end module variables
