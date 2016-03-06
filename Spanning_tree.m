function [ net ] = Spanning_tree( rel_mat )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here




    [n n] = size(rel_mat);
    
    net = zeros(n , n);


    no_of_link = 0;

    degree_node = ones(1 , n) .* 0.001;
    [ degrel ] = Make_degree_rel_ratio( rel_mat , degree_node );

    s_set = [1];



    for h = 1 : n
        [m s_size] = size(s_set);
        if s_size == n
            break
        end

        max = zeros(1 , 3);
        for source = 1 : s_size
            for node = 1 : n
                if degrel(s_set(source) , node) > 0
                    if degrel(s_set(source) , node) > max(1)
                        max(1) = degrel(s_set(source) , node);
                        max(2) = s_set(source);
                        max(3) = node;
                    end
                end
            end
        end

        %%%%%make node to be added with the source set and also make sure that no
        %%%%%link exits between source nodes


        for i = 1 : s_size
            rel_mat(s_set(i) , max(3)) = 0;
            rel_mat(max(3) , s_set(i)) = 0;
        end

        net(max(2) , max(3)) = 1;
        net(max(3) , max(2)) = 1;

        no_of_link = no_of_link + 1;

        degree_node(max(2)) = degree_node(max(2)) + 1;
        degree_node(max(3)) = degree_node(max(3)) + 1;

        [ degrel ] = Make_degree_rel_ratio( rel_mat , degree_node );


        count = 0;
        for r = 1 : s_size
            if s_set(r) == max(3)
                count = count + 1;
            end
        end
        if count == 0
            s_set(s_size + 1) = max(3);
        end

    end
    

end

