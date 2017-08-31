//
//  ImageCollectionViewCell.m
//  图片删除
//
//  Created by WangXueqi on 17/8/28.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ImageCollectionViewCell.h"
#import <UIImageView+WebCache.h>

// 当前屏幕宽
#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])
// 当前屏幕高
#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])
#define k_itemNum       3
@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if (!_selectImage) {
            _selectImage = [[UIImageView alloc]init];
            _selectImage.layer.cornerRadius = 5;
            _selectImage.layer.masksToBounds = YES;
            [self addSubview:_selectImage];
        }
    }
    return self;
}

- (void)getSelectImage:(UIImage *)image {

    CGFloat W = (K_ScreenWidth-50)/k_itemNum;
    [_selectImage setImage:[self image:image changeTosize:CGSizeMake(W, W)]];
}

- (UIImage *)image:(UIImage *)image changeTosize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat W = (K_ScreenWidth-50)/k_itemNum;
    _selectImage.frame = CGRectMake(0, 0, W, W);
}

@end
