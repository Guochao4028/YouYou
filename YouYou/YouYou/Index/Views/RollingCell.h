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

@protocol RollingCellDelegate <NSObject>
@optional
-(void)getRollingId:(NSString *)aid;
@end

@interface RollingCell : UITableViewCell

@property(nonatomic, strong)CategoryContent *model;

@property(nonatomic, weak)id<RollingCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
