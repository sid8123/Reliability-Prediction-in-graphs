function [ all_com] = All_combination_revisit( node_set , all_com  )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [top_all_com , n] = size(all_com);
    top_all_com = top_all_com + 1;

    [no_of_nodes no] = size(node_set);
    
    com_matrix = zeros(no_of_nodes , no_of_nodes , no);
    
    
    for row = 1 : no_of_nodes
        for col = no_of_nodes : -1 :row + 1
            com_matrix(row , col , :) = or( node_set(row , :) , node_set(col , :) );
            all_com(top_all_com , :) = com_matrix(row , col , :);
            top_all_com = top_all_com + 1;
        end
    end
    
    
    
    for row = 1 : no_of_nodes - 2
        
        dummy_node_set = [];
        dtop = 1;
        
        for col = no_of_nodes : -1:row + 1
            
            dummy_node_set(dtop , :) =  com_matrix(row , col , :);
            dtop = dtop + 1;
            
        end
        [ all_com  ] = All_combination_revisit( dummy_node_set , all_com );
    end
    

end

