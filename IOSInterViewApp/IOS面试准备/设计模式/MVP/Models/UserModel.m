//
//  UserModel.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "UserModel.h"

@implementation UserModel
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _age = age;
        _name = name;
    }
    return self;
}
@end
