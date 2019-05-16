%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO13';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,P,S,S,S);  %R16 Left Bracket
x = ruleOut(x,S,S,Q,P);
x = ruleOut(x,U,S,P,S);
x = ruleOut(x,S,S,Q,Q);

x = ruleOut(x,U,V,S,S);  %R16 Right Bracket
x = ruleOut(x,Q,S,T,Q);
x = ruleOut(x,S,U,S,S);
x = ruleOut(x,U,Q,U,R);

x = ruleOut(x,T,Q,S,S);  %R8 Left Bracket
x = ruleOut(x,P,R,P,S);

x = ruleOut(x,P,S,S,S);  %R8 Right Bracket
x = ruleOut(x,T,P,S,S);

x = ruleOut(x,T,V,S,S);  %R4 Left Bracket
x = ruleOut(x,U,Q,T,V);  %R4 Right Bracket

x = ruleOut(x,T,S,U,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



