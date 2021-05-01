//
//  GJTPostGroupInfoViewController.m
//  Gojito
//
//  Created by kyson on 2021/2/22.
//

#import "GJTPostGroupInfoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "GJTPostGroupInfoItemView.h"
#import "GJTGroupPicProcsView.h"
#import "GJTPostGroupDescView.h"

@interface GJTPostGroupInfoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) GJTGroupPicProcsView *processView;

@property (nonatomic, strong) UITextField *groupNameTextField;

@property (nonatomic, strong) UILabel *textCountLabel;

@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *line2View;

@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, strong) GJTTextView *descTextView;

@property (nonatomic, strong) GJTPostGroupInfoItemView *groupLocationItemView;

@property (nonatomic, strong) GJTPostGroupInfoItemView *groupTagItemView;

@property (nonatomic, strong) UIScrollView *mScrollView;
@end

@implementation GJTPostGroupInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"上传";
    
    self.scrollView = self.mScrollView;
    self.scrollView.contentSize = CGSizeMake(UIScreen.width,UIScreen.height - 200);
    [self.view addSubview:self.scrollView];

    [self.view addSubview:self.confirmButton];
    [self.confirmButton addTarget:self action:@selector(confirmButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(16.f);
        make.right.equalTo(self.view).offset(-16.f);
        if (@available(iOS 11.0, *)) {
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom).offset(-10);
        } else {
            // Fallback on earlier versions
            make.bottom.equalTo(self.view).offset(-10);
        }
        make.height.mas_equalTo(44.f);
    }];
    
    [self.scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.confirmButton.mas_top).offset(-5);
    }];
    
    [self.scrollView addSubview:self.processView];
    [self.processView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.top.equalTo(self.scrollView).offset(10);
        make.height.mas_equalTo(88);
    }];
    
    [self.scrollView addSubview:self.groupNameTextField];
    [self.groupNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processView.mas_bottom).offset(8.f);
        make.left.equalTo(self.view).offset(16.f);
        make.height.mas_equalTo(44.f);
        make.right.equalTo(self.view).offset(-55.f);
    }];
    
    [self.scrollView addSubview:self.textCountLabel];
    [self.textCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.groupNameTextField);
        make.left.equalTo(self.groupNameTextField.mas_right).offset(8);
        make.width.mas_equalTo(30);
        make.right.equalTo(self.view).offset(-16.f);
    }];
    
    [self.scrollView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.groupNameTextField);
        make.height.mas_equalTo(0.3f);
        make.top.equalTo(self.groupNameTextField.mas_bottom).offset(-2.f);
    }];
    
    [self.scrollView addSubview:self.descTextView];
    [self.descTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(12.f);
        make.right.equalTo(self.view).offset(-16.f);
        make.top.equalTo(self.groupNameTextField.mas_bottom).offset(10);
        //动态调整高度
//        make.height.mas_equalTo(25.f);
    }];
    
    [self.scrollView addSubview:self.line2View];
    [self.line2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(0.3f);
        make.top.equalTo(self.descTextView.mas_bottom).offset(-2.f);
    }];
    
    
    [self.scrollView addSubview:self.groupLocationItemView];
    [self.groupLocationItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descTextView.mas_bottom).offset(10.f);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(44.f);
    }];
    
    [self.scrollView addSubview:self.groupTagItemView];
    [self.groupTagItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupLocationItemView.mas_bottom).offset(10.f);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.mas_equalTo(44.f);
    }];

}

-(void) confirmButtonDidClicked {
    [self.navigationController popViewControllerAnimated:YES];
}


// 选择图片成功调用此方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    // dismiss UIImagePickerController
    [self dismissViewControllerAnimated:YES completion:nil];
    // 选择的图片信息存储于info字典中
    NSLog(@"%@", info);
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    self.processView.codeImage = image;
    
}

// 取消图片选择调用此方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    // dismiss UIImagePickerController
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) processButtonDidClicked {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            // 实例化UIImagePickerController控制器
        UIImagePickerController * imagePickerVC = [[UIImagePickerController alloc] init];
        // 设置资源来源（相册、相机、图库之一）
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        // 设置可用的媒体类型、默认只包含kUTTypeImage，如果想选择视频，请添加kUTTypeMovie
        // 如果选择的是视屏，允许的视屏时长为20秒
        imagePickerVC.videoMaximumDuration = 20;
        // 允许的视屏质量（如果质量选取的质量过高，会自动降低质量）
        imagePickerVC.videoQuality = UIImagePickerControllerQualityTypeHigh;
        imagePickerVC.mediaTypes = @[ (NSString *)kUTTypeImage];
        // 设置代理，遵守UINavigationControllerDelegate, UIImagePickerControllerDelegate 协议
        imagePickerVC.delegate = self;
        // 是否允许编辑（YES：图片选择完成进入编辑模式）
        imagePickerVC.allowsEditing = YES;
        // model出控制器
        [self presentViewController:imagePickerVC animated:YES completion:nil];
    }
}

-(GJTGroupPicProcsView *)processView {
    if (!_processView) {
        _processView = [[GJTGroupPicProcsView alloc] init];
        
        __weak typeof(self) weakSelf = self;
        _processView.codeButtonDidClickedBlock = ^{
            __strong typeof(self) self = weakSelf;
            
            [self processButtonDidClicked];
        };
    }
    return _processView;
}

-(UITextField *)groupNameTextField {
    if (!_groupNameTextField) {
        _groupNameTextField = [[UITextField alloc] init];
        _groupNameTextField.placeholder = @"请填写群名";
        _groupNameTextField.font = [UIFont systemFontOfSize:16.f];
    }
    return _groupNameTextField;;
}

-(UILabel *)textCountLabel {
    if (!_textCountLabel) {
        _textCountLabel = [[UILabel alloc] init];
        _textCountLabel.text = @"20";
        _textCountLabel.font = [UIFont systemFontOfSize:16.f];
        _textCountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _textCountLabel;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"3d3d3d"];
    }
    return _lineView;
}

-(UIView *)line2View {
    if (!_line2View) {
        _line2View = [[UIView alloc] init];
        _line2View.backgroundColor = [UIColor colorWithHexString:@"3d3d3d"];
    }
    return _line2View;
}

-(UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [[UIButton alloc] init];
        [_confirmButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:[UIColor colorWithHexString:@"365ec5"]];
        _confirmButton.layer.cornerRadius = 22.f;
        _confirmButton.clipsToBounds = YES;
        [_confirmButton setTitle:@"发布" forState:UIControlStateNormal];
    }
    return _confirmButton;
}

-(GJTTextView *)descTextView {
    if (!_descTextView) {
        _descTextView = [[GJTTextView alloc] init];
        _descTextView.placeholder = @"请输入群介绍";
        _descTextView.scrollEnabled = NO;
        _descTextView.font = [UIFont systemFontOfSize:14.f];
    }
    return _descTextView;
}

-(GJTPostGroupInfoItemView *)groupLocationItemView {
    if (!_groupLocationItemView) {
        UIImage *img = [UIImage imageNamed:@"icon_location"];
        _groupLocationItemView = [[GJTPostGroupInfoItemView alloc] initWithIcon:img title:@"定位" subTitle:@""];
    }
    return _groupLocationItemView;
}

-(GJTPostGroupInfoItemView *)groupTagItemView {
    if (!_groupTagItemView) {
        UIImage *img = [UIImage imageNamed:@"icon_location"];
        _groupTagItemView = [[GJTPostGroupInfoItemView alloc] initWithIcon:img title:@"标签" subTitle:@""];
    }
    return _groupTagItemView;
}


-(UIScrollView *)mScrollView {
    if (!_mScrollView) {
        _mScrollView = [[UIScrollView alloc] init];
    }
    return _mScrollView;
}


@end
