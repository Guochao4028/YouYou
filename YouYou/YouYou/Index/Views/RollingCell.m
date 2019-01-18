//
//  RollingCell.m
//  YouYou
//
//  Created by AYLiOS on 2019/1/18.
//  Copyright © 2019 AYLiOS. All rights reserved.
//

#import "RollingCell.h"
#import "CategoryContent.h"
#import "RollingCollectionViewCell.h"
#import "Album.h"

@interface RollingCell()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong)UICollectionView *collectionView;

@end

@implementation RollingCell



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    GLog(@"%ld", self.model.list.count);
    return self.model.list.count;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RollingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    Album *album = self.model.list[indexPath.row];
    [cell setModel:album];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Album *album = self.model.list[indexPath.row];
    if ([self.delegate respondsToSelector:@selector(getRollingId:)]) {
        [self.delegate getRollingId:album.albumId];
    }
}


#pragma mark - setter / getter

-(void)setModel:(CategoryContent *)model{
    _model = model;
    [self.contentView addSubview:self.collectionView];
    
    
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = CGSizeMake(110, 142);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        CGFloat collectionViewX = 14;
        CGFloat collectionViewY = 7;
        CGFloat collectionViewW = ScreenWidth-28;
        CGFloat collectionViewH = 158-16;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(collectionViewX, collectionViewY, collectionViewW, collectionViewH) collectionViewLayout:flowLayout];
        _collectionView.bounces = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        [_collectionView registerNib:[UINib nibWithNibName:@"RollingCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    }
    return _collectionView;
}

@end
