function [ k_terminal_cut ] = calculate_kterminal_cutset_from_network_cutset( node_left , all_cut_set , terminal_set )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


    [no_of_cut , nl] = size(all_cut_set);
    k_terminal_index_no = [];
    k = 1;
    for i = 1 : no_of_cut
        reasult = common_element_present( node_left(i,:) , terminal_set );
        if reasult == 1
           k_terminal_index_no(k) = i;
           k = k + 1;
        end
    end
    
    k_terminal_cut = [];
    
    for i = 1 : k - 1
        k_terminal_cut(i , :) = all_cut_set(k_terminal_index_no(i) , :);
    end
    
    [m n] = size(k_terminal_cut);
    if m == 0
        disp('some thing has go wrong')
    end
    
    

end

