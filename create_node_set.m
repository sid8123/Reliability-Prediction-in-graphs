function [ node_set ] = create_node_set( network , child_nodes )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

    [n n] = size(network);
    [m nc] = size(child_nodes);
    
    node_set = zeros(nc , n);
    
    for i = 1 : nc
        node_set(i ,child_nodes(i)) = 1;
    end
    

end

