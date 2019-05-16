%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO9';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,S,S,U,S);  %R16 Left Bracket
x = ruleOut(x,S,U,P,S);
x = ruleOut(x,Q,S,U,S);
x = ruleOut(x,S,U,S,V);

x = ruleOut(x,U,S,S,V);  %R16 Right Bracket
x = ruleOut(x,S,U,V,S);
x = ruleOut(x,U,Q,V,S);
x = ruleOut(x,Q,V,S,Q);

x = ruleOut(x,S,P,S,S);  %R8 Left Bracket
x = ruleOut(x,Q,T,P,S);

x = ruleOut(x,P,T,P,S);  %R8 Right Bracket
x = ruleOut(x,P,S,S,S);

x = ruleOut(x,V,T,S,S);  %R4 Left Bracket
x = ruleOut(x,S,R,P,S);  %R4 Right Bracket

x = ruleOut(x,P,S,S,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



