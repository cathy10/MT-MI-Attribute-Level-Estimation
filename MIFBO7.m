%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO7';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
%x = ruleOut(x,Q,S,S,S);  %R16 Left Bracket
%x = ruleOut(x,Q,S,S,S);
x = ruleOut(x,S,U,S,S);
x = ruleOut(x,P,S,R,S);

x = ruleOut(x,S,V,P,S);  %R16 Right Bracket
x = ruleOut(x,S,R,S,V);
x = ruleOut(x,S,P,V,S);
x = ruleOut(x,Q,S,P,S);

x = ruleOut(x,T,S,P,V);  %R8 Left Bracket
x = ruleOut(x,Q,P,S,S);

x = ruleOut(x,P,V,S,S);  %R8 Right Bracket
x = ruleOut(x,V,S,P,S);

x = ruleOut(x,R,Q,U,S);  %R4 Left Bracket
x = ruleOut(x,P,Q,S,S);  %R4 Right Bracket

x = ruleOut(x,U,S,S,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



