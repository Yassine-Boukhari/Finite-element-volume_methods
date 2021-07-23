%% Entrées du programme
dt=0.001;h=0.1;T=0.2;
%% solution approximée du schéma de lax-friedrichs
% cas f linéaire :
[ufried_1,tf_1,xf_1]=lax_fried(dt,h,T,true);
% cas f non linéaire :
[ufried_2,tf_2,xf_2]=lax_fried(dt,h,T,false);
plot(ufried_2);
% Représentation 3D
mesh(tf_2,xf_2,ufried_2);
%% solution approximée du schéma de lax-wendroff
% cas f linéaire :
[uwend_1,tw_1,xw_1] =lax_wend(dt,h,T,true);
% cas f non linéaire :
[uwend_2,tw_2,xw_2] =lax_wend(dt,h,T,false);
plot(uwend_2);
% Représentation 3D
mesh(tw_1,xw_1,uwend_1);
mesh(tw_2,xw_2,uwend_2);
%% solution approximée du schéma de Saute-Mouton 
% cas f linéaire :
[ust_1,tst_1,xst_1]=saut_mout(dt,h,T,true);
% cas f non linéaire :
[ust_2,tst_2,xst_2]=saut_mout(dt,h,T,false);
plot(ust_2);
% Représentation 3D
mesh(tst_1,xst_1,ust_1);
mesh(tst_2,xst_2,ust_2);
%% Solution approximée du schéma implicite centré
[uimp,timp,ximp]=burgimp(dt,h,T);
plot(uimp);
mesh(timp,ximp,uimp);