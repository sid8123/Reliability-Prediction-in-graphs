function [ ] = Main_function( network , p , node_rel )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here



    


    disp('***************** reliability evaluation programm *********************')
    disp(' ')
    disp('step - 1 << inputing the adjacency matrix >>')
    disp('Do you want to enter the adjacency matrix        :          (''y'' / ''n'')  ')
    disp('(otherwise it will take the default value present in file)')
    ch = input('choice : ');
    if ch == 'y'
        network = input('adjacency matrix {enter}: ');
        node_rel = input('reliability of nodes : ');
        p = input('reliability of links : ');
    else
        disp('default value taken');
    end

    while(1)
        while(1)
            home
            
            [n n] = size(network);
            disp('***************** reliability evaluation programm *********************')
            disp(' ')
            disp('              |-------------------------------------------------|')
           disp(['              | no of nodes : ' int2str(n) '                                |'])
            disp('              | 1 ---- for network reliability                  |')
            disp('              | 2 ---- for s - t reliability                    |')
            disp('              | 3 ---- for m-group reliability with network     |')
            disp('              | 4 ---- for k-terminal reliability               |')
            disp('              |-------------------------------------------------|')
            choice = input('              choice ?? : ');

            if choice == 1

                tic
                [ reliability all_cut_set node_left link_matrix] = Network_Reliability( network , p , node_rel );
                toc

                [no_of_cut , link_no] = size(all_cut_set);
                [m nl] = size(link_matrix);
                disp(' ')
                disp( '********************* graph details*****************************')
                disp(['* no of nodes : ' int2str(n)])
                disp(['* no of links : ' int2str(nl)])
                disp(['* no of cuts  : ' int2str(no_of_cut)])
                fprintf( '* reliability : %20.19f \n', reliability)
                disp( '*****************************************************************')
                disp(' ')
                My_view_with_link_undirected( network , link_matrix )

            elseif choice == 2

                source = input('source ? : ');
                [a b] = size(source);
                if b > 1 || a > 1
                    disp('source value not single !!!!!!')
                    break
                end
                sink = input('sink ?   : ');
                [a b] = size(sink);
                if b > 1 || a > 1
                    disp('sink value not single !!!!!!')
                    break
                end
                tic
                [ reliability all_cut_set node_left link_matrix BFS_matrix ] = S_T_Reliability( network ,source , sink , p , node_rel );
                toc

                [no_of_cut , link_no] = size(all_cut_set);
                [m nl] = size(link_matrix);
                disp(' ')
                disp( '********************* graph details*****************************')
                disp(['* no of nodes : ' int2str(n)])
                disp(['* no of links : ' int2str(nl)])
                disp(['* Source      : ' int2str(source)])
                disp(['* Sink        : ' int2str(sink)])
                disp(['* no of cuts  : ' int2str(no_of_cut)])
                fprintf( '* reliability : %20.19f \n', reliability)
                disp( '*****************************************************************')
                disp(' ')
                My_view_with_link_undirected( network , link_matrix )
                view(biograph(BFS_matrix))

            elseif choice == 3

                k_terminal = input('m-group nodes ?? : ');
                tic
                [node_left reliability all_cut_set link_matrix ] = Reliability_of_group_nodes_with_network( network ,k_terminal , p ,node_rel);
                toc

                [no_of_cut , link_no] = size(all_cut_set);
                [m nl] = size(link_matrix);
                disp(' ')
                disp( '********************* graph details*****************************')
                disp(['* no of nodes : ' int2str(n)])
                disp(['* no of links : ' int2str(nl)])
                disp(['* group nodes : ' int2str(k_terminal)])
                disp(['* no of cuts  : ' int2str(no_of_cut)])
                fprintf( '* reliability : %20.19f \n', reliability)
                disp( '*****************************************************************')
                disp(' ')

                My_view_with_link_undirected( network , link_matrix )

            elseif choice == 4
                
                k_terminal = input('k-terminal nodes ?? : ');
                tic
                [reliability all_cut_set node_left link_matrix ] = K_terminal_reliability( network , p ,node_rel , k_terminal);
                toc

                [no_of_cut , link_no] = size(all_cut_set);
                [m nl] = size(link_matrix);
                disp(' ')
                disp( '********************* graph details*****************************')
                disp(['* no of nodes : ' int2str(n)])
                disp(['* no of links : ' int2str(nl)])
                disp(['* k_terminals : ' int2str(k_terminal)])
                disp(['* no of cuts  : ' int2str(no_of_cut)])
                fprintf( '* reliability : %20.19f \n', reliability)
                disp( '*****************************************************************')
                disp(' ')

                My_view_with_link_undirected( network , link_matrix )
                
            else
                disp('wrong choice entered')
            end

            ch_choice = input('print all cut-set!! (y/n) : ');
            if ch_choice == 'y'
                disp('all cutset of graph : ')
                print_cut_set(all_cut_set)
            end
            

            disp(' ')
            ch = input('countinue evaluating the same graph ??? : (''y''/''n'') : ');
            if ch ~= 'y'
                break
            end
        end
        
        choice = input('evaluate another graph?? : (''y''/''n'') : ');
        if choice == 'y'
            clc
            disp('***************** reliability evaluation programm *********************')
            disp(' ')
            network = input('adjacency matrix {enter}: ');
            node_rel = input('reliability of nodes    : ');
            p = input('reliability of links    : ');
        else
            break
        end
    end
    
    disp('****************************** thank you *************************************')

end

