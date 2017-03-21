# QXFrameLayout
write frame layout like masonry
a simple kit make your layout code like masonry 
use it 
```
 [self.orangeView frameLayout:^(HotpotFrameLayout *layout) {
    layout.width.equalTo(40.f);
    layout.height.equalTo(40.f);
    layout.left.equalTo(10);
    layout.top.equalTo(12).offset(20.f);
 }];
 ```
 
 you can alse write releative layout like this 
 ```
  [self.orangeView frameLayout:^(HotpotFrameLayout *layout) {
    layout.width.equalTo(self.label1.mas_width);
    layout.height.equalTo(40.f);
    layout.left.equalTo(self.label1.mas_left);
    layout.top.equalTo(self.blackView.bottom).offset(20.f);
 }];
 ```
