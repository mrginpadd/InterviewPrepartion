//
//  MVCDemoModel.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

// MVCModel.h
#import <Foundation/Foundation.h>

@interface MVCCellModel : NSObject
@property (nonatomic, strong, readwrite) NSString* title;
@property (nonatomic, assign, readwrite) NSInteger val;
@end

@interface MVCDemoModel : NSObject

@property (nonatomic, strong, readwrite) NSMutableArray<MVCCellModel *> *data;

- (void)generateData; // 用于生成数据
- (void)updateItemWithIndex:(NSInteger)index;
@end


