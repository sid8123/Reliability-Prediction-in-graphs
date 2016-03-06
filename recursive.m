function [ node_left all_cut_set ] = recursive( link_matrix , network , BFS_matrix, S , SS ,SIS , all_cut_set ,node_left)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [n n] = size(network);

    child_nodes = Find_child_nodes(BFS_matrix , S);
    
    
    
    [m no_of_child_nodes] = size(child_nodes);
    if no_of_child_nodes == 0
        return
    end
    
    
    
    
    [ all_com ] = create_node_set( network , child_nodes );
    
    [ all_com ] = All_combination_revisit( all_com ,all_com);
    
    [no_all_com n] = size(all_com);
    
    for com = 1 : no_all_com
        
        child_nodes = nodes_present(all_com(com , :));
        
        if Is_connected_revised( network , Delete_node_set(SIS,child_nodes) ) == 1
            all_cut_set = Insert_cutset( all_cut_set , Cut_for_node_set(link_matrix , Add_node_set(SS,child_nodes)));
            node_left = Insert_cutset(node_left , Create_set(Add_node_set(SS,child_nodes) , n));
        end
        
       [node_left all_cut_set] = recursive( link_matrix , network , BFS_matrix, child_nodes , Add_node_set(SS,child_nodes) ,Delete_node_set(SIS,child_nodes) , all_cut_set , node_left);
    
    
    end




end

