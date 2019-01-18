//
//  RollingCollectionViewCell.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "RollingCollectionViewCell.h"
#import "Album.h"
#import "UIImageView+WebCache.h"

@interface RollingCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation RollingCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(Album *)model{

    [self.titleLabel setText:model.title];
    [self.logoImageView sd_setImageWithURL:[NSURL URLWithString:model.albumCoverUrl290]];
}

@end
