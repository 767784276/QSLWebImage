//
//  DownloadOperation.h
//  HM仿SDWebImage
//
//  Created by administrator on 16/8/20.
//  Copyright © 2016年 qishuolei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DownloadOperation : NSOperation


+(instancetype)downloadWithURLString:(NSString *)URLString finishedBlocl:(void(^)(UIImage *image))finishedBlock;

@end
