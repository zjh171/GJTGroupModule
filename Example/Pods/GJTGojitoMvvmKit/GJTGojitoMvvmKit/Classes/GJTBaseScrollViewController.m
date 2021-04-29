//
//  GJTBaseScrollViewController.m
//  GJTMvvmKit
//
//  Created by kyson on 2021/2/27.
//

#import "GJTBaseScrollViewController.h"
#import <GJTAdditionKit/GJTAdditionKit.h>
#import <Masonry/Masonry.h>

@interface GJTBaseScrollViewController ()

@end

@implementation GJTBaseScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *backImage = [UIImage imageNamed:@"icon_back"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(backButtonClicked:)];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    UIColor *navbarColor = nil;
    if (@available(iOS 12.0, *)) {
        BOOL isDark = (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark);
        if (isDark) {
            navbarColor = [UIColor colorWithHexString:@"151515"];
        } else {
            navbarColor = [UIColor colorWithHexString:@"009BFF"];
        }
    } else {
        // Fallback on earlier versions
        navbarColor = [UIColor colorWithHexString:@"009BFF"];
    }
        
    UIImage *navbarImage = [UIImage imageWithColor:navbarColor size:CGSizeMake(UIScreen.width, 65)];
    [self.navigationController.navigationBar setBackgroundImage:navbarImage forBarMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:UIColor.whiteColor};
}

-(void)viewWillDisappear:(BOOL)animated {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];

    [super viewWillDisappear:animated];
    
}

-(void)backButtonClicked:(UIButton *) button {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
