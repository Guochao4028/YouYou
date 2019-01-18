//
//  DetailsViewController.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DetailsViewController.h"
#import "DetailsNavgationView.h"
#import "DetailsModel.h"
#import "Album.h"
#import "Track.h"
#import "DetailsHeardView.h"
#import "DetailsTableViewCell.h"

static NSString *DetailsTableViewCellIdentifier = @"DetailsTableViewCellIdentifier";


@interface DetailsViewController ()<DetailsNavgationViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)DetailsNavgationView *navgationView;
@property(nonatomic, strong)DetailsHeardView *heardView;

@property(nonatomic, strong)NSArray *list;

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
    
    [self.navgationView setTitleString: self.model.title];
    
    [[DataManager shareInstance]getDetails:self.model call:^(NSObject *object) {
        GLog(@"object : %@", object);
        
        DetailsModel *model = (DetailsModel *)object;
    
        self.list = model.trackList;
        
        [self.heardView setModel:model.album];
        
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
    
    return self.list.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DetailsTableViewCellIdentifier];
    [cell setModel:[self.list objectAtIndex:indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = @{@"all":self.list, @"loction":@(indexPath.row), @"curr":self.list[indexPath.row]};
   
    [[NSNotificationCenter defaultCenter] postNotificationName:@"BeginPlay" object:nil userInfo:dic];
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
        
        //tableView -> headView
        self.heardView = ({
            DetailsHeardView *heardView = [[DetailsHeardView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
            
            heardView;
        });
        
        _tableView.tableHeaderView = ({
            UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
            back.backgroundColor = [UIColor clearColor];
            [back addSubview:self.heardView];
            back;
        });
        
        //tableView -> cell
        [_tableView registerNib:[UINib nibWithNibName:@"DetailsTableViewCell" bundle:nil] forCellReuseIdentifier:DetailsTableViewCellIdentifier];
//        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableViewCellIdentifier];
    }
    return _tableView;
}


@end
