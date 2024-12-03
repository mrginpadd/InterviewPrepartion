//
//  MVPViewController.m
//  IOSInterViewApp
//
//  Created by xushihao on 2024/12/3.
//

#import "MVPViewController.h"
#import "MVPTableViewCell.h"
#import "MVPPresenter.h"
@interface MVPViewController ()
@property(nonatomic, strong) MVPPresenter* presenter;
@end

@implementation MVPViewController
# pragma-mark MVPViewProtocol
- (void)loadData {
    self.dataModel = [[MVPDemoModel alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    //创建Presenter
    self.presenter = [[MVPPresenter alloc] initWithView:self];
    
    //加载数据
    [self.presenter loadData];
//    self.dataModel = [[MVPDemoModel alloc] init];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.data.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MVPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MVPTableViewCell"];
    NSString *title = self.dataModel.data[indexPath.row].title;
    NSInteger val = self.dataModel.data[indexPath.row].val;
    if (cell == nil) {
        cell = [[MVPTableViewCell alloc] initWithTitle:title val:val reuseIdentifier:@"MVPTableViewCell"];
    } else {
        cell.titleLabel.text = title;
        cell.valLabel.text = [NSString stringWithFormat:@"%d", val];
    }
    
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void)didTapAddBtnInCell:(UITableViewCell*)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath) {
        [self.dataModel updateItemWithIndex:indexPath.row];
        // 刷新对应行
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
