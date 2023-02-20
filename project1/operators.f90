module operators

  use constants
  use variables

contains

  subroutine divergence(u, v, div)
    ! minus divergence
    implicit none

    real,dimension(nx, ny):: div
    real,dimension(nx+1, ny):: u
    real,dimension(nx, ny+1):: v

    integer:: i, j

    do j = 1, ny
       do i = 1, nx
          div(i, j) = &
               -idx*(u(i+1,j)-u(i,j))&
               -idy*(v(i,j+1)-v(i,j))
       enddo
    enddo

  end subroutine divergence

  subroutine gradient(phi, gx, gy)
    ! minus gradient actually
    implicit none

    real,dimension(nx, ny):: phi
    real,dimension(nx+1, ny):: gx
    real,dimension(nx, ny+1):: gy

    integer:: i, j

    do j = 1, ny
       gx(1, j) = 0.
       do i = 2, nx
          gx(i, j) = -idx*(phi(i, j)-phi(i-1, j))
       enddo
       gx(nx+1, j) = 0.
    enddo

    gy(:, 1)=0.
    gy(:, ny+1)=0.
    do j = 2, ny
       do i = 1, nx
          gy(i, j) = -idy*(phi(i, j)-phi(i, j-1))
       enddo
    enddo

  end subroutine gradient

  subroutine kineticenergy(ke, u, v)

    implicit none

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

  subroutine flux(h,u,v,fu,fv)
    real,dimension(nx, ny):: h
    real,dimension(nx+1, ny):: u,fu
    real,dimension(nx, ny+1):: v,fv

    integer:: i, j

    do j = 1, ny
       fu(1, j) = 0.
       do i = 2, nx
          fu(i, j) = u(i, j)*(Hlayer+0.5*h(i-1, j)+0.5*h(i,j))
       enddo
       fu(nx+1, j) = 0.
    enddo

    fv(:, 1)=0.
    fv(:, ny+1)=0.
    do j = 2, ny
       do i = 1, nx
          fv(i, j) = v(i, j)*(Hlayer+0.5*h(i, j-1)+0.5*h(i,j))
       enddo
    enddo

  end subroutine flux

  subroutine rhs(s, ds)

    type(state),intent(inout):: s
    type(state),intent(out):: ds

    s%p = gravity*s%h
    call kineticenergy(s%ke, s%u, s%v)
    s%ber = s%p+s%ke
    call gradient(s%ber, ds%u, ds%v)

    call flux(s%h, s%u, s%v, s%fu, s%fv)
    call divergence(s%fu, s%fv, ds%h)

  end subroutine rhs

end module operators
