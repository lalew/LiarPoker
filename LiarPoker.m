function [prob, std] = LiarPoker(cfun, n, I,deck)
%Inputs:
%   cfun - a handle to a function which takes in a hand as an input, and
%       returns an integer indicating the number of cards needed to
%       complete the combo without any wild cards.  (A nonpositive integer
%       should imply that the combination exists in the hand without any
%       wild cards.)
%   n - Number of cards in play.  (Optional, default value = 10)
%   I - Number of rounds to play.  (Optional, default value = 100000)
%   deck - Optional, default value is imported from deck.mat, which should 
%       be saved in the same folder.  deck is a 52x1 cell array of 
%       structures.  Each structure has two keys, num and suit, which
%       give the number value (J = 11, Q = 12, K = 13) and suit of the
%       card (d = diamond, c = clubs, h = hearts, s = spades)
%
%Output:
%   prob - Simulated probability of your combination occurring.
%   std - One error bar ("standard deviation") of your result.  (Lower std 
%       values = more accurate.  std scales inversely with the square root 
%       of the input I.  Runtime should scale proportionally to I.  There
%       is a ~95% chance of the actual probability being within prob +/-
%       2*std)


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
    I = 100000;
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

% Integer and bounds check
if n ~= ceil(n) || n < 1 || n > 52
    disp('n must be an integer between 1 and 52');
    return;
end
if I < 1
    disp('I must be a positive integer (and probably a large one)');
    return;
end

%Shuffle the deck a bunch of times:
for i = 1:100
    deck = shuffle(deck);
end


counts = 0;  %Tally for number of successes
%Cycle through I rounds
for i = 1:I
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
        
    %Simulation progress bar:
    progressbar(i/I);
end

prob = counts/I;
std = sqrt(counts)/I;

%Save deck:
save deck.mat deck

end