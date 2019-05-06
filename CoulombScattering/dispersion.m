clear all
%Capa de Oro experimento Geiger y Marsden 0.0000004 m grosor
%Programa Dispersión de Coulomb
%Número de partículas
n=1000;
m=6.6442e-27; %Suponemos que las partículas dispersadas tienen la misma masa [kg]
me = 9.1e-31; %Masa electron
%Constante de Coulomb [Nm^2/C^2)
k=8.9875517873681764*10^9;
%Velocidad de la luz [m/s]
C = 299792458;
%Carga de electr¢n [C]
q=-1.6*10^(-19); 
%Particulas cargadas en nucleo dispersado
z=2;
%Particulas en nucleo masivo
zo=79;
%Energía en función de la celeridad
v=0.05 *C; %supondremos que todos tienen la misma velocidad [m/s]
E=m*v*v/2;
beta = v/C;
%Erel;

%Distancia entre núcleo y pantalla [m]
d=1; 
%Parámetro de impacto
bmin=7.7e-13;%parámetro de impacto mínimo (radio de nuclero de oro) [m]
db=1e-12;%Distancia máxima de impacto
b=bmin+db*rand(1,n);%Parámetro de impacto, utilizando distribución uniforme
%ver notas
chi = k^2 * z^2 * zo^2 * q^4 /16 / E^2;
phi=2*pi*rand(1,n); %nuevamente distribución uniforme
interval = [0 pi/2];
interval2= [pi/2 pi];
%for j=1:6
    
    %Energía en función de la celeridad
%    v(j)=0.0000001*10^j*C; %supondremos que todos tienen la misma velocidad [m/s]
%    E(j)=m*v(j)*v(j)/2;
    %beta = v/C;
for i=1:n

    %En caso de no ser desviados
    bx(i)=b(i)*cos(phi(i));
    by(i)=b(i)*sin(phi(i));

    %Calculamos el ángulo de dispersión para cada partícula
    theta(i)=2*acot(2*E*b(i)/(k*z*zo*q^2)); 
    proy(i)=d*sin(theta(i));

    %Proyectamos sobre una pantalla
    x(i)=(proy(i)+b(i))*cos(phi(i));
    y(i)=(proy(i)+b(i))*sin(phi(i));

    %Versión relativista (Mott formula)
    %fun = @(A) 2*chi*(cot(A/2)^2 - 2*beta^2*log(sin(A/2))) - b(i)^2;
    %A= fzero(fun,interval); 
    %thetarel(i) = A;

end
plot([-5,5],[0,0],'-');
hold on
plot([0,0],[-5,5],'-');
hold on
plot(x,y,'.r')
hold on
plot(bx,by,'.b');
hold on
xlabel ('x [m]');
ylabel ('y [m]');
grid on
title(('Pantalla colocada a 3 m de distancia'),'FontSize',16);
set(gca,'XLimMode','manual');
set(gca,'YLimMode','manual');
%set(gca,'XLim',[-3,3],'YLim',[-3,3]);



