%% Implementacao: Metodos de Euler / Euler Melhorado (Runge-Kutta ordem 1 e 2)
%% EDO-PVI: y'=f(x,y), y(x0)=y0

function edopviModelo()
 clc
 format long

 % Instancias de testes
 % Indices deslocados de um, pois o Matlab nao tem posicao zero !
 %xn = 10; n = 20;   x = zeros(1,n); y = zeros(1,n); x(1) = 0; y(1) = 1;% Exemplo PVI-1: y'=y
 %xn = 1;  n = 20;  x = zeros(1,n); y = zeros(1,n); x(1) = 0; y(1) = 1000; % Exemplo PVI-1: y'= - x*y
 xn = 1;  n = 20;  x = zeros(1,n); y = zeros(1,n); x(1) = 0; y(1) = 0;% Exemplo PVI-1: y'= x^2+y^2
 
 h = (xn-x(1))/n;      % Tamanho do passo
 rk = 2;               % rk = 1: Euler;  rk = 2; Euler melhorado
 switch (rk)
  case 1
   fprintf( '\nMetodo de Euler - Runge-Kutta de primeira ordem \n\n');
   fprintf( 'Iter %2d:  x%02d: %12.9f   y%02d: %14.9f \n', 0, 0, x(1), 0, y(1));
   % Laco: Para i de 1 ate n. Notar que o indice jah estah corrigido
   for i = 1:n
   %   Calcular k1 igual a "h" multiplicado por f(x_i,y_i)
   %   Fazer x_i+1 = x_i + h
   %   Fazer y_i+1 = y_i + k1
    k1 = h * f(x(i), y(i));
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + k1;   
    fprintf( 'Iter %2d:  x%02d: %12.9f   y%02d: %14.9f \n', i, i, x(i+1), i, y(i+1));
   end
   % FimLaco

  case 2
   fprintf( '\nMetodo de Euler Aperfeicoado - Runge-Kutta de segunda ordem \n\n');
   fprintf( 'Iter %2d:  x%02d: %12.9f   y%02d: %14.9f \n', 0, 0, x(1), 0, y(1));
   % Laco: Para i de 1 ate n. Notar que o indice jah estah corrigido
   %   Calcular k1 igual a "h" multiplicado por f(x_i,y_i)
   %   Calcular k2 igual a "h" multiplicado por f(x_i + h,y_i + k1)
   %   Fazer x_i+1 = x_i + h
   %   Fazer y_i+1 = y_i + (k1+k2)/2
   for i = 1:n
       k1 = h*f(x(i),y(i));
       k2 = h*f(x(i) + h, y(i) + k1);
       x(i+1) = x(i) + h;
       y(i+1) = y(i) + (k1+k2)/2;
       fprintf( 'Iter %2d:  x%02d: %12.9f   y%02d: %14.9f \n', i, i, x(i+1), i, y(i+1));
   end
   % FimLaco

 end
  
end

function z = f(x,y)
 %z = y;
 %z = -x*y;
 z = x^2+y^2;
end



















