//
//  AddImageViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/20.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "AddImageViewController.h"
#import "Header.h"

@interface AddImageViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property(nonatomic, retain)UIImageView *imageView;
@property(nonatomic, retain)UIButton *addButton;
@property(nonatomic, strong)UIImagePickerController *imagePicker;

@end

@implementation AddImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"登录页面";
}
-(void)loadView
{
    [super loadView];
    [self addButtonFunction];
    _imageView = [UIImageView new];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imageView];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-50);
        make.top.equalTo(self.view).with.offset(20);
        make.height.equalTo(@400);
    }];
    
    
    
    
}
-(void)addButtonFunction
{
    
    _addButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_addButton setTitle:@"添加" forState:UIControlStateNormal];
    _addButton.titleLabel.font = [UIFont systemFontOfSize:25];
    _addButton.backgroundColor = [UIColor redColor];
    [_addButton addTarget:self action:@selector(pickerImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addButton];
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).with.offset(-50);
        make.left.equalTo(self.view).with.offset(50);
        make.right.equalTo(self.view).with.offset(-50);
//        make.bottom.equalTo(addButton.mas_top).with.offset(-50);
        make.height.equalTo(@50);
    }];
    
}

- (void)pickerImage:(UIButton *)button
{
    _imagePicker = [UIImagePickerController new];
    _imagePicker.delegate = self;
    UIAlertController *alert = [UIAlertController new];
    [alert addAction:[UIAlertAction actionWithTitle:@"用相机拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
        _imagePicker.allowsEditing = YES;
        [self presentViewController:_imagePicker animated:YES completion:nil];

    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _imagePicker.allowsEditing = YES;
        
         [self presentViewController:_imagePicker animated:YES completion:nil];
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

// 操作完成
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //    UIImagePickerControllerCropRect // 裁剪尺寸
    //    UIImagePickerControllerEditedImage // 编辑后图片
    //    UIImagePickerControllerMediaURL // 媒体的URL
    //    UIImagePickerControllerMediaType // 媒体类型（kUTTypeImage、kUTTypeMovie等）
    //    UIImagePickerControllerOriginalImage // 原始图片
    //    UIImagePickerControllerReferenceURL // 引用相册的URL
    //    UIImagePickerControllerMediaMetadata // 拍照的元数据
    //    UIImagePickerControllerLivePhoto // PHLivePhoto
    
//    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    _imageView.image = editedImage;

    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 操作取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




@end
