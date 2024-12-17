//
//  MVCExitModel.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import "MVCExitModel.h"

@implementation MVCExitModel
+ (MVCExitModel *)title:(NSString *)title {
    MVCExitModel *model = [MVCExitModel new];
    model.title = title;
    return model;
}
@end
