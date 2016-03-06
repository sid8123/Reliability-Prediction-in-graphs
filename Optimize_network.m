function [ pre_rel , pre_cost , pre_all_cut_set , opt_rel , opt_cost , opt_all_cut_set , opt_net ] = Optimize_network( network , rel , cost , node_rel , node_cost)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    [n n] = size(rel);
    
    %%%%%%%% evaluation of required link %%%%%%%%%%%%%%%%%%%
    required_link = 0;
    for i = 1 : n
        for j = 1 : i - 1
            if network(i , j) > 0
                required_link = required_link + 1;
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



    %@@@@@@@@ modifying reliability matrix with node reliability@@@@@@@@@@%
    [ rel ] = Evaluate_link_rel_with_node_rel( rel , node_rel );
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%
    
    %@@@@@@@@@@@@@@@ modifying cost matrix with node cost @@@@@@@@@@@@@@@@%
    [ cost ] = Eval_link_cost_with_node_cost( cost , node_cost );
    %@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%
    
    

    rel_mat = rel;
    cost_mat = cost;
    
    
    
    
    

    
    


    %%%%%%%%%%%%%reliability to cost ratio calculation%%%%%%%%%%%%%%%%%%%%%
    relcost = zeros(n , n);
    for i = 1 : n
        for j = 1 : n
            if i == j

            else
                relcost(i , j) = rel_mat(i , j) / cost_mat(i , j);
            end

        end
    end

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%%%%%%%%% maximum reliable tree generation %%%%%%%%%%%%%%%%%%%%%%
    net_tree = Spanning_tree( relcost );
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %%%%%%%%% declaration of necessary variables %%%%%%%%%%%%%%%%%%%%%
    opt_net = net_tree;
    degree_node = zeros(1 , n);
    degrelcost = zeros(n , n);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%%%%%%%%%%% finding links which are not used in net_tree %%%%%%%%%%%%%%%%
    for i = 1 : n
        for j = 1 : n
            if net_tree(i , j) > 0
                %degrelcost(i , j) = 0;
                relcost(i , j) = 0;
                degree_node(i) = degree_node(i) + 1;
                degree_node(j) = degree_node(j) + 1;
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%%%%%%%%% calculation of ratio of relcost to degree %%%%%%%%%%%%
    for i = 1 : n
        for j = 1 : n
            if relcost(i , j) > 0
                degrelcost(i , j) = relcost(i , j) / ( degree_node(i) + degree_node(j) );
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %%%%%%%%%%% repeated calculation of maximum reliable link %%%%%%%%%%%%%%%%
    current_link = n - 1;
    while current_link < required_link
        max = zeros(1 , 3);
        for i = 1 : n
            for j = 1 : i - 1
                if degrelcost(i , j) > 0
                    if degrelcost(i , j) > max(1)
                        max(1) = degrelcost(i , j);
                        max(2) = i;
                        max(3) = j;
                    end
                end
            end
        end

        opt_net(max(2) , max(3)) = 1;
        opt_net(max(3) , max(2)) = 1;

        degree_node(max(2)) = degree_node(max(2)) + 1;
        degree_node(max(3)) = degree_node(max(3)) + 1;

        current_link = current_link + 1;
        relcost(max(2) , max(3)) = 0;
        relcost(max(3) , max(2)) = 0;

        [ degrelcost ] = Make_degree_rel_ratio( relcost , degree_node );

    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%calculation of pre_reliability and cost %%%%%%%%%%%%%%%%
                %------------calculation of cost--------------%
                [ pre_cost ] = Cal_cost_of_network( network , cost );
                %---------------------------------------------%
                
                %________calculation of pre_reliability_______%
                [ p ] = Calculate_p_from_reliability_matrix( network , rel );
                
                [ pre_rel pre_all_cut_set] = Network_Reliability( network  , p );
                 
                %_____________________________________________%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    %%%%%%%%%%%%%%%calculation of opt_reliability and opt_cost %%%%%%%%%%%%%%%%
                %------------calculation of cost--------------%
                [ opt_cost ] = Cal_cost_of_network( opt_net , cost );
                %---------------------------------------------%
                
                %________calculation of pre_reliability_______%
                [ opt_p ] = Calculate_p_from_reliability_matrix( opt_net , rel );
                
                [ opt_rel opt_all_cut_set] = Network_Reliability( opt_net  , opt_p );
                
                %_____________________________________________%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    

end

