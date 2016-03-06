function [ cost_matrix ] = Eval_link_cost_with_node_cost( cost_matrix , node_cost )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    [n n] = size(cost_matrix);
    
    for row = 1 : n
        for col = 1 : row - 1
            cost_matrix(row , col) = cost_matrix(row , col) + (( node_cost(row) + node_cost(col) ) / 2);
            cost_matrix(col ,row) = cost_matrix(row , col);
        end
    end

end

