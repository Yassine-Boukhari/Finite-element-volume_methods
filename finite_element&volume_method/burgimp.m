function [u,t,x]=burgimp(dt,h,T)
%Schéma explicite
alpha=(dt/2*h);
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
%% Initialisation de u 
u=zeros(M+2,N+1);
%% Condition initiale pour l'espace (aux bord)
u(1,:) = zeros(1,N+1);
u(M+2,:) =zeros(1,N+1);
%% cond initiale pour le temps (t=0)
u(:,1) = sin(pi*x);
U_tk=u(:,1);
%% La matrice C (cas linéaire)
%y=zeros(1,M+2);
c=[1,-alpha,zeros(1,M)];r=[1,alpha,zeros(1,M)];
C=toeplitz(c,r);
%% Cas implicite linéaire (Un=CUn+1)
for n=1:N %boucle  temps
    %         for j=M+1:-1:2 %boucle spatiale
    %         u(j,n)=u(j,n+1)-alpha*(u(j+1,n+1)-u(j-1,n+1));
    %         end
    c=U_tk;
    U_tk1=C/c';
    u(:,n+1)=U_tk1;
    U_tk=U_tk1;
end
return
end