//
//  main.m
//  OC (串讲)-KVC&&懒加载
//
//  Created by qingyun on 16/4/16.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p=[Person new];
        [p setName:@"xiaoming"];
        [p setValue:@"男" forKey:@"sex"];
//        [p setValue:@(21) forKey:@"age"];
        [p setValue:@(22) forKeyPath:@"age"];
        [p setValue:@"18787676543" forKey:@"telephone"];
        
        NSLog(@"%@,%@,%d,%@",[p valueForKey:@"name"],[p valueForKey:@"sex"],[[p valueForKey:@"age"] intValue],[p valueForKey:@"telephone"]);
        
        [p setValue:@(187) forKey:@"height"]; //如果类中没有该属性，则程序崩溃，可以重写 方法给出提示，程序就不会崩溃
        
        Car *c1=[Car new];
        [c1 setValue:@"大众" forKey:@"carName"];
        [p.car setValue:@"SA8688" forKey:@"carID"];
//        [p setValue:@(180000) forKey:@"car.carPrice"];
        [p setValue:@(180000) forKeyPath:@"car.carPrice"];
        
        NSLog(@"%@,%@,%g",[c1 valueForKey:@"carName"],[p.car valueForKey:@"carID"],[[p valueForKeyPath:@"car.carPrice"] doubleValue]);
    }
    return 0;
}
