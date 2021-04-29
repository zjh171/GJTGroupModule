//
//  GJTGroupDetailViewController.m
//  Gojito
//
//  Created by kyson on 2021/2/27.
//

#import "GJTGroupDetailViewController.h"
#import "GJTGroupDetailToolbarView.h"
#import "GJTGroupDetailViewModel.h"

@interface GJTGroupDetailViewController ()

@property (nonatomic, strong) GJTGroupDetailToolbarView *toolbarView;

@property (nonatomic,strong) GJTInputToolBar *inputToolBar;

@property (nonatomic,strong) UILabel *groupDescLabel;

@property (nonatomic, strong) UIScrollView *mScrollView;

@property (nonatomic, strong) GJTGroupDetailViewModel *viewModel;
@end

@implementation GJTGroupDetailViewController
@dynamic viewModel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"夸夸群";

    self.scrollView = self.mScrollView;
    self.scrollView.backgroundColor = UIColor.whiteColor;
    self.needLoadingHeader = YES;
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.view);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-44);
        } else {
            // Fallback on earlier versions
            make.bottom.equalTo(self.view).offset(-44);
        }
    }];
    
    
    self.groupDescLabel.text = @"当弹起的键盘遮住了页面上的输入框时，我们应该将输入框移至键盘之上，而键盘没有遮到输入框时，并不需要操作。因此在ios的坐标系下，我们可以分别获取键盘弹起后上端的Y坐标和输入框下端的Y坐标，通过做差可以判断出键盘是否遮住了输入框。上移我们可以采用view的transform属性进行平移变换，而不是直接去操作view的frame，这样做的好处是当我们要还原view的状态时可以直接将transform重置为0，而不需要再关心计算下移时的距离当弹起的键盘遮住了页面上的输入框时，我们应该将输入框移至键盘之上，而键盘没有遮到输入框时，并不需要操作。因此在ios的坐标系下，我们可以分别获取键盘弹起后上端的Y坐标和输入框下端的Y坐标，通过做差可以判断出键盘是否遮住了输入框。上移我们可以采用view的transform属性进行平移变换，而不是直接去操作view的frame，这样做的好处是当我们要还原view的状态时可以直接将transform重置为0，而不需要再关心计算下移时的距离当弹起的键盘遮住了页面上的输入框时，我们应该将输入框移至键盘之上，而键盘没有遮到输入框时，并不需要操作。因此在ios的坐标系下，我们可以分别获取键盘弹起后上端的Y坐标和输入框下端的Y坐标，通过做差可以判断出键盘是否遮住了输入框。上移我们可以采用view的transform属性进行平移变换，而不是直接去操作view的frame，这样做的好处是当我们要还原view的状态时可以直接将transform重置为0，而不需要再关心计算下移时的距离当弹起的键盘遮住了页面上的输入框时，我们应该将输入框移至键盘之上，而键盘没有遮到输入框时，并不需要操作。因此在ios的坐标系下，我们可以分别获取键盘弹起后上端的Y坐标和输入框下端的Y坐标，通过做差可以判断出键盘是否遮住了输入框。上移我们可以采用view的transform属性进行平移变换，而不是直接去操作view的frame，这样做的好处是当我们要还原view的状态时可以直接将transform重置为0，而不需要再关心计算下移时的距离当弹起的键盘遮住了页面上的输入框时，我们应该将输入框移至键盘之上，而键盘没有遮到输入框时，并不需要操作。因此在ios的坐标系下，我们可以分别获取键盘弹起后上端的Y坐标和输入框下端的Y坐标，通过做差可以判断出键盘是否遮住了输入框。上移我们可以采用view的transform属性进行平移变换，而不是直接去操作view的frame，这样做的好处是当我们要还原view的状态时可以直接将transform重置为0，而不需要再关心计算下移时的距离";


    
    [self.scrollView addSubview:self.groupDescLabel];
    [self.groupDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(15.f);
        make.right.equalTo(self.view).offset(-15.f);
        make.top.mas_equalTo(30);
        make.bottom.greaterThanOrEqualTo(self.scrollView).offset(-15.f);
    }];
    
    @weakify(self);
    self.toolbarView.joinButtonClickedBlock = ^{
        @strongify(self);
        NSLog(@"%@",[self description]);
    };
    self.toolbarView.commontsButtonClickedBlock = ^{
        @strongify(self);
        [self.inputToolBar showToolbar];
    };
    [self.view addSubview:self.toolbarView];
    [self.toolbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            // Fallback on earlier versions
            make.bottom.equalTo(self.view);
        }
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
    
    self.inputToolBar.gjt_top = UIScreen.height;
    
    [self.view addSubview:self.inputToolBar];
    [self.inputToolBar inputToolbarSendText:^(NSString *text) {
        @strongify(self);
//            [self.btn setTitle:text forState:UIControlStateNormal];
            // 清空输入框文字
        [self.inputToolBar clearText];
    }];
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

-(GJTGroupDetailToolbarView *)toolbarView {
    if (!_toolbarView) {
        _toolbarView = [[GJTGroupDetailToolbarView alloc] init];
    }
    return _toolbarView;
}



- (GJTInputToolBar *)inputToolBar {
    if (!_inputToolBar) {
        _inputToolBar = [[GJTInputToolBar alloc] init];
        _inputToolBar.textViewMaxLine = 3;
        _inputToolBar.fontSize = 14;
        _inputToolBar.placeholder = @"请输入...";
        _inputToolBar.showMaskView = YES;
    }
    return _inputToolBar;
}

-( UIScrollView *)mScrollView {
    if (!_mScrollView) {
        _mScrollView = [[UIScrollView alloc] init];
    }
    return _mScrollView;;
}


-(UILabel *)groupDescLabel {
    if (!_groupDescLabel) {
        _groupDescLabel = [[UILabel alloc] init];
        _groupDescLabel.numberOfLines = 0;
    }
    return _groupDescLabel;
}




- (void)dealloc
{
    [self.inputToolBar invalidate];
}

@end
