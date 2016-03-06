function [ net_str net_str2] = make_str_graph( network )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    [no no] = size(network);
    
    net_str = '';
    for row = 1 : no

        str = mat2str(network(row,:));
        [n m] = size(str);

        str = str(2:m-1);
        net_str(row,:) = char(str);

    end
    
    
    

    net_str2 = '';
    for row = 1 : no

        str = mat2str(network(row,:));
        [n m] = size(str);

        str = str(2:m-1);
        net_str2(row,:) = [char(str) ';'];

    end
end

