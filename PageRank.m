function [R1 R2]= PageRank(nume,d,eps)
  fileID = fopen(nume,'r');
 T = fscanf(fileID,'%f');
 N = T(1,1);
 E = dlmread(nume,' ',[1 0 N+2 N]);
 val1= E(N+1,1);
 val2=E(N+2,1);
 %aflam matricea de adiacenta A si M cu formula de la adresa [1]
 A= zeros(N,N);
 M= zeros(N,N);
for i = 1:N
   k= E(i,2); %ordinul paginii
   ok=1;
   for j=1:k 
     z= E(i,j+2); %pagina catre care are link pagina i
     A(i,z)=1;
     M(z,i)=1/k;
     if(z==i)
     ok=0;
     endif
   endfor
   A(i,i)=0;
   %modificam A si M daca avem vreo pagina cu link catre ea insasi
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
 noduri= [1:N];
  R1=Iterative(nume,d,eps);
  R2=Algebraic(nume,d);
 ffisier_out=strcat(nume,'.out');
 fisier_out=fopen(ffisier_out,'w');
 fprintf(fisier_out,'%d \n',N);
 fprintf(fisier_out,'%7.6f \n',R1);
  fprintf(fisier_out,'\n');
 fprintf(fisier_out,'%7.6f \n',R2);
  fprintf(fisier_out,'\n');
 n = length(R2);
 %sortam descrescator pe R2 si vectorul noduri
  for i = 1:n-1
    for j = i+1:n
      if R2(i) <= R2(j)
        aux = R2(i);
        R2(i) = R2(j);
        R2(j) = aux;
        aux = noduri(i);
        noduri(i) = noduri(j);
        noduri(j) = aux;
      endif
    endfor
  endfor
  F = Apartenenta(R2, val1, val2);
  for i=1:n
    if(F(i)<0.0)
      F(i)=0.000000; %trebuie afisat 0 daca F(i)<0
      endif
    fprintf(fisier_out,'%d %d %.6f\n',i,noduri(i),F(i));
  endfor
  fclose(fisier_out);
  fclose(fileID);
  endfunction
