//
//  GJTGroupItemTableViewCell.m
//  Gojito
//
//  Created by kyson on 2021/2/25.
//

#import "GJTGroupItemTableViewCell.h"
#import <Masonry/Masonry.h>

@interface GJTGroupItemTableViewCell ()

@property (nonatomic,strong) UIImageView *groupImageView;
@property (nonatomic,strong) UILabel *groupNameLabel;
@property (nonatomic,strong) UILabel *groupDescLabel;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UILabel *propertyLabel;
@property (nonatomic,strong) UILabel *categoryLabel;

@end

@implementation GJTGroupItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.groupImageView];
        [self.groupImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 60));
            make.left.equalTo(self.contentView).offset(15.f);
            make.top.equalTo(self.contentView).offset(12.f);
            make.bottom.equalTo(self.contentView).offset(-25.f);
        }];
        
        [self.contentView addSubview:self.categoryLabel];
        [self.categoryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.groupImageView);
            make.right.equalTo(self.groupImageView).offset(5.f);
            make.bottom.equalTo(self.contentView).offset(-6.f);
        }];
        
        [self.contentView addSubview:self.groupNameLabel];
        [self.groupNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.groupImageView.mas_right).offset(16.f);
            make.right.equalTo(self.contentView).offset(-15.f);
            make.top.equalTo(self.groupImageView).offset(-3.f);
        }];
        
        [self.contentView addSubview:self.groupDescLabel];
        [self.groupDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.groupNameLabel);
            make.right.equalTo(self.contentView).offset(-15.f);
            make.top.equalTo(self.groupNameLabel.mas_bottom).offset(6.f);
        }];
        
        [self.contentView addSubview:self.propertyLabel];
        [self.propertyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.groupNameLabel);
            make.right.equalTo(self.contentView).offset(-15.f);
            make.bottom.equalTo(self.categoryLabel);
        }];
        
        [self.contentView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.groupNameLabel);
            make.right.equalTo(self.contentView);
            make.height.mas_equalTo(0.5f);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-1.f);
        }];
        
    }
    return self;
}


-(void)setGroupImage:(UIImage *)groupImage {
    _groupImage = groupImage;
    self.groupImageView.image = groupImage;
}

-(void)setGroupName:(NSString *)groupName {
    _groupName = groupName;
    _groupNameLabel.text = groupName;
}

-(void)setGroupDesc:(NSString *)groupDesc {
    _groupDesc = groupDesc;
    _groupDescLabel.text = groupDesc;

}

- (void)setGroupProperty:(NSString *)groupProperty {
    _groupProperty = groupProperty;
    self.propertyLabel.text = groupProperty;
}

- (void)setGroupCategory:(NSString *)groupCategory {
    _groupCategory = groupCategory;
    self.categoryLabel.text = groupCategory;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}


-(UIImageView *)groupImageView {
    if (!_groupImageView) {
        _groupImageView = [[UIImageView alloc] init];
        _groupImageView.layer.cornerRadius = 4.f;
        _groupImageView.clipsToBounds = YES;
    }
    return _groupImageView;
}


-(UILabel *)groupNameLabel {
    if (!_groupNameLabel) {
        _groupNameLabel = [[UILabel alloc] init];
        _groupNameLabel.font = [UIFont systemFontOfSize:17.f];
    }
    return _groupNameLabel;
}

-(UILabel *)groupDescLabel {
    if (!_groupDescLabel) {
        _groupDescLabel = [[UILabel alloc] init];
        _groupDescLabel.numberOfLines = 2;
        _groupDescLabel.font = [UIFont systemFontOfSize:14.f];
    }
    return _groupDescLabel;;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView =[[UIView alloc] init];
        _lineView.backgroundColor = UIColor.grayColor;
    }
    return _lineView;
}

-(UILabel *)propertyLabel {
    if (!_propertyLabel) {
        _propertyLabel = [[UILabel alloc] init];
        _propertyLabel.font = [UIFont systemFontOfSize:12.f];
    }
    return _propertyLabel;
}

-(UILabel *)categoryLabel {
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] init];
        _categoryLabel.font = [UIFont systemFontOfSize:12.f];
    }
    return _categoryLabel;
}

@end
