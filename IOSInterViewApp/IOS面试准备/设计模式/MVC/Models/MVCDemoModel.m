//
//  MVCDemoModel.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <Foundation/Foundation.h>
#import "MVCDemoModel.h"
@implementation MVCCellModel

- (instancetype)initWithTitle:(NSString*)title val:(NSInteger)val {
    self = [super init];
    if (self) {
        _title = title;
        _val = val;
    }
    return self;
}

@end

@implementation MVCDemoModel

- (instancetype)init {
    self = [super init];
    if (self) {
        _data = [NSMutableArray array];
        [self generateData];
    }
    return self;
}

- (void)generateData {
    for (NSInteger i=1; i<=50; i++) {
        NSString *title = [NSString stringWithFormat:@"Item %ld", i];
        NSInteger *val = i;
        MVCCellModel *cellModel = [[MVCCellModel alloc] initWithTitle:title val:val];
        [self.data addObject:cellModel];
    }
}

- (void)updateItemWithIndex:(NSInteger)index {
    NSInteger val = self.data[index].val;
    val+=1;
    self.data[index].val = val;
}
@end
