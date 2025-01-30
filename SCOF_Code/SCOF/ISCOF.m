function [LctRec,modes,COSTLOSS]= ISCOF( x  , pm ,  SDT_matrix,LctRec,modes)
    no_total_loop = 0;
    % k-prototype clustering
    Change=1; % set convergence judger for launching loop
    COSTLOSS=zeros(1,101);
    while Change==1 && no_total_loop<=100
        Change=0;
        no_total_loop = no_total_loop + 1;
        dis_obj_modes = zeros( 1 , pm.k );
        for i = 1 : pm.n
            for j = 1 : pm.k
                dis_sub = zeros( 1 , pm.d );
                for t = 1 : pm.d
                    dis_sub( t ) =  SDT_matrix{j}{ t }( x( i , t ) , modes( j , t ) );
                end
                %dis_obj_modes( j ) = sum( dis_sub .* weights);
                dis_obj_modes( j ) = sqrt(sum( dis_sub .^ 2));
            end
            [loss,winner] = min( dis_obj_modes );
%             disp(dis_obj_modes);
            COSTLOSS(no_total_loop)=COSTLOSS(no_total_loop)+loss;
            if LctRec(i)~=winner
                Change=1;
                LctRec(i)=winner;
            end   
        end
        % UPDATE PROTOTYPES

        for c = 1 : pm.k
            x_sub = x( LctRec == c , : );
            if isempty( x_sub ) ==0
                % for nominal and ordinal attributes, cpds
                for t = 1 : pm.d
                    mode_cand_dist = zeros( 1 , pm.no_values( t ) );
                    modes_dct = zeros( 1 , pm.no_values( t ) );
                    sta = tabulate( x_sub( : , t ) );
                    sta_vct = sta( : , 3 )' / 100;
                    modes_dct( 1 : length( sta_vct ) ) = sta_vct;
                    for m = 1 : pm.no_values( t )
                        mode_cand_dist( m ) = ...
                            sum(SDT_matrix{c}{ t }( m , : ) .* modes_dct );
                    end
                    [ ~ , modes( c , t ) ] = min( mode_cand_dist );
                end
            end
        end
%  update mode
%         for j = 1 : pm.k
%             x_sub = x( LctRec == j , 1 : pm.d );
%             if isempty( x_sub ) == 0
%                 for t = 1 : pm.d
%                     sta_table = tabulate( x_sub( : , t ) );
%                     [ ~ , lct_max_freq ]= max( sta_table( : , 2 ) );
%                     modes( j , t )= sta_table( lct_max_freq , 1 );
%                 end
%             end
%         end
    end
end