program main

  use constants
  use variables
  use integrator

  implicit none

  integer:: i,j,kt,nt

  integer:: nope,nrk3,nrhs,nflux,ngrad,nke,ndiv
  real:: t0, t1, elapsed, perf, speed

  ! It is stupid to initialize with zeros
  ! clearly we should put a non trivial initial state
  ! and save the results ...
  !
  ! Here, we do nothing except measuring the time is takes
  ! to do the computation. This is a waste of ressources!
  s%u(:,:)=0.
  s%v(:,:)=0.
  s%h(:,:)=0.

  nt = 1000

  ! cpu_time() is an INTRINSIC that return the internal time (in sec)
  call cpu_time(t0)

  do kt = 1,nt
     if (mod(kt,100).eq.0) print*,kt
     call rk3(dt)
  enddo

  call cpu_time(t1)

  elapsed = t1-t0
  perf = elapsed/nt/(nx*ny)

  print '(A12, ":", (f6.2), " s")', "elapsed time", elapsed

  ! This rescaled performance number can be compared to the one of a
  ! Python code. This is where one can really assess that Fortran is
  ! a killer.
  !
  print '(A12, ":",  (e9.2), " s per dof per ite")', "perf", perf

  ! number of operations per subroutine per grid point
  !
  ! found manually, subroutine per subroutine (this is fun!)
  nrk3 = 15
  nrhs = 2
  nflux = 10
  ngrad = 4
  nke = 7
  ndiv = 4
  nope = nrk3+nrhs+nflux+ngrad+nke+ndiv
  speed = nope/perf/1e9
  print '(A12, ":", (i5), " Flops per dof per ite")', "operations", nope

  ! I achieve ~ 1 GFlops per s on my laptop. This is not so good. I
  ! could aim at 6 GFlops per s.
  print '(A12, ":", (f6.2), " GFlops per s")', "speed", speed
end program main
