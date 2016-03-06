function [ node_set ] = Create_set( node , no_of_vertices )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    [m n] = size(node);
    node_set = zeros(1 , no_of_vertices);
    
    for i = 1 : n
        node_set(node(i)) = 1;
    end

end

