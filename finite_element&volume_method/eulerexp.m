function [u,t,x]=eulerexp(dt,h,T)
%Schéma explicite
alpha=(dt/h^2);
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
%% L'éq de la chaleur 
u=zeros(M+2,N+1);
f=@(x,t)(cos(t)+pi^2)*exp(sin(t))*sin(pi*x);
%% Condition initiale pour l'espace (aux bord)
u(1,:) = zeros(1,N+1);
u(M+2,:) =zeros(1,N+1);
%% cond initiale pour le temps (t=0)
u(:,1) = sin(pi*x);
%% Cas explicite
for n=1:N %boucle  temps
    for j=2:M+1 %boucle spatiale
        u(j,n+1)=u(j,n)+alpha*(u(j+1,n)-2*u(j,n)+u(j-1,n))+dt*f(x(j),t(n));
    end
end
return
end






