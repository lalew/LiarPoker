function newdeck = shuffle(deck)

%Initialize new deck variable:
newdeck = cell(size(deck));

%I is now a the numbers 1 through 52 arranged randomly in an array.
[Y,I] = sort(rand(size(deck)));

%Assign old deck values to the appropriate place in newdeck.
for i = 1:length(I)
    newdeck{i} = deck{I(i)};
end

end