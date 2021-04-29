//
//  GJTGroupDetailToolbarView.h
//  Gojito
//
//  Created by kyson on 2021/2/27.
//

#import <GJTMvvmKit/GJTMvvmKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GJTJoinGroupButtonClickedBlock)(void);
typedef void(^GJTCommentsGroupButtonClickedBlock)(void);


@interface GJTGroupDetailToolbarView : GJTBaseView


@property (nonatomic, copy) GJTJoinGroupButtonClickedBlock joinButtonClickedBlock;
@property (nonatomic, copy) GJTCommentsGroupButtonClickedBlock commontsButtonClickedBlock;

@end

NS_ASSUME_NONNULL_END
