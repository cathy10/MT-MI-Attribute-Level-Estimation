%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='NGO1';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,S,S,U,V);  %R16 Left Bracket
x = ruleOut(x,V,S,S,Q);
x = ruleOut(x,S,S,U,R);
x = ruleOut(x,S,S,P,R);

x = ruleOut(x,U,S,U,S);  %R16 Right Bracket
x = ruleOut(x,T,P,R,S);
x = ruleOut(x,T,P,S,T);
x = ruleOut(x,P,S,P,R);

x = ruleOut(x,V,P,S,S);  %R8 Left Bracket
x = ruleOut(x,V,V,S,S);

x = ruleOut(x,T,U,T,S);  %R8 Right Bracket
x = ruleOut(x,T,P,S,S);

x = ruleOut(x,S,P,S,V);  %R4 Left Bracket
x = ruleOut(x,S,S,T,V);  %R4 Right Bracket

x = ruleOut(x,V,S,U,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



