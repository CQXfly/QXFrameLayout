# QXFrameLayout
write frame layout like masonry
a simple kit make your layout code like masonry 
use it 
```
 [self.orangeView frameLayout:^(HotpotFrameLayout *layout) {
    layout.width.equalTo(40.f);
    layout.height.equalTo(40.f);
    layout.left.equalTo(self.blackView.left);
    layout.top.equalTo(self.blackView.bottom).offset(20.f);
 }];
