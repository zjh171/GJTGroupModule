//
//  GJTGroupPicProcsView.h
//  GJTGroupModule
//
//  Created by kyson on 2021/3/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^CodeImageButtonDidClickedBlock) (void);

@interface GJTGroupPicProcsView : UIView

@property (nonatomic, copy) CodeImageButtonDidClickedBlock codeButtonDidClickedBlock;

@property (nonatomic, strong) UIImage *codeImage;

@end

NS_ASSUME_NONNULL_END
