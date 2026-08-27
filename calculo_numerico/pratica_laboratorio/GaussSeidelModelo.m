
function GaussSeidelmodelo
  % Metodo de Gauss-Seidel para resolver sistema linear Ax=b
  clc
  format short

  % Calcular a solução x para cada sistema abaixo.
  % Exemplo 1
  %A = [3 -1 -1; 1  5  1; 1  1  7];
  %b = [-2; 14; 24];

  % Exemplo 2
  %A = [1  5  1; 0 -1 -1; 1  1  7];
  %b = [14; -2; 24];

  % Exemplo 3
  %A = [1  1; 1 -3];
  %b = [3; -3];

  % Exemplo 4
  A = [7 4 3 5 8; 0 4 8 5 2; 6 9 9 4 6; 0 9 9 7 0; 9 9 8 0 3];
  b = [84; 62; 97; 73; 66];


  n = size(A,2);      % numero de variaveis do problema
  x = zeros(n,1);     % solucao inicial (aproximada) em forma de matriz coluna

  ee = 10^(-8);       % Precisao ou Tolerancia para o teste de parada
  MAXITER = 1000;     % Numero maximo de iteracoes
  conv = false;       % Variavel que informa se convergiu ou nao
  teste_conv = false; % tentando forçar a convergência do sistema


  % Realizar a iteracao de Gauss Seidel sobre o vetor x
  % Para a iteracao "iter" de 1 até MAXITER:
  %   Para as linhas i de 1 até n:
  %     Fazer o acumulador S = 0;
  %     Para a coluna j de 1 até n:
  %       Se a coluna j for diferente de i:  (diferente no Octave: ~=)
  %         Fazer S = S + A(i,j)*x(j)
  %     Fazer x(i) = (b(i) - S)/A(i,i)

  for iter = 1:MAXITER
    for i = 1:n #percorrendo as linhas
      S = 0;
      for j = 1:n #percorrendo as colunas
        if j ~= i #evita que o valor do coeficiente da própria variável que está sendo calculada seja considerado
          S = S + A(i,j)*x(j); #por exemplo, se estamos calculando x1, então S irá considerar os coeficientes de x2 e x3
        endif
      endfor
      x(i) = (b(i) - S) / A(i,i);
    endfor

    %   Se norm(A*x-b,inf) < ee  % Testa se x eh solucao aproximada
    %     Se sim, fazer conv = true e abandonar iteracoes (usar "break")

    if norm(A*x - b, inf) < ee
      conv = true;
      break
    endif
  endfor

  % Se "conv" for "verdadeiro" (true)
  %   Imprimir "O metodo convergiu !!"
  %   Imprimir o número de iteracoes utilizadas (valor de iter)
  %   Imprimir o valor de "x" (solucao aproximada)
  % Se "conv" for "falso" (false)
  %   Imprimir "O metodo nao convergiu !!"
  if conv == true
    fprintf("O metodo convergiu !!\n");
    fprintf("Número de iteracoes utilizadas: %d\n", iter);
    for i = 1:n
      fprintf("valor de x%d: %f\t", i, x(i));
    endfor
    fprintf("\n");
  else
    fprintf("O metodo nao convergiu !!\n");
  endif
endfunction

function verifica_convergencia
  converge
  
endfunction


