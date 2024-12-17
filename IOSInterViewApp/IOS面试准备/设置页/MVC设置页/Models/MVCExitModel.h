//
//  MVCExitModel.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVCExitModel : NSObject
@property(nonatomic, copy)NSString *title;

+(MVCExitModel*)title:(NSString*)title;
@end

NS_ASSUME_NONNULL_END
