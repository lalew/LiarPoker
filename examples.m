clear all; close all; clc; format compact;

%Calculate the probability of 5 of a kind, with 20 cards in play, using
%   20000 simulated rounds:
[prob, std] = LiarPoker(@(hand) OfAKind(hand,5),20,20000)
%The OfAKind function assumes that it's 5 of a kind aces, but that should
%   be irrelevant.

%Calculate the probability of a 8 card straight with 15 cards in play,
%   using 5000 simulated rounds:
[prob, std] = LiarPoker(@(hand) straight(hand,8),15,5000)

%% Same as above, but specifying a convergence criteria of 1% instead of 
%   a number of simulations:
prob = LiarPokerConv(@(hand) OfAKind(hand,5),20,0.01)
prob = LiarPokerConv(@(hand) straight(hand,8),15,0.01)

%More examples:
prob = LiarPokerConv(@(hand) straightflush(hand,5),30)
prob = LiarPokerConv(@(hand) flush(hand,5),15)