function [ cut ] = My_operator( cut_one , cut_two )

    cut = and(~(cut_one),cut_two);

end

