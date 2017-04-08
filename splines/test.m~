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

% k IS USED TO ITERATE ON THE PARAMETERIZED CURVE
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

% FINALLY px,py AND pz HOLD THE COORDINATES OF THE PARAMETERIZED CURVE NOW. A 3 SEGMENT B-SPLINE USING 6 POINTS
%plot3(px,py,pz,"ro");

% PART A OF THE QUESTION
i=1;
l=0;		% INITIALIZE LENGTH TO ZERO
while(i < 303)	% TOTAL 303 ITEMS
  a=sqrt( (px(i)-px(i+1))^2 + (pz(i)-pz(i+1))^2 + (py(i)-py(i+1))^2 ); %	DISTANCE BETWEEN 2 POINTS
  l=l+a;	% ADD TO LENGTH
  i++;
endwhile
arc_len=l;
arc_len		% PRINT THE ARC LENGTH
part=arc_len/10;
s=input("input length ");	% TAKE INPUT THE LENGTH DESIRED FOR WHICH t IS TO BE CALCULATED
s;
% NOW USE t=(s/l)*(tmax-tmin)	WE TAKE tmax=1 AND tmin=0
t=s/l				% VALUE OF t
l=0;
i=1;
a=0;
while(l <= s)			% TILL THE INPUT LENGTH s IS NOT REACHED
  a=sqrt( (px(i)-px(i+1))^2 + (pz(i)-pz(i+1))^2 + (py(i)-py(i+1))^2 );
  l=l+a;			% ADD TO LENGTH
  i++;
endwhile
i;
% PLOT THE CURVE IN TWO PARTS, TILL t IS REACHED IN RED AND AFTER t IS REACHED IN GREEN
for k=1:303
if(floor(mod(k,303/11))==0)
	px1(k) =px(k);
	py1(k) =py(k);
	pz1(k) =pz(k); 
	plot3(px1,py1,pz1,"ro");
	hold on;
endif
endfor
l=0;
for k=2:floor(303/11)
	l=l+sqrt((px(k)-px(k+1))^2 + (pz(k)-pz(k+1))^2 + (py(k)-py(k+1))^2);
endfor
l
l=0;
for k=floor(303/11):2*floor(303/11)
	l=l+sqrt((px(k)-px(k+1))^2 + (pz(k)-pz(k+1))^2 + (py(k)-py(k+1))^2);
endfor
l
l=0;
for k=2*floor(303/11):3*floor(303/11)
	l=l+sqrt((px(k)-px(k+1))^2 + (pz(k)-pz(k+1))^2 + (py(k)-py(k+1))^2);
endfor
l
l=0;
for k=3*floor(303/11):4*floor(303/11)
	l=l+sqrt((px(k)-px(k+1))^2 + (pz(k)-pz(k+1))^2 + (py(k)-py(k+1))^2);
endfor
l
