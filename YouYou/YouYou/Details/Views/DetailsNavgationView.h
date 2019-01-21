//
//  DetailsNavgationView.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DetailsNavgationViewDelegate <NSObject>
@optional

-(void)goback;

-(void)collectionAction:(NSInteger)type;

@end

@interface DetailsNavgationView : UIView
@property(nonatomic, weak)id<DetailsNavgationViewDelegate>delegate;
@property(nonatomic, strong)NSString *titleString;

-(void)collectionColor:(BOOL)type;
@end

NS_ASSUME_NONNULL_END
