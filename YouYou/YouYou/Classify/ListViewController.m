//
//  ListViewController.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/19.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ListViewController.h"
#import "ListTableViewCell.h"
#import "DetailsViewController.h"
#import "Tag.h"

static NSString *ListTableViewCellIdentifier = @"ListTableViewCellIdentifier";

@interface ListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *dataList;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataList = [NSMutableArray array];
    [self.view addSubview:self.tableView];
}

-(void)viewWillAppear:(BOOL)animated{
    
    NSDictionary *dic = @{@"categoryId": self.model.category_id, @"tagName":self.model.tname};
    
    [[DataManager shareInstance]getCateforyAlbum:dic call:^(NSArray *result) {
        [self.dataList addObjectsFromArray:result];
        [self.tableView reloadData];
    }];
    
    [super viewWillAppear:animated];
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   return 96;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


        ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model =  self.dataList[indexPath.row];
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    Album *album = self.dataList[indexPath.row];
    DetailsViewController *vc = [[DetailsViewController alloc]init];
    vc.model = album;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.01;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

#pragma mark - setter
-(UITableView *)tableView{
    
    if (_tableView == nil) {
        
        CGFloat tabelViewH = ScreenHeight - (SafeAreaBottomHeight + TabBarHeight + NavigatorHeight);
        
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        
        //tableView -> cell
        [_tableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:ListTableViewCellIdentifier];
        //
        //
        //        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _tableView;
}



@end
