function [ reasult ] = common_element_present( node_set , terminal_set )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    reasult = 0;
    res_set = and(node_set , terminal_set);
    if any(res_set) == 1
        reasult = 1;
    end
    
    
    res_res_set = xor(res_set , terminal_set);
    
        
    if any(res_res_set) == 0
        reasult = 2;
    end

end

