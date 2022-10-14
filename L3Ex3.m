function [] = L3Ex3(A,B,a)
A(1,3) = a;
A(2,3) = 2*a;
A(3,1) = a;
D = A;
n = length(A);
for j = 1:(n-1)
    for i = (j+1):n
        if (A(j,j) == 0)
            C = A(j,:);
            A(j,:) = A(j+1,:);
            A(j+1,:) = C;
            C = B(j,1);
            B(j,1) = B(j+1,1);
            B(j+1,1) = C;
        else
            m = A(i,j)/A(j,j);
            A(i,j) = A(i,j) - A(j,j)*m;
            for k = (j+1):n
                A(i,k) = A(i,k) - A(j,k)*m; 
            end
            B(i) = B(i) - B(j)*m;
         end
     end
end
fprintf('O sistema equivalente � definido por: \n');
disp(A)
disp(B')
if(det(A) == 0)
    fprintf('O sistema n�o possu� solu��o definida \n')
else
x = zeros(n,1);
x(n) = B(n)/(A(n,n));
for i = (n-1):-1:1 
    soma = 0;
    for j = (i+1):n
        soma = soma + x(j)*A(i,j);
    end
    x(i) = (B(i) - soma)/A(i,i);
end
fprintf('O resultado do sistema �: \n')
disp(x)
fprintf('Verifica��o \n')
C = D*x;
disp(C)
C = -det(A);
fprintf('A determinante da matriz triangular �: %d \n', C)
end
end
