//
//  IndexViewController.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/15.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()<UITableViewDelegate, UITableViewDataSource>

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
    
}

#pragma mark - UITableViewDelegate && UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataList.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
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
