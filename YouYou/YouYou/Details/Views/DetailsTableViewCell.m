//
//  DetailsTableViewCell.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "DetailsTableViewCell.h"
#import "Track.h"

@interface DetailsTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;


@end

@implementation DetailsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(Track *)model{
    /*
     @property (weak, nonatomic) IBOutlet UILabel *titleLabel;
     @property (weak, nonatomic) IBOutlet UILabel *nameLabel;
     @property (weak, nonatomic) IBOutlet UILabel *timeLabel;
     */
    [self.titleLabel setText:model.title];
    [self.nameLabel setText:model.nickname];
    
    NSTimeInterval duration = [model.duration integerValue];
    // 分
    NSInteger minutes = duration/60;
    // 秒
    NSInteger seconds = (NSInteger)duration%60;
    
 
    [self.timeLabel setText:[NSString stringWithFormat:@"%02ld:%02ld",minutes,seconds]];
}

@end
