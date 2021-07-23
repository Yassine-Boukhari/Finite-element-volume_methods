%Cas Explicite
clc;
dt_1=[0.001,0.01]; h_1=0.1; T1=0.2;
[uexp1,texp1,xexp1]=eulerexp(dt_1(1),h_1,T1); %Cas dt=0.001
[uexp2,texp2,xexp2]=eulerexp(dt_1(2),h_1,T1); %Cas dt=0.01
uex=@(x,t)sin(pi*x)*exp(sin(t));
%% Plot en Dim 3
mesh(texp1,xexp1,uexp1);
mesh(texp1,xexp2,uexp2);
%% pour le 1er cas
a_1=size(xexp1); b_1=size(texp1);
Uex=zeros(a_1(2),b_1(2));
for n=1:b_1(2)
for i=1:a_1(2)
Uex(i,n)=uex(xexp1(i),texp1(n));
end
end
% Calcul de l'erreur
e1=abs(Uex-uexp1);
plot(e1);
%% Pour le 2ème cas
a_2=size(xexp2); b_2=size(texp2);
Uex=zeros(a_2(2),b_2(2));
for n=1:b_2(2)
for i=1:a_2(2)
Uex(i,n)=uex(xexp2(i),texp2(n));
end
end
% Calcul de l'erreur
e2=abs(Uex-uexp2);
plot(e2);
%% Cas implicite 
dt_2=0.01; h_2=[0.01,0.1]; T2=1;
[uimp1,timp1,ximp1]=eulerimp(dt_2,h_2(1),T2); %Cas h=0.01
[uimp2,timp2,ximp2]=eulerimp(dt_2,h_2(2),T2); %Cas dt=0.1
%% Plot implicite 
plot(uimp1);
%plot(uimp2);
%% Que remarquons nous ? 
% On remarque après avoir les calculs que notre schéma donne une solution
% inconditionnelle stable qu'importe la valeur de alpha contrairement
%à au schéma d'euler explicite ou la valeur est moins stable si alpha<1/2.


