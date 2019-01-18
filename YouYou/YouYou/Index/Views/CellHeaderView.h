//
//  CellHeaderView.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@protocol CellHeaderViewDelegate <NSObject>
@optional

-(void)tagAction;

@end

@interface CellHeaderView : UIView

@property(nonatomic, weak)id<CellHeaderViewDelegate>delegate;

@property(nonatomic, strong)NSString *title;

-(void)noEntry;

@end

NS_ASSUME_NONNULL_END
