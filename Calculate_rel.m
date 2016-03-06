function [ reliability ] = Calculate_rel( cut_set , p , q )
% Calculate_rel : it calculate reliability using mutual inclusion exclusion principle for a single cut  


    [a n] = size(cut_set);

    reliability = 0;
    mul = 1;
   
    
    
    
    
    for i = 1:n
        if cut_set(i) >= 1
            reliability = reliability + p(i) * mul;
            mul = mul * q(i);
            
        end
    end
% k = 0;
%     for i = 1:n
%         if cut_set(i) >= 1
%             reliability = reliability + p(i);
%             k = k + 1;
%             
%             
%             %mul = mul * q(i);
%             
%         end
%     end
%     
%     if reliability == 1
%         reliability = 0;
%     else
%         reliability = reliability/k;
%     end
%         
    
end

