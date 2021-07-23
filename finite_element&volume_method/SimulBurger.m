%% Entr�es du programme
dt=0.001;h=0.1;T=0.2;
%% solution approxim�e du sch�ma de lax-friedrichs
% cas f lin�aire :
[ufried_1,tf_1,xf_1]=lax_fried(dt,h,T,true);
% cas f non lin�aire :
[ufried_2,tf_2,xf_2]=lax_fried(dt,h,T,false);
plot(ufried_2);
% Repr�sentation 3D
mesh(tf_2,xf_2,ufried_2);
%% solution approxim�e du sch�ma de lax-wendroff
% cas f lin�aire :
[uwend_1,tw_1,xw_1] =lax_wend(dt,h,T,true);
% cas f non lin�aire :
[uwend_2,tw_2,xw_2] =lax_wend(dt,h,T,false);
plot(uwend_2);
% Repr�sentation 3D
mesh(tw_1,xw_1,uwend_1);
mesh(tw_2,xw_2,uwend_2);
%% solution approxim�e du sch�ma de Saute-Mouton 
% cas f lin�aire :
[ust_1,tst_1,xst_1]=saut_mout(dt,h,T,true);
% cas f non lin�aire :
[ust_2,tst_2,xst_2]=saut_mout(dt,h,T,false);
plot(ust_2);
% Repr�sentation 3D
mesh(tst_1,xst_1,ust_1);
mesh(tst_2,xst_2,ust_2);
%% Solution approxim�e du sch�ma implicite centr�
[uimp,timp,ximp]=burgimp(dt,h,T);
plot(uimp);
mesh(timp,ximp,uimp);