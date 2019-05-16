function x = ruleOut(x,S1,S2,S3,S4)

%% Rule out possible orderings based on choice task outcome
 for n=1:1296
     if ismember(x(n,1),S1) &&  ismember(x(n,2),S2) && ismember(x(n,3),S3) && ismember(x(n,4),S4)
         x(n,5)=0;
     end
 end
           
end

