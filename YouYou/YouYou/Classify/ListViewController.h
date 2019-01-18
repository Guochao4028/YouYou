//
//  ListViewController.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/19.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "BaseViewController.h"


@class Tag;

NS_ASSUME_NONNULL_BEGIN

@interface ListViewController : BaseViewController

@property(nonatomic, strong)Tag *model;

@end

NS_ASSUME_NONNULL_END
