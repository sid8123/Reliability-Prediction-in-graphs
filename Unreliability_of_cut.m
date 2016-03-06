function [ un_rel] = Unreliability_of_cut(cut_set , q )
   
    [m n] = size(cut_set);
	
    un_rel = 1;
    
    for i = 1 : n
        if cut_set(i) >= 1
            un_rel = un_rel * q(i);
            
        end
    end
    

end

