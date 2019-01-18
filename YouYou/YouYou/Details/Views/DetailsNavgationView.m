//
//  DetailsNavgationView.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DetailsNavgationView.h"

@interface DetailsNavgationView()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *collectionImageView;

@property(nonatomic)NSInteger type;

@end

@implementation DetailsNavgationView
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self != nil) {
        [[NSBundle mainBundle] loadNibNamed:@"DetailsNavgationView" owner:self options:nil];
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
- (IBAction)back:(id)sender {
    if ([self.delegate respondsToSelector:@selector(goback)] == YES) {
        [self.delegate goback];
    }
}

- (IBAction)collection:(UIButton *)sender {
    self.type = !self.type;
    
    if (self.type) {
        [self.collectionImageView setImage:[UIImage imageNamed:@"collectioned"]];
    }else{
        [self.collectionImageView setImage:[UIImage imageNamed:@"collection"]];
    }
    
    if ([self.delegate respondsToSelector:@selector(collectionAction:)] == YES) {
        [self.delegate collectionAction:self.type];
    }
}


@end
