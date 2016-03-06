function [ cost ] = Cal_cost_of_network( network , cost_matrix )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

     cost = 0;
     

     [n n] = size(network);
     
     for row = 1 : n
         for col = 1 : row - 1
             if network(row , col) == 1
                 cost = cost + cost_matrix(row , col);
             end
         end
     end
     
     cost = round(cost);
end

