function [ node_left reliability all_cut_set link_matrix ] = Reliability_of_group_nodes_with_network( network , k_terminal  , p  , node_rel )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    all_cut_set = [];
    node_left = [];
    source = 0;
    
    [n n] = size(network);
    sink = k_terminal;
    
    
    if Right_mat(network) == 1
        [link_matrix network_rel] = Calculate_link_matrix(network);
        p = modify_link_rel( network_rel , node_rel , p );
    else
        disp('wrong matrix');
    end
    
    
    for i = 1 : n
        if present_in(sink , i) == 0
            source = i;
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
            
             [a b] = size(sink);
%             if b == n-1
%                 break
%             end

            if Is_connected_revised(network , SIS) == 1
               all_cut_set = Insert_cutset(all_cut_set , link_matrix(source , :));
               node_left = Insert_cutset(node_left , Create_set(source , n));
            end    

           
            [ level_matrix BFS_matrix ] = Modified_BFS( network , source , sink );

            [nodeleft all_cut_set] = recursive( link_matrix , network , BFS_matrix, source , SS ,SIS , all_cut_set , node_left );

            
           

%             if b ~= n-1
%                 view(biograph(BFS_matrix))
%             end
            sink = Add_node_set(sink , source);
            
        end
    end
    
    %My_view_with_link_undirected( network , link_matrix )
    
    [ reliability ] = Finding_reliability_from_cutset( all_cut_set , p );
end

