//
//  ZYStack.m
//  001-逆波兰表达式求值
//
//  Created by 张乾坤 on 2019/10/15.
//  Copyright © 2019 张乾坤. All rights reserved.
//

#import "ZYStack.h"

@interface ZYStack ()

@property (nonatomic,strong) NSMutableArray *stackArray;


@end


@implementation ZYStack

- (NSMutableArray *)stackArray{
    
    if (_stackArray == nil) {
        
        self.stackArray = [NSMutableArray array];
    }
    
    return _stackArray;
}

- (instancetype)initWithNumbers:(NSArray *)numbers{
    
    if (self = [super init]) {
        
        for (NSNumber *number in numbers) {
            
            [self.stackArray addObject:number];
        }
        
        
    }
    
    return self;
    
}

- (void)push:(id)obj{
    
    [self.stackArray addObject:obj];
    
}

- (id)popObj{
    
    if ([self isEmpty]) {
        
        return nil;
        
    }else{
        
        id lastObject = self.stackArray.lastObject;
        
        [self.stackArray removeLastObject];
        
        return lastObject;
    }
    
    
    
    
}


- (id)topObj{
    
    if ([self isEmpty]) {
        
        return nil;
        
    }else{
        
        return self.stackArray.lastObject;
    }
    
}


- (BOOL)isEmpty{
    
    return !self.stackArray.count;
    
}


- (NSInteger)stackLength{
    
    return self.stackArray.count;
    
}


#pragma mark -- 遍历

//从栈底开始遍历
- (void)enumerateObjectsFromBottom:(StackBlock)block{
    
    [self.stackArray enumerateObjectsWithOptions:(NSEnumerationConcurrent) usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        block ? block(obj):nil;
    }];
    
}


//从顶部开始遍历
- (void)enumerateObjectsFromTop:(StackBlock)block{
    
    [self.stackArray enumerateObjectsWithOptions:(NSEnumerationReverse) usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        block ? block(obj):nil;
        
        
    }];
    
    
}


//所有元素出栈，一边出栈一边返回元素
- (void)enumerateObjectsPopStack:(StackBlock)block{
    
    __weak typeof(self) weakSelf = self;
    
    NSInteger count = self.stackArray.count;
    
    for (NSUInteger i = count; i > 0; i --) {
        
        if (block) {
            block(weakSelf.stackArray.lastObject);
            [self.stackArray removeLastObject];
        }
        
    }
    
}


- (void)removeAllObjects{
    
    [self.stackArray removeAllObjects];
    
}






















@end
