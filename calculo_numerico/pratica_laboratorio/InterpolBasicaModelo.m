% Forma Basica do polinomio interpolador - Exemplos

clear  all
clc
format long

% Exemplo 1
x = [1; 2; 3];
y = [6; 3; 2];         % f(x) = 6/x;
v = 2.5;

% Exemplo 2
%x = [-1; 0;  2];
%y = [ 4; 1; -1];
%v = 1;

% Exemplo 3
%x = [ -2;  -1;  0;  1;  2];
%y = [ 33; -11; -9; -3; 13];
%v = 3;

% Processamento
n = length(x)-1;    % n eh o grau do polinomio interpolador

% Criar matriz X
%X = zeros(n+1);
%for i=1:n+1
    %for j=1:n+1
        %X(i,j) = x(i)^(j-1);
    %end
%end
X = fliplr(vander(x));
disp(X);

% Calcular o vetor "a" resolvendo sistema com recursos do Matlab
a = X\y; %inv(X)*y;
% aplicar o "flip" ao vetor "a"
a = flip(a);

% Impressao dos coeficientes
disp('Coeficientes do polinomio interpolador'); %disp(a);
for i=1:(n+1)
 fprintf('coef. de x%1d: %1.2f\n', n-i+1, a(i));
end
disp('');

% Impressao do valor interpolado
% Usar funcao polyval e armazenar na variavel "r"
r = polyval(a, v); %v sendo o valor de x que precisa ser interpolado
disp('Valor interpolado:');
disp(r);
disp('');

a = [0;1;1];
% Impressao do polinomio interpolador
fprintf('Polinomio Interpolador:\n');
fprintf('p%1d(x)= ',n);
for i=1:(n+1)
   if a(i) ~= 0
     if i == 1
         if a(i) == -1
            fprintf('-');
         elseif a(i) ~= 1
            fprintf('%1.4f', a(i));
         end
     else
         if a(i) == -1
            fprintf('-');
         elseif a(i) ~= 1
             if a(i-1) == 0
                fprintf('%1.4f', a(i));
             else
                fprintf('%1.4f', a(i));
             end
         elseif a(i) == 1 && i == n+1
             fprintf('%1.4f', a(i));
         end
     end 
     if n-i+1 > 1
       fprintf('x^%d ', n-i+1);
     elseif n-i+1 == 1 
       fprintf('x ');
     end
   elseif i == n+1 && a(i-1)== 0
       fprintf('%1.4f', a(i));
   end
end
fprintf('\n\n');
%NECESSARIO CORRIGIR ESSA ROTINA DE OUTPUT
