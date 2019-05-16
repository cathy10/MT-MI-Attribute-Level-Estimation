%% This script identifies possible attribute level orderings
%% based on tournament data
%% Please Edit lines 6, 16-35
clear all; close all; format long;
x=xlsread('ranks');
ID='FBO6';  %% Specify Organization Being Analyzed

%%eliminate the infeasible rankings based on total unacceptable levels
for i = 1:1296
    if x(i,4) == 4 | x(i,4)==6
        x(i,5) = 0
    end
end
%% List of ranks
S=[1 2 3 4 5 6]; %% all possible rank orders allowed
P=[1 2 5]; % 1<2
Q=[3 4 6]; % 2<1
R=[2 5 6]; % 3<2
T=[4 5 6]; % 3<1
U=[1 2 3]; % 1<3
V=[1 3 4]; % 2<3
%% Tournament Outcomes 
x = ruleOut(x,Q,S,S,S);  %R16 Left Bracket
x = ruleOut(x,Q,S,S,S);
x = ruleOut(x,S,Q,U,S);
x = ruleOut(x,S,P,P,S);

%x = ruleOut(x,S,V,S,R);  %R16 Right Bracket
%x = ruleOut(x,T,P,S,S);
%x = ruleOut(x,P,V,Q,S);
%x = ruleOut(x,S,U,U,R);

x = ruleOut(x,S,R,U,S);  %R8 Left Bracket
x = ruleOut(x,R,Q,S,S);

x = ruleOut(x,S,P,P,S);  %R8 Right Bracket
x = ruleOut(x,S,U,V,S);

x = ruleOut(x,R,V,S,S);  %R4 Left Bracket
x = ruleOut(x,U,S,P,S);  %R4 Right Bracket

x = ruleOut(x,T,Q,S,S);  % R2

x=processCount(x);
xlswrite('MIRanking.xlsx',x,ID);



