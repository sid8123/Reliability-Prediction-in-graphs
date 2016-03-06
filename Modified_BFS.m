function [ level_matrix BFS_matrix ] = Modified_BFS( network , source , sink )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    

    [a no_of_sink_nodes] = size(sink);


    [no_of_vertex , no_of_vertex] = size(network);
    BFS_matrix = zeros(no_of_vertex , no_of_vertex);


    level_matrix = zeros(no_of_vertex , no_of_vertex);

    row_of_level_matrix = 1;
    column_of_level_matrix = 1;


    color_of_vertex = zeros(1, no_of_vertex);

    black = 2;
    white = 0;
    red = 1;

    color_of_vertex( source ) = red;
    
    for i = 1 : no_of_sink_nodes
        color_of_vertex( sink(i) ) = black;
    end

    no_vertex_to_be_visited = no_of_vertex - 1;

    level_matrix(row_of_level_matrix , source) = source;

    while no_vertex_to_be_visited > 0


        for vertex = 1 : no_of_vertex

            if level_matrix(row_of_level_matrix ,vertex) > 0

                for child_node = 1:no_of_vertex

                    if network(vertex,child_node) > 0

                        if color_of_vertex(child_node) == white

                            level_matrix(row_of_level_matrix + 1 ,child_node) = child_node;
                            BFS_matrix(vertex , child_node) = 1;

                        end
                    end
                end

                color_of_vertex(vertex) = black;
                no_vertex_to_be_visited = no_vertex_to_be_visited - 1;



            end
        end



        row_of_level_matrix = row_of_level_matrix + 1;
        
        if row_of_level_matrix <= no_of_vertex 
        
            for i = 1:no_of_vertex
                if level_matrix(row_of_level_matrix , i) > 0
                    color_of_vertex(i) = red;
                end
            end
        else
            break
        end

    end
%     BFS_matrix
%     no_of_vertex
%     no_of_sink_nodes
%     if no_of_sink_nodes < no_of_vertex-1
%         view(biograph(BFS_matrix));
%     end
end

