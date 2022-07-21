//
//  DCBlock1ViewController.m
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/21.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import "DCBlock1ViewController.h"

typedef void (^RequestResult)(BOOL result);

@interface DCBlock1ViewController ()

@end

@implementation DCBlock1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     https://www.jianshu.com/p/660566e21e3a
    
     代码规范:
     
     // 定义一个 Block
     typedef returnType (^BlockName)(parameterA, parameterB, ...);

     eg: typedef void (^RequestResult)(BOOL result);

     // 实例
     ^{
         NSLog(@"This is a block");
      }
     
     本质:
     
     Block 本质上是一个 Objective-C 的对象，它内部也有一个 isa 指针，它是一个封装了函数及函数调用环境的 Objective-C 对象，可以添加到 NSArray 及 NSDictionary 等集合中，它是基于 C 语言及运行时特性，有点类似标准的 C 函数。但除了可执行代码以外，另外包含了变量同堆或栈的自动绑定。

 
     Block 的类型：
     NSGlobalBlock  NSStackBlock    NSMallocBlock
     
     */
    
//    void()
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
