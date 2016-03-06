function [ child_nodes ] = Find_child_nodes( BFS_matrix , source_nodes )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [g no_of_source_nodes] = size(source_nodes);
    
    [no_of_vertices n] = size(BFS_matrix);
    
    child_nodes = [];
    no_of_child_nodes = 0;

    for s_row = 1:no_of_source_nodes
        for column = 1:no_of_vertices
            if (BFS_matrix(source_nodes(s_row) , column) == 1)
                if present_in(child_nodes , column) == 0
                    no_of_child_nodes = no_of_child_nodes + 1;
                    child_nodes(no_of_child_nodes) = column;
                end
            end
        end
    end

end

