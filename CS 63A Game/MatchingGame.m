//
//  MatchingGame.m
//  CS 63A Game
//
//  Created by Kevin Largo on 7/18/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import "MatchingGame.h"

@interface MatchingGame()

@property(strong, nonatomic) NSMutableArray* cards;
@property(nonatomic, readwrite) NSInteger score;

@property(nonatomic, readwrite) NSString* results;///

@end

@implementation MatchingGame

- (NSMutableArray*)cards
{
  if (!_cards)
    _cards = [[NSMutableArray alloc] init];
  return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck*)deck
{
  self =[super init];
  if (self)
    for (int i=0;i<count;i++) {
      Card* card = [deck drawRandomCard];
      if (card) {
        [self.cards addObject:card];
      }
      else{
        self = nil;
        break;
      }
    }

  return self;
}

static const int COST_TO_CHOOSE = 1;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;

- (void)chooseCardAtIndex:(NSUInteger)index
{
  
  Card* card = [self cardAtIndex:index];
  
  //show card's content when first card is chosen
  self.results = [card contents];
  
  if (!card.isMatched) {
    if (card.isChosen) {
      card.chosen = NO;
      //show no results when no cards are chosen
      self.results = @"";
    }
    
    else{
      for (Card* otherCard in self.cards) {
        if (otherCard.isChosen && !otherCard.isMatched) {
          int matchScore = [card match:@[otherCard]];
          if (matchScore) {
            otherCard.matched = YES;
            card.matched = YES;
            self.score += matchScore * MATCH_BONUS;
            
            //set results string for match
            self.results = [NSString stringWithFormat:@"Matched %@ and %@ for %d points.", [card contents], [otherCard contents], matchScore * MATCH_BONUS];
          }
          else{
            otherCard.chosen = NO;
            self.score -= MISMATCH_PENALTY;
            //set results string for mismatch
            self.results = [NSString stringWithFormat:@"%@ & %@ don't match. %d-point penalty.", [card contents], [otherCard contents], MISMATCH_PENALTY];
          }
          break;
        }
      }
      card.chosen = YES;
      self.score -= COST_TO_CHOOSE;
    }
  }
}

- (Card*)cardAtIndex:(NSUInteger)index
{
  return (index < [self.cards count]) ? self.cards[index] : nil;
}

@end
