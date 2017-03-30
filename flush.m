function numLeft = flush(hand,n,wilds_removed)
%This function is for calculating whether hand has a n card flush of 
%   spades, NOT including wild cards.  It returns the number of cards you're
%   missing in hand.  (If numLeft is not positive, the combination exists.)
%
%wilds_removed is the number of wilds you're calling inside your straight.
%For example, if you want ace through 5 (with 2 wild), you can calculate
%   the probability by running a simulation for a 4 card straight, with
%   wilds_removed = 1.

if n < 1 || n > 16
    error('Flush parameters incorrect');
    numLeft = NaN;
    return;
end
if nargin < 3
    wilds_removed = 0;
end

counts = 0;
for i = 1:numel(hand)
    if hand{i}.suit == 's' && hand{i}.num ~= 2
        counts = counts+1;
    end
end

numLeft = n - counts + wilds_removed;

end