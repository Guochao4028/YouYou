//
//  DetailsViewController.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "BaseViewController.h"

@class  Album;

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : BaseViewController

@property(nonatomic, strong)Album *model;

@end

NS_ASSUME_NONNULL_END
