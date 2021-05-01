//
//  GJTPostGroupDescView.m
//  GJTGroupModule
//
//  Created by kyson on 2021/5/1.
//

#import "GJTPostGroupDescView.h"
#import <GJTAdditionKit/GJTAdditionKit.h>

@interface GJTPostGroupDescView ()


@property (nonatomic, strong) UIView *lineView;


@end

@implementation GJTPostGroupDescView





-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"3d3d3d"];
    }
    return _lineView;
}



@end
