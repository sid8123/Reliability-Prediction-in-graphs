function [ reliability all_cut_set node_left  link_matrix  BFS_matrix ] = S_T_Reliability( network ,source , sink , p , node_rel )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    all_cut_set = [];
    node_left = [];
    
    [n n] = size(network);

    SS = [source];


    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SIS = [];
    k = 1;

    for i = 1 : n
        if i ~= source
            SIS(k) = i;
            k = k + 1;
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    if Right_mat(network) == 1
        [link_matrix network_rel] = Calculate_link_matrix(network);
        p = modify_link_rel( network_rel , node_rel , p );
        
        
        if Is_connected_revised(network , SIS) == 1
           all_cut_set = Insert_cutset(all_cut_set , link_matrix(source , :));
           node_left = Insert_cutset(node_left , Create_set(source , n));
        end    

        
        [ level_matrix BFS_matrix ] = Modified_BFS( network , source , sink );

        [node_left all_cut_set] = recursive( link_matrix , network , BFS_matrix, source , SS ,SIS , all_cut_set ,node_left );
        
        [ reliability ] = Finding_reliability_from_cutset( all_cut_set , p );
        

        %My_view_with_link_undirected( network , link_matrix )
        %view(biograph(BFS_matrix))
    else
        disp('wrong matrix');
    end
end

