      program resorte_fric_tarea

      integer r,i,j,k,n
      character*13 nombre
      include 'caida.c'

      nombre='resfri000.dat'

      n=1
      r=1


      do i=1,n
            do j=1,n

                  if(r<10) then
                        write(nombre(9:9),'(1i1)') r
                  else if(r<100) then
                        write(nombre(8:9),'(1i2)') r
                  else
                        write(nombre(7:9),'(1i3)') r
                  endif

                  r=r+1

        
                  yo(1)=5.1 + (j-1)*0.5!posición
                  yo(2)= i-1 !velocidad
                  to=0.0
                  dt=0.1

                  open(unit=100,file=nombre)
                  write(100,'(3F12.3)') to,yo(1),yo(2)

                  do k=1,100

                        call runkut(yo,to,dt,y)
                        yo(1)=y(1)
                        yo(2)=y(2)
                        to=to+dt

                        write(100,'(3F12.3)') to,yo(1),yo(2)
                  enddo

                  close(100)

       
            enddo
      enddo

      return
      end program resorte_fric_tarea

! --------------------------------
      subroutine fun(t,xo,i,fp)
 
      !xo(2) es velocidad y xo(1) es posición 

      real t,xo,fp
      integer i
      dimension xo(2)
  
      if(i.eq.1) then
      fp=xo(2)
      endif

      if(i.eq.2) then
      fp=(-9.81e0)*(xo(1))-(0.4*xo(2))
      endif

      end
