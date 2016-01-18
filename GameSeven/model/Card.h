//
//  Card.h
//  GameSeven
//
//  Created by xiangxixids on 16/1/14.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic) NSUInteger point;
@property (strong, nonatomic) NSString *imageName;

- (BOOL)match:(Card *)otherCard;

@end
