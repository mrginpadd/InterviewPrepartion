//
//  UserPresenter.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "UserPresenter.h"

@interface UserPresenter()
@property(nonatomic, weak) id<UserViewProtocol> view;
@property(nonatomic, strong) UserModel *userModel;
@end

@implementation UserPresenter

- (instancetype) initWithView:(id<UserViewProtocol>)view {
    self = [super init];
    if (self) {
        _view = view;
    }
    return self;
}
- (void)loadUserData {
    //假设从网络获取数据
    self.userModel = [[UserModel alloc] initWithName:@"张三" age:32];
    if (self.userModel) {
        //获取到数据后更新视图
        [self.view showUserDataWithName:self.userModel.name age:self.userModel.age];
    } else {
        //如果没有数据，展示错误信息
        [self.view showError:@"加载用户数据失败"];
    }
}
@end
