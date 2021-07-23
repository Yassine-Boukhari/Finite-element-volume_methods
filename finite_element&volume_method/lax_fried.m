function [u,t,x]=lax_fried(dt,h,T,caslin)
%% Remarque
%caslin=signifie que nous voulons choisir le cas où la fonction f 
%...sera linéaire si on met comme argument true 
%% Schéma Lax-Friedrichs
alpha=(dt/2*h);
%% cas linéaire
%% Données
%%Discrétisation spatiale
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
f1=@(u)u;%cas linéaire
f2=@(u)u^2/2;%cas non linéaire
%% Cas explicite
if caslin
    f=f1;
else
    f=f2;
end
for n=1:N %boucle  temps
    for j=2:M+1 %boucle spatiale
            u(j,n+1)=1/2*(u(j+1,n)+u(j-1,n))-alpha*(f(u(j+1,n))^2-f(u(j-1,n))^2);                 
    end
end
return
end
