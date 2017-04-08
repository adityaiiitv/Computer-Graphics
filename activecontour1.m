clear all;
close all;

I = imread('circle.jpg');
[m,n] = size(I);
%B = [	.2 .3 .2;
%	.3 .4 .2;
%	.2 .3 .3];
%IB = filter2(B,I);
[Ix,Iy] = gradient(double(I));
EI = -(Ix.^2+Iy.^2);
[IIx, IIy] = gradient(EI);
%[EIx, EIy] = gradient(EI);
III = sqrt(IIx.^2+IIy.^2);
EIx = IIx/max(max(III));
EIy = IIy/max(max(III));

% ------ Initialize a contour -------
figure;
imshow(I); hold on;
[cx,cy] = ginput();
t = 0:1/length(cx):1;
N = 20;
T = 0:1/N:1;
cx = [cx;cx(1)];
cy = [cy;cy(1)];
C = interp1(t,[cx cy],T,"cubic");
C(end,:) = [];
plot(C(:,1),C(:,2),'r');
%hold off;
gamma = 1;
D = C;
iter = 300;
% ---- Flag for explicit(1)/implicit(0) euler ----
FLAG = 1; 
%------------------------------------------

for count = 1:iter

%------------------------------------
%------ Generate Matrix A -----
%
%bC(i-2)+(-a-4b)C(i-1)+(2a-2b)C(i)+(-a-4b)C(i+1)+bC(i+2)+ECx(i)=0
%
dD = diff(D);
h = sqrt(dD(:,1).^2+dD(:,2).^2);
h(end+1) = sqrt((D(end,1)-D(1,1))^2+(D(end,2)-D(1,2))^2);
a = 1*ones(length(D),1)./h.^2; 
b = .1*ones(length(D),1)./h.^4;
E = eye(N);
% --- multiple of C(i)
a0 = a + shift(a,1);
b0 = shift(b,-1)-4*b+shift(b,1);
D0 = a0+b0;
% --- multiple of C(i+1)
a1 = -shift(a,1);
b1 = -2*b-2*shift(b,1);
D1 = a1+b1;
% --- multiple of C(i+2)
b2 = shift(b,1);
D2 = b2;
% --- multiple of C(i-1)
a_1 = -a;
b_1 = -2*shift(b,-1)-2*b;
D_1 = a_1+b_1;
% --- multiple of C(i-2)
b_2 = shift(b,-1);
D_2 = b_2;
% Matrix A
A = diag(D0)+diag(D1(1:N-1),1)+diag(D2(1:N-2),2)+diag(D_1(2:N,1),-1)+diag(D_2(3:N,1),-2);
A(end,1) = D1(N,1); A(end,2) = D2(N,1); 
A(end-1,1) = D2(N-1,1);
A(1,end)=D_1(1,1); A(1,end-1) = D_2(1,1); 
A(2,end-1) = D_2(2,1);


% ---------------------------------

% ----- Write update rule ----------
% Gradient Descent
% 

	ECx = interp2(1:m,1:n,EIx,D(:,1),D(:,2));
	ECy = interp2(1:m,1:n,EIy,D(:,1),D(:,2));
	if(FLAG==1)
		Ctemp(:,1) = (A+gamma*E)\(gamma*D(:,1)-ECx);
		Ctemp(:,2) = (A+gamma*E)\(gamma*D(:,2)-ECy);
	else
		Ctemp(:,1) = D(:,1)-gamma*(A*D(:,1)+ECx);
		Ctemp(:,2) = D(:,2)-gamma*(A*D(:,2)+ECy);
	endif
%	pause(.5);
	if(mod(count,10)==0)
		pause(.5);
		plot([Ctemp(:,1); Ctemp(1,1)],[Ctemp(:,2); Ctemp(1,2)],'b');  hold on;
	endif
	D = Ctemp;
end
plot([Ctemp(:,1); Ctemp(1,1)],[Ctemp(:,2); Ctemp(1,2)],'linewidth',3,'g'); 
hold off;