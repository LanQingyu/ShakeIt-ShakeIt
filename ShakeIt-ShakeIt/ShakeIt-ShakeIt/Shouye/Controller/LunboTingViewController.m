//
//  LunboTingViewController.m
//  ShakeIt-ShakeIt
//
//  Created by apple on 2017/12/22.
//  Copyright © 2017年 Lan's Personal Company. All rights reserved.
//

#import "Header.h"
#import "LunboTingViewController.h"
#import "YaoViewController.h"
#import "PhotoListView.h"

@interface LunboTingViewController ()<pushViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property(nonatomic, strong)PhotoListView *photoListView;
@property(nonatomic, strong)UIImagePickerController *imagePicker;
@property(nonatomic, retain)UIAlertController *alertController;
@property(nonatomic, retain)NSMutableArray *dataArray;

@end

@implementation LunboTingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"摇呗";
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(nextStep)];
    
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(nextStep)]];
    
}
-(void)nextStep
{
    YaoViewController *YVC = [YaoViewController new];
    YVC.dataArray = _dataArray;
//    [self presentViewController:YVC animated:YES completion:nil];
    [self.navigationController pushViewController:YVC animated:YES];
}
-(void)loadView
{
    [super loadView];
    [self createViews];
    [self pickerImage];
    _dataArray = [NSMutableArray array];
}
- (void)createViews
{
    
    _photoListView = [[PhotoListView alloc]initWithFrame:self.view.frame];
    _photoListView.delegate = self;
    __block LunboTingViewController *VC = self;
    void(^pushViewControllerBlock)(void) = ^(){
        [VC presentViewController:_alertController animated:YES completion:nil];
//        [VC pickerImage];
    };
    _photoListView.block = pushViewControllerBlock;
    _photoListView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_photoListView];
    
}
- (void)pickerImage
{
    _imagePicker = [UIImagePickerController new];
    _imagePicker.delegate = self;
    _alertController = [UIAlertController new];
    [_alertController addAction:[UIAlertAction actionWithTitle:@"用相机拍摄" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        _imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
        _imagePicker.allowsEditing = YES;
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }]];
    
    [_alertController addAction:[UIAlertAction actionWithTitle:@"从手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        _imagePicker.allowsEditing = YES;
        [self presentViewController:_imagePicker animated:YES completion:nil];
    }]];
    [_alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {

    }]];

}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    //成功获得相片还是视频后的回调
        //通过UIImagePickerControllerMediaType判断返回的是照片还是视频
//        NSString* type = [info objectForKey:UIImagePickerControllerMediaType];
        //获取照片的原图
//        UIImage* original = [info objectForKey:UIImagePickerControllerOriginalImage];
        //获取图片裁剪的图
//        UIImage* edit = [info objectForKey:UIImagePickerControllerEditedImage];
        //获取图片裁剪后，剩下的图
//        UIImage* crop = [info objectForKey:UIImagePickerControllerCropRect];
        //获取图片的url
//        NSURL* url = [info objectForKey:UIImagePickerControllerMediaURL];
        //获取图片的metadata数据信息
//        NSDictionary* metadata = [info objectForKey:UIImagePickerControllerMediaMetadata];
    
    UIImage *edit = [info objectForKey:UIImagePickerControllerEditedImage];
    [_dataArray addObject:edit];
    _photoListView.dataArray = _dataArray;
//    [_photoListView.dataArray addObject:edit];
    _photoListView.isReloadData = YES;
//    _imageView.image = editedImage;
    //    if ([type isEqualToString:(NSString*)kUTTypeImage]&&picker.sourceType==UIImagePickerControllerSourceTypeCamera) {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


-(void)pushViewController
{
    
}














- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
