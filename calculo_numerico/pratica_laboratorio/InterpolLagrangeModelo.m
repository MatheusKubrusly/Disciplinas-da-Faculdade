%%  Este programa calcula o polinomio interpolador na FORMA DE LAGRANGE
%%  Interpola conjunto de pontos (xk,yk), para k = 0,...,n
%%  pn(x) = Sum(k=0,n) yk Lk(x)
%%          (x -x0)(x -x1)...(x -x(k-1))(x -x(k+1))...(x -xn)
%%  Lk(x) = -------------------------------------------------,  k=0,...,n.
%%          (xk-x0)(xk-x1)...(xk-x(k-1))(xk-x(k+1))...(xk-xn)

function InterpolLagrangeModelo
 clc
 format long

 % Exemplo1 - funcao y = 6./t
 x = [1 2 3];

 % Exemplo2 - funcao y = 12./(t+2)
  % x = [-1 0 1 2];
  %x = [-1 0 1 2 10];

 y = f(x); % "y" é uma lista com valores de f(xi), com i = 0,...,n
 %disp(y);
 n = length(x)-1;      % n eh o grau do polinomio interpolador

 % Calculo dos "coeficientes" ck = yk/denominador da forma de Lagrange
 % Para k variando de 1 até n+1 (pois o Matlab nao tem indice "0")
 %  Calcular o denominador "m" de cada parcela Lk da forma de Lagrange
 %  Calcular c(k) como y(k)/m
 c = zeros(1, n+1); %criando uma matriz linha
 for i = 1:n+1
     m = 1; %reinicializar o produtório para cada denominador calculado
     for k = 1:n+1
        if i ~= k
            m = m * (x(i) - x(k));
        end
     end
     c(i) = y(i) / m;
 end

 % Impressao dos coeficientes
 disp('Coeficientes do polinomio de Lagrange:');
 for k=1:(n+1)
  fprintf('c%1d: %1.2f\n', k, c(k));
 end
 disp('');

 %Rotina de impressao do polinomio
 disp('Polinomio de Lagrange:');
 fprintf('p%d(x) = ', n);
 for i=1:n+1
     fprintf('%+.2f', c(i));
     for j=1:n+1
         if i ~= j
             if x(j) >= 0
                fprintf('(x - %.0f)', x(j));
             else
                fprintf('(x + %.0f)', x(j) * -1);
             end
         end
     end
 end
 fprintf('\n');

 x_plot = -2:0.1:11;
 y_plot = f(x_plot);
 grid on
 p_plot = p(x_plot, c, n, x);
 plot(x_plot,y_plot);
 hold on
 plot(x_plot, p_plot);

end

function y = f(t)
 y = 6./t;
 % y = 12./(t+2);
end

function p_plot = p(t, c, n, x)
    tam = length(t);
    p_plot = zeros(1, tam);
    for i = 1:tam
        s = 0;
        p = 1;
        for k = 1:n+1
            for j = 1:n+1
                if j ~= k
                    p = p * (t(i) - x(j));
                end
            end
            s = s + (c(k) * p);
        end
        p_plot(i) = s;
    end
end
