clear all;
close all;

p1=[0,0];
p2=[-1,1];
p3=[0,1];
p4=[1,1];
p5=[1,0];

a=[1 0 0 0 0;1 4 1 0 0;0 1 4 1 0;0 0 1 4 1;0 0 0 0 1];

P=[p1;3*(p3-p1);3*(p4-p2);3*(p5-p3);p5];
y=inv(a)*P
% refer to soloman chapter 5
% m doh carmo. differential geometry ch-1
%func=((p0'.*f1)+(p1'.*f2)+(p2'.*f3)+(p3'.*f4))';
%plot(func(:,1),func(:,2));


