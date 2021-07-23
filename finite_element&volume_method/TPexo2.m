%Ex�cutons le programme de Lax-Wendroff selon ces diff�rents cas
%On travaille dans le cas o� c=1 T=0.5 et alpha=a=50
h=[0.01,0.02]; dt=0.01; a=50; T=0.5;
[u1,t1,x1]=laxwend(dt,h(1),T,a);
[u2,t2,x2]=laxwend(dt,h(2),T,a);
%On remarque que comme pour le cas du sch�ma explicite le sch�ma de lax-wendroff...
%est plus stable si le coefficient mu=c(dt/h)<0.5 sinon il le sera moins.
%% Solution analytique (Cas 1)
uex=@(x,t)exp(-a*(x-t-0.2).^2);
for i=1:length(x1)
for n=1:length(t1)
Uex1(i,n)=uex(x1(i),t1(n));
end
end
%% Courbe en 3 dimension(bonus)
mesh(t1,x1,u1);
mesh(t2,x2,u2);
%% Tra�ons les courbes pour (cas 1)
b=find(t1==0.01); c=find(t1==0.1); d=find(t1==0.3); e=find(t1==0.5);
k=[b,c,d,e];
plot(x1,u1(:,k),'--');
hold on
plot(x1,Uex1(:,k));
%on remarque d'apr�s le graphe que les courbes concordent parfaitement
%entre elle
%% Solution analytique (Cas 2)
uex=@(x,t)exp(-a*(x-t-0.2).^2);
for i=1:length(x2)
for n=1:length(t2)
Uex2(i,n)=uex(x2(i),t2(n));
end
end
%% Tra�ons les courbes pour (cas 1)
plot(x2,u2(:,k),'--');
hold on
plot(x2,Uex2(:,k));
%Ici ce n'est plus le cas les courbes donnent un l�ger d'�calage les unes
%des autres
%Donc la stabilit� est v�rifi� si mu=<1.