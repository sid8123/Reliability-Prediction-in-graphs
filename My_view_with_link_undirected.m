function [  ] = My_view_with_link_undirected( mat )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


[n n] = size(mat);
ids = { '1' '2' '3' '4' '5' '6' '7' '8' '9' '10' '11' '12' '13' '14' '15' '16' '17' '18' '19' '20' '21' '22' '23' '24' '25' '26' '27' '28' '29' '30' '31' '32' '33' '34' };
ids = ids(1:n);
% for i = 1 : n
%     for j = 1 : i - 1
%         if mat(i,j) == 1
%             for k = 1 : e
%                 if link_mat(i,k) == 1 && link_mat(j,k) == 1
%                     mat(i,j) = k;
%                     break
%                 end
%             end
%         end
%     end
% end
My_view_with_weight(mat ,ids);

end

