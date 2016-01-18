//
//  Card.m
//  GameSeven
//
//  Created by xiangxixids on 16/1/14.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import "Card.h"

@implementation Card

- (BOOL)match:(Card *)otherCard
{
    BOOL isMatch = false;
    
    if ([self.imageName isEqualToString:otherCard.imageName]) {
        isMatch = true;
    }

    return isMatch;
}

@end
