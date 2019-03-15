function [y,ny,r] = deconv_m(x,nx,h,nh)
nyb=nx(1)-nh(1);
nye=nx(length(nx))-nh(length(nh));
ny=[nyb:nye];
[y,r]=deconv(x,h);
end
