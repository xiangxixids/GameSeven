//
//  Wheel.m
//  GameSeven
//
//  Created by xiangxixids on 16/1/14.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import "Wheel.h"

@interface Wheel()
@property (strong, nonatomic) NSMutableArray<Card*> *cards;
@end

@implementation Wheel

- (instancetype)init{
    self = [super init];
    if (self) {
        if (!_cards) {
            _cards = [[NSMutableArray alloc]initWithCapacity:10];
        }
    }
    NSLog(@"Wheel init");
    return self;
}

- (void)addCardToWheel:(Card *)card{
    if (_cards) {
        [_cards addObject:card];
    }
}

- (NSArray *)getCards
{
    return _cards;
}

@end
