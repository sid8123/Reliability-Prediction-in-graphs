clear all
clc
format long
net = zeros(16 ,16);

% rel_mat = [
%     000  0.9  0.9  0.9   0.9  0.9;
%     0.9  000  0.9  0.9   0.9  0.9;
%     0.9  0.9  000  0.9   0.9  0.9;
%     0.9  0.9  0.9  000   0.9  0.9;
%     0.9  0.9  0.9  0.9   000  0.9;
%     0.9  0.9  0.9  0.9   0.9  000];


% rel_mat = [
%          0    0.6551    0.1493    0.9172    0.1622    0.5383    0.1818    0.1839    0.0965    0.5470    0.5085    0.4709    0.2581    0.9289    0.0377    0.8909;
%     0.6551         0    0.2575    0.2858    0.7943    0.9961    0.2638    0.2400    0.1320    0.2963    0.5108    0.2305    0.4087    0.7303    0.8852    0.3342;
%     0.1493    0.2575         0    0.7572    0.3112    0.0782    0.1455    0.4173    0.9421    0.7447    0.8176    0.8443    0.5949    0.4886    0.9133    0.6987;
%     0.9172    0.2858    0.7572         0    0.5285    0.4427    0.1361    0.0497    0.9561    0.1890    0.7948    0.1948    0.2622    0.5785    0.7962    0.1978;
%     0.1622    0.7943    0.3112    0.5285         0    0.1067    0.8693    0.9027    0.5752    0.6868    0.6443    0.2259    0.6028    0.2373    0.0987    0.0305;
%     0.5383    0.9961    0.0782    0.4427    0.1067         0    0.5797    0.9448    0.0598    0.1835    0.3786    0.1707    0.7112    0.4588    0.2619    0.7441;
%     0.1818    0.2638    0.1455    0.1361    0.8693    0.5797         0    0.4909    0.2348    0.3685    0.8116    0.2277    0.2217    0.9631    0.3354    0.5000;
%     0.1839    0.2400    0.4173    0.0497    0.9027    0.9448    0.4909         0    0.3532    0.6256    0.5328    0.4357    0.1174    0.5468    0.6797    0.4799;
%     0.0965    0.1320    0.9421    0.9561    0.5752    0.0598    0.2348    0.3532         0    0.7802    0.3507    0.3111    0.2967    0.5211    0.1366    0.9047;
%     0.5470    0.2963    0.7447    0.1890    0.6868    0.1835    0.3685    0.6256    0.7802         0    0.9390    0.9234    0.3188    0.2316    0.7212    0.6099;
%     0.5085    0.5108    0.8176    0.7948    0.6443    0.3786    0.8116    0.5328    0.3507    0.9390         0    0.4302    0.4242    0.4889    0.1068    0.6177;
%     0.4709    0.2305    0.8443    0.1948    0.2259    0.1707    0.2277    0.4357    0.3111    0.9234    0.4302         0    0.5079    0.6241    0.6538    0.8594;
%     0.2581    0.4087    0.5949    0.2622    0.6028    0.7112    0.2217    0.1174    0.2967    0.3188    0.4242    0.5079         0    0.6791    0.4942    0.8055;
%     0.9289    0.7303    0.4886    0.5785    0.2373    0.4588    0.9631    0.5468    0.5211    0.2316    0.4889    0.6241    0.6791         0    0.7791    0.5767;
%     0.0377    0.8852    0.9133    0.7962    0.0987    0.2619    0.3354    0.6797    0.1366    0.7212    0.1068    0.6538    0.4942    0.7791         0    0.1829;
%     0.8909    0.3342    0.6987    0.1978    0.0305    0.7441    0.5000    0.4799    0.9047    0.6099    0.6177    0.8594    0.8055    0.5767    0.1829         0];
% 

rel_mat = rand(16 , 16);
cost_mat = magic(16);


% rel_mat = ones(26 , 26).*0.9;

[n n] = size(rel_mat);

for i = 1 : n
    for j = 1 : n
        if i == j
            rel_mat(i , i) = 0;
            cost_mat(i , i) = 0;
        else
            rel_mat(i , j) = rel_mat(j , i);
            cost_mat(i , j) = cost_mat(j , i);
        end
        
    end
end













%%%%%%%%%%%%%reliability to cost calculation%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1 : n
    for j = 1 : n
        if i == j
            
        else
            rel_mat(i , j) = rel_mat(i , j) / cost_mat(i , j);
        end
        
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



no_of_link = 0;

degree_node = ones(1 , n) .* 0.001;
[ degrel ] = Make_degree_rel_ratio( rel_mat , degree_node );

s_set = [1];



for h = 1 : n
    [m s_size] = size(s_set);
    if s_size == n
        break
    end
    
    max = zeros(1 , 3);
    for source = 1 : s_size
        for node = 1 : n
            if degrel(s_set(source) , node) > 0
                if degrel(s_set(source) , node) > max(1)
                    max(1) = degrel(s_set(source) , node);
                    max(2) = s_set(source);
                    max(3) = node;
                end
            end
        end
    end

    %%%%%make node to be added with the source set and also make sure that no
    %%%%%link exits between source nodes
    
    
    for i = 1 : s_size
        rel_mat(s_set(i) , max(3)) = 0;
        rel_mat(max(3) , s_set(i)) = 0;
    end

    net(max(2) , max(3)) = 1;
    net(max(3) , max(2)) = 1;
    
    no_of_link = no_of_link + 1;
    
    degree_node(max(2)) = degree_node(max(2)) + 1;
    degree_node(max(3)) = degree_node(max(3)) + 1;

    [ degrel ] = Make_degree_rel_ratio( rel_mat , degree_node );
    
    
    count = 0;
    for r = 1 : s_size
        if s_set(r) == max(3)
            count = count + 1;
        end
    end
    if count == 0
        s_set(s_size + 1) = max(3);
    end
    
    
    
end

My_view_with_link_undirected( net )

no_of_link
