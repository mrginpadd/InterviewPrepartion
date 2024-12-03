//
//  ViewController.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/11/6.
//

#import "ViewController.h"
#import "MVCViewController.h"
#import "UserViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 40, 100, 100)];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(jumpToPage) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:btn];
}

- (void)jumpToPage {
    UserViewController *vc = [[UserViewController alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
}


@end
