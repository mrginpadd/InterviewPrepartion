//
//  MVCNormalModel.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/17.
//

#import "MVCNormalModel.h"

@implementation MVCNormalModel

+(MVCNormalModel*)title:(NSString*)title arrowText:(NSString*)arrowText hideArrow:(BOOL)hideArrow {
    MVCNormalModel *model = [MVCNormalModel new];
    model.title = title;
    model.arrowText = arrowText;
    model.hideArrow = hideArrow;
    return model;
}
@end
