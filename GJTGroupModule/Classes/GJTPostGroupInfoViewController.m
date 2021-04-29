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

@interface GJTPostGroupInfoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) GJTGroupPicProcsView *processView;

@property (nonatomic, strong) UITextField *groupNameTextField;

@property (nonatomic, strong) UILabel *textCountLabel;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, strong) GJTTextView *descTextView;

@property (nonatomic, strong) GJTPostGroupInfoItemView *groupLocationItemView;

@property (nonatomic, strong) GJTPostGroupInfoItemView *groupTagItemView;

@property (nonatomic, strong) GJTPostGroupInfoItemView *groupOtherItemView;


@end

@implementation GJTPostGroupInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.confirmButton];
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
    
    
    self.scrollView.contentSize = CGSizeMake(UIScreen.width,UIScreen.height - 100);
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
        make.height.mas_equalTo(66);
    }];

    // Do any additional setup after loading the view.
//    [self.scrollView addSubview:self.codeImageButton];
//    [self.codeImageButton addTarget:self action:@selector(codeAddButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.codeImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(66, 66));
//        make.left.equalTo(self.view).offset(16);
//        make.top.equalTo(self.scrollView).offset(10);
//    }];
//
//    [self.scrollView addSubview:self.codeDescLabel];
//    [self.codeDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.codeImageButton.mas_right).offset(12.f);
//        make.top.equalTo(self.codeImageButton);
//        make.right.equalTo(self.view).offset(-15.f);
//    }];
//
//    [self.scrollView addSubview:self.codeImagelineView];
//    [self.codeImagelineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view);
//        make.height.mas_equalTo(0.3f);
//        make.top.equalTo(self.codeImageButton.mas_bottom).offset(10.f);
//        make.right.equalTo(self.view);
//    }];
//
//    // Do any additional setup after loading the view.
//    [self.scrollView addSubview:self.groupDetailImageButton];
//    [self.groupDetailImageButton addTarget:self action:@selector(codeAddButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
//    [self.groupDetailImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.size.mas_equalTo(CGSizeMake(66, 66));
//        make.left.equalTo(self.view).offset(16);
//        make.top.equalTo(self.codeImageButton.mas_bottom).offset(20);
//    }];
//
//    [self.scrollView addSubview:self.groupDetailLabel];
//    [self.groupDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.groupDetailImageButton.mas_right).offset(12.f);
//        make.top.equalTo(self.groupDetailImageButton);
//        make.right.equalTo(self.view.mas_right).offset(-15.f);
//    }];
    
    [self.scrollView addSubview:self.groupNameTextField];
    [self.groupNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.processView.mas_bottom).offset(8.f);
        make.left.equalTo(self.processView);
        make.height.mas_equalTo(44.f);
        make.right.equalTo(self.view).offset(-55.f);
    }];
    
    [self.scrollView addSubview:self.textCountLabel];
    [self.textCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.groupNameTextField);
        make.left.equalTo(self.groupNameTextField.mas_right).offset(8);
        make.width.mas_equalTo(30);
        make.right.equalTo(self.view).offset(-16.f);
    }];
    
    [self.scrollView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.groupNameTextField);
        make.right.equalTo(self.groupNameTextField);
        make.height.mas_equalTo(0.3f);
        make.top.equalTo(self.groupNameTextField.mas_bottom).offset(-2.f);
    }];
    
   
    
    [self.scrollView addSubview:self.descTextView];
    [self.descTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(16.f);
        make.right.equalTo(self.view).offset(-16.f);
        make.top.equalTo(self.groupNameTextField.mas_bottom).offset(10);
        make.height.mas_equalTo(200.f);
    }];
    
    [self.scrollView addSubview:self.groupLocationItemView];
    [self.groupLocationItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.descTextView.mas_bottom).offset(20.f);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(44.f);
    }];
    
    [self.scrollView addSubview:self.groupTagItemView];
    [self.groupTagItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupLocationItemView.mas_bottom).offset(10.f);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(44.f);
    }];
    
    [self.scrollView addSubview:self.groupOtherItemView];
    [self.groupOtherItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.groupTagItemView.mas_bottom).offset(150.f);
        make.left.equalTo(self.view).offset(15);
        make.right.equalTo(self.view).offset(-15);
        make.height.mas_equalTo(44.f);
    }];
   
}


// 选择图片成功调用此方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    // dismiss UIImagePickerController
    [self dismissViewControllerAnimated:YES completion:nil];
    // 选择的图片信息存储于info字典中
    NSLog(@"%@", info);
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
//    [self.codeImageButton setImage:image forState:UIControlStateNormal];
}

// 取消图片选择调用此方法
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    // dismiss UIImagePickerController
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)codeAddButtonClicked :(UIButton *) button {
    // 判断当前的sourceType是否可用
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
        _textCountLabel.textAlignment = NSTextAlignmentRight;
    }
    return _textCountLabel;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = UIColor.grayColor;
    }
    return _lineView;
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
        _descTextView.layer.borderWidth = 0.5f;
        _descTextView.layer.borderColor = UIColor.grayColor.CGColor;
        _descTextView.layer.cornerRadius = 3.f;
        _descTextView.placeholder = @"请输入群介绍";
    }
    return _descTextView;
}

-(GJTPostGroupInfoItemView *)groupLocationItemView {
    if (!_groupLocationItemView) {
        UIImage *img = [UIImage imageNamed:@"icon_location"];
        _groupLocationItemView = [[GJTPostGroupInfoItemView alloc] initWithIcon:img title:@"你好" subTitle:@"有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说"];
    }
    return _groupLocationItemView;
}

-(GJTPostGroupInfoItemView *)groupTagItemView {
    if (!_groupTagItemView) {
        UIImage *img = [UIImage imageNamed:@"icon_location"];
        _groupTagItemView = [[GJTPostGroupInfoItemView alloc] initWithIcon:img title:@"你好" subTitle:@"有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说"];
    }
    return _groupTagItemView;
}

-(GJTPostGroupInfoItemView *)groupOtherItemView {
    if (!_groupOtherItemView) {
        UIImage *img = [UIImage imageNamed:@"icon_location"];
        _groupOtherItemView = [[GJTPostGroupInfoItemView alloc] initWithIcon:img title:@"你好" subTitle:@"有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说有话这里说"];
    }
    return _groupOtherItemView;
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
