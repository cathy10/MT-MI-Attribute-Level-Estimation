%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO11';  %% Specify Organization Being Analyzed
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
x = ruleOut(x,T,S,V,S);
x = ruleOut(x,S,T,U,S);

x = ruleOut(x,P,U,S,S);  %R16 Right Bracket
x = ruleOut(x,P,S,U,S);
x = ruleOut(x,S,P,S,V);
x = ruleOut(x,Q,U,S,S);

x = ruleOut(x,V,Q,P,Q);  %R8 Left Bracket
x = ruleOut(x,S,R,P,S);

x = ruleOut(x,S,P,Q,S);  %R8 Right Bracket
x = ruleOut(x,R,S,P,S);

x = ruleOut(x,V,V,S,S);  %R4 Left Bracket
x = ruleOut(x,T,S,P,S);  %R4 Right Bracket

x = ruleOut(x,R,P,S,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



