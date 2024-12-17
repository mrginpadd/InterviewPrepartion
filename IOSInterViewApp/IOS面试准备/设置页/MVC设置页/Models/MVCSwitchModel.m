//
//  MVCSwitchModel.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import "MVCSwitchModel.h"

@implementation MVCSwitchModel

+(MVCSwitchModel*)title:(NSString*) title subtitle:(NSString* __nullable)subtitle switchFlag:(BOOL)switchFlag {
    MVCSwitchModel *model = [MVCSwitchModel new];
    model.title = title;
    model.subtitle = subtitle;
    model.switchFlag = switchFlag;
    return model;
}

@end
