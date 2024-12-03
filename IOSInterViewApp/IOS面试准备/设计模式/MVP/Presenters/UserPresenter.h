//
//  UserPresenter.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <Foundation/Foundation.h>
#import "UserViewProtocol.h"
#import "UserModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserPresenter : NSObject
- (instancetype)initWithView:(id<UserViewProtocol>) view;
- (void)loadUserData;
@end

NS_ASSUME_NONNULL_END
