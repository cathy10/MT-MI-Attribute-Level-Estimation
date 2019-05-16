%% This script identifies possible attribute level orderings
%% based on tournament data
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO2';
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,S,P,S,S);  %R16 Left Bracket
x = ruleOut(x,P,S,S,S);
x = ruleOut(x,T,S,S,Q);
x = ruleOut(x,U,P,P,S);

x = ruleOut(x,V,R,S,U);  %R16 Right Bracket
x = ruleOut(x,R,U,V,S);
x = ruleOut(x,U,T,S,S);
x = ruleOut(x,V,R,Q,Q);

x = ruleOut(x,U,Q,U,S);  %R8 Left Bracket
x = ruleOut(x,U,U,S,S);

x = ruleOut(x,R,U,Q,Q);  %R8 Right Bracket
x = ruleOut(x,Q,S,Q,Q);

x = ruleOut(x,S,P,S,S);  %R4 Left Bracket
x = ruleOut(x,V,T,S,S);  %R4 Right Bracket

x = ruleOut(x,P,U,P,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



