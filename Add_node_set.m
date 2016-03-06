function [ source_node_set ] = Add_node_set( source_node_set , nodes_to_be_added )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

    [m no_of_source_nodes] = size(source_node_set);
    [d no_of_nodes_to_be_added] = size(nodes_to_be_added);
    source_node_set(no_of_source_nodes + 1:no_of_source_nodes + no_of_nodes_to_be_added) = nodes_to_be_added;
    source_node_set = sort(source_node_set);

end

