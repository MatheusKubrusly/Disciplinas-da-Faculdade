% Este programa calcula o polinomio interpolador na FORMA DE NEWTON
%  pn(x) = d0 + d1(x-x0) + d2(x-x0)(x-x1) +...+ dn(x-x0)(x-x1)...(x-x(n-1))
%  onde dk, k=0,...,n sao as diferencas divididas de ordem k entre os
%  pontos (xj,f(xj)), j=0,1,...,k: dk=f[x0,x1,...,xk].

function InterpolNewtonModelo()
 clc
 format long

 %       Diferencas divididas
 %         ordem (j)
 %    | 0  ....   j-1       j ..... n
 % ---+-------------------------------
 % x0 |y0          .        .
 %  . | .          .        .
 % xi |yi  ....   i,j-1 -> i,j
 %    |         i+1,j-1 /
 %    |          .
 %    |         .
 %    |        .
 %    |       .
 %    |      .
 %    |     .
 %xi+j|yi+j
 %  . |
 %  . |
 % xn |yn

 %       Implementacao com uma matriz:
 %            dd_i+1,j-1 - dd_i,j-1
 %  dd_i,j = -----------------------
 %                x_i+j - x_i

 % Tarefa: interpolaÃ§Ã£o da funÃ§Ã£o f(x) nos pontos dados pelo vetor x

 % os valores de x devem estar em ordem crescente!
 % Exemplo1 - funcao y = 6./t
 %x = [1 2 3];

 % Exemplo2 - funcao y = 12./(t+2)
 %x = [-1 0 1 2];
 x = [-1 0 1 2 10];

 y = f(x);
 n = length(x)-1;      % n eh o grau do polinomio interpolador

 % essa matriz irÃ¡ armazenar os valores da tabelinha para
 % cÃ¡lculo das diferenÃ§as divididas
 dd = zeros(n+1);      % Comecamos com uma matriz zerada
 dd(:,1) = y;          % Primeira coluna sÃ£o os valores de y

 % Montar loop de ordem  (1 ate n)
 %  Montar loop de linha (0 ate ???)
 %   Fazer dd(i,j) = (Num) / (den);
 % CUIDADO: somar 1 a cada indice, pois no Matlab nao existe posicao zero !!!
 for i = 1:n
    for j = i+1:(n+1)
		dd(j,i+1) = (dd(j,i) - dd(j-1,i)) / (x(j) - x(j-i));
    end
 end


 % Impressao dos coeficientes
 % as diferenças divididas estarão na diagonal principal da matriz
 disp('Coeficientes do polinomio de Newton:');
 for j=0:n             % ordem 0 ate ordem n
  fprintf('dif.div.%d: %.4f\n', j, dd(j+1,j+1));
 end
 disp('');             % pula linha

 % Impressao do Polinomio de Newton
  printpol(x,dd);
  calcula_erro(n, x, dd)
  
  
  %plotar a função
  x_plot = -1:0.1:10;
  disp(x_plot);
  y_plot = plot_func(n, x_plot, x, dd);
  plot(x_plot, y_plot);
  hold on;
  plot(x, y); %função exata
  xlabel('x');
  ylabel('y = 6./x');
  title('Gráfico da função y = f(x)');
  grid on;
  
  
end

function y = f(t)
  %y = 6./t;             
  y = 12./(t+2);
end

function printpol(x,dd)
 n = length(x)-1;

 fprintf('Polinomio de Newton:\n');
 fprintf('N%d(x)= ',n);

 % Imprimir polinomio
 for i = 1:(n+1)
   if i == 1
    fprintf('%.4f', dd(i,i));
   else
    fprintf('%+.4f', dd(i,i));
   end
   if i ~= 1
     for j = 1:(i-1)
      if x(j) ~= 0
        fprintf('(x%+d)', x(j) * (-1));
      else 
        fprintf('(x)');
      end
     end
   end
   %fprintf(' ');
 end
 fprintf('\n\n');
end

function calcula_erro(n, x, dd)
  x_aprox = input('Digite um valor inteiro de x para encontrar seu f(x) aproximado: ');
  soma = 0;
  for i = 1:(n+1)
    if i == 1
      soma = soma + dd(i,i);
    else
      produto = 1;
      for j = 1:(i-1)
        produto = produto * (x_aprox - x(j));
      end
      soma = soma + (dd(i,i) * produto);
    end
  end
  y_aprox = f(x_aprox);
  fprintf('Valor exato para f(%d): %.4f\n', x_aprox, y_aprox);
  fprintf('Aproximação para f(%d): %.4f\n', x_aprox, soma);
  dist_absoluta = abs(soma - y_aprox);
  dist_relativa = dist_absoluta / abs(y_aprox);
  fprintf('Erro absoluto de aproximação: %.4f\n', dist_absoluta);
  fprintf('Erro relativo de aproximação: %.4f\n', dist_relativa);
end

function y_plot = plot_func(n, x_plot, x, dd)
  num = length(x_plot);
  y_plot = zeros(1,num);
  for m = 1:num
      soma = 0;
      for i = 1:(n+1)
        if i == 1
          soma = soma + dd(i,i);
        else
          produto = 1;
          for j = 1:(i-1)
            produto = produto * (x_plot(m) - x(j));
          end
          soma = soma + (dd(i,i) * produto);
        end
      end
    y_plot(m) = soma;
  end
end
