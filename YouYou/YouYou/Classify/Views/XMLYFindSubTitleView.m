//
//  XMLYFindSubTitleView.m
//  XMLYFM
//
//  Created by East_wu on 16/8/9.
//  Copyright © 2016年 East_wu. All rights reserved.
//

#import "XMLYFindSubTitleView.h"
#import "Tag.h"


#define kSystemOriginColor [UIColor colorWithRed:0.96f green:0.39f blue:0.26f alpha:1.00f]
#define kSystemBlackColor  [UIColor colorWithRed:0.38f green:0.39f blue:0.40f alpha:1.00f]

@interface XMLYFindSubTitleView ()

/**
 *  滑块子视图
 */
@property (nonatomic, strong) UIView  *sliderView;
/**
 *  子标题按钮数组
 */
@property (nonatomic, strong) NSMutableArray    *subTitleButtonArray;

@property (nonatomic, strong) UIButton          *currentSelectedButton;

@property (nonatomic, strong)UIScrollView *scrollView;

@end

@implementation XMLYFindSubTitleView


- (instancetype)init {
    if(self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setTitleArray:(NSMutableArray<Tag *> *)titleArray {
    _titleArray = titleArray;
    [self addSubview:self.scrollView];
    [self sliderView];
    [self configSubTitles];
}


- (void)trans2ShowAtIndex:(NSInteger)index {
    if(index < 0 || index >= self.subTitleButtonArray.count) {
        return;
    }
    UIButton *btn = [self.subTitleButtonArray objectAtIndex:index];
    [self selectedAtButton:btn isFirstStart:NO];
}

- (void)configSubTitles {
    
  
    
    //1.每一个titleView的宽度
    CGFloat width = ScreenWidth / 6;// _titleArray.count;
    
     NSInteger page =  (_titleArray.count /6.0) + 0.5;
    
    [self.scrollView setContentSize:CGSizeMake(ScreenWidth * page, 0)];
    
    for(NSInteger index = 0; index < _titleArray.count; index++) {
        
        
        Tag *tag = [_titleArray objectAtIndex:index];
        
        
        NSString *title = tag.tname;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:kSystemOriginColor forState:UIControlStateSelected];
        [btn setTitleColor:kSystemBlackColor forState:UIControlStateNormal];
        [btn setTitleColor:kSystemOriginColor forState:UIControlStateHighlighted | UIControlStateSelected];
        btn.frame = CGRectMake(width * index, 0, width, 38);
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.adjustsImageWhenHighlighted = NO;
        [btn addTarget:self action:@selector(subTitleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.subTitleButtonArray addObject:btn];
        [self.scrollView addSubview:btn];
    }
    
    UIButton *firstBtn = [self.subTitleButtonArray firstObject];
    [self selectedAtButton:firstBtn isFirstStart:YES];
}


/**
 *  当前选中了某一个按钮
 */
- (void)selectedAtButton:(UIButton *)btn isFirstStart:(BOOL)first{
    btn.selected = YES;
    self.currentSelectedButton = btn;
    
    self.sliderView.frame = CGRectMake(btn.frame.origin.x + btn.frame.size.width / 2.0 - 15, CGRectGetHeight(self.scrollView.bounds)-2, 30, 2);
    
//
//    NSInteger page =  (_titleArray.count /6.0) + 0.5;
    
    NSInteger page = CGRectGetMinX(btn.frame) /ScreenWidth;
    
   
    [self.scrollView setContentOffset:CGPointMake(ScreenWidth * page, 0)];
    
    
    
    
    if(!first) {
        [UIView animateWithDuration:0.25 animations:^{
            [self layoutIfNeeded];
        }];
    }
    [self unselectedAllButton:btn];
}

/**
 *  对所有按钮颜色执行反选操作
 */
- (void)unselectedAllButton:(UIButton *)btn {
    for(UIButton *sbtn in self.subTitleButtonArray) {
        if(sbtn == btn) {
            continue;
        }
        sbtn.selected = NO;
    }
}

/**
 *  按钮点击事件回调
 */
- (void)subTitleBtnClick:(UIButton *)btn {
    if(btn == self.currentSelectedButton) {
        return;
    }
    if([self.delegate respondsToSelector:@selector(findSubTitleViewDidSelected:atIndex:title:)]) {
        [self.delegate findSubTitleViewDidSelected:self atIndex:[self.subTitleButtonArray indexOfObject:btn] title:btn.titleLabel.text];
    }
    [self selectedAtButton:btn isFirstStart:NO];
}


#pragma mark - getter

- (NSMutableArray *)subTitleButtonArray {
    if(!_subTitleButtonArray) {
        _subTitleButtonArray = [[NSMutableArray alloc] init];
    }
    return _subTitleButtonArray;
}

/**
 *  下方的滑块
 */
- (UIView *)sliderView {
    if(!_sliderView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(5, CGRectGetHeight(self.scrollView.bounds)-2, 30, 2)];
        view.backgroundColor = kSystemOriginColor;
        [self.scrollView addSubview:view];
        _sliderView = view;
    }
    return _sliderView;
}


-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.showsVerticalScrollIndicator = NO;
        
        _scrollView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollView;
}


@end
