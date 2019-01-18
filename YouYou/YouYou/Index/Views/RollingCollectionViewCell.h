//
//  RollingCollectionViewCell.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Album;

NS_ASSUME_NONNULL_BEGIN

@interface RollingCollectionViewCell : UICollectionViewCell

@property(nonatomic, strong)Album *model;

@end

NS_ASSUME_NONNULL_END
