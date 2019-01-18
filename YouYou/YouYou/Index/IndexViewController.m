//
//  IndexViewController.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/15.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "IndexViewController.h"
#import "CategoryContent.h"
#import "CellHeaderView.h"

@interface IndexViewController ()<UITableViewDelegate, UITableViewDataSource, CellHeaderViewDelegate>

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)NSMutableArray *dataList;

@end

@implementation IndexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initData];
}

#pragma mark - private
-(void)initUI{
    [self.view addSubview:self.tableView];
}

-(void)initData{
    YYData *data = [YYData shareInstance];
    if (data.categoryContentsList.count > 0) {
        self.dataList = [NSMutableArray arrayWithArray:data.categoryContentsList];
        [self.tableView reloadData];
    }else{
        [[DataManager shareInstance]getCategoryrRecommendsList:@{} call:^(NSArray *result) {
            self.dataList = [NSMutableArray arrayWithArray:data.categoryContentsList];
            [self.tableView reloadData];
        }];
    }
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 1;
    }else{
        CategoryContent *model = self.dataList[section];
        return model.list.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 78;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    [cell setBackgroundColor:[UIColor redColor]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    CellHeaderView *headerView = [[CellHeaderView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
    if (section != 0) {
        [headerView noEntry];
    }
    CategoryContent *model = self.dataList[section];
    [headerView setTitle:model.title];
    
    [headerView setDelegate:self];
    
    return headerView;
}

-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
        return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

#pragma mark - CellHeaderViewDelegate
-(void)tagAction{
    GLog(@"....");
}

#pragma mark - setter
-(UITableView *)tableView{
    
    if (_tableView == nil) {
        
        CGFloat tabelViewH = ScreenHeight - (SafeAreaBottomHeight + TabBarHeight + NavigatorHeight);
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavigatorHeight, ScreenWidth, tabelViewH) style:UITableViewStyleGrouped];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        
        //tableView -> headView
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
        [imageView setFrame:CGRectMake(0, 0, ScreenWidth, 200)];
       
        
        _tableView.tableHeaderView = ({
            UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
            back.backgroundColor = [UIColor clearColor];
            [back addSubview:imageView];
            back;
        });
        
        
        //tableView -> cell
//        [_tableView registerNib:[UINib nibWithNibName:@"IndexTableViewCell" bundle:nil] forCellReuseIdentifier:IndexTableViewCellIdentifier];
        //
        //
        //        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _tableView;
}




@end
