function [ ] = My_view_with_weight( mat , ids)

    [no_of_vertex , no_of_vertex] = size(mat);

    mat_copy = zeros(size(mat));
    for i = 1: no_of_vertex
        for j = 1 : i
            mat_copy(i,j) = mat(i,j);
        end
    end

    bg = biograph(mat_copy,ids);
    set(bg , 'ShowArrows' , 'off' , 'ShowWeights' , 'off' );
    set(bg.nodes , 'Shape' , 'circle' , 'LineWidth' , 2 , 'FontSize' , 20 , 'Color' , [1, 1, 1] , 'LineColor' , [0, 0, 0]);
    set(bg.edges ,'LineWidth' , 2 , 'LineColor' , [0, 0, 0]);
    view(bg)

end

