//
//  DetailsHeardView.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DetailsHeardView.h"
#import "Album.h"
#import "UIImageView+WebCache.h"

@interface DetailsHeardView()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titelLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;


@property(nonatomic)NSInteger type;

@end
@implementation DetailsHeardView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"DetailsHeardView" owner:self options:nil];
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

-(void)setModel:(Album *)model{    
    [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:model.coverSmall]];
    [self.nameLabel setText:model.nickname];
    [self.titelLabel setText:model.title];
    [self.descLabel setText:model.customSubTitle];
}

@end
