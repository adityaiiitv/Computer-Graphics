clear all;
close all;
% THE 6 CONTROL POINTS FOR 3 SEGMENTS
p1 = [0 0 0];
p2 = [0 1 1];
p3 = [1 1 0];
p4 = [2 1 1];
p5 = [2 0 1];
p6 = [1 1 0];

% MATRIX M FOR EQUATION OF SEGMENTS
M = [-1 3 -3 1;3 -6 3 0;-3 0 3 0;1 4 1 0];

% k IS USED TO ITERATE THE PARAMETERIZED CURVE
% px,py AND pz ARE THE x,y AND z COORDINATES OF THE PARAMETERIZED CURVE
k=1;
% SEGMENT 1
for i = 0:0.01:1

  t=[i^3 i^2 i 1];

  p1x = (1/6)*t*M*[p1(1); p2(1); p3(1); p4(1)];	%	x coordinate for segment 1
  p1y = (1/6)*t*M*[p1(2); p2(2); p3(2); p4(2)];	%	y coordinate for segment 1
  p1z = (1/6)*t*M*[p1(3); p2(3); p3(3); p4(3)];	%	z coordinate for segment 1

  px(k)=p1x;
  py(k)=p1y;
  pz(k)=p1z;

  k=k+1;
  %plot3(p1x,p1y,p1z,"bo");
  %hold on;
end

% SEGMENT 2
for i = 0:0.01:1
  t=[i^3 i^2 i 1];
  p2x = (1/6)*t*M*[p2(1); p3(1); p4(1); p5(1)];	%	x coordinate for segment 2
  p2y = (1/6)*t*M*[p2(2); p3(2); p4(2); p5(2)];	%	y coordinate for segment 2
  p2z = (1/6)*t*M*[p2(3); p3(3); p4(3); p5(3)];	%	z coordinate for segment 2

  px(k)=p2x;
  py(k)=p2y;
  pz(k)=p2z;

  k=k+1;
  %plot3(p2x,p2y,p2z,"ro");
  %hold on;
end

% SEGMENT 3
for i = 0:0.01:1
  t=[i^3 i^2 i 1];
  p3x = (1/6)*t*M*[p3(1); p4(1); p5(1); p6(1)];	%	x coordinate for segment 3
  p3y = (1/6)*t*M*[p3(2); p4(2); p5(2); p6(2)];	%	y coordinate for segment 3
  p3z = (1/6)*t*M*[p3(3); p4(3); p5(3); p6(3)];	%	z coordinate for segment 3
  px(k)=p3x;
  py(k)=p3y;
  pz(k)=p3z;
  k=k+1;
  %plot3(p3x,p3y,p3z,"go");
  %hold on;
end

%plot3(px,py,pz,"ro");

i=1;
l=0;		% INITIALIZE LENGTH TO ZERO
while(i < 303)	% TOTAL 303 POINTS
  a=sqrt( (px(i)-px(i+1))^2 + (pz(i)-pz(i+1))^2 + (py(i)-py(i+1))^2 ); %	DISTANCE BETWEEN 2 POINTS
  l=l+a;	% ADD TO LENGTH
  i++;
endwhile
l
% PART (b) OF QUESTION 1
k=1;
for i = 0:0.01:1

  t=[3*(i^2) 2*i 1 0];	% TO FIND THE DIFFERENTIAL OF THE CURVE, WE DIFFERENTIATE THE MATRIX T

  p1x = (1/6)*t*M*[p1(1); p2(1); p3(1); p4(1)];	%	x coordinate for segment 1
  p1y = (1/6)*t*M*[p1(2); p2(2); p3(2); p4(2)];	%	y coordinate for segment 1
  p1z = (1/6)*t*M*[p1(3); p2(3); p3(3); p4(3)];	%	z coordinate for segment 1

  pdx(k)=p1x;
  pdy(k)=p1y;
  pdz(k)=p1z;

  k=k+1;
  %plot3(p1x,p1y,p1z,"bo");
  %hold on;
end

% SEGMENT 2
for i = 0:0.01:1
  t=[3*(i^2) 2*i 1 0];
  p2x = (1/6)*t*M*[p2(1); p3(1); p4(1); p5(1)];	%	x coordinate for segment 2
  p2y = (1/6)*t*M*[p2(2); p3(2); p4(2); p5(2)];	%	y coordinate for segment 2
  p2z = (1/6)*t*M*[p2(3); p3(3); p4(3); p5(3)];	%	z coordinate for segment 2

  pdx(k)=p2x;
  pdy(k)=p2y;
  pdz(k)=p2z;

  k=k+1;
  %plot3(p2x,p2y,p2z,"ro");
  %hold on;
end

% SEGMENT 3
for i = 0:0.01:1
  t=[3*(i^2) 2*i 1 0];
  p3x = (1/6)*t*M*[p3(1); p4(1); p5(1); p6(1)];	%	x coordinate for segment 3
  p3y = (1/6)*t*M*[p3(2); p4(2); p5(2); p6(2)];	%	y coordinate for segment 3
  p3z = (1/6)*t*M*[p3(3); p4(3); p5(3); p6(3)];	%	z coordinate for segment 3
  pdx(k)=p3x;
  pdy(k)=p3y;
  pdz(k)=p3z;
  k=k+1;
  %plot3(p3x,p3y,p3z,"go");
  %hold on;
end
% NOW pdx,pdy and pdz HOLD THE x,y AND z COORDINATE OF THE DIFFERENTIAL OF THE PARAMETERIZED CURVE
%plot3(px,py,pz,"ro");
%hold on;
%plot3(pdx,pdy,pdz,"go");

L=0;		% INITIALIZE ARC-LENGTH TO ZERO
i=1;
while(i < 303)	% TOTAL 303 ITEMS
  a=sqrt( (pdx(i)-pdx(i+1))^2 + (pdz(i)-pdz(i+1))^2 + (pdy(i)-pdy(i+1))^2 ); %	DISTANCE BETWEEN 2 POINTS
  L=L+a;	% ADD TO LENGTH
  i++;
endwhile
% L GIVES THE ARC-LENGTH
PD = sqrt(pdx.^2 + pdy.^2 +pdz.^2);
%tmin=input('Enter tmin');
%tmax=input('Enter tmax');
tmin=0;tmax=0.8;		% tmin AND tmax ARE PROVIDED BY THE USER
SIGMA= @(t) 9*t*t + 3*t;	% FUNCTION FOR SPEED SIGMA IS PROVIDED BY THE USER
len = quad(SIGMA,tmin,tmax);	% len GIVES THE LENGTH COVERED IN TIME t
len_match=0;
i=1;
while(len_match <= len)			% TILL len IS NOT REACHED
  a=sqrt( (pdx(i)-pdx(i+1))^2 + (pdz(i)-pdz(i+1))^2 + (pdy(i)-pdy(i+1))^2 );
  len_match=len_match+a;		% ADD TO LENGTH
  i++;
endwhile
printf("The value of u for the particular len is:");
i
% PLOT THE CURVE IN TWO PARTS, TILL u IS REACHED IN RED AND AFTER u IS REACHED IN GREEN
% THE PARTICULAR u IS GIVEN BY i
for k=1:i
px1(k) =px(k);
py1(k) =py(k);
pz1(k) =pz(k); 
%  plot3(px(k),py(k),pz(k),"ro");
%  hold on;
endfor
plot3(px1,py1,pz1,"ro");
hold on;
for k=i+1:303
px2(k) =px(k);
py2(k) =py(k);
pz2(k) =pz(k); 
%  plot3(px(k),py(k),pz(k),"go");
%  hold on;
endfor
plot3(px2,py2,pz2,"go");
% PLOT THE DIFFERENTIAL CURVE AS WELL
for k=1:i
px1(k) =pdx(k);
py1(k) =pdy(k);
pz1(k) =pdz(k); 
%  plot3(px(k),py(k),pz(k),"ro");
%  hold on;
endfor
plot3(px1,py1,pz1,"ro");
hold on;
for k=i+1:303
px2(k) =pdx(k);
py2(k) =pdy(k);
pz2(k) =pdz(k); 
%  plot3(px(k),py(k),pz(k),"go");
%  hold on;
endfor
plot3(px2,py2,pz2,"go");
%
hold off;
print -djpg example1.jpg
