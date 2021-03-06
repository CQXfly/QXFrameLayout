//
//  MXFrameLayout.h
//  jupiter_business
//
//  Created by 崇庆旭 on 2017/2/13.
//  Copyright © 2017年 dev. All rights reserved.
//
#import "UIView+Extension.h"
#import <objc/runtime.h>

static char alertViewIdentifier;
@implementation UIView (Extension)
- (void)setIdentifier:(NSString *)identifier {
    objc_setAssociatedObject(self, &alertViewIdentifier, identifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString *)identifier {
    return objc_getAssociatedObject(self, &alertViewIdentifier);
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}
- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}
- (UINavigationController *)rootNavigationController {
    UIResponder *responder = self.nextResponder;
    while (responder) {
        if ([responder isKindOfClass:[UINavigationController class]]) {
            return (UINavigationController *)responder;
        }
        responder = responder.nextResponder;
    }
    return nil;
}

- (UINavigationController *)getNav{
    UINavigationController *result = nil;
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]]) {
            result = (UINavigationController *)nextResponder;
        }
    }
    
    return result;
}

- (CGFloat)mas_left {
    
    return CGRectGetMinX(self.frame);
}

- (CGFloat)mas_right {
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)mas_top {
    return CGRectGetMinY(self.frame);
}

- (CGFloat)mas_bottom {
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)mas_width {
    return self.width;
}

- (CGFloat)mas_height {
    return self.height;
}

-(void)layout:(void(^)(MXFrameLayout *layout))block{
    
    MXFrameLayout *layout = [[MXFrameLayout alloc]initWithView:self];
    block(layout);
    [layout render];
}


@end
