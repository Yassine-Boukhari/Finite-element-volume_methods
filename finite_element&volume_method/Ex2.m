%% Nbre de pts du maillage 
x=0:h:1;
a=size(x);
nbs=a(2);
%% Nbre d'intervalle
nbt=a(2)-1;
%% vecteur contenant les variables
coor=x;
som=zeros(nbs,nbt);
for i=1:nbs
    for j=1:nbt
    som(i,j)=i^j;
    end
end
%% Calcul de la matrice du système

