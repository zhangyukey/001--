//
//  ViewController.m
//  001-逆波兰表达式求值
//
//  Created by 张乾坤 on 2019/10/15.
//  Copyright © 2019 张乾坤. All rights reserved.
//

#import "ViewController.h"
#import "ZYStack.h"
@interface ViewController ()

@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) ZYStack *stack;



@end

@implementation ViewController


- (NSMutableArray *)dataSource{
    
    if (_dataSource == nil) {
        
        self.dataSource = [NSMutableArray arrayWithObjects:@"2",@"3",@"*",@"4",@"+", nil];
    }
    
    return _dataSource;
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    NSString *str = [self tokens];
    
    NSLog(@"-----------%@",str);

}



- (BOOL)isOperator:(NSString *)token{

    NSString *regex = @"+-*/";//规定的特殊字符，可以自己随意添加
    
    //计算字符串长度
    NSInteger str_length = [token length];
    
    NSInteger allIndex = 0;
    for (int i = 0; i<str_length; i++) {
        //取出i
        NSString *subStr = [token substringWithRange:NSMakeRange(i, 1)];
        if([regex rangeOfString:subStr].location != NSNotFound)
        {  //存在
            allIndex++;
        }
    }
    
    if (str_length == allIndex) {
        //纯特殊字符
        return YES;
    }
    else
    {
        //非纯特殊字符
        return NO;
    }
    




}


- (NSInteger)calculateLeft:(NSString *)left right:(NSString *)right operator:(NSString *)operator{
    
    if ([operator isEqualToString:@"+"]) {
        
        return  [left integerValue] + [right integerValue];
        
    }else if ([operator isEqualToString:@"-"]){
        
        return [left integerValue] - [right integerValue];
        
    }else if ([operator isEqualToString:@"*"]){
        
        return [left integerValue] * [right integerValue];
        
    }else{
        
        return [left integerValue] / [right integerValue];
    }
    

    
}



- (NSString *)tokens{
    
    self.stack = [ZYStack new];

    for (NSString *str  in self.dataSource) {
        
        if ([self isOperator:str]) {
            NSString *oneStr = self.stack.popObj;
            NSString *twoStr = self.stack.popObj;
            
            NSLog(@"=========%@ %@",oneStr,twoStr);
            
            
            [self.stack push:[NSString stringWithFormat:@"%ld",[self calculateLeft:oneStr right:twoStr operator:str]]];

        }else{
            
            NSLog(@"*********************%@",str);
            
            [self.stack push:str];

        }
  
       }

    return self.stack.popObj;
    
}










@end
