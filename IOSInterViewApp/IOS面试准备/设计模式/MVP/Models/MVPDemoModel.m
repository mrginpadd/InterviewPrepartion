//
//  MVPDemoModel.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "MVPDemoModel.h"

@implementation MVPCellModel

- (instancetype)initWithTitle:(NSString*)title val:(NSInteger)val {
    self = [super init];
    if (self) {
        _title = title;
        _val = val;
    }
    return self;
}

@end
@implementation MVPDemoModel
- (instancetype)init {
    self = [super init];
    if (self) {
        _data = [NSMutableArray array];
      [self generateData];
    }
    return self;
}
- (void)generateData {
    for (NSInteger i=0; i<=50; i++) {
        NSString *title = [NSString stringWithFormat:@"Item %ld", i];
        MVPCellModel *item = [[MVPCellModel alloc] initWithTitle:title val:i];
        [self.data addObject:item];
    }
}

- (void)updateItemWithIndex:(NSInteger)index {
    NSInteger val = self.data[index].val;
    val+=1;
    self.data[index].val = val;
}
@end
