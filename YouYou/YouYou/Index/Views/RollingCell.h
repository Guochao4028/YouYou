//
//  RollingCell.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CategoryContent;

NS_ASSUME_NONNULL_BEGIN

@interface RollingCell : UITableViewCell

@property(nonatomic, strong)CategoryContent *model;

@end

NS_ASSUME_NONNULL_END
