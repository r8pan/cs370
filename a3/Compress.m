function [Y, drop] = Compress(X,tol)
%scripts for compression process 

I = im2double(X);

img = cell(16,16);
nonzero = 0;
dropped = 0;

for i = 1:16
  for j = 1:16
    img{i,j} = I(((i-1)*32+1):((i-1)*32+32),((j-1)*32+1):((j-1)*32+32));
    img{i,j} = fft2(img{i,j});
    F_max = max(img{i,j}(:));
    for m = 1:32
      for n = 1:32
	if (img{i,j}(m,n) ~= 0)
          nonzero = nonzero + 1;
	end
	if abs(img{i,j}(m,n)) <= F_max*tol
	  img{i,j}(m,n) = 0;
          dropped = dropped + 1;
        end
      end
    end
    img{i,j} = real(ifft2(img{i,j}));
  end	  
end

Y = zeros(512,512);
for i = 1:512
  for j = 1:512
    Y(i,j) = img{ceil(i/32),ceil(j/32)}(mod(i-1,32)+1,mod(j-1,32)+1);   
  end
end

drop = dropped/nonzero;
  
return
