//
//  NSArray+HL_Block.m
//  GraphKit
//
//  Created by String on 15/1/6.
//  Copyright (c) 2015年 Michal Konturek. All rights reserved.
//

#import "NSArray+HL_Block.h"

@implementation NSArray (HL_Block)

- (void)HL_each:(void (^)(id))block {
    if (!block) return;
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        block(obj);
    }];
}

- (instancetype)HL_map:(id (^)(id))block {
    if (!block) return nil;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSValue *value = block(obj) ? : [NSNull null];
        [array addObject:value];
    }];
    return array;
}

- (id)HL_match:(BOOL (^)(id))block {
    if (!block) return nil;
    
    __block id result;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (block(obj)) {
            result = obj;
            *stop = YES;
        }
    }];
    return result;
}

- (id)HL_reduce:(id (^)(id, id))block {
    return [self HL_reduce:nil reduce:block];
}

- (id)HL_reduce:(id)initial reduce:(id (^)(id, id))block {
    if (!block) return nil;
    
    __block id result = initial;
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (!result) result = obj;
        else result = block(obj, result);
    }];
    return result;
}

- (instancetype)HL_reject:(BOOL (^)(id))block {
    return [self HL_select:^BOOL(id item) {
        return !block(item);
    }];
}

- (instancetype)HL_select:(BOOL (^)(id))block {
    if (!block) return nil;
    
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.count];
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (block(obj)) [result addObject:obj];
    }];
    return result;
}

- (BOOL)HL_all:(BOOL (^)(id))block {
    if (!block) return YES;
    
    for (id item in self) {
        if (!block(item)) return NO;
    }
    return YES;
}

- (BOOL)HL_any:(BOOL (^)(id))block {
    if (!block) return nil;
    
    for (id item in self) {
        if (block(item)) return YES;
    }
    return NO;
}

- (BOOL)HL_none:(BOOL (^)(id))block {
    return [self HL_any:^BOOL(id item) {
        return !block(item);
    }];
}

- (BOOL)HL_empty {
    return self.count == 0;
}

- (id)HL_max {
    if ([self HL_empty]) return [NSDecimalNumber zero];
    
    return [self HL_reduce:^id(id item, id result) {
        return [item compare:result] == NSOrderedAscending ? result : item;
    }];
}

- (id)HL_min {
    if ([self HL_empty]) return [NSDecimalNumber zero];

    return [self HL_reduce:^id(id item, id result) {
        return [item compare:result] == NSOrderedAscending ? item : result;
    }];
}

- (instancetype)HL_reverse {
    return [[self.reverseObjectEnumerator allObjects] mutableCopy];
}

- (instancetype)HL_append:(NSArray *)array {
    if (!array) {
        return self;
    }
    NSMutableArray *result = [NSMutableArray arrayWithArray:self];
    [result addObjectsFromArray:array];
    return result;
}

- (instancetype)HL_front:(NSArray *)array {
    if (!array) {
        return self;
    }
    NSMutableArray *result = [NSMutableArray arrayWithArray:array];
    [result addObjectsFromArray:self];
    return result;
}

@end
