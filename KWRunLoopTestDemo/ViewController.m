//
//  ViewController.m
//  KWRunLoopTestDemo
//
//  Created by 吴婷婷 on 2017/11/24.
//  Copyright © 2017年 wutingting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self creatObserver];
}


- (void)creatObserver {
    //7.CFRunLoopObserverRef
    /*
     1.即将进入RunLoop
     2.即将处理NSTimer
     4.即将处理Source
     32.即将进入休眠
     64.刚从休眠中唤醒
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"--------%zd", activity);
    });
    
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);  // 添加监听者
    CFRelease(observer); // 释放
    
}

- (IBAction)didClickBtn:(id)sender {
    
    /* 1.打印中包含信息：kCFRunLoopDefaultMode，UITrackingRunLoopMode，CFRunLoopSource，CFRunLoopObserver，timers*/
//    NSLog(@"----%@",[NSRunLoop currentRunLoop]);
    
    //2.已经将timer自动加入到了一个运行模式为kCFRunLoopDefaultMode的runloop中
//    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    
    //3.手动将timer添加进去
    //4.Timer与TextView同时运行,textview滚动时timer不打印
    
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //5.将Timer添加到commonModes中,textview滚动时timer也会打印
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //6.CFRunLoopSourseRef
    
    

}

- (void)timerTest
{
    NSLog(@"timerTest----");
}

@end
