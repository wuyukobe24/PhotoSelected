//
//  ShowImageView.h
//  图片选择器
//
//  Created by WangXueqi on 17/8/31.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowImageView : UIView
@property(nonatomic,strong)NSArray * imageArray;
- (void)reloadImageArray:(NSArray *)array;
@end
