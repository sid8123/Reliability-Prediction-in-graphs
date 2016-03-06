function [pre_rel1 , pre_cost1 , pre_all_cut_set1 , pre_rel2 , pre_cost2 , pre_all_cut_set2 , opt_rel , opt_cost , opt_all_cut_set , opt_net ] = Graph_addtion_opt( network1 , rel1 , cost1 , node_rel1 , node_cost1 , network2 , rel2 , cost2 , node_rel2 , node_cost2 , required_link)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


    [n1 n1] = size(network1);
    [n2 n2] = size(network2);


    node_rel = node_rel1;
    node_rel(n1+1 : n1+n2) = node_rel2;

    node_cost = node_cost1;
    node_cost(n1+1 : n1+n2) = node_cost2;



    network = zeros(n1+n2 , n1+n2);

    network(1:n1 , 1:n1) = network1;
    network(n1+1:n1+n2 , n1+1:n1+n2) = network2;
    
    rel = zeros(n1+n2 , n1+n2);
    rel(n1+1: n1+n2 , 1 : n1) = ones(n2 , n1) .* 0.9;

    rel(1:n1 , 1:n1) = rel1;
    rel(n1+1:n1+n2 , n1+1:n1+n2) = rel2;
    
    
    
    cost = zeros(n1+n2 , n1+n2);
    cost(n1+1: n1+n2 , 1 : n1) = ones(n2 , n1).*10;

    cost(1:n1 , 1:n1) = cost1;

    cost(n1+1:n1+n2 , n1+1:n1+n2) = cost2;
    
    
    node_rel = [node_rel1 node_rel2];
    node_cost = [node_cost1 node_cost2];
    
    nodeset1 = [1:n1];
    nodeset2 = [n1 + 1 : n1 + n2];
    
    [ pre_rel , pre_cost , pre_all_cut_set , opt_rel , opt_cost , opt_all_cut_set , opt_net ] = k_set_opt(  network , rel , cost , node_rel , node_cost , nodeset1 , nodeset2 , required_link );

    
    
    %%%%%%%%%%%%%%%calculation of pre_reliability_one and pre_cost_one %%%%%%%%%%%%%%%%
                %------------calculation of cost--------------%
                [ cost1 ] = Eval_link_cost_with_node_cost( cost1 , node_cost1 );
                [ pre_cost1 ] = Cal_cost_of_network( network1 , cost1 );
                %---------------------------------------------%
                
                %________calculation of pre_reliability_______%
                [ rel1 ] = Evaluate_link_rel_with_node_rel( rel1 , node_rel1 );
                [ p1 ] = Calculate_p_from_reliability_matrix( network1 , rel1 );
                
                [ pre_rel1 pre_all_cut_set1] = Network_Reliability( network1  , p1 );
                 
                %_____________________________________________%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%calculation of pre_reliability and cost %%%%%%%%%%%%%%%%
                %------------calculation of cost--------------%
                [ cost2 ] = Eval_link_cost_with_node_cost( cost2 , node_cost2 );
                [ pre_cost2 ] = Cal_cost_of_network( network2 , cost2 );
                %---------------------------------------------%
                
                %________calculation of pre_reliability_______%
                [ rel2 ] = Evaluate_link_rel_with_node_rel( rel2 , node_rel2 );
                [ p2 ] = Calculate_p_from_reliability_matrix( network2 , rel2 );
                [a b] = size(network2);
                if a > 2
                    [ pre_rel2 pre_all_cut_set2] = Network_Reliability( network2  , p2 );
                else
                    pre_rel2 = 0.9;
                    pre_all_cut_set2 = [];
                end
                 
                %_____________________________________________%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
end

