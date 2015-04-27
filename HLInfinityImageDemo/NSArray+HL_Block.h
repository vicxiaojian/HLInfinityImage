//
//  NSArray+HL_Block.h
//  GraphKit
//
//  Created by String on 15/1/6.
//  Copyright (c) 2015年 Michal Konturek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HL_Block)

/**
 * 遍历数组中的所有对象
 */
- (void)HL_each:(void (^)(id item))block;

/**
 * 根据item获得返回对象 把返回的对象加入数组中 返回数组
 */
- (instancetype)HL_map:(id (^)(id item))block;

/**
 * 遍历数组 返回符合条件的对象
 */
- (id)HL_match:(BOOL (^)(id item))block;

/**
 * 遍历数组 每次把符合条件的和老的对象传出来 最后返回最终符合条件的对象
 *
 * @param initial 最初的结果 可以为空
 */
- (id)HL_reduce:(id (^)(id item, id result))block;
- (id)HL_reduce:(id)initial reduce:(id (^)(id item, id result))block;

/**
 * 遍历数组 每次把符合条件的对象加入数组 返回数组
 *
 */
- (instancetype)HL_select:(BOOL (^)(id item))block;

/**
 * 遍历数组 每次把符合条件的对象不加入数组 返回数组
 *
 */
- (instancetype)HL_reject:(BOOL (^)(id item))block;

/**
 * 遍历数组 所有对象都符合条件 返回YES 否则返回NO
 *
 */
- (BOOL)HL_all:(BOOL (^)(id item))block;

/**
 * 遍历数组 任何一个对象符合条件 返回YES 否则返回NO
 *
 */
- (BOOL)HL_any:(BOOL (^)(id item))block;

/**
 * 遍历数组 所有对象都不符合条件 返回YES 否则返回NO
 *
 */
- (BOOL)HL_none:(BOOL (^)(id item))block;

/**
 * 数组是否为空
 *
 */
- (BOOL)HL_empty;

/**
 * 数组中的最大值
 *
 */
- (id)HL_max;

/**
 * 数组中的最小值
 *
 */
- (id)HL_min;

/**
 * 返回数组中对象的反转序列
 *
 */
- (instancetype)HL_reverse;

/**
 在后边添加数组
 */
- (instancetype)HL_append:(NSArray *)array;

/**
 在前边添加数组
 */
- (instancetype)HL_front:(NSArray *)array;


@end
