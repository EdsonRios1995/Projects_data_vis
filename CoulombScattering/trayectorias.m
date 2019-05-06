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
v=0.000005 *C; %supondremos que todos tienen la misma velocidad [m/s]
E=m*v*v/2;
beta = v/C;
%Erel;
x0=-1*10^(-10);%[m]
alpha= k*z*zo*q^2;
T = 1000000;
steps = T;
dt =  T/steps;
t0 = 0;
for j=1:5 
    b(j) = j*10^(-13);
    x(1) = x0; %[m]
    y(1) = b(j); %[m]
    phi(1) = atan(y(1)/x(1)); %[°]
    for i=1:T

        t = t0 + dt*i;
        F(i) = alpha/((y(i))^2+(x(i))^2);
        Fx(i) = F(i)*cos(atan(phi(i)));
        Fy(i) = F(i)*sin(atan(phi(i)));  
        x(i+1) = x(1)+v*t+Fx(i)*t^2/2/m;
        y(i+1) = y(1)+Fy(i)*t/2/m;
        phi(i+1) = atan(y(i+1)/x(i+1));
    end
    plot([-5,5],[0,0],'-');
    hold on
    plot([0,0],[-5,5],'-');
    hold on
    plot(x,y,'.r')
    hold on

    xlabel ('x [m]');
    ylabel ('y [m]');
    grid on
    title(('Trayectoria'),'FontSize',16);
    set(gca,'XLimMode','manual');
    set(gca,'YLimMode','manual');
end    
    