//
//  ViewController.m
//  图片选择器
//
//  Created by WangXueqi on 17/8/31.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "TZImagePickerController.h"
#import "TZImageManager.h"
#import "ShowImageView.h"

#define K_ScreenWidth   CGRectGetWidth([[UIScreen mainScreen] bounds])// 当前屏幕宽
#define K_ScreenHeight  CGRectGetHeight([[UIScreen mainScreen] bounds])// 当前屏幕高
static NSString * imageCollectionId = @"imageCollectionId";
@interface ViewController ()<TZImagePickerControllerDelegate>
@property (strong, nonatomic) TZImagePickerController *imagePickerVc;
@property(nonatomic,strong)UIButton * button;
@property(nonatomic,strong)UIBarButtonItem * selectItem;
@property(nonatomic,strong)ShowImageView * imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.selectItem;
    [self.view addSubview:self.button];
    [self.view addSubview:self.imageView];
}

- (TZImagePickerController *)imagePickerVc
{
    if (_imagePickerVc == nil) {
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:3 delegate:nil pushPhotoPickerVc:YES];
        
        imagePickerVc.isSelectOriginalPhoto = YES;
        imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
        imagePickerVc.allowPickingVideo = NO;
        imagePickerVc.allowPickingImage = YES;
        imagePickerVc.allowPickingOriginalPhoto = NO;
        imagePickerVc.allowPickingGif = NO;
        // 4. 照片排列按修改时间升序
        imagePickerVc.sortAscendingByModificationDate = YES;
        imagePickerVc.showSelectBtn = NO;
        imagePickerVc.allowCrop = NO;
        imagePickerVc.needCircleCrop = NO;
        imagePickerVc.circleCropRadius = 100;
        imagePickerVc.isStatusBarDefault = NO;
        
        _imagePickerVc = imagePickerVc;
    }
    return _imagePickerVc;
}

- (UIBarButtonItem *)selectItem {

    if (!_selectItem) {
        _selectItem = [[UIBarButtonItem alloc]initWithTitle:@"选择图片" style:UIBarButtonItemStyleDone target:self action:@selector(buttonClick)];
    }
    return _selectItem;
}

- (UIButton *)button {

    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:CGRectMake(0, 64, 150, 50)];
        [_button setCenter:self.view.center];
        [_button setHidden:YES];
        [_button setTitle:@"点击选择图片" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_button setBackgroundColor:[UIColor redColor]];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (ShowImageView *)imageView {

    if (!_imageView ) {
        _imageView = [[ShowImageView alloc]initWithFrame:CGRectMake(0, 72, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-72)];
    }
    return _imageView;
}

- (void)buttonClick {

    // 你可以通过block或者代理，来得到用户选择的照片.
    __weak typeof(self) weakSelf = self;
    [self.imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        NSLog(@"photos == %@ assets == %@",photos,assets);
        [weakSelf.imageView reloadImageArray:photos];
    }];
    
    self.imagePickerVc.selectedAssets = nil;
    [self presentViewController:self.imagePickerVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
