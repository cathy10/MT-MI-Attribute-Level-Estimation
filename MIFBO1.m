%% This script identifies possible attribute level orderings
%% based on tournament data
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO1';
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,S,P,P,S); % R16 Left Bracket
x = ruleOut(x,S,S,V,R);
x = ruleOut(x,P,S,S,Q);
x = ruleOut(x,P,V,S,S);

x = ruleOut(x,S,P,V,S); %R16 Right Bracket
x = ruleOut(x,V,S,S,P);
x = ruleOut(x,S,V,S,P);
x = ruleOut(x,S,S,U,T);

x = ruleOut(x,S,S,P,V); %R8 Left Bracket
x = ruleOut(x,S,S,P,V);

x = ruleOut(x,P,S,S,Q); %R8 Right Bracket
x = ruleOut(x,P,S,Q,U);

x = ruleOut(x,P,Q,S,S); % R4 Left Bracket
x = ruleOut(x,S,P,S,Q); % R$ Right Bracket

x = ruleOut(x,S,P,Q,S); % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



