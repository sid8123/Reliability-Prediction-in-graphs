function [ reliability_matrix ] = Evaluate_link_rel_with_node_rel( reliability_matrix , node_rel )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [n n] = size(reliability_matrix);
    
    for row = 1 : n
        for col = 1 : row - 1
            reliability_matrix(row , col) = reliability_matrix(row , col) * node_rel_eva(node_rel(row) , node_rel(col));
            reliability_matrix(col , row) = reliability_matrix(row , col);
        end
    end


end

