%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:        Exponential Search Algorithm (Including Binary Search)
% Author:       Samir Habibi (sid1819363)
% Rev. Date:    11/05/2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [numComparisons, targetIndex] = exponentialSearch(V, target)
%EXPONENTIALSEARCH Perfom Exponential Search Algorithm.
%   This function performs the exponential search algorithm on a given
%   array by taking the array & search target as input argument.

    numComparisons = 0;
    N = length(V);

    if(V(1) == target) % Compare target with first array value
        numComparisons = numComparisons + 1; % Comparison count to '1'        
        return % Return, search target found
    end % End if statement

    i = 1; % Set value for current array index

    % While search target is bigger than i, keep multiplying i by two.
    % Multiply i by two, so exponentially: 1*2=2^1 .. 2*2=2^2 .. 4*2=2^3 etc.
    while(i < N && V(i) <= target)
        i = i * 2; 
        numComparisons = numComparisons + 1;
    end

    bottom = i/2;
    top = min( i, N );

    % Execute Binary Search algorithm (chop until one element) in the above 
    % found range 2^j & 2^j-1) by giving the upper and lower bound where the 
    % search target is present.
    while(bottom < top)

        middle = floor((bottom+top)/2); 

        numComparisons = numComparisons + 1;
        if(target > V(middle))
            bottom = middle + 1;
        else
            top = middle;
        end % end if

    end % end while

    numComparisons = numComparisons + 1;
    if(V(top)==target)
        targetIndex = top;
    else
        targetIndex = -1;
    end % end if-else statement

end % end function