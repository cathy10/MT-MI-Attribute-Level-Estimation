%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO12';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
%x = ruleOut(x,S,V,S,S);  %R16 Left Bracket
%x = ruleOut(x,P,V,S,S);
%x = ruleOut(x,T,S,V,S);
x = ruleOut(x,S,Q,V,S);

x = ruleOut(x,S,Q,P,S);  %R16 Right Bracket
x = ruleOut(x,S,V,S,R);
x = ruleOut(x,U,S,S,Q);
x = ruleOut(x,P,S,U,S);

x = ruleOut(x,S,P,S,Q);  %R8 Left Bracket
x = ruleOut(x,T,S,S,V);

x = ruleOut(x,V,S,S,V);  %R8 Right Bracket
x = ruleOut(x,S,Q,P,S);

x = ruleOut(x,S,P,P,S);  %R4 Left Bracket
x = ruleOut(x,P,S,S,S);  %R4 Right Bracket

x = ruleOut(x,T,P,S,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



