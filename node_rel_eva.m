function [ link_rel ] = node_rel_eva( nl1 , nl2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    link_rel = 1 - ((1 - nl1) + (nl1 * (1 - nl2)));
    

end

