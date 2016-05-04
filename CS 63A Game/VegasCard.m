//
//  VegasCard.m
//  CS 63A Game
//
//  Created by Kevin Largo on 7/18/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import "VegasCard.h"

@implementation VegasCard

- (int)match:(NSArray *)otherCards
{
  int score = 0;
  
  if ([otherCards count] == 1) {
    VegasCard* otherCard = [otherCards firstObject];
    if (otherCard.rank == self.rank) {
      score = 4;
    }
    else if ([otherCard.suit isEqualToString:self.suit]){
      score = 1;
    }
  }
  
  return score;
}

- (NSString*)contents
{
  NSArray* rankStrings = [VegasCard validRanks];
  return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray*)validSuits
{
  return @[@"♦️",@"♥️",@"♠️",@"♣️"];
}

+ (NSArray*)validRanks
{
  return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"K",@"Q"];
}

+ (NSUInteger)maxRank
{
  return [[self validRanks] count]-1;
}

- (void)setRank:(NSUInteger)rank
{
  if (rank <= [VegasCard maxRank])
    _rank = rank;
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit
{
  if ([[VegasCard validSuits] containsObject:suit])
    _suit = suit;
}

- (NSString*)suit
{
  return _suit ? _suit : @"?";
}


@end
