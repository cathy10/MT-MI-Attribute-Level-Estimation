%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='NGO2';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,S,V,S,S);  %R16 Left Bracket
x = ruleOut(x,V,S,S,R);
x = ruleOut(x,U,P,S,S);
x = ruleOut(x,V,S,P,S);

x = ruleOut(x,S,Q,S,Q);  %R16 Right Bracket
x = ruleOut(x,S,P,Q,S);
x = ruleOut(x,S,U,Q,S);
x = ruleOut(x,S,S,P,P);

x = ruleOut(x,Q,P,S,R);  %R8 Left Bracket
x = ruleOut(x,P,U,S,R);

x = ruleOut(x,V,S,P,S);  %R8 Right Bracket
x = ruleOut(x,U,S,P,U);

x = ruleOut(x,P,S,S,S);  %R4 Left Bracket
x = ruleOut(x,P,P,S,P);  %R4 Right Bracket

x = ruleOut(x,S,S,S,T);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



