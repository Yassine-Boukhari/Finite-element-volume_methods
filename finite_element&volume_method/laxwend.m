function [u,t,x]=laxwend(dt,h,T,a)
%Schéma explicite
%Pour le cas c=1
mu=(dt/h);
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
%f=@(x,t)(cos(t)+pi^2)*exp(sin(t))*sin(pi*x);
%% Condition initiale pour l'espace (aux bord)
%le a représente le alpha
u(1,:) = exp(-a*(t+0.2).^2);
u(M+2,:) =exp(-a*(1-t-0.2).^2);
%% cond initiale pour le temps (t=0)
u(:,1) = exp(-a*(x-0.2).^2);
%% Cas explicite
for n=1:N %boucle  temps
    for j=2:M+1 %boucle spatiale
        u(j,n+1)=u(j,n)-0.5*mu*(u(j+1,n)-u(j-1,n))+0.5*mu^2*(u(j+1,n)-2*u(j,n)+u(j-1,n));
    end
end
return
end






