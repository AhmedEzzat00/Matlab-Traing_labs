
% Example 1 :
%-------------------
% X3(Z) = 2z^3+7z^2+4z^1+9.
% X1(Z) = z^2+1

x3_D=[2 7 4 9 ];
x1_D=[1 0 1];
[x2_D,r]=deconv(x3_D,x1_D);

% Example 2 :
% *********************
% X3(Z) = 6 + 17z + 34z^2 + 43z^3 + 38z^4 + 24z^5.
% X1(Z) = 2 + 3z + 4z^2

x3_DM = [6,17,34,43,38,24];
nx3_DM= [0:5];
x1_DM=[2,3,4];
nx1_DM = [0:2];
[y_DM,ny_DM,r_DM]= deconv_m(x3_DM,nx3_DM,x1_DM,nx1_DM)

% Exampe 1 :
% ******************
% X(z) = z/(3z^2-4z+1).

b = [0,1,0];
a = [3,4,1];
[R,P,C] = residuez(b,a);

% The Zero-pole diagram:
% ********************************
% X(z) = z/(z-0.5)(z+0.75)

z=[0];
F= [0.5;-0.75];
zplane(z,F);



