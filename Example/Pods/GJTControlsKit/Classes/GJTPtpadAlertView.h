//
//  GJTPtpadAlertView.h
//  GJTControlsKit
//
//  Created by kyson on 2021/3/28.
//

#import <UIKit/UIKit.h>
//pours to put a door view,倒插门 view，因为这个弹框底部是个 x，就像 倒插门一样

@interface GJTPtpadAlertView : UIView
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, assign) BOOL showCloseBtn;
@property (nonatomic, copy) void(^didDismissHandler)(void);
@property (nonatomic, copy) void(^didCloseBtnClickedHandler)(void);
- (void)show;
- (void)dismiss;
@end
