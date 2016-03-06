function [ all_cut_set ] = Insert_cutset( all_cut_set , cut )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

    [m n] = size(all_cut_set);
    all_cut_set(m+1,:) = cut;

end

