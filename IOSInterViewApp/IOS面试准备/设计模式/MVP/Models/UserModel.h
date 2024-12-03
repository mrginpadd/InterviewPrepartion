//
//  UserModel.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

//Model 类负责管理数据
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject
@property(nonatomic, strong) NSString* name;
@property(nonatomic, assign) NSInteger age;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
@end

NS_ASSUME_NONNULL_END
