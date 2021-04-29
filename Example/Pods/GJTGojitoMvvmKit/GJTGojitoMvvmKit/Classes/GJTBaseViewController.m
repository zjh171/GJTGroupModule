//
//  GJTBaseViewController.m
//  Gojito
//
//  Created by kyson on 2021/2/19.
//

#import "GJTBaseViewController.h"

@interface GJTBaseViewController ()

@end

@implementation GJTBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 12.0, *)) {
        BOOL isDark = (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
        if (isDark) {
            self.view.backgroundColor = [UIColor colorWithHexString:@"151515"];;
        } else {
            self.view.backgroundColor = [UIColor colorWithHexString:@"EFEFF4"];
        }
    } else {
        // Fallback on earlier versions
        self.view.backgroundColor = [UIColor colorWithHexString:@"EFEFF4"];
    }

    [self setEdgesForExtendedLayout:UIRectEdgeNone];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
