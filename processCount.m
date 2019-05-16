function x = processCount(x)
%compute the count the feasible rankings with each level

%%Initialize Level Count
x(1,6)=0;  %% keeps track of total feasible
 x(1,7)=0; x(1,8)=0; x(1,9)=0; x(1,10)=0; %% L(i,j) count for level i attribute j
 x(2,7)=0; x(2,8)=0; x(2,9)=0; x(2,10)=0;
 x(3,7)=0; x(3,8)=0; x(3,9)=0; x(3,10)=0;

for i=1:1296
    if x(i,5)==1 & (x(i,1)==4 | x(i,1)==6) %%First Attribute Levels
        x(1,7)=x(1,7)+1;
        x(1,6)=x(1,6)+1;
    elseif x(i,5)==1 & (x(i,1)==2 | x(i,1)==5)
        x(2,7)=x(2,7)+1;
        x(1,6)=x(1,6)+1;
    else
        if x(i,5)==1 & (x(i,1)==1 | x(i,1)==3)
        x(3,7)=x(3,7)+1;
        x(1,6)=x(1,6)+1;
        end
    end
        
        if x(i,5)==1 & (x(i,2)==4 | x(i,2)==6) %% 2nd Attribute Levels
        x(1,8)=x(1,8)+1;
        elseif x(i,5)==1 & (x(i,2)==2 | x(i,2)==5)
        x(2,8)=x(2,8)+1;
        else
            if x(i,5)==1 & (x(i,2)==1 | x(i,2)==3)
            x(3,8)=x(3,8)+1;
            end
        end
       
        if x(i,5)==1 & (x(i,3)==4 | x(i,3)==6) %% 3rd Attribute Levels
           x(1,9)=x(1,9)+1;
        elseif x(i,5)==1 & (x(i,3)==2 | x(i,3)==5)
             x(2,9)=x(2,9)+1;
        else
            if x(i,5)==1 & (x(i,3)==1 | x(i,3)==3)
               x(3,9)=x(3,9)+1;
            end
         end
    
        if x(i,5)==1 & (x(i,4)==4 | x(i,4)==6) %% 4th Attribute Levels
            x(1,10)=x(1,10)+1;
        elseif x(i,5)==1 & (x(i,4)==2 | x(i,4)==5)
            x(2,10)=x(2,10)+1;
        else
            if x(i,5)==1 & (x(i,4)==1 | x(i,4)==3)
             x(3,10)=x(3,10)+1;
             end
         end
   end
    

end

