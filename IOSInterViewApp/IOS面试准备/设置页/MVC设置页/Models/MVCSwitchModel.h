//
//  MVCSwitchModel.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVCSwitchModel : NSObject

@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy, nullable)NSString *subtitle;
@property(nonatomic, assign)BOOL switchFlag;

+(MVCSwitchModel*)title:(NSString*) title subtitle:(NSString* __nullable)subtitle switchFlag:(BOOL)switchFlag;
@end

NS_ASSUME_NONNULL_END
