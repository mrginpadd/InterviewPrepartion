//
//  UserViewController.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "ViewController.h"
#import "UserViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN


@interface UserViewController : UIViewController<UserViewProtocol>
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *ageLabel;
@end

NS_ASSUME_NONNULL_END
