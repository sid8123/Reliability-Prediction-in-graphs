clc
clear all
format long


%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%
% required_link = 9;
% cost_mat = [
%      0    10    10    10    10    10;
%     10     0    10    10    10    10;
%     10    10     0    10    10    10;
%     10    10    10     0    10    10;
%     10    10    10    10     0    10;
%     10    10    10    10    10     0];
% rel_mat = [
%     000  0.9  0.9  0.9   0.9  0.9;
%     0.9  000  0.9  0.9   0.9  0.9;
%     0.9  0.9  000  0.9   0.9  0.9;
%     0.9  0.9  0.9  000   0.9  0.9;
%     0.9  0.9  0.9  0.9   000  0.9;
%     0.9  0.9  0.9  0.9   0.9  000];
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~%

%__________________________________________________________________%
required_link = 28;
rel_mat = ones(16 , 16) .* 0.9;
cost_mat = ones(16).*10;

for i = 1 : 16
    rel_mat(i , i) = 0;
    cost_mat(i , i) = 0;
end

%__________________________________________________________________%

[n n] = size(rel_mat);


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
My_view_with_link_undirected( opt_net );
opt_net

