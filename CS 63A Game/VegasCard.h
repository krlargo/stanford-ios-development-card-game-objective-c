//
//  VegasCard.h
//  CS 63A Game
//
//  Created by Kevin Largo on 7/18/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import "Card.h"

@interface VegasCard : Card

@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray*)validSuits;
+ (NSUInteger)maxRank;

@end
