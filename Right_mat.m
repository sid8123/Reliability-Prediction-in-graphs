function [ reasult ] = Right_mat( mat )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    
    [m n] = size(mat);
    
    reasult = 0;
    if m ~= n
        return
    end
    
    for i = 1 : n
        for j = 1 : n
            if i == j
                if mat(i,j) ~= 0
                    return
                end
            else
                if mat(i,j) ~= mat(j,i)
                    return
                end
            end
        end
    end
    
    reasult = 1;

end

