//
//  RHSessionViewController.h
//  IMSample--网易云信
//
//  Created by zero on 2017/3/16.
//  Copyright © 2017年 zero-zhou. All rights reserved.
//

#import <NIMKit/NIMKit.h>

@interface RHSessionViewController : NIMSessionViewController
@property (nonatomic,assign) BOOL disableCommandTyping;  //需要在导航条上显示“正在输入”

@end
