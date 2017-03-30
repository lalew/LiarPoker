function numLeft = straightflush(hand,n,wilds_removed)
%This function is for calculating whether hand has a n card straight flush
%   up to ace, NOT including wild cards.  It returns the number of cards 
%   you're missing in hand.  (If numLeft is not positive, the combination
%   exists.)
%
%wilds_removed is the number of wilds you're calling inside your straight.
%For example, if you want ace through 5 (with 2 wild), you can calculate
%   the probability by running a simulation for a 4 card straight, with
%   wilds_removed = 1.

if nargin < 3
    wilds_removed = 0;
end

if n > 12 || n < 0
    disp('n-arg StraightFlush card hands must be non-negative and below 13');
    disp('Try using straightflush(hand,n,1) which removes a wild card');
    numLeft = NaN;
    return;
end

counts = 0;
for j = [1 (13-(n-2)):13]
    for i = 1:numel(hand)
        if hand{i}.num == j && hand{i}.suit == 's'
            counts = counts+1;
            break;
        end
    end
end

numLeft = n - counts + wilds_removed;

end