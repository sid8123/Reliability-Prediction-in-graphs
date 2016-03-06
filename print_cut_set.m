function [  ] = print_cut_set( all_cut_set )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [row col] = size(all_cut_set);
    
%     dummy_cut = [];
%     kr = 1;
%     lc = 1;
%     
%     for i = 1 : row
%         lc = 1;
%         for j = 1 : col
%             if all_cut_set(i , j) == 1
%                 dummy_cut(kr,lc) = j;
%                 lc = lc + 1;
%             end
%         end
%         kr = kr + 1;
%     end
    %cutset = [];
    for i = 1 : row
        cut = ['{ '];
        for j = 1 : col
            if all_cut_set(i , j) == 1
                cut = [cut 'e' int2str(j) ' ' ];
            end
            
        end
        cut = [cut '}'];
        disp(cut)
        %cutset =[cutset '\n' ' ' cut ];
    end
    

end

