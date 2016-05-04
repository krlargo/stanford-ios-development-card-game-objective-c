//
//  EmoCard.h
//  CS 63A Game
//
//  Created by Kevin Largo on 7/20/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import "Card.h"

@interface EmoCard : Card

@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*)validSuits;
+ (NSUInteger)maxRank;

@end
