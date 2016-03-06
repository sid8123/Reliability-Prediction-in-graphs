function [ red_set ] = nodes_present( node_set )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    red_set = [];
    k = 1;
    [m n] = size(node_set);
    
    for i = 1 : n
        if node_set(1 , i) == 1
            red_set(k) = i;
            k = k + 1;
        end
    end
    
    if k == 1
        disp('empty_all_com_set')
    end

end

