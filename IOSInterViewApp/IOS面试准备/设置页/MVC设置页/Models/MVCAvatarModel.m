//
//  MVCAvatarModel.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/16.
//

#import "MVCAvatarModel.h"

@implementation MVCAvatarModel
+(MVCAvatarModel*)avatarUrl:(NSString*)avatarUrl nickName:(NSString*)nickName subtitle:(NSString*)subtitle hideAccesory:(BOOL)hideAccesory {
    MVCAvatarModel *model = [MVCAvatarModel new];
    model.avatarUrl = avatarUrl;
    model.nickName = nickName;
    model.subtitle = subtitle;
    model.hideAccesory = hideAccesory;
    return model;
}
@end
