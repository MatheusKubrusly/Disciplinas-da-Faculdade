% Este programa calcula o valor de uma funcao por serie (polinomio) de Taylor
% Taylor: f(x) = Sum(0,infty,f^(n)(a)/n!*(x-a)^n)
% Se a=0: f(x) = Sum(0,infty,f^(n)(0)/n!*x^n)   (serie de Maclaurin) 

function CalcTaylorModelo()
 clc
 format long

 disp('Calculo da expansao de Taylor de uma funcao em torno de a = 0');
 x = input('Entre com o valor de x: ');
 g = input('Entre com o grau do polinomio: ');

 s = 0;
 for k=0:g
  s = s + coef(k)*x^k/factorial(k);
 end

 %            ======= coef(k) = f^(n)(0) ========
 %  --------------------------------------------- 
 %  k         0  1  2  3  4  5  6  7  8  9 10 11 
 %  =============================================
 %  e^x       1  1  1  1  1  1  1  1  1  1  1  1 
 %  cos(x)    1  0 -1  0  1  0 -1  0  1  0 -1  0
 %  sen(x)    0  1  0 -1  0  1  0 -1  0  1  0 -1
 %  =============================================
 %  mod(k,4)  0  1  2  3  0  1  2  3  0  1  2  3

 fprintf('Taylor: %12.10f\n',s);
 fprintf('Exato : %12.10f\n',f(x));
 syms x;
 disp(taylor(exp(x),x,0,'Order',g+1));
 disp(taylor(sin(x),x,0,'Order',g+1));
 disp(taylor(cos(x),x,0,'Order',g+1));
end

function y = f(t)
  %y = exp(t);
  %y = cos(t);
  y = sin(t);
end

function c = coef(k)
 %%% funcao exponencial 
 % Implementar coeficientes para funÃ§Ã£o exponencial
 %c = real((1i)^4);
  
 %%% funcao cosseno 
 % Implementar coeficientes para funÃ§Ã£o cosseno       
 %{
 switch mod(k,4)
     case 0
         c = 1;
     case 1
         c = 0;
     case 2
         c = -1;
     case 3
         c = 0;     
 end
 %}
 %c = real((1i)^k);
     
 


 %%% funcao seno 
 % Implementar coeficientes para funÃ§Ã£o seno
 %{
    switch mod(k,4)
         case 0
             c = 0;
         case 1
             c = 1;
         case 2
             c = 0;
         case 3
             c = -1;     
    end 
 %}
 c = real((1i)^(k+3));
end


