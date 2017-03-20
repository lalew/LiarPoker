function hand = draw(deck,n)
%Draw n cards.  (Create a new deck with the first n elements of deck.)

hand = cell(size(n,1));

for i = 1:n
    hand{i} = deck{i};
end

end