function [ cut_set ] = Cut_for_node_set( link_matrix , node_set )

    

    [m no_nodes] = size(node_set);
    
    cut_set = link_matrix(node_set(1) , :);
    
    for row = 2 : no_nodes
        cut_set = xor( cut_set , link_matrix(node_set(row) ,:));
    end
    

end

