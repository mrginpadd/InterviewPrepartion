//
//  ViewController.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/11/6.
//

#import "ViewController.h"
#import "MVCViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建并初始化子控制器
    MVCViewController *vc = [[MVCViewController alloc] init];
    
    // 添加子控制器
    [self addChildViewController:vc];
    
    // 将子视图控制器的视图添加到父视图
    [self.view addSubview:vc.view];
    
    // 设置子视图的框架或布局约束
    vc.view.frame = self.view.bounds; // 使子视图控制器的视图填满整个父视图
    
    // 通知子控制器它已经被添加
    [vc didMoveToParentViewController:self];
}


@end
