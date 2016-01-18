//
//  WheelSeven.m
//  GameSeven
//
//  Created by xiangxixids on 16/1/14.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import "WheelSeven.h"
#import "CardSeven.h"

@interface WheelSeven()
@property (strong, nonatomic) NSMutableDictionary *imageElement;
@property (strong, nonatomic) NSMutableArray<CardSeven *> *cards;
@end

@implementation WheelSeven

static const int capacity = 10;

- (instancetype)init{
    self = [super init];
    if (self) {
        if (!_imageElement) {
            _imageElement = [[NSMutableDictionary alloc]initWithCapacity:capacity];
            // key:value = "imagename":"bounds"
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:1]  forKey:@"apple"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:1]  forKey:@"bananer"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:2]  forKey:@"boluo"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:2]  forKey:@"caomei"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:3]  forKey:@"mihoutao"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:3]  forKey:@"putao"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:4]  forKey:@"ring"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:4]  forKey:@"xigua"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:5]  forKey:@"yellowbody"];
            [_imageElement setObject:[NSNumber numberWithUnsignedInt:9]  forKey:@"seven"];
        }
        if (!_cards) {
            _cards = [[NSMutableArray alloc]initWithCapacity:capacity];
        }
        [self createAllCards];
    }
    return self;
}

- (NSArray *)getImageNames{
    return [_imageElement allKeys];
}

- (void)createAllCards{
    if (_cards) {
        // clear all card first
        [_cards removeAllObjects];
        // add new card
        for (id key in _imageElement) {
            if ([key isKindOfClass:[NSString class]]) {
                CardSeven *card = [[CardSeven alloc]init];
                card.imageName = (NSString *)key;
                card.bound = [(NSNumber*)[_imageElement objectForKey:key] unsignedIntValue];
                [self.cards addObject:card];
            }
        }
    }
}

- (NSArray *)getCards{
    return self.cards;
}



@end
