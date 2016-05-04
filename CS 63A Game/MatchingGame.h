//
//  MatchingGame.h
//  CS 63A Game
//
//  Created by Kevin Largo on 7/18/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface MatchingGame : NSObject

@property(nonatomic, readonly) NSInteger score;
@property(nonatomic, readonly) NSString* results;///

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck*)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card*)cardAtIndex:(NSUInteger)index;

@end