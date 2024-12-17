//
//  SettingViewController.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/16.
//

#import "SettingViewController.h"
#import "MVCAvatarModel.h"
#import "MVCAvatarCell.h"
#import "MVCSwitchModel.h"
#import "MVCSwitchCell.h"
#import "MVCNormalCell.h"
#import "MVCExitCell.h"
@interface SettingViewController ()<MVCSwitchProtocol>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.view.backgroundColor = [UIColor grayColor];
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = self.view.bounds;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVCExitCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[MVCExitCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    //头像cell
//    MVCAvatarModel *cellModel = [MVCAvatarModel avatarUrl:@"https://photo.16pic.com/00/78/15/16pic_7815269_b.jpg" nickName:@"张三" subtitle:@"一个勤劳的牛马" hideAccesory:YES];
    
    //开关cell
//    MVCSwitchModel *cellModel = [MVCSwitchModel title:@"阿萨德的期望" subtitle:nil switchFlag:YES];
//    cell.eventDelegate = self;
    
    //普通cell
//    MVCNormalModel *cellModel = [MVCNormalModel title:@"算法请求放弃我" arrowText:@"的无法完全放弃放弃我" hideArrow:NO];
//    [cell setDataSource:cellModel];
    
    //退出cell
    MVCExitModel *cellModel = [MVCExitModel title:@"退出"];
    [cell setDataSource:cellModel];
    return cell;
}

- (void)switchChange:(BOOL)val {
    NSLog(@"switch按钮的回调 %@", val ? @"true" : @"false");
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
@end
