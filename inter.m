clear all;
close all;

t = 0:0.01:1;
%t=0.5;
f1= (1-t).*(1-t).*(1-t);
f2= (3*t).*(1-t).*(1-t);
f3= 3.*t.*t.*(1-t);
f4= t.*t.*t;

p0=[0,0];
p1=[0.25,0.25];
p2=[0.75,0.25];
p3=[1,0];
func=((p0'.*f1)+(p1'.*f2)+(p2'.*f3)+(p3'.*f4))';
plot(func(:,1),func(:,2));


