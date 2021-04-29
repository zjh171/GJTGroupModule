//
//  GJTGroupDetailViewModel.m
//  GJTGroupModule
//
//  Created by kyson on 2021/4/27.
//

#import "GJTGroupDetailViewModel.h"

@implementation GJTGroupDetailViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        @weakify(self);
        [self.didLoadingSignal subscribeNext:^(id  _Nullable x) {
            @strongify(self);
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.loading = NO;
            });
        }];
    }
    return self;
}


@end
