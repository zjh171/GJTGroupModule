//
//  GJTPostGroupInfoItemView.m
//  Gojito
//
//  Created by kyson on 2021/3/2.
//

#import "GJTPostGroupInfoItemView.h"
#import <Masonry/Masonry.h>

@interface GJTPostGroupInfoItemView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;
@property (nonatomic, strong) UIImageView *moreArrowImageView;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation GJTPostGroupInfoItemView


-(instancetype) initWithIcon:(UIImage *)img title:(NSString *) title subTitle:(NSString *) subTitle {
    if (self =[super init]) {
        [self addSubview:self.iconImageView];
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(7);
            make.bottom.equalTo(self.iconImageView);
        }];
        
        [self addSubview:self.moreArrowImageView];
        [self.moreArrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
        
        [self addSubview:self.subTitleLabel];
        [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.moreArrowImageView.mas_left).offset(-5);
            make.left.equalTo(self.titleLabel.mas_right).offset(5);
            make.bottom.equalTo(self.titleLabel);
        }];
        //设置水平方向抗压缩优先级高 水平方向可以正常显示
        [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self.subTitleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];

        [self addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView);
            make.right.equalTo(self.moreArrowImageView);
            make.bottom.equalTo(self).offset(-1);
            make.height.mas_equalTo(0.5f);
        }];
        
        self.titleLabel.text = title;
        self.subTitleLabel.text = subTitle;
        self.iconImageView.image = img;
    }
    return self;
}


-(UIImageView *)iconImageView{
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
    }
    return _iconImageView;
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textAlignment = NSTextAlignmentRight;
    }
    return _subTitleLabel;
}

-(UIImageView *)moreArrowImageView {
    if (!_moreArrowImageView) {
        _moreArrowImageView = [[UIImageView alloc] init];
        _moreArrowImageView.image = [UIImage imageNamed:@"icon_more"];
    }
    return _moreArrowImageView;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = UIColor.whiteColor;
    }
    return _lineView;
}

@end
