%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='NGO4';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,P,S,R,V);  %R16 Left Bracket
x = ruleOut(x,R,U,S,S);
x = ruleOut(x,S,S,R,V);
x = ruleOut(x,S,V,S,S);

x = ruleOut(x,P,S,V,S);  %R16 Right Bracket
x = ruleOut(x,S,P,U,R);
x = ruleOut(x,U,P,P,S);
x = ruleOut(x,U,U,R,S);

x = ruleOut(x,T,P,U,S);  %R8 Left Bracket
x = ruleOut(x,U,Q,V,S);

x = ruleOut(x,P,S,Q,S);  %R8 Right Bracket
x = ruleOut(x,S,S,U,S);

x = ruleOut(x,U,Q,Q,S);  %R4 Left Bracket
x = ruleOut(x,S,S,P,V);  %R4 Right Bracket

x = ruleOut(x,S,P,P,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



