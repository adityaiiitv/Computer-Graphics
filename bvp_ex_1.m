clear all;
close all;

x = linspace(0,1,20);
solinit.x = x;
solinit.y = [sqrt(2)*pi*sin(pi*(1-x)+pi/4);
	-sqrt(2)*pi*cos(pi*(1-x)+pi/4);
	sqrt(2)*cos(pi*(1-x)+pi/4);
	sqrt(2)*sin(pi*(1-x)+pi/4)];



f = @(x,y)[-2*y(1)*y(2)*y(4)/(1+y(3)^2+y(4)^2);
	-2*y(1)*y(2)*y(3)/(1+y(3)^2+y(4)^2);
	y(1);
	y(2)];
g = @(ya,yb)[%ya(1)+pi;
	%ya(2)-pi;
	ya(3)+1;
	ya(4)+1;
	%yb(1)-pi;
	%yb(2)+pi;
	yb(3)-1;
	yb(4)-1];

%options = bvpset('RelTol','10^(-1)','AbsTol','10^(-1)','Vectorized','on');
opti.RelTol = 10^(-1);
opti.AbsTol = 10^(-1);
sol = bvp4c(f,g,solinit,opti);
plot3(sol y(3,:),sol y(4,:),sol y(4,:));% error
