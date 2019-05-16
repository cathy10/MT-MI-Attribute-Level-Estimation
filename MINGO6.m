%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='NGO6';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,V,U,S,S);  %R16 Left Bracket
x = ruleOut(x,S,T,S,S);
x = ruleOut(x,U,P,S,P);
x = ruleOut(x,V,S,P,R);

x = ruleOut(x,Q,V,P,S);  %R16 Right Bracket
x = ruleOut(x,P,V,S,P);
x = ruleOut(x,S,U,V,P);
x = ruleOut(x,U,R,S,V);

x = ruleOut(x,P,T,S,T);  %R8 Left Bracket
x = ruleOut(x,P,U,S,U);

x = ruleOut(x,P,S,S,S);  %R8 Right Bracket
x = ruleOut(x,U,T,P,Q);

x = ruleOut(x,S,T,S,S);  %R4 Left Bracket
x = ruleOut(x,S,V,S,P);  %R4 Right Bracket

x = ruleOut(x,S,S,S,V);  % R2
x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



