//
//  MVCNormalModel.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVCNormalModel : NSObject

@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *arrowText;
@property(nonatomic, assign)BOOL hideArrow;

+(MVCNormalModel*)title:(NSString*)title arrowText:(NSString*)arrowText hideArrow:(BOOL)hideArrow;
@end

NS_ASSUME_NONNULL_END
