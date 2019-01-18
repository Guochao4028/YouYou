//
//  DetailsViewController.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsNavgationView.h"

@interface DetailsViewController ()<DetailsNavgationViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)DetailsNavgationView *navgationView;
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self initUI];
    [self initData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}
-(void)initUI{
    [self.view addSubview:self.navgationView];
    [self.view addSubview:self.tableView];
}
-(void)initData{
//    NSArray *tem = [[DBManager shareInstance]queryPlist];
//    self.dataList = [NSMutableArray arrayWithArray:tem];
    
//    GLog(@"albumid = %@", self.albumid);
    
    [[DataManager shareInstance]getDetails:self.model call:^(NSObject *object) {
        GLog(@"object : %@", object);
        [self.tableView reloadData];
    }];
}

#pragma mark - HistroyNavgtionViewDelegate
-(void)goback{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)collectionAction:(NSInteger)type{
    GLog(@"%ld", type);
}

#pragma mark - UITableViewDelegate && UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

#pragma mark - getter/ setter

-(DetailsNavgationView *)navgationView{
    if (_navgationView == nil) {
        _navgationView = [[DetailsNavgationView alloc]initWithFrame:CGRectMake(0, StatusBarHeight, ScreenWidth, 44)];
        [_navgationView setDelegate:self];
    }
    return _navgationView;
}

-(UITableView *)tableView{
    
    if (_tableView == nil) {
        
        CGFloat tabelViewH = ScreenHeight - (CGRectGetMaxY(self.navgationView.frame) + TabBarHeight);
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.navgationView.frame), ScreenWidth, tabelViewH)
                                                 style:UITableViewStylePlain];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellEditingStyleNone;
        
        //tableView -> cell
//        [_tableView registerNib:[UINib nibWithNibName:@"HistroyTableViewCell" bundle:nil] forCellReuseIdentifier:HistroyTableViewCellIdentifier];
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    }
    return _tableView;
}


@end
