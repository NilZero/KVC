//
//  Person.m
//  OC (串讲)-KVC&&懒加载
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "Person.h"

@interface Person ()
{
    NSString *_telephone;
}
@property(copy,nonatomic)NSString *sex;
@end
@implementation Person
//如果外部设置了未被定义的属性，则必须重写下面方法，否则程序崩溃
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"未被定义的key-->%@",key);
}
//懒加载  就是getter方法
//其他地方调用（XXXX.car）的时候自动走此方法进行初始化
-(Car *)car
{
    if (!_car)
    {
        _car=[Car new];
    }
    return _car;
}
@end
