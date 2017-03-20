# Liar Poker/Commune
Liar Poker is an alternative name for commune, where each player is dealt a certain number of cards from the deck. Each player takes turns guessing the highest possible hand from all cards in play. The first person to get "called" for an incorrect hand must attempt to construct the hand from all the cards in play. If it's not possible, the person who called the "existing hand" receives a penalty.

Here's a wikipedia article about it. [Commune/Liar Poker](https://en.wikipedia.org/wiki/Commune_(card_game))

## Usage
There is a provided examples file with some possible hand calls. You may put your own hand calls to determine the probability.

Calculate the probability of 5 of a kind, with 20 cards in play, using 20000 simulated rounds:
```matlab
[prob, std] = LiarPoker(@(hand) OfAKind(hand,5),20,20000)
```
The OfAKind function assumes that it's 5 of a kind aces, but that should be irrelevant.

Calculate the probability of a 8 card straight with 15 cards in play, using 5000 simulated rounds:
```matlab
[prob, std] = LiarPoker(@(hand) straight(hand,8),15,5000)
```

## Contributing
1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D
