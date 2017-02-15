//
//  MXFrameLayout.h
//  jupiter_business
//
//  Created by 崇庆旭 on 2017/2/13.
//  Copyright © 2017年 dev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXFrameLayout.h"

/**
 * a frame layout write type like masonry 
 *
 *  example:
 
 [self.redView frameLayout:^(HotpotFrameLayout *layout) {
    layout.left.equalTo(self.view.left).offset(20.f);
    layout.right.equalTo(self.view.right).offset(-20.f);
    layout.height.equalTo(40.f);
    layout.top.equalTo(self.view.top).offset(40.f);
 }];
 
 [self.blueView frameLayout:^(HotpotFrameLayout *layout) {
    layout.width.equalTo(100.f);
    layout.centerX.equalTo(self.view.centerX);
    layout.bottom.equalTo(self.view.bottom).offset(-50.f);
    layout.height.equalTo(40.f);
 }];
 
 [self.blackView frameLayout:^(HotpotFrameLayout *layout) {
    layout.height.equalTo(100.f);
    layout.centerY.equalTo(self.view.centerY);
    layout.left.equalTo(self.view.left).offset(20.f);
    layout.right.equalTo(self.blueView.left);
 }];
 
 [self.orangeView frameLayout:^(HotpotFrameLayout *layout) {
    layout.width.equalTo(40.f);
    layout.height.equalTo(40.f);
    layout.left.equalTo(self.blackView.left);
    layout.top.equalTo(self.blackView.bottom).offset(20.f);
 }];
 
 
 [self.nameLabel frameLayout:^(HotpotFrameLayout *layout) {
 layout.right.equalTo(self.redView.right);
 layout.bottom.equalTo(self.blackView.top).offset(-20.f);
 }];

 */

@interface UIView (Extension)
@property (assign, nonatomic) CGFloat x;
@property (assign, nonatomic) CGFloat y;
@property (assign, nonatomic) CGFloat width;
@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) CGPoint origin;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;
@property(nonatomic,copy) NSString *identifier;
-(void)layout:(void(^)(MXFrameLayout *layout))block;
- (UINavigationController *)rootNavigationController;
- (UINavigationController *)getNav;

@property (nonatomic,assign) CGFloat mas_left;
@property (nonatomic,assign) CGFloat mas_right;
@property (nonatomic,assign) CGFloat mas_width;
@property (nonatomic,assign) CGFloat mas_height;
@property (nonatomic,assign) CGFloat mas_top;
@property (nonatomic,assign) CGFloat mas_bottom;
@end
