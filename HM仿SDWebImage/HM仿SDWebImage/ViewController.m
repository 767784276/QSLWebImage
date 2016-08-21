//
//  ViewController.m
//  HM仿SDWebImage
//
//  Created by administrator on 16/8/20.
//  Copyright © 2016年 qishuolei. All rights reserved.
//

#import "ViewController.h"
#import "DownloadOperation.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSOperationQueue *_queue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 实例化队列
    _queue = [[NSOperationQueue alloc]init];
    
    NSString *URLString = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    
    // 类方法创建操作的同时传入图片地址和下载完成的回调
    DownloadOperation *op = [DownloadOperation downloadWithURLString:URLString finishedBlocl:^(UIImage *image) {
        
        // 赋值操作
        NSLog(@"%@  %@",image, [NSThread currentThread]);
    }];
    
    // 添加到队列
    [_queue addOperation:op];
}

#pragma mark - 对象方法操作
-(void)demo
{
    _queue = [[NSOperationQueue alloc] init];
    
    DownloadOperation *op = [[DownloadOperation alloc]init];
/*
    // 想自定义操作的内部传入图片地址
    op.URLString = @"http://img2.3lian.com/2014/c7/12/d/77.jpg";
    // 传入代码块到自定义操作对象
    [op setFinishedBlock:^(UIImage *image) {
        
        // 赋值操作
        NSLog(@"%@ %@",image,[NSThread currentThread]);
    }];
 */
    
    [_queue addOperation:op];
}



@end
