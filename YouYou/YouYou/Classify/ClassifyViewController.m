//
//  ClassifyViewController.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/15.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ClassifyViewController.h"
#import "XMLYFindSubTitleView.h"
#import "Tag.h"

#import "ListViewController.h"

@interface ClassifyViewController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource,XMLYFindSubTitleViewDelegate>



@property (strong, nonatomic)XMLYFindSubTitleView *subTitleView;

@property (nonatomic, strong) NSMutableArray     *subTitleArray;

@property (nonatomic, strong) NSMutableArray     *controllers;

@property (nonatomic, weak) UIPageViewController *pageViewController;

@end

@implementation ClassifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.subTitleView.delegate = self;
    self.subTitleView.titleArray = self.subTitleArray;
    
    CGFloat tabelViewH = ScreenHeight - (SafeAreaBottomHeight + TabBarHeight + NavigatorHeight);
    
    [self.view addSubview:self.subTitleView];
    [self.pageViewController.view setFrame:CGRectMake(0, CGRectGetMaxY(self.subTitleView.frame), ScreenWidth, tabelViewH)];
}

#pragma mark - XMLYFindSubTitleViewDelegate
- (void)findSubTitleViewDidSelected:(XMLYFindSubTitleView *)titleView atIndex:(NSInteger)index title:(NSString *)title {
    [self.pageViewController setViewControllers:@[[self.controllers objectAtIndex:index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark - UIPageViewControllerDelegate/UIPageViewControllerDataSource

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self indexForViewController:viewController];
    if(index == 0 || index == NSNotFound) {
        return nil;
    }
    return [self.controllers objectAtIndex:index - 1];
}

- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self indexForViewController:viewController];
    if(index == NSNotFound || index == self.controllers.count - 1) {
        return nil;
    }
    return [self.controllers objectAtIndex:index + 1];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    return self.controllers.count;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {
    UIViewController *viewController = self.pageViewController.viewControllers[0];
    NSUInteger index = [self indexForViewController:viewController];
    [self.subTitleView trans2ShowAtIndex:index];
}

#pragma mark - private

- (NSInteger)indexForViewController:(UIViewController *)controller {
    return [self.controllers indexOfObject:controller];
}

#pragma mark - getter

- (UIPageViewController *)pageViewController {
    if(!_pageViewController) {
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey:UIPageViewControllerOptionSpineLocationKey];
        UIPageViewController *page = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        page.delegate = self;
        page.dataSource = self;
        [page setViewControllers:@[[self.controllers firstObject]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        [self addChildViewController:page];
        [self.view addSubview:page.view];
        _pageViewController = page;
    }
    return _pageViewController;
}

- (NSMutableArray *)controllers {
    if(!_controllers) {
        _controllers = [[NSMutableArray alloc] init];
        for(Tag *tm in self.subTitleArray) {
            ListViewController *con = [[ListViewController alloc]init];
            [con setModel:tm];
            [_controllers addObject:con];
        }
    }
    return _controllers;
}

- (NSMutableArray *)subTitleArray {
    if(!_subTitleArray) {
        
        YYData *data = [YYData shareInstance];
        
        _subTitleArray = [NSMutableArray arrayWithArray:data.tagsList];
    }
    return _subTitleArray;
}

-(XMLYFindSubTitleView *)subTitleView{
    if (!_subTitleView) {
        _subTitleView = [[XMLYFindSubTitleView alloc]initWithFrame:CGRectMake(0, NavigatorHeight, ScreenWidth, 44)];
    }
    return _subTitleView;
}

@end
