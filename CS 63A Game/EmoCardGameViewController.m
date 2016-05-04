//
//  EmoCardGameViewController.m
//  CS 63A Game
//
//  Created by Kevin Largo on 7/20/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import "EmoCardGameViewController.h"
#import "EmoDeck.h"
#import "MatchingGame.h"

@interface EmoCardGameViewController ()
@property(strong, nonatomic) MatchingGame* game;
@property(weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property(strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//results label
@property(weak, nonatomic) IBOutlet UILabel *results;
@end

@implementation EmoCardGameViewController

- (MatchingGame*)game
{
  if (!_game)
    _game = [[MatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                          usingDeck:[self createDeck]];
  return _game;
}

- (Deck*)createDeck
{
  return [[EmoDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
  NSUInteger chosenCardIndex = [self.cardButtons indexOfObject:sender];
  [self.game chooseCardAtIndex:chosenCardIndex];
  [self updateUI];
}

- (IBAction)dealNewGame:(UIBarButtonItem *)sender
{
  _game = nil;
  self.scoreLabel.text = [NSString stringWithFormat:@"Score: 0"];
  [self updateUI];
}

- (void)updateUI
{
  for (UIButton* cardButton in self.cardButtons) {
    NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
    Card* card = [self.game cardAtIndex:cardButtonIndex];
    [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
    [cardButton setBackgroundImage:[self backgroundForCard:card] forState:UIControlStateNormal];
    cardButton.enabled = !card.isMatched;
  }
  self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",(int)self.game.score];
  
  self.results.text = self.game.results;///
  
}

- (NSString*)titleForCard:(Card*)card
{
  return  card.isChosen ? card.contents : @"";
}

- (UIImage*)backgroundForCard:(Card*)card
{
  return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
