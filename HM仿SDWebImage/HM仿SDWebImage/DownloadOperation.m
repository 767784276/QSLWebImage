//
//  DownloadOperation.m
//  HM仿SDWebImage
//
//  Created by administrator on 16/8/20.
//  Copyright © 2016年 qishuolei. All rights reserved.
//

#import "DownloadOperation.h"


@interface DownloadOperation ()
// 接受控制器传入的图片地址
@property(copy, nonatomic) NSString *URLString;

// 接受控制器传入的下载完成的回调
@property(copy, nonatomic) void(^finishedBlock)(UIImage *image);

@end
@implementation DownloadOperation



// 重写自定义操作的入口方法
-(void)main
{
    // 下载图片
    NSURL *url = [NSURL URLWithString:self.URLString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    // 断言
    NSAssert(self.finishedBlock != nil, @"下载完成的回调不能为空");
    
    
    // 把图片传入到VC
    // 需要在主线程 把图片对象传递到控制器
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        
        self.finishedBlock(image);
    }];
}

+(instancetype)downloadWithURLString:(NSString *)URLString finishedBlocl:(void (^)(UIImage *))finishedBlock
{
    // 创建自定义操作
    DownloadOperation *op = [[self alloc]init];
    
    // 记录完结传入的图片地址和下载完成的回调
    op.URLString = URLString;
    op.finishedBlock = finishedBlock;
    
    return op;
}



@end
