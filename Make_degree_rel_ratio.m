function [ rel_net ] = Make_degree_rel_ratio( rel_net , degree_node )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [n n] = size(rel_net);
    
    for i = 1 : n
        for j = 1 : n
            if rel_net(i , j) > 0
                rel_net(i , j) = rel_net(i , j)/(degree_node(i) + degree_node(j));
            end
        end
    end

end

