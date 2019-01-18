//
//  CellHeaderView.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "CellHeaderView.h"


@interface CellHeaderView()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *tagButton;
@property (weak, nonatomic) IBOutlet UIButton *eButtton;

@end

@implementation CellHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"CellHeaderView" owner:self options:nil];
        self.backgroundColor = [UIColor clearColor];
        [self initUI];
    }
    return self;
}


-(void)initUI{
    [self.contentView setFrame:self.bounds];
    [self addSubview:self.contentView];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self.contentView setFrame:self.bounds];
}

-(void)noEntry{
    [self.tagButton setHidden:YES];
    [self.eButtton setUserInteractionEnabled:NO];
}

- (IBAction)tagAction:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tagAction)] == YES) {
        [self.delegate tagAction];
    }
}

-(void)setTitle:(NSString *)title{
    _title = title;
    [self.titleLabel setText:title];
}

@end
