//
//  GJTPtpadAlertView.m
//  GJTControlsKit
//
//  Created by kyson on 2021/3/28.
//

#import "GJTPtpadAlertView.h"
#import <GJTAdditionKit/GJTAdditionKit.h>

@interface GJTPtpadAlertView ()
@property (nonatomic, strong) UIView *backsideView;
@property (nonatomic, strong) UIButton *closeBtn;
@end

@implementation GJTPtpadAlertView

- (instancetype)init {
    if (self = [super init]) {
        [self _config];
    }
    return self;
}

- (void)setMainView:(UIView *)mainView {
    _mainView = mainView;
    [self addSubview:_mainView];
}

- (void)show {
    if (self.mainView) {
        self.mainView.gjt_centerX = self.gjt_width / 2;
        self.mainView.gjt_centerY = self.gjt_height / 2 - 30;
        self.closeBtn .gjt_centerX = self.gjt_width / 2;
        self.closeBtn.gjt_top = self.mainView.gjt_bottom + 20;
        
        self.mainView.transform = CGAffineTransformMakeScale(0, 0);
        self.closeBtn.transform = CGAffineTransformMakeScale(0, 0);
        self.closeBtn.hidden = !self.showCloseBtn;
        self.backsideView.alpha = 0;
        [[UIApplication sharedApplication].delegate.window addSubview:self];
        [UIView animateWithDuration:0.2 animations:^{
            self.mainView.transform = CGAffineTransformMakeScale(1, 1);
            self.closeBtn.transform = CGAffineTransformMakeScale(1, 1);
            self.backsideView.alpha = 1;
        }];
    }
}

- (void)dismiss {
    if (self.mainView) {
        [UIView animateWithDuration:0.2 animations:^{
            self.mainView.transform = CGAffineTransformMakeScale(0.1, 0.1);
            self.closeBtn.transform = CGAffineTransformMakeScale(0, 0);
            self.backsideView.alpha = 0;
        } completion:^(BOOL finished) {
            if (self.didDismissHandler) {
                self.didDismissHandler();
            }
            [self removeFromSuperview];
            [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];

        }];
    }
}


- (void)_config {
    self.frame = [UIScreen mainScreen].bounds;
    
    self.backsideView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:self.backsideView];
    self.backsideView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.7];
    self.backsideView.alpha = 0;
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.closeBtn];
    self.closeBtn.gjt_width = 40;
    self.closeBtn.gjt_height = 40;
    [self.closeBtn setBackgroundImage:[UIImage imageNamed:@"icon_badge_button_close"] forState:UIControlStateNormal];
    [self.closeBtn addTarget:self action:@selector(closeButtonClicked) forControlEvents:UIControlEventTouchUpInside];
}

-(void) closeButtonClicked {
    if (self.didCloseBtnClickedHandler) {
        self.didCloseBtnClickedHandler();
    }
    [self dismiss];
}

- (void)dealloc
{
    
}


@end
