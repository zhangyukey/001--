//
//  ZYStack.h
//  001-逆波兰表达式求值
//
//  Created by 张乾坤 on 2019/10/15.
//  Copyright © 2019 张乾坤. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 定义block
 @param obj 回调值
 */
typedef void(^StackBlock)(id obj);



@interface ZYStack : NSObject


//初始化操作
- (instancetype)initWithNumbers:(NSArray *)numbers;

/**入栈 @param obj 指定入栈对象*/
- (void)push:(id)obj;

/**出栈*/
- (id)popObj;

/**是否为空*/
- (BOOL)isEmpty;

/**栈的长度*/
- (NSInteger)stackLength;

/**从栈底开始遍历 @param block 回调遍历的结果*/
- (void)enumerateObjectsFromBottom:(StackBlock)block;

/**从顶部开始遍历*/
- (void)enumerateObjectsFromTop:(StackBlock)block;

/**所有元素出栈，一边出栈，一边返回元素*/
- (void)enumerateObjectsPopStack:(StackBlock)block;

/**清空*/
- (void)removeAllObjects;

/**返回栈顶元素*/
- (id)topObj;










@end

NS_ASSUME_NONNULL_END
