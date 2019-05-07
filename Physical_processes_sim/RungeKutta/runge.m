clear all
clf

load('rk.dat')

n = 20;    %steps
x0 = 0.0;
xf = 0.5;
dx = (xf-x0)/n;

x = x0:dx:xf;

plot(x, exp(x.^2), 'o-')
hold on;

x = rk(:,1);
y = rk(:,2);
grid on
axis([0 0.5 1 1.3] )
drawnow
plot(x, y, 's-')
