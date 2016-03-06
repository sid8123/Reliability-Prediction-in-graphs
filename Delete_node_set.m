function [ source_node_set ] = Delete_node_set( source_node_set , nodes_to_be_deleted )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    [m no_of_nodes_to_be_deleted] = size(nodes_to_be_deleted);
    for i = 1:no_of_nodes_to_be_deleted
        ind = find(source_node_set == nodes_to_be_deleted(i));
        
        [m no_of_nodes_in_source_set] = size(source_node_set);
        
        source_node_set = [source_node_set(1:ind-1),source_node_set(ind+1:no_of_nodes_in_source_set)];
    end


end

