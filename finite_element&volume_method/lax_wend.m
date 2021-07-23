function [u,t,x] =lax_wend(dt,h,T,caslin)
%% Remarque 
%caslin=signifie que nous voulons choisir le cas où la fonction f 
%...sera linéaire si on met comme argument true 
%% Schéma Lax-Wendroff
alpha=(dt/h);
%% cas linéaire
%% Données
%%Discrétisation spatiale (M+2=nombre d'itération)
M=round(1/h-1); %cas h=0.1 d'où M+1=10
%xi=i*h; 
x=(0:h:1); %vecteur x
%sans oublier les conditions aux bords
%% Discrétisation temporel
%ti=i*dt et t0=0
t=(0:dt:T);%vecteur t c'est avec quoi on fera avancer la boucle for
N=T/dt;
%% Initialisation 
u=zeros(M+2,N+1);
%f=@(x,t)(cos(t)+pi^2)*exp(sin(t))*sin(pi*x);
%% Condition initiale pour l'espace (aux bord)
u(1,:) = zeros(1,N+1);
u(M+2,:) =zeros(1,N+1);
%% cond initiale pour le temps (t=0)
g=@(x)sin(pi*x);
for i=1:M+2
    u(i,1)=g(x(i));
end
%u(:,1) = sin(pi*x);
%% fonction f 
f1=@(y)y;%cas linéaire
f2=@(y)y^2/2;%cas non linéaire
syms y;  
%% Cas explicite
if caslin
    f=f1;
    df=eval(['@(y)' char(diff(f(y)))]); %pour rendre la fonction dérivée maniable
else
    f=f2;
    df=matlabFunction(diff(f,y));
end
for n=1:N %boucle  temps
    for j=2:M+1 %boucle spatiale
        u(j,n+1)=u(j,n)-alpha/2*(f(u(j+1,n))-f(u(j-1,n)))+alpha^2/2*(df(u(j+1,n))+df(u(j,n)))/2 *(f(u(j+1,n))-f(u(j,n)))-alpha^2/2*(df(u(j-1,n))+df(u(j,n)))/2 *(f(u(j,n))-f(u(j-1,n)));               
    end
end
return
end
