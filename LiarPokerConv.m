function [prob, std] = LiarPokerConv(cfun, n, eps,deck)
%Inputs:
%   cfun - a handle to a function which takes in a hand as an input, and
%       returns an integer indicating the number of cards needed to
%       complete the combo without any wild cards.  (A nonpositive integer
%       should imply that the combination exists in the hand without any
%       wild cards.)
%   n - Number of cards in play.  (Optional, default value = 10)
%   eps - Convergence criteria.  (Optional, default = 1% of prob)
%   deck - Optional, default value is imported from deck.mat, which should 
%       be saved in the same folder.  deck is a 32x1 cell array of 
%       structures.  Each structure has two keys, num and suit, which
%       give the number value (J = 11, Q = 12, K = 13) and suit of the
%       card (d = diamond, c = clubs, h = hearts, s = spades)
%
%Output:
%   prob - Simulated probability of your combination occurring.
%   std - One error bar ("standard deviation") of your result.  (Lower std 
%       values = more accurate.)


%Initialize values:
prob = 0; std = 0;

%In case you forgot some arguments:  (nargin = number of arguments)
if nargin == 0
    cfun = @(hand) 0;  
    %This is just a function that just always returns "true" (combination 
    %   always exists)
end
if nargin < 2
    n = 10;
end
if nargin < 3
    eps = 0.01;
end
if nargin <4
    try
        temp = load('deck.mat');
        deck = temp.deck;
    catch
        disp(['Please place deck.mat (a 52x1 cell of structures with'...
            'each sturcture representing a card']);
    end
end

%
if n ~= ceil(n) || n < 1 || n > 52
    disp('n must be an integer between 1 and 52');
    return;
end
if eps <= 0
    disp('eps must be positive');
    return;
end

%Shuffle the deck a bunch of times:
for i = 1:100
    deck = shuffle(deck);
end


counts = 0;  %Tally for number of successes
i = 0;
%Cycle through I rounds
while counts <= 0 || sqrt(counts)/counts > eps
    %Shuffle deck.
    deck = shuffle(deck);
    %Draw n cards.
    hand = draw(deck,n);
    
    %Check how many cards we're missing (or not missing).
    numLeft = cfun(hand);
    
    %If it exists without the need for wildcards:
    if numLeft <= 0
        counts = counts+1;
    %Else if we have enough wildcards to get the combo:
    elseif numLeft <= countWilds(hand)
        counts = counts+1;
    end
        
    i = i+1;
    %Simulation progress bar:
    %progressbar(eps/(sqrt(counts)/counts));
end

prob = counts/i;
std = sqrt(counts)/i;

end