function [ link_matrix network ] = Calculate_link_matrix( network )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here


    [n n] = size(network);
    
    link_number = 1;
    for i = 1 : n
        for j = 1 : i - 1
            if network(i,j) == 1
                network(i,j) = link_number;
                link_number = link_number + 1;
            end
        end
    end
    
    no_of_links = link_number - 1;
    
    link_matrix = zeros(n , no_of_links);
    
    for i = 1 : n
        for j = 1 : i - 1
            if network(i,j) >= 1
                link_matrix(i , network(i,j)) = 1;
                link_matrix(j , network(i,j)) = 1;
            end
        end
    end
    
    

end

