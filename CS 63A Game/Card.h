//
//  Card.h
//  CS 63A Game
//
//  Created by Kevin Largo on 7/18/15.
//  Copyright (c) 2015 xkevlarproductions. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString* contents;
@property(nonatomic, getter = isChosen) BOOL chosen;
@property(nonatomic, getter = isMatched) BOOL matched;

-(int)match:(NSArray*)otherCards;

@end

