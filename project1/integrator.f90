module integrator

  use variables
  use operators

  implicit none

contains

  subroutine rk3(dt)
    !
    ! variables s, ds0, ds1, ds2 are declared in the 'variables'
    ! module

    ! rhs is defined in 'operators'. rhs() could be anything, which
    ! means that this RK3 integrator can be used with an arbitrary
    ! dynamical system

    implicit none
    real:: dt

    call rhs(s, ds0)
    s = s+dt*ds0

    call rhs(s, ds1)
    s = s+(-0.75*dt)*ds0+(0.25*dt)*ds1

    call rhs(s, ds2)
    s = s+(8*dt/12)*ds2+(-dt/12)*(ds0+ds1)

  end subroutine rk3

end module integrator
