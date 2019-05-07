clear all
clf

files=dir('nombre*.dat');

for k=1: size(files,1)

  dat=load(files(k).name);
  x=dat(:,2);
  v=dat(:,3);

  xlabel ('Posicion');
  ylabel ('Momento');
  
  hold on
  plot(x,v)
  drawnow
  
end

print espacio_fase.jpg