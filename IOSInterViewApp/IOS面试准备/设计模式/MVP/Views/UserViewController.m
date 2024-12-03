//
//  UserViewController.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

// View 是与用户交互的地方，它展示数据并响应用户的操作。
// View 在 MVP 中是被动的，它通过 Presenter 来更新 UI。
#import "UserViewController.h"
#import "UserPresenter.h"
@interface UserViewController ()
@property (nonatomic, strong) UserPresenter *presenter;
@end

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化 UI
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 30)];
    self.ageLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 140, 200, 30)];
    [self.view addSubview:self.nameLabel];
    [self.view addSubview:self.ageLabel];
    self.view.backgroundColor = [UIColor whiteColor];
    //创建Presenter
    self.presenter = [[UserPresenter alloc] initWithView:self];
    
    //加载数据
    [self.presenter loadUserData];
}

// 更新UI
- (void)showUserDataWithName:(NSString *)name age:(NSInteger)age {
    self.nameLabel.text = name;
    self.ageLabel.text = [NSString stringWithFormat:@"%ld", (long)age];
}


- (void)showError:(NSString *)error {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:error preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
