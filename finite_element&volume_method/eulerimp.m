function [u,t,x]=eulerimp(dt,h,T)
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
U_tk=u(:,1);
%% Déclare une matrice qui tiendra compte des valeur de f
F=zeros(M+2,N+1);
for n=1:N
    for i=2:M+1
        F(i,n)=f(x(i),t(n));
    end
end
%% La matrice C=(1-2alpha)*A
y=zeros(1,M+2);
y(1)=1+2*alpha;y(2)=-alpha;
C=toeplitz(y);
%% Cas impplicite (Un=CUn+1-alpha*Fn)
for n=1:N %boucle  temps
    %         for j=M+1:-1:2 %boucle spatiale
    %         u(j,n)=(1+2*alpha)*u(j,n+1)-alpha*(u(j+1,n+1)+u(j-1,n+1))-dt*f(x(j),t(n));
    %         end
    c=U_tk+dt*F(:,n);
    U_tk1=C/c';
    u(:,n+1)=U_tk1;
    U_tk=U_tk1;
end
return
end