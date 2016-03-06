function [ p ] = modify_link_rel( network , node_rel , p )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    [n n] = size(network);
    
    for i = 1 : n
        for j = 1 : i - 1
            if network(i , j) > 0
                nl = node_rel_eva( node_rel(i) , node_rel(j) );
                p(network(i , j)) = p(network(i , j)) * nl;
            end
        end
    end

end

