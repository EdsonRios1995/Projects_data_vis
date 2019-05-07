      program vorticespuntuales7
C --------N:=Numero de vortices puntuales
C ------PARAMETROS----
C     Queremmos Numero vortices 8j j:=Numero de anillo
C     Numero total de vortices Np=4n(n+1)+1  n:=anillos concentricos
C     a=2b=8dx  son las longitudes de los semiejes.
C     kappa=1 Omega=a*b*kappa/(a^2+b^2) :=velocidad angular
C     x=acos(theta); y=bsin(theta)
      integer :: Np,Orb,N
      parameter(Orb=4)
      !Np = Numero de vortices por orbita
      !Orb = Numero de orbitas
      !N = Numero de vortices en total
      real,dimension(2*(4*Orb*(Orb+1)+1)) :: kappa,xf,xo,yf,yo
      real :: dt,sumax,sumay,Rij2,t,to,d,pi,dtheta
      real,dimension(Orb) :: a,b
      integer :: i,j,k,Nt,aux,h,g
      N=2*(4*Orb*(Orb+1)+1)
      pi=3.1416
      d=1/(2*pi)
      to=0
      dt=0.1 !Diferencial de tiempo
      Nt=500 !Numero de pasos de tiempo
C ---Parametros para la elipse: a=2b=8dx---
      do i=1,Orb
        b(i)=0.5+i
        a(i)=2*b(i)

      end do

C ------CONDICIONES INICIALES---
      do i=1,N
        kappa(i)=1
      end do

      xo(1)=-10; yo(1)=0 !Vortice central
      xo(N/2+1)=10 ; yo(N/2+1)=0
C ------(x/a)^2 + (y/b)^2 = 1 ----> y= b(1 -(x/a)^2)^1/2
C -----ACOMODO DE VORTICES PARA CADA ORBITA
      aux=0
      g=1
      do h=0,1
        aux=aux+h
          if (h==1) then
            g=N/2+1
          end if
        do j=1,Orb
          Np=8*j
          dtheta=2*pi/Np
          do i=1,Np
            xo(aux+i+1)=xo(g)+a(j)*cos(dtheta*i)
            yo(aux+i+1)=yo(g)+b(j)*sin(dtheta*i)
          end do
          aux=aux+Np
        end do

      end do
C --------

      open(unit=100,file='vorticespuntuales7.txt')
C      write(100,200) xo(1),yo(1)
      do k=1,Nt
        do i=1,N
          sumax=0
          sumay=0
          do j=1,N
            if (j/=i) then
C ----poner Rij2 = rij^2  ---
              Rij2=(xo(i)-xo(j))**2+(yo(i)-yo(j))**2
              sumax=sumax + (-kappa(j)*d*(yo(i)-yo(j)))/Rij2
              sumay=sumay + (kappa(j)*d*(xo(i)-xo(j)))/Rij2
            endif
          end do
          xf(i)=xo(i)+sumax*dt
          yf(i)=yo(i)+sumay*dt
        end do
        do i=1,N
          xo(i)=xf(i)
          yo(i)=yf(i)
          write(100,200) xo(i), yo(i)

        enddo
      end do
      close(100)
  200 format(2F20.5)    !Debemos poner (2N)F7.3
      return
      end
