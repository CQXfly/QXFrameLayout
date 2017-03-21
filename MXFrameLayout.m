//
//  MXFrameLayout.m
//  jupiter_business
//
//  Created by 崇庆旭 on 2017/2/13.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "MXFrameLayout.h"

//标记当前链式布局计算的位置
typedef NS_ENUM(NSInteger,MXFrameLayoutDirection) {
    MXFrameLayoutDirectionHorizontal,
    MXFrameLayoutDirectionVertical
};

@interface MXFrameLayout ()
@property (nonatomic) UIView *view;
@property (nonatomic) NSString *key;

@property (nonatomic) MXFrameLayoutDirection direction;
@property (nonatomic) NSMutableDictionary *layoutHorizontal;
@property (nonatomic) NSMutableDictionary *layoutVertical;

@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;
@property (nonatomic) CGFloat frameLeft;
@property (nonatomic) CGFloat frameRight;
@property (nonatomic) CGFloat frameTop;
@property (nonatomic) CGFloat frameBottom;
@property (nonatomic) CGFloat frameCenterX;
@property (nonatomic) CGFloat frameCenterY;


@end

@implementation MXFrameLayout


- (instancetype)initWithView:(UIView *)view
{
    self = [super init];
    if (self) {
        self.view = view;
        self.key = @"default";
        
        self.frameWidth = -0.1f;
        self.frameHeight = -0.1f;
        
        self.frameCenterX = -0.1f;
        self.frameCenterY = -0.1f;
        
        self.layoutHorizontal = [[NSMutableDictionary alloc]initWithCapacity:0];
        self.layoutVertical = [[NSMutableDictionary alloc]initWithCapacity: 0];
    }
    return self;
}

- (MXFrameLayout *)width {
    self.key = @"width";
    self.direction = MXFrameLayoutDirectionHorizontal;
    return self;
}

-(MXFrameLayout *)height{
    self.key = @"height";
    self.direction = MXFrameLayoutDirectionVertical;
    return self;
}

-(MXFrameLayout *)left{
    self.key = @"left";
    self.direction = MXFrameLayoutDirectionHorizontal;
    return self;
}

-(MXFrameLayout *)right{
    self.key = @"right";
    self.direction = MXFrameLayoutDirectionHorizontal;
    return self;
}

-(MXFrameLayout *)top{
    self.key = @"top";
    self.direction = MXFrameLayoutDirectionVertical;
    return self;
}

-(MXFrameLayout *)bottom{
    self.key = @"bottom";
    self.direction = MXFrameLayoutDirectionVertical;
    return self;
}

-(MXFrameLayout *)centerX{
    self.key = @"centerX";
    self.direction = MXFrameLayoutDirectionHorizontal;
    return self;
    
}

-(MXFrameLayout *)centerY{
    self.key = @"centerY";
    self.direction = MXFrameLayoutDirectionVertical;
    return self;
}

-(MXFrameLayout *(^)(CGFloat))equalTo{
    
    __weak typeof(self) weakSelf = self;
    return ^id(CGFloat value){
        switch (weakSelf.direction) {
            case MXFrameLayoutDirectionHorizontal:
                [weakSelf.layoutHorizontal setValue:@(value) forKey:self.key];
                break;
            case MXFrameLayoutDirectionVertical:
                [weakSelf.layoutVertical setValue:@(value) forKey:self.key];
                break;
            default:
                break;
        }
        
        return weakSelf;
    };
}


-(MXFrameLayout *(^)(CGFloat offset))offset{
    __weak typeof(self) weakSelf = self;
    
    return ^id(CGFloat offset){
        
        NSMutableDictionary *tempDictionary ;
        
        switch (weakSelf.direction) {
            case MXFrameLayoutDirectionHorizontal:
                tempDictionary = weakSelf.layoutHorizontal;
                break;
            case MXFrameLayoutDirectionVertical:
                tempDictionary = weakSelf.layoutVertical;
                break;
            default:
                break;
        }
        CGFloat value = [[tempDictionary objectForKey:weakSelf.key] floatValue] + offset;
        [tempDictionary setValue:@(value) forKey:weakSelf.key];
        return weakSelf;
    };
    
}

- (MXFrameLayout *)with {
    
    return self;
}

-(void)render{
    
    
    [self.view sizeToFit];
    
    NSNumber * left = [self.layoutHorizontal objectForKey:@"left"];
    NSNumber * right = [self.layoutHorizontal objectForKey:@"right"];
    NSNumber * width = [self.layoutHorizontal objectForKey:@"width"];
    NSNumber * centerX = [self.layoutHorizontal objectForKey:@"centerX"];
    
    NSNumber * top = [self.layoutVertical objectForKey:@"top"];
    NSNumber * bottom = [self.layoutVertical objectForKey:@"bottom"];
    NSNumber * height = [self.layoutVertical objectForKey:@"height"];
    NSNumber * centerY = [self.layoutVertical objectForKey:@"centerY"];
    
    
    if(left){
        self.frameLeft = [left floatValue];
        
        
        if(width){
            self.frameWidth = [width floatValue];
        }
        
        
        else if(right){
            self.frameWidth = [right floatValue] - [left floatValue];
        }
        
        else{
            
        }
    }
    
    
    else if(width){
        self.frameWidth = [width floatValue];
        
        
        if(right){
            self.frameLeft = [right floatValue] - [width floatValue];
        }
        
        else{
            
            
            
        }
        
    }
    else if(right){
        
        self.frameLeft = [right floatValue] - self.view.width;
    }
    
    
    
    
    
    if(top){
        self.frameTop = [top floatValue];
        
        
        if(height){
            self.frameHeight = [height floatValue];
        }
        
        
        else if(bottom){
            self.frameHeight = [bottom floatValue] - [top floatValue];
        }
        
        else{
            
        }
    }
    
    else if(height){
        self.frameHeight = [height floatValue];
        
        
        if(bottom){
            self.frameTop = [bottom floatValue] - [height floatValue];
        }
        
        else{
            
            
            
        }
        
    }
    else if(bottom){
        
        self.frameTop = [bottom floatValue] - self.view.height;
    }
    
    
    
    self.view.frame = CGRectMake(self.frameLeft,
                                 self.frameTop,
                                 self.frameWidth >= 0 ? self.frameWidth:self.view.width,
                                 self.frameHeight >= 0 ? self.frameHeight:self.view.height);
    
    if(centerX)
        self.view.centerX = [centerX floatValue];
    
    if(centerY)
        self.view.centerY = [centerY floatValue];
    
    
    
}


@end
