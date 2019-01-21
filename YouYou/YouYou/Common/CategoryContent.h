//
//  CategoryContent.h
//  YouYou
//
//  Created by AYLiOS on 2019/1/17.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Album;

NS_ASSUME_NONNULL_BEGIN

@interface CategoryContent : NSObject<NSCoding>


@property(nonatomic, strong)NSString *moduleType;
@property(nonatomic, strong)NSString *calcDimension;
@property(nonatomic, strong)NSString *tagName;
@property(nonatomic, strong)NSString *contentType;
@property(nonatomic, strong)NSString *keywordId;
@property(nonatomic, strong)NSString *keywordName;
@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)NSString *hasMore;
@property(nonatomic, strong)NSArray <Album *>*list;

@end

NS_ASSUME_NONNULL_END
