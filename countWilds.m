function wildnum = countWilds(hand,wild)

%Second argument is optional, defaults to 2 if not specified
if nargin < 2
    wild = 2;
end

wildnum = 0;

for i = 1:numel(hand)
    if hand{i}.num == wild
        wildnum = wildnum+1;
    end
end

end