clear all;
close all;
[x,y]=meshgrid([0:3],[0:3]);

		f=x.*x+y.*y;
M = [-4.5 13.5 -13.5 4.5;9 -22.5 18 -4.5;-5.5 9 -4.5 1;1 0 0 0];
k=1;
for i = 0:0.1:1
	l=1;
	for j = 0:0.1:1
		
		S(k,l)=[i*i*i i*i i 1]*M*f*M'*[j*j*j j*j j 1]';
		l++;
	endfor
	k++;
endfor
surf(S);
