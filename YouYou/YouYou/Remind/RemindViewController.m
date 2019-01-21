//
//  RemindViewController.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/15.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "RemindViewController.h"

#import "HomeViewController.h"

@interface RemindViewController ()

@end

@implementation RemindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStoryboard *firstSB = [UIStoryboard storyboardWithName:@"First" bundle:nil];
    HomeViewController *viewC =[firstSB instantiateViewControllerWithIdentifier:@"first-nav"];
    [self addChildViewController:viewC];
    [self.view addSubview:viewC.view];
    [viewC.view setFrame:self.view.bounds];
}


-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
    [super viewWillAppear:animated];
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
