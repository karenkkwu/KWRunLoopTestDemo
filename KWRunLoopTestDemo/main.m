//
//  main.m
//  KWRunLoopTestDemo
//
//  Created by 吴婷婷 on 2017/11/24.
//  Copyright © 2017年 wutingting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        //函数内部已经启动了一个runloop，始终在循环，没有返回，无法执行到NSLog代码。
        int res = UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        
        NSLog(@"--end--");
        
        return res;
    }
}
