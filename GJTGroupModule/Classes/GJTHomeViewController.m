//
//  GJTHomeViewController.m
//  Gojito
//
//  Created by kyson on 2021/2/19.
//

#import "GJTHomeViewController.h"
//#import <GJTQRCodeModule/GJTQRCodeModule.h>
#import "GJTPostGroupInfoViewController.h"
#import "GJTGroupItemTableViewCell.h"
#import "GJTGroupDetailViewController.h"
#import "GJTGroupDetailViewModel.h"

@interface GJTHomeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation GJTHomeViewController



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.title = @"首页";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView = self.tableView;
    
    UISearchBar *searchbar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 80, 44)];
    UIButton *addButton = [[UIButton alloc] initWithFrame:CGRectMake(searchbar.gjt_right + 10, 0, 44, 44)];
    addButton.titleLabel.font = [UIFont boldSystemFontOfSize:24];
    [addButton setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    [addButton setTitle:@"+" forState:UIControlStateNormal];
    @weakify(self);
    [[addButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        // 弹出QQ的自定义视图
        [GJTTableSelectView addTableSelectViweWithWindowFrame:CGRectMake(self.view.bounds.size.width-100, 64, 150, 200) selectData:@[@"扫一扫",@"手动上传"] images:@[@"saoyisao",@"saoyisao"] action:^(NSInteger index) {
            NSLog(@"选择%ld",(long)index);
//            if (index == 0) {
//                GJTScanningViewController *scanViewController = [[GJTScanningViewController alloc] init];
//                [self.navigationController pushViewController:scanViewController animated:YES];
//            } else {
//                GJTPostGroupInfoViewController *postViewController = [[GJTPostGroupInfoViewController alloc] init];
//                [self.navigationController pushViewController:postViewController animated:YES];
//            }
            
        } animated:YES];
    }];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width - 30, 44)];
    
    [titleView addSubview:searchbar];
    [titleView addSubview:addButton];

    self.navigationItem.titleView = titleView;
    
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"identifier";
    GJTGroupItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GJTGroupItemTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.groupImage = [UIImage imageNamed:@"AppIcon"];
    cell.groupName = @"夸夸群夸夸群夸夸群夸夸群夸夸群夸夸群夸夸群";
    cell.groupDesc = @"这是描述这是描述这是描述这是描述这是描述这是描述这是描述";
    cell.groupProperty = @"100人 关注";
    cell.groupCategory = @"理财技巧";
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    GJTGroupDetailViewModel *viewModel = [[GJTGroupDetailViewModel alloc] init];
    GJTGroupDetailViewController *detailVC = [[GJTGroupDetailViewController alloc] initWithViewModel:viewModel];
    [self.navigationController pushViewController:detailVC animated:YES];
    

    
    
}

-(UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
