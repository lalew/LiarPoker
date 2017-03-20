function deck = deckGenerator
%Creates an ordered deck of 52 cards.

suits = 'dchs';
deck = cell(52,1);

for i = 1:13
    for j = 1:4
        deck{(i-1)*4+j}.num = i;
        deck{(i-1)*4+j}.suit = suits(j);
    end
end

end