function [ reasult ] = Is_connected_revised( network , node_set )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    

    
    reasult = 0; 
    black = 1;
    white = 0;

    [m n] = size(node_set);
    
    color_node = zeros(1 , n);
    
    color_node(1) = black;
    
    
    
    
    
    for i = 1 : n
    
        for node = 1 : n

            if color_node(node) == black 

                for child = 1 : n
                    if network(node_set(node) , node_set(child)) == 1
                        color_node(child) = black;
                    end
                end

            end

        end
    
    end

    for i = 1 : n
        if color_node(i) == white
            reasult = 0;
            return
        end
    end
    reasult = 1;
    
    



end

