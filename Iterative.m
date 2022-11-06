function R = Iterative(nume, d, eps)
 fileID = fopen(nume,'r');
 T = fscanf(fileID,'%f');
 N = T(1,1);
 E = dlmread(nume,' ',[1 0 N+2 N]);
 val1= E(N+1,1);
 val2=E(N+2,1);
 A= zeros(N,N);
 M= zeros(N,N);
 for i = 1:N
   k= E(i,2);
   ok=1;
   for j=1:k
     z= E(i,j+2);
     A(i,z)=1;
     M(z,i)=1/k;
     if(z==i)
     ok=0;
     endif
   endfor
   A(i,i)=0;
   if(ok==0)
    for j=1:k
     z= E(i,j+2);
    if(z==i)
   M(z,i)=0;
  else
   M(z,i)=1/(k-1);
   endif
    endfor
   endif
 endfor
 %initial avem 1/N peste tot
 PR(1:N,1)=1/N;
 ok=1;
 while (ok==1)
   R= d*M*PR+(1-d)/N;
   if norm(R-PR)<eps
     %conditia este indeplinita, deci s-a aflat R
     R=PR;
     ok=0;
   endif
   PR=R;
 endwhile
 endfunction
