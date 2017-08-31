//
//  ShowImageView.m
//  图片选择器
//
//  Created by WangXueqi on 17/8/31.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ShowImageView.h"
#import "ImageCollectionViewCell.h"

// 当前屏幕宽
//#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])
// 当前屏幕高
//#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])
#define k_itemNum       3
static NSString * imageCollectionId = @"imageCollectionId";

@interface ShowImageView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView * imageCollectionView;

@end

@implementation ShowImageView

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageCollectionView];
    }
    return self;
}

- (UICollectionView *)imageCollectionView {
    
    if (!_imageCollectionView) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.itemSize = CGSizeMake((self.frame.size.width-50)/k_itemNum, (self.frame.size.width-50)/k_itemNum);//每个cell大小
        
        _imageCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(10, 0, self.frame.size.width-20, self.frame.size.height-72) collectionViewLayout:flowLayout];
        _imageCollectionView.delegate = self;
        _imageCollectionView.dataSource = self;
        _imageCollectionView.backgroundColor = [UIColor whiteColor];
        [_imageCollectionView setScrollEnabled:NO];
        
        [_imageCollectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:imageCollectionId];
    }
    return _imageCollectionView;
}

- (void)reloadImageArray:(NSArray *)array {

    _imageArray = [NSArray arrayWithArray:array];
    [self.imageCollectionView reloadData];
}

#pragma mark - UICollectionviewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:imageCollectionId forIndexPath:indexPath];
    [cell getSelectImage:_imageArray[indexPath.row]];
    
    return cell;
}

@end
