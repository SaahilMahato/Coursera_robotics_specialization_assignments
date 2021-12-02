function flag = triangle_intersection(P1, P2)
% triangle_test : returns true if the triangles overlap and false otherwise

%%% All of your code should be between the two lines of stars.
% *******************************************************************

flag = false;
flag = check(P1, P2) && check(P2, P1);

function bool = check(t1, t2)
    for i = 1:3
        % assign indices
        j = mod(i, 3) + 1;
        k = mod(j, 3) + 1;
        
        % assign points
        pt1 = t1(i, :);
        pt2 = t1(j, :);
        pt3 = t1(k, :);
        
        % initialize equation
        e1 = 0;
        e2 = 0;
        
        if pt1(1) == pt2(1)
            % if line is vertical slope will be infinite so we need a differet case
            % to calculate equation
            e1 = pt3(1) - pt1(1);
            e2 = t2(:, 1) - pt1(1);
        else
            % calculate equation in case of finite slope
            m = (pt2(2) - pt1(2)) / (pt2(1) - pt1(1));
            c = pt2(2) - m * pt2(1);
            e1 = pt3(2) - (m * pt3(1) + c);
            e2 = t2(:, 2) - (m .* t2(:, 1) + c);
        end
        
        
        diff_side = (e1 * e2) < 0; % if triangles don't interset e1 * e2 < 0
        if all(diff_side)
            bool = false; 
            return;
        end
    end
    bool = true;
end
% *******************************************************************
end