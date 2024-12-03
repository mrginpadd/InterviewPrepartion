//
//  UserViewProtocol.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#ifndef UserViewProtocol_h
#define UserViewProtocol_h

@protocol UserViewProtocol <NSObject>

- (void)showUserDataWithName:(NSString *)name age:(NSInteger)age;
- (void)showError:(NSString *)error;

@end

#endif /* UserViewProtocol_h */
