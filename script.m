close all; clear all; clc; format compact;

j0 = 5;         % Card Combos start at 5 cards 
N = 52;         % Num Cards in hand (Max 52)

ofakind = zeros(N,7);  %From 2 of a kind to 8 of a kind
flushes = zeros(N,12);  %From 2 card flushes to 13 card flushes
straights = zeros(N,11);  %From 3 card straight to dragon (including wild)
straightflushes = zeros(N,11);  %From 3 card straight flush to dragon (including wild)

for j = j0:N
    for i = 1:size(ofakind,2)   %Fills Nx7 Matrix
        if i < j-5
            ofakind(j,i) = LiarPokerConv(@(hand) OfAKind(hand,i+1),j);
        end
        progressbar((j-j0+i/size(ofakind,2))/(N-j0+1));
    end

    for i = 1:size(flushes,2)
        if i < j-5
            flushes(j,i) = LiarPokerConv(@(hand) flush(hand,i+1),j);
        end
        progressbar((j-j0+i/size(flushes,2))/(N-j0+1));
    end

    for i = 1:size(straights,2)
        if i<j-4 && i == 11
            straights(j,i) = LiarPokerConv(@(hand) straight(hand,12,1),j);
        elseif i<j-4
            straights(j,i) = LiarPokerConv(@(hand) straight(hand,i+2),j);
        end
        progressbar((j-j0+i/size(straights,2))/(N-j0+1));
    end

    for i = 1:size(straightflushes,2) %Fills Nx7 Matrix
        if i<j-10 && i == 11
            straightflushes(j,i) = ...
                LiarPokerConv(@(hand) straightflush(hand,12,1),j);
        elseif i<j-11 
            straightflushes(j,i) = ...
                LiarPokerConv(@(hand) straightflush(hand,i+2),j,0.02);
        end
        progressbar((j-j0+i/size(straightflushes,2))/(N-j0+1));
    end
end

save ofakind.mat ofakind;
save flushes.mat flushes;
save straightflushes.mat straightflushes;