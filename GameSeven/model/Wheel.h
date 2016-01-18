//
//  Wheel.h
//  GameSeven
//
//  Created by xiangxixids on 16/1/14.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Wheel : NSObject

- (void)addCardToWheel:(Card *)card;

- (NSArray *)getCards;

@end
