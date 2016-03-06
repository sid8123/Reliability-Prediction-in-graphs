function [ reliability k_terminal_cut node_left link_matrix ] = K_terminal_reliability( network  , p  , node_rel , k_terminal_set )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


    all_cut_set = [];
    node_left = [];
    reliability = 0;
    source = 0;
    
    [n n] = size(network);
    sink = [n];
    
    
    if Right_mat(network) == 1
        [link_matrix network_rel] = Calculate_link_matrix(network);
        p = modify_link_rel( network_rel , node_rel , p );
    else
        disp('wrong matrix');
        return
    end
    
    [nn nl] = size(link_matrix);
    [b dl] = size(p);
    if dl < nl
        disp('reliability function is less then no of links')
        return
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

            [node_left all_cut_set] = recursive( link_matrix , network , BFS_matrix, source , SS ,SIS , all_cut_set , node_left);

            
           

%             if b ~= n-1
%                 view(biograph(BFS_matrix))
%             end
            sink = Add_node_set(sink , source);
            
        end
    end
    
    %My_view_with_link_undirected( network , link_matrix  )
    
    k_terminal_set = Create_set(k_terminal_set , n);
    [ k_terminal_cut ] = calculate_kterminal_cutset_from_network_cutset( node_left , all_cut_set , k_terminal_set );
    
    [ reliability ] = Finding_reliability_from_cutset( k_terminal_cut , p );
    
end

