//
//  RootViewController.m
//  PartTime
//
//  Created by AYLiOS on 2018/12/29.
//  Copyright © 2018 AYLiOS. All rights reserved.
//

#import "RootViewController.h"
#import "BaseViewController.h"
#import "SetupViewController.h"
#import "RemindViewController.h"
#import "ClassifyViewController.h"
#import "IndexViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTabbar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playingWithInfoDictionary:) name:@"BeginPlay" object:nil];
    
}

-(void)playingWithInfoDictionary:(NSNotificationCenter *)fit{
    
//    PlayViewController *vc = [[PlayViewController alloc]init];
//    
//    [self presentModalViewController:vc animated:YES];

}

#pragma mark - private
//初始化tabbar
-(void)initTabbar{
    UINavigationController *indexNav = [self p_SetTabBarItem:[[IndexViewController alloc]init] withViewControllerTitle:@"推荐" image:[UIImage imageNamed:@"tuijian_uselectes"] selectImage:[UIImage imageNamed:@"tuijian_selectes"]];
    
    UINavigationController *classifyNav = [self p_SetTabBarItem:[[ClassifyViewController alloc] init] withViewControllerTitle:@"分类" image:[UIImage imageNamed:@"leimupinleifenleileibie2_uselectes"] selectImage:[UIImage imageNamed:@"leimupinleifenleileibie2_selectes"]];
    
    UINavigationController *remindNav = [self p_SetTabBarItem:[[RemindViewController alloc] init] withViewControllerTitle:@"提醒" image:[UIImage imageNamed:@"tixing_uselectes"] selectImage:[UIImage imageNamed:@"tixing_selectes"]];
    
    UINavigationController *setupNav = [self p_SetTabBarItem:[[SetupViewController alloc] init] withViewControllerTitle:@"设置" image:[UIImage imageNamed:@"icon_set_up_uselectes"] selectImage:[UIImage imageNamed:@"icon_set_up_selectes"]];
    
    self.viewControllers = @[indexNav, classifyNav, remindNav, setupNav];
}
//生成NavigationController
-(UINavigationController *)p_SetTabBarItem:(BaseViewController *)vc withViewControllerTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage{
    [vc setTitle:title];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [selectImage  imageWithRenderingMode:UIImageRenderingModeAutomatic];
    UITabBarItem *tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:image selectedImage:selectImage];
    nav.tabBarItem = tabBarItem;
    return nav;
}


@end
