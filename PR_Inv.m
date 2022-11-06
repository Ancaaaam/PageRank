function B= PR_Inv(A);
  % Gram-Schimdt pt a afla Q si R
n = length(A);
  Q = zeros(n);
  R = zeros(n);
  for i = 1:n
    R(i,i) = norm(A(:,i));
    Q(:,i) = A(:,i) / R(i,i);
    for j = i+1:n
      R(i,j) = Q(:,i)' * A(:,j);
      A(:,j) = A(:,j) - Q(:,i) * R(i,j);
    endfor
  endfor
  % aflam inversa rezolvand n ecuatii
  n= length(A);
  for i=1:n
    nn=length(R);
    x=zeros(nn,1);
    b=Q'(:,i);
    x(nn)=b(nn)/R(nn,nn);
    for ii= nn-1:-1:1 
      sum= 0.0;
      for jj = ii+1:nn
        sum = sum+ R(ii,jj)*x(jj);
      endfor
      x(ii)=(b(ii)-sum)/R(ii,ii);
    endfor
    B(:,i)=x;
  endfor
  endfunction
