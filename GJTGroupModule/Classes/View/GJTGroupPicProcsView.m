//
//  GJTGroupPicProcsView.m
//  GJTGroupModule
//
//  Created by kyson on 2021/3/9.
//

#import "GJTGroupPicProcsView.h"
#import <GJTAdditionKit/GJTAdditionKit.h>
#import <Masonry/Masonry.h>

@interface GJTGroupPicProcsView ()

@property (nonatomic, strong) UIButton *codeImageButton;
@property (nonatomic, strong) UILabel *codeDescLabel;
@property (nonatomic, strong) UIView *codeImagelineView;

//@property (nonatomic, strong) UIButton *groupDetailImageButton;
//@property (nonatomic, strong) UILabel *groupDetailLabel;


@end

@implementation GJTGroupPicProcsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.codeImageButton];
//        [self.codeImageButton addTarget:self action:@selector(codeAddButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.codeImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(66, 66));
            make.left.equalTo(self).offset(16);
            make.top.equalTo(self).offset(10);
        }];
        
        [self addSubview:self.codeDescLabel];
        [self.codeDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.codeImageButton.mas_right).offset(12.f);
            make.top.equalTo(self.codeImageButton);
            make.right.equalTo(self).offset(-15.f);
        }];
        
        [self addSubview:self.codeImagelineView];
        [self.codeImagelineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.height.mas_equalTo(0.3f);
            make.top.equalTo(self.codeImageButton.mas_bottom).offset(10.f);
            make.right.equalTo(self);
        }];
        
        // Do any additional setup after loading the view.
//        [self addSubview:self.groupDetailImageButton];
//        [self.groupDetailImageButton addTarget:self action:@selector(codeAddButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//        [self.groupDetailImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.size.mas_equalTo(CGSizeMake(66, 66));
//            make.left.equalTo(self).offset(16);
//            make.top.equalTo(self.codeImageButton.mas_bottom).offset(20);
//        }];
//
//        [self addSubview:self.groupDetailLabel];
//        [self.groupDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.groupDetailImageButton.mas_right).offset(12.f);
//            make.top.equalTo(self.groupDetailImageButton);
//            make.right.equalTo(self.mas_right).offset(-15.f);
//        }];
        
    }
    return self;
}


-(UIButton *)codeImageButton {
    if (!_codeImageButton) {
        _codeImageButton = [[UIButton alloc] init];
        UIImage *image = [UIImage imageNamed:@"icon_add"];
        [_codeImageButton setImage:image forState:UIControlStateNormal];
        _codeImageButton.layer.borderWidth = 0.5f;
        _codeImageButton.layer.borderColor = UIColor.whiteColor.CGColor;
        _codeImageButton.layer.cornerRadius = 33.f;
        _codeImageButton.clipsToBounds = YES;
    }
    return _codeImageButton;
}

-(UILabel *)codeDescLabel {
    if (!_codeDescLabel) {
        _codeDescLabel = [[UILabel alloc] init];
        _codeDescLabel.font = [UIFont systemFontOfSize:14.f];
        _codeDescLabel.numberOfLines = 0;
        
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 6;
        
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
        attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
        _codeDescLabel.attributedText = [[NSAttributedString alloc] initWithString:@"请上传群二维码（微信、钉钉、抖音皆可）" attributes:attributes];
    }
    return _codeDescLabel;
}

//-(UIButton *)groupDetailImageButton {
//    if (!_groupDetailImageButton) {
//        _groupDetailImageButton = [[UIButton alloc] init];
//        UIImage *image = [UIImage imageNamed:@"icon_add"];
//        [_groupDetailImageButton setImage:image forState:UIControlStateNormal];
//        _groupDetailImageButton.layer.borderWidth = 0.5f;
//        _groupDetailImageButton.layer.borderColor = UIColor.whiteColor.CGColor;
//        _groupDetailImageButton.layer.cornerRadius = 33.f;
//        _groupDetailImageButton.clipsToBounds = YES;
//    }
//    return _groupDetailImageButton;
//}
//
//-(UILabel *)groupDetailLabel {
//    if (!_groupDetailLabel) {
//        _groupDetailLabel = [[UILabel alloc] init];
//        _groupDetailLabel.font = [UIFont systemFontOfSize:14.f];
//        _groupDetailLabel.numberOfLines = 0;
//        
//        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
//        paragraphStyle.lineSpacing = 6;
//        
//        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
//        [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
//        attributes[NSForegroundColorAttributeName] = [UIColor whiteColor];
//        _groupDetailLabel.attributedText = [[NSAttributedString alloc] initWithString:@"请上传群信息" attributes:attributes];
//    }
//    return _groupDetailLabel;
//}


-(UIView *)codeImagelineView {
    if (!_codeImagelineView) {
        _codeImagelineView = [[UIView alloc] init];
        _codeImagelineView.backgroundColor = [UIColor colorWithHexString:@"3d3d3d"];
    }
    return _codeImagelineView;
}

@end
