function [ reasult ] = present_in( node_set , item )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [m n] = size(node_set);
    
    reasult = 0;
    for i = 1 : n
        if node_set(i) == item
            reasult = 1;
            return
        end
    end
    
   
end

