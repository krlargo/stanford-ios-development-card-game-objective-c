//
//  Card.m
//  CS 63A Game
//
//  Created by Kevin Largo on 7/18/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray*) otherCards
{
  int score = 0;
  
  for (Card* card in otherCards)
    if([card.contents isEqualToString:self.contents])
      score = 1;
  
  return score;
}

@end
