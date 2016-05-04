//
//  Deck.h
//  CS 63A Game
//
//  Created by Kevin Largo on 7/18/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

- (void)addCard:(Card*)card atTop:(BOOL)atTop;
- (void)addCard:(Card*)card;
- (Card*)drawRandomCard;

@end
