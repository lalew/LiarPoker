function numLeft = OfAKind(hand,N,card)
%numLeft = N minus the number of cards in hand with num value equal to card

%Check if there is N of a kind (aces if card value isn't supplied)
if nargin < 3
    card = 1;
end

counts = 0;
for i = 1:numel(hand)
    if hand{i}.num == card
        counts = counts+1;
    end
end

numLeft = N - counts;

end