//
//  MXFrameLayout.h
//  jupiter_business
//
//  Created by 崇庆旭 on 2017/2/13.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXFrameLayout : NSObject

- (instancetype)init UNAVAILABLE_ATTRIBUTE;

- (instancetype)initWithView:(UIView *)view;

-(MXFrameLayout *(^)(CGFloat to))equalTo;
-(MXFrameLayout *(^)(CGFloat offset))offset;


@property(nonatomic,strong) MXFrameLayout *left;
@property(nonatomic,strong) MXFrameLayout *right;
@property(nonatomic,strong) MXFrameLayout *top;
@property(nonatomic,strong) MXFrameLayout *bottom;
@property(nonatomic,strong) MXFrameLayout *width;
@property(nonatomic,strong) MXFrameLayout *height;
@property(nonatomic,strong) MXFrameLayout *centerX;
@property(nonatomic,strong) MXFrameLayout *centerY;
@property(nonatomic,strong) MXFrameLayout *center;
@property(nonatomic,strong) MXFrameLayout *origin;
@property(nonatomic,strong) MXFrameLayout *size;
@property(nonatomic,strong) MXFrameLayout *with;

//进行计算
-(void)render;

@end
