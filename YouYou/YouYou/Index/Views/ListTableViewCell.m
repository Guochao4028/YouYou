//
//  ListTableViewCell.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "ListTableViewCell.h"
#import "Album.h"
#import "UIImageView+WebCache.h"

@interface ListTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *intro;
@property (weak, nonatomic) IBOutlet UIImageView *albumCover;
@property (weak, nonatomic) IBOutlet UIImageView *albumCoverUrl290;

@end

@implementation ListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.albumCoverUrl290.layer setMasksToBounds:YES];
    self.albumCoverUrl290.layer.cornerRadius = 25 / 2;
    [self.albumCover.layer setMasksToBounds:YES];
    self.albumCover.layer.cornerRadius = 8;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(Album *)model{
    
    [self.nickNameLabel setText:model.nickname];
    [self.title setText:model.title];
    [self.intro setText:model.intro];
    [self.albumCover sd_setImageWithURL:[NSURL URLWithString:model.coverSmall]];
    [self.albumCoverUrl290 sd_setImageWithURL:[NSURL URLWithString:model.albumCoverUrl290]];
    
}

@end
