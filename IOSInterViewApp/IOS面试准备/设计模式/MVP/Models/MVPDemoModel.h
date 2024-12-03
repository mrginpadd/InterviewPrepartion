//
//  MVPDemoModel.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MVPCellModel : NSObject
@property(nonatomic, strong) NSString* title;
@property(nonatomic, assign) NSInteger val;
@end

@interface MVPDemoModel : NSObject
@property(nonatomic, strong) NSMutableArray<MVPCellModel*>* data;
- (void)generateData;
- (void)updateItemWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
