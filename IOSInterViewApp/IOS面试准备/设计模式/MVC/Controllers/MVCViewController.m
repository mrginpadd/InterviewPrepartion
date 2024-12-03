//
//  MVCViewController.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "MVCViewController.h"
#import "MVCTableViewCell.h"
@interface MVCViewController ()

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //初始化数据
//    NSMutableArray *data = [NSMutableArray array];

//    for (NSInteger i = 1; i <= 50; i++) {
//        NSString *title = [NSString stringWithFormat:@"Item%ld", (long)i];
//        NSNumber *val = @(i);
//
//        NSDictionary *item = @{@"title": title, @"val": val};
//        [data addObject:item];
//    }
//    // 赋值给 self.data
//    self.data = data;
    self.dataModel = [[MVCDemoModel alloc] init];
    
    self.view.backgroundColor = [UIColor redColor];
    
    //初始化tableView
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.frame = self.view.bounds;
//    [self.tableView registerClass:[MVCTableViewCell class] forCellReuseIdentifier:@"MVCTableViewCell"];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    NSDictionary *item = self.data[indexPath.row];
    MVCCellModel *item = self.dataModel.data[indexPath.row];
    
    MVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MVCTableViewCell"];
    
    if (!cell) {
        // 如果没有复用的单元格，创建新的单元格
        cell = [[MVCTableViewCell alloc] initWithTitle:item.title val:item.val reuseIdentifier:@"MVCTableViewCell"];
    } else {
        // 如果是复用的单元格，仅更新内容
        [cell configureWithTitle:item.title val:item.val];
    }
    
    cell.delegate = self;

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    
}

- (void)didTapAddButtonInCell:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath) {
        [self.dataModel updateItemWithIndex:indexPath.row];
        // 刷新对应行
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
@end
