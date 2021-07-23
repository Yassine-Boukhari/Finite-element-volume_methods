function [Uex, Uap]= sol(eps, h, avecB)
%% Veuillez choisir entre les fonction 
%[Uex, Uap]= sol(eps, h, true)
%[Uex, Uap]= sol(eps, h, false)
%pour choisir entre la première méthode d'approximation(true) ou bien la seconde (false)
M = 1/h - 1;
x = linspace(0, 1, M+2);
%% Solution exacte 
uex = @(x) x - (exp(x/eps) - 1)/(exp(1/eps)-1);
Uex = zeros(100, 1);
y = linspace(0, 1, 100);
for i=1:100
    Uex(i) = uex(y(i));
end
% plot(uex,'b-'); 
% hold on;  
%% Solution numérique
M = 1/h - 1;
col = [2*eps/h; -eps/h - 0.5; zeros(M-2,1)];
row = [2*eps/h; -eps/h + 0.5; zeros(M-2,1)];
A = toeplitz(col, row);
if avecB
    B = toeplitz( [2/h; -1/h; zeros(M-2,1)] );
    if h/eps<6
        beta = h^2/(12*eps);
    else
        beta = h/2;
    end
    A = A + beta*B;
end
b = h*ones(M,1);
Uap = A\b;
Uap = [0; Uap; 0];
plot(y, Uex, 'b-'); 
hold on;  
plot(x, Uap, 'k');
end


