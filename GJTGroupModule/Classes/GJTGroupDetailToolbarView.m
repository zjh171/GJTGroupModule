//
//  GJTGroupDetailToolbarView.m
//  Gojito
//
//  Created by kyson on 2021/2/27.
//

#import "GJTGroupDetailToolbarView.h"
#import <Masonry/Masonry.h>

@interface GJTGroupDetailToolbarView ()


@property (nonatomic, strong) UIButton *praiseButton;
@property (nonatomic, strong) UIButton *commentsButton;
@property (nonatomic, strong) UIButton *joinGroupButton;


@end


@implementation GJTGroupDetailToolbarView


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.praiseButton];
        [self.praiseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(15.f);
            make.width.mas_equalTo(44);
            make.top.equalTo(self).offset(5);
        }];
        
        [self addSubview:self.commentsButton];
        [self.commentsButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.praiseButton.mas_right).offset(15.f);
            make.width.mas_equalTo(44);
            make.top.equalTo(self).offset(5);
        }];
        
        [self addSubview:self.joinGroupButton];
        [self.joinGroupButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-15.f);
            make.width.mas_equalTo(44);
            make.top.equalTo(self).offset(5);
        }];
        
        [self.commentsButton addTarget:self action:@selector(commentButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.joinGroupButton addTarget:self action:@selector(joinButtonDidClicked:) forControlEvents:UIControlEventTouchUpInside];

    }
    return self;
}


- (void)joinButtonDidClicked:(UIButton *) sender {
    if (self.joinButtonClickedBlock) {
        self.joinButtonClickedBlock();
    }
}


- (void)commentButtonDidClicked:(UIButton *) sender {
    if (self.commontsButtonClickedBlock) {
        self.commontsButtonClickedBlock();
    }
}

-(UIButton *)praiseButton {
    if (!_praiseButton) {
        _praiseButton = [[UIButton alloc] init];
        _praiseButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [_praiseButton setTitle:@"点赞" forState:UIControlStateNormal];
    }
    return _praiseButton;
}


-(UIButton *)commentsButton {
    if (!_commentsButton) {
        _commentsButton = [[UIButton alloc] init];
        _commentsButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [_commentsButton setTitle:@"评论" forState:UIControlStateNormal];
    }
    return _commentsButton;
}

-(UIButton *)joinGroupButton {
    if (!_joinGroupButton) {
        _joinGroupButton = [[UIButton alloc] init];
        _joinGroupButton.titleLabel.font = [UIFont systemFontOfSize:14.f];
        [_joinGroupButton setTitle:@"加入" forState:UIControlStateNormal];
    }
    return _joinGroupButton;
}


@end
