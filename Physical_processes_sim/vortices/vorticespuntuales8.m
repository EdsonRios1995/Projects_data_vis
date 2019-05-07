clear all
clc
Nt=5000;
dat=load('vorticespuntuales7.txt');
[p,q]=size(dat);
N=p/Nt;
x=dat(:,1);
y=dat(:,2);
aux=1:N;
for i=1:Nt
  clf
        plot(x(aux),y(aux),'.b','MarkerSize',15)
    axis equal
    axis([-100 100 -100 100])
    hold on;
    grid on;
    
    
    drawnow;
  aux=aux+N;
end