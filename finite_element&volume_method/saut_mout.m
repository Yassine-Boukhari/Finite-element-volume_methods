function [u,t,x]=saut_mout(dt,h,T,caslin)
%% Remarque 
%caslin=signifie que nous voulons choisir le cas où la fonction f 
%...sera linéaire si on met comme argument true 
%% Schéma Saute-mouton
alpha=(dt/2*h);
%% cas linéaire
%% Données
%%Discrétisation spatiale
M=round(1/h-1); %cas h=0.1 d'où M+1=10
%xi=i*h; 
x=(0:h:1); %vecteur x
%sans oublier les conditions aux bords
%% Discrétisation temporel pour dt=0.001
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
f1=@(u)u;%cas linéaire
f2=@(u)u^2/2;%cas non linéaire
%% Cas explicite
%% Choix entre le cas linéaire ou non linéaire
if caslin
    f=f1;
    
else
    f=f2;
end
%% condition pour faire marcher le cas saute-mouton

%% calcul pour le cas u(j,n-1)
for j=2:M+1
u(j,2)=u(j,1)-alpha*(f(u(j+1,1)) - f(u(j-1,1)));
end
for n=2:N %boucle  temps
    for j=2:M+1 %boucle spatiale
        u(j,n+1)=u(j,n-1)-alpha*(f1(u(j+1,n))-f1(u(j-1,n)));                 
    end
end
u=u;
return
end
