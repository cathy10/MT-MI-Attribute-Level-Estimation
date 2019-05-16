%%% SCRIPT IS USED TO COMPUTE THE WEIGHTED MEAN ERROR 
%%% FOR FUNDING ATTRIBUTE FOR BYO LEVELS A1: >=75% A2: About 50% A3: <25% 
clear all; close all; format long;
%% Sample and Population Parameters
N = 49; %% Population Size
m=3; %% Number of Levels
n1 = 9; n2 = 3; n3 = 0; %% Number of BYOs at each level
n = n1+n2+n3; %% Sample size
d = N - n; %% Difference between Population and Sample
%% Create Admissible Populations and Probability of Observed Sample 
id =1; %% Identifier for admissible population
for N1 = n1:n1+d
    for N2 = n2:n2+d
        for N3 = n3:n3+d
            if N1+N2+N3==N
              x(id,1)=id;
              x(id,2)=N1;x(id,3)=N2; x(id,4)=N3;
              x(id,5)=nchoosek(N1,n1)*nchoosek(N2,n2)*nchoosek(N3,n3);
              id=id+1;
            end             
          end
    end
end
%% Determine the Weights on the Admissible Populations
totalp=0;
for i=1:length(x)
    totalp=totalp+x(i,5);
end
for i=1:length(x)
    x(i,5)=x(i,5)/totalp;
end
%% Determine the Weighted Mean Error for Each Predicted Population
id=1;
for N1H = n1:n1+d
   for N2H = n2:n2+d
       for N3H = n3:n3+d
           if N1H+N2H+N3H==N
           x=Error(x,N1H,N2H,N3H,id);
           id=id+1;
           end
       end
   end
end
%% Plot the Mean Errors with the Upper Bound Value
for i=1:id-1
    UB(i,1)=2*d/m;
end
figure
plot(x(:,1),x(:,6));
hold on;
plot(x(:,1),UB(:,1));
xlabel('Admissible Population ID');
ylabel('Weighted Mean Absolute Error (WMAE)');          

function X = Error(X,N1H,N2H,N3H,ID)
% find mean error
error=0;
    for i=1:length(X)
        error=error+X(i,5)*(abs(X(i,2)-N1H)+abs(X(i,3)-N2H)+abs(X(i,4)-N3H));
        X(ID,6)=error/3;
    end
end