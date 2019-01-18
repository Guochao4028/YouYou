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
#import "RollingCell.h"

#import "ListTableViewCell.h"

static NSString *RollingCellIdentifier = @"RollingCellIdentifier";
static NSString *ListTableViewCellIdentifier = @"ListTableViewCellIdentifier";


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
    if ((indexPath.section == 0) || (indexPath.section == 1)) {
        return 158;
    }else{
        return 96;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        RollingCell *cell = [tableView dequeueReusableCellWithIdentifier:RollingCellIdentifier];
        CategoryContent *model = self.dataList[indexPath.section];
        cell.model =  model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.section == 1){
        RollingCell *cell = [tableView dequeueReusableCellWithIdentifier:RollingCellIdentifier];
        CategoryContent *model = self.dataList[indexPath.section];
        cell.model =  model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        CategoryContent *model = self.dataList[indexPath.section];
        ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListTableViewCellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model =  model.list[indexPath.row];
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CategoryContent *model = self.dataList[section];
    CellHeaderView *headerView = [[CellHeaderView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
     [headerView setTitle:model.title];
    if (section != 0) {
        [headerView noEntry];
    }else{
        [headerView setTitle:@"热门排行榜"];
    }
    
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
        [imageView setFrame:CGRectMake(0, 0, ScreenWidth, 244)];
       
        
        _tableView.tableHeaderView = ({
            UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 244)];
            back.backgroundColor = [UIColor clearColor];
            [back addSubview:imageView];
            back;
        });
        
        
        //tableView -> cell
        [_tableView registerNib:[UINib nibWithNibName:@"ListTableViewCell" bundle:nil] forCellReuseIdentifier:ListTableViewCellIdentifier];
        [_tableView registerClass:[RollingCell class] forCellReuseIdentifier:RollingCellIdentifier];
        //
        //
        //        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _tableView;
}




@end
