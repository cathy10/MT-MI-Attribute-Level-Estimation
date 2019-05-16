%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO10';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,S,V,U,S);  %R16 Left Bracket
x = ruleOut(x,P,V,S,S);
x = ruleOut(x,S,S,S,T);
x = ruleOut(x,S,P,U,S);

x = ruleOut(x,S,R,S,V);  %R16 Right Bracket
x = ruleOut(x,S,P,S,V);
x = ruleOut(x,S,P,U,S);
x = ruleOut(x,V,S,T,S);

x = ruleOut(x,P,S,Q,S);  %R8 Left Bracket
x = ruleOut(x,V,S,S,R);

x = ruleOut(x,P,T,P,S);  %R8 Right Bracket
x = ruleOut(x,P,P,U,V);

x = ruleOut(x,P,Q,Q,V);  %R4 Left Bracket
x = ruleOut(x,S,T,S,S);  %R4 Right Bracket

x = ruleOut(x,S,R,P,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



