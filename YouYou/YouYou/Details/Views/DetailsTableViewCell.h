//
//  DetailsTableViewCell.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Track;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsTableViewCell : UITableViewCell

@property(nonatomic, strong)Track *model;

@end

NS_ASSUME_NONNULL_END
