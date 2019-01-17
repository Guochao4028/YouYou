//
//  YYData.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/17.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Tag, CategoryContent;

NS_ASSUME_NONNULL_BEGIN

@interface YYData : NSObject

@property(nonatomic, strong)NSArray <Tag *>*tagsList;

@property(nonatomic, strong)NSArray <CategoryContent *>*categoryContentsList;

+(YYData*) shareInstance;

@end

NS_ASSUME_NONNULL_END
