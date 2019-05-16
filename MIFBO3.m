%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO3';  %% Specify Organization Being Analyzed
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
%x = ruleOut(x,S,P,S,S);  %R16 Left Bracket
x = ruleOut(x,P,P,S,S);
x = ruleOut(x,P,S,V,S);
x = ruleOut(x,Q,P,S,S);

x = ruleOut(x,V,P,S,S);  %R16 Right Bracket
x = ruleOut(x,Q,P,S,S);
x = ruleOut(x,P,S,S,R);
x = ruleOut(x,V,S,S,V);

x = ruleOut(x,P,P,Q,T);  %R8 Left Bracket
x = ruleOut(x,Q,P,R,R);

x = ruleOut(x,S,S,P,T);  %R8 Right Bracket
x = ruleOut(x,P,Q,P,R);

x = ruleOut(x,P,S,V,S);  %R4 Left Bracket
x = ruleOut(x,Q,P,S,S);  %R4 Right Bracket

x = ruleOut(x,Q,S,P,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



