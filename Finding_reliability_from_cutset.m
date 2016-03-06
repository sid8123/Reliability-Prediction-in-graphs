function [ reliability ] = Finding_reliability_from_cutset( cut_set , p )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%%%%%%%%%%%formatting purpose%%%%%%%%%%%


format long
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%formation of unreliability matrix%%%%
[c e] = size(cut_set);

q = zeros(1,e);  % q = unreliability matrix
for i = 1 : e
    q(i) = 1 - p(i);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%evaluation of reliability %%%%%%%%%%%%%%%%
[reliability] = Unreliability_of_cut(cut_set(1,:) , q);
 



for i = 2 : c
    dummy_rel = 1;
 
    for j = 1 : i - 1
        [dummy_rel_rel] = Calculate_rel( My_operator(cut_set(i,:) , cut_set(j,:)), p , q );
        dummy_rel = dummy_rel * dummy_rel_rel;
        
    end
    
    
    [un_rel] = Unreliability_of_cut(cut_set(i,:) , q);
    dummy_rel = dummy_rel * un_rel;
    
    reliability = reliability + dummy_rel;
    
end

reliability = 1 - reliability;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end

