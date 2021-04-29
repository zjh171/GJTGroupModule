//
//  GJTGroupItemTableViewCell.h
//  Gojito
//
//  Created by kyson on 2021/2/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GJTGroupItemTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImage *groupImage;

@property (nonatomic,copy) NSString *groupName;

@property (nonatomic,copy) NSString *groupDesc;

@property (nonatomic,copy) NSString *groupProperty;

@property (nonatomic,copy) NSString *groupCategory;

@end

NS_ASSUME_NONNULL_END
