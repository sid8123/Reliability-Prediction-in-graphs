function [ network p ] = Make_complete_graph( no_of_nodes )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    

    network = ones(no_of_nodes , no_of_nodes);
    
    for i = 1 : no_of_nodes
        network(i,i) = 0;
    end
    
    p = [];
    k = 1;
    for i = 1 : (no_of_nodes * (no_of_nodes - 1))/2
        p(k) = 0.9;
        k = k + 1;
    end


end

