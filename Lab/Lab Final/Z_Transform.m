
% (1) Z Transform  X(n) = [1/16^n ]u(n)
syms z n
a=[1/16^n]* heaviside(n); %x(n) = [1/16^n]u(n)
ZTransform=ztrans(a); %Z transform
disp(ZTransform);
IZtransform = iztrans(ZTransform);
disp(IZtransform);

(2) Inverse Z-Transform X(n) = Z-1 [ X(Z)] , X(Z) = 3*Z / (Z+1)
syms Z n
a=iztrans(3*Z/(Z+1))
disp(a);
(3) Pole Zero Diagram for a Function in Z Domain Z plane command computes and display the pole-zero diagram of Z function.
The Command is Zplane(b,a)
To display the pole value, use root(a)
To display the zero value, use root(b)
X(Z) = [Z-2 + Z-1 ] / [1-2Z-1+3Z-2]

b=[ 1 1 ]
a= [1 -2 +3]
roots(a)
roots(b)
zplane(b,a);


% Z(4) transform of 2^n + 2^n*(n - 1)
syms n
f=2^n + 2^n*(n - 1)
ztrans(f)
%output 2*z/(z-2)^2

%(5) Inverse Z transform of 2*z/(z-2)^2
syms z
F = 2*z/(z-2)^2;
iztrans(F)
% Output 2^n + 2^n*(n - 1)



%(6) EXC: Use the MATLAB command "roots" to determine  the poles and  zeros of the following systems-
   %(i)	H(s)=(s^2+2)/(s^3+2s^2-s+1)  (ii) H(s)=(s^3+1)/(s^4+2s^2+1)   (iii) H(s)=(4s^2+8s+10)/(2s^3+8s^2+18s+20)   

   %(i)
clear
z=roots([1,0,2])
p=roots([1,2,-1,1])

(ii)
clear
z=roots([1,0,0,1])
p=roots([1,0,2,0,1])

%(iii)
clear
z=roots([4,8,10])
p=roots([2,8,18,20])

%(7) EXC:   Use the MATLAB command "pzmap” to plot  the poles and  zeros of the following systems-
         %(i)H(s)=(s^3+1)/(s^4+2s^2+1)
 clear
num=[1,0,0,1];
den=[1,0,2,0,1];
systf=tf(num,den)
pzmap(systf)


%Frequency Response
%The Freqz function computes and display the frequency response of given Z- Transform of the function
%freqz(b,a,npt,Fs)
%b= Coeff. Of Numerator
%a= Coeff. Of Denominator
%Fs= Sampling Frequency
%Npt= no. of free points between and Fs/2
X(Z) = [2+ 5Z-1+9Z-2+5Z-3+3Z-4]/ [5+ 45Z-1+2Z-2+Z-3+Z-4]

b=[2 5 9 5 3]
a= [5 45 2 1 1]
freqz(b,a);




