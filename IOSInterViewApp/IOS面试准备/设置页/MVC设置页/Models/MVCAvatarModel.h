//
//  MVCAvatarModel.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVCAvatarModel : NSObject
@property(nonatomic, copy) NSString *avatarUrl; //头像url
@property(nonatomic, copy) NSString *nickName; //昵称
@property(nonatomic, copy) NSString *subtitle;  //描述
@property(nonatomic, assign, readwrite) BOOL hideAccesory;  //隐藏箭头

+(MVCAvatarModel*)avatarUrl:(NSString*)avatarUrl nickName:(NSString*)nickName subtitle:(NSString*)subtitle hideAccesory:(BOOL)hideAccesory;


@end

NS_ASSUME_NONNULL_END
