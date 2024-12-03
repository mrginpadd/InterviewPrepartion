//
//  MVPPresenter.h
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import <Foundation/Foundation.h>
#import "MVPViewProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface MVPPresenter : NSObject
- (instancetype)initWithView:(id<MVPViewProtocol>) view;
- (void)loadData;
@end

NS_ASSUME_NONNULL_END
