clear all;
close all;

t = 0:0.01:1;
f1= 1 -5.5*t + 9.*t.*t -4.5*t.*t.*t;
f2= 9.*t -22.5.*t.*t + 13.5*t.*t.*t;
f3= -4.5*t + 18.*t.*t -13.5*t.*t.*t;
f4= t -4.5*t.*t + 4.5*t.*t.*t;

p0=[2,4];
p1=[1,3];
p2=[1,4];
p3=[2,3];

Pt=((p0'.*f1)+(p1'.*f2)+(p2'.*f3)+(p3'.*f4))';
%hold on
%plot(Pt(:,1),Pt(:,2));
t = 0:0.01:1;
df1= -5.5 + 18.*t -13.5*t.*t;
df2= 9 -45.*t + 40.5*t.*t;
df3= -4.5 + 36.*t -40.5*t.*t;
df4= 1 -9.*t + 13.5*t.*t;

dpt=((p0'.*df1)+(p1'.*df2)+(p2'.*df3)+(p3'.*df4))';
%plot(dpt(:,1),dpt(:,2));
%hold on;
%plot(Pt(:,1),Pt(:,2));

%quiver(Pt(:,1),Pt(:,2),dpt(:,1),dpt(:,2))

%hold off

sum=0;
for i=1:101
v(i)=norm(dpt(i,:))*0.01;
sum=sum+v(i);
endfor

sum
