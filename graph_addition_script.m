clc
format long
clear all


%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%
network1 = [
    0 1 0 1 0 0;
    1 0 1 1 0 0;
    0 1 0 1 1 1;
    1 1 1 0 1 0;
    0 0 1 1 0 1;
    0 0 1 0 1 0];
network2 = [
    0];
% rel2 = [
%     000  0.9  0.9  0.9   0.9  0.9;
%     0.9  000  0.9  0.9   0.9  0.9;
%     0.9  0.9  000  0.9   0.9  0.9;
%     0.9  0.9  0.9  000   0.9  0.9;
%     0.9  0.9  0.9  0.9   000  0.9;
%     0.9  0.9  0.9  0.9   0.9  000];
% cost2 = [
%      0 10 10 10 10 10;
%     10  0 10 10 10 10;
%     10 10  0 10 10 10;
%     10 10 10  0 10 10;
%     10 10 10 10  0 10;
%     10 10 10 10 10  0
%     ];
% node_rel2 = [0.9 0.9 0.9 0.9 0.9 0.9];
% node_cost2 = [10 10 10 10 10 10];
%++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++%

%=================================================================================================================================================================%
% network1 = [
%     0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
%     1 0 1 0 0 1 0 0 0 0 0 0 0 0 0 0;
%     1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0;
%     0 0 1 0 1 0 0 1 0 0 0 0 0 0 0 0;
%     0 0 0 1 0 1 1 1 0 1 0 0 0 0 0 0;
%     0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0;
%     0 0 0 0 1 1 0 0 1 1 0 0 0 0 0 0;
%     0 0 0 1 1 0 0 0 0 0 1 0 0 0 0 0;
%     0 0 0 0 0 0 1 0 0 1 0 1 0 0 0 0;
%     0 0 0 0 1 0 1 0 1 0 1 1 1 0 0 0;
%     0 0 0 0 0 0 0 1 0 1 0 0 1 0 0 0;
%     0 0 0 0 0 0 0 0 1 1 0 0 1 1 1 0;
%     0 0 0 0 0 0 0 0 0 1 1 1 0 0 1 0;
%     0 0 0 0 0 0 0 0 0 0 0 1 0 0 1 1;
%     0 0 0 0 0 0 0 0 0 0 0 1 1 1 0 1;
%     0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0];

% rel1 = [
%          0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0    0.9000;
%     0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000         0];
% cost1 = [
%      0    10    10    10    10    10    10    10    10    10    10    10    10    10    10    10;
%     10     0    10    10    10    10    10    10    10    10    10    10    10    10    10    10;
%     10    10     0    10    10    10    10    10    10    10    10    10    10    10    10    10;
%     10    10    10     0    10    10    10    10    10    10    10    10    10    10    10    10;
%     10    10    10    10     0    10    10    10    10    10    10    10    10    10    10    10;
%     10    10    10    10    10     0    10    10    10    10    10    10    10    10    10    10;
%     10    10    10    10    10    10     0    10    10    10    10    10    10    10    10    10;
%     10    10    10    10    10    10    10     0    10    10    10    10    10    10    10    10;
%     10    10    10    10    10    10    10    10     0    10    10    10    10    10    10    10;
%     10    10    10    10    10    10    10    10    10     0    10    10    10    10    10    10;
%     10    10    10    10    10    10    10    10    10    10     0    10    10    10    10    10;
%     10    10    10    10    10    10    10    10    10    10    10     0    10    10    10    10;
%     10    10    10    10    10    10    10    10    10    10    10    10     0    10    10    10;
%     10    10    10    10    10    10    10    10    10    10    10    10    10     0    10    10;
%     10    10    10    10    10    10    10    10    10    10    10    10    10    10     0    10;
%     10    10    10    10    10    10    10    10    10    10    10    10    10    10    10     0];
% 
% node_rel1 = [ 0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000    0.9000];
% node_cost1 = [ 10    10    10    10    10    10    10    10    10    10    10    10    10    10    10    10];

%========================================================================================================================================================================%


% if you do not want to enter reliability and cost matrix then uncomment
% the following code . this will automatically generate these matrixes with
% given homogeneuos value

%%%%%%%%%%%%%%%%%%%%%%%% default values %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% relia = input('reliability value : ');
% costt = input('cost value : ');
relia = 0.9;
costt = 10;
[n1 , n1] = size(network1);
rel1 = ones(n1 , n1) .* relia;
for i = 1 : n1
    rel1(i , i) = 0;
end
cost1 = ones(n1 , n1) .* costt;
for i = 1 : n1
    cost1(i , i) = 0;
end

node_rel1 = ones(1 , n1) .* relia;
node_cost1 = ones(1 , n1) .* costt;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[n2 , n2] = size(network2);
rel2 = ones(n2 , n2) .* relia;
for i = 1 : n2
    rel2(i , i) = 0;
end
cost2 = ones(n2 , n2) .* costt;
for i = 1 : n2
    cost2(i , i) = 0;
end

node_rel2 = ones(1 , n2) .* relia;
node_cost2 = ones(1 , n2) .* costt;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




required_link = input('no of link allowed between two graphs : ');
tic
[pre_rel1 , pre_cost1 , pre_all_cut_set1 , pre_rel2 , pre_cost2 , pre_all_cut_set2 , opt_rel , opt_cost , opt_all_cut_set , opt_net ] = Graph_addtion_opt( network1 , rel1 , cost1 , node_rel1 , node_cost1 , network2 , rel2 , cost2 , node_rel2 , node_cost2 , required_link );
toc



     [ n1 , n1 ] = size(network1);
     [ cutsetpre1 , linkpre1 ] = size(pre_all_cut_set1);
     
     [ n2 , n2 ] = size(network2);
     [ cutsetpre2 , linkpre2 ] = size(pre_all_cut_set2);
     
     
     [ n3 , n3 ] = size(opt_net);
     [ cutsetpost , linkpost ] = size(opt_all_cut_set);
     
     
     disp('___________details of network one before optimization____________')
     disp(['no of nodes     : ' int2str(n1)])
     disp(['no of link      : ' int2str(linkpre1)])
     disp(['no of min cuts  : ' int2str(cutsetpre1)])
     fprintf( 'reliability     : %20.19f \n', pre_rel1)
     disp(['network cost    : ' int2str(pre_cost1)])
     disp('_____________________________________________________________')
     disp(' ')
     
     
       disp('___________details of network before two optimization____________')
     disp(['no of nodes     : ' int2str(n2)])
     disp(['no of link      : ' int2str(linkpre2)])
     disp(['no of min cuts  : ' int2str(cutsetpre2)])
     fprintf( 'reliability     : %20.19f \n', pre_rel2)
     disp(['network cost    : ' int2str(pre_cost2)])
     disp('_____________________________________________________________')
     disp(' ')
     
     disp('____________details of optimized network_____________')
     disp(['no of nodes     : ' int2str(n3)])
     disp(['no of link      : ' int2str(linkpost)])
     disp(['no of min cuts  : ' int2str(cutsetpost)])
     fprintf( 'reliability     : %20.19f \n', opt_rel)
     disp(['network cost    : ' int2str(opt_cost)])
     disp('_____________________________________________________')



     
     
     
     network_add = zeros(n1+n2 , n1+n2);

    network_add(1:n1 , 1:n1) = network1;
    network_add(n1+1:n1+n2 , n1+1:n1+n2) = network2;


My_view_with_link_undirected( network_add )

My_view_with_link_undirected( opt_net )



 