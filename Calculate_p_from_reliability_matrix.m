function [ p ] = Calculate_p_from_reliability_matrix( network , reliability_matrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

     [n n] = size(network);
     p = [];
     kp = 1;

     for row = 1 : n
         for col = 1 : row - 1
             if network(row , col) == 1
                 p(kp) = reliability_matrix(row , col);
                 kp = kp + 1;
             end
         end
     end
end

