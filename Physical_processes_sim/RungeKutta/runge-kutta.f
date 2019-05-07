C     Solve 
C     dy/dx = 2xy
C     y(0) = 1
C     [0, 0.5]

      program Rk
      
      real, external :: f
      real x0, y0, h, y1, xf
      integer n 

      n = 20
      x0 = 0.0
      xf = 0.5
      y0 = 1.0
      h = (xf - x0)/n

      open(unit=100, file='rk.dat')      

      do i=1,n      
       x0 = i*h
       call k_gen(x0, y0, h, f, y1)       
       write(100,200) h*(i+1), y1
      end do

      close(100)

  200 format(2F10.4)

      end program


C-----------------------------

      real function f(x, y)
    
      f = 2.0*x*y
      
      return
      end function
      
C-----------------------------    

      subroutine k_gen(x0, y0, h, f, y1)
      
      real, external :: f
      real x0, y0, h, y1
      
      real k1, k2, k3, k4
      
      k1 = h*f(x0, y0)
      k2 = h*f(x0 + 0.5*h, y0 + 0.5*k1)
      k3 = h*f(x0 + 0.5*h, y0 + 0.5*k2)
      k4 = h*f(x0 + h, y0 + k3)

      y1 = y0 + (1.0/6.0)*(k1 + 2.0*k2 + 2.0*k3 + k4)      
      y0 = y1

      end subroutine

    



