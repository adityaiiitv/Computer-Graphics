clear all;
close all;

t = 0:0.01:1;
%t=0.5;
f1= 1 -3*t.*t +2*t.*t.*t;
f2= 3*t.*t -2.*t.*t.*t;
f3= 1*t -2*t.*t +1*t.*t.*t;
f4= -1*t.*t + 1*t.*t.*t;

%plot(f1);
%hold on;
%plot(f2);
%hold on;
%plot(f3);
%hold on;
%plot(f4);
%hold off;

p0=[0,0];
p1=[1,0];
p2=[10,1];
p3=[1,-10];
func=((p0'.*f1)+(p1'.*f2)+(p2'.*f3)+(p3'.*f4))';
plot(func(:,1),func(:,2));

%create a knot in the curve by changing the points, find the points and the size of the tangent at the point
