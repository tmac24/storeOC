//
//  DCTestModel.h
//  CDDStoreDemo
//
//  Created by cdql10103 on 2022/7/20.
//  Copyright © 2022 RocketsChen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class DCTestItemDetail ,DCTestItemList;

@interface DCTestModel : NSObject

@property (nonatomic, assign) NSInteger displayStyleType;
@property (nonatomic, strong) NSString * groupName;
@property (nonatomic, strong) NSArray<DCTestItemList *> * itemList;

@end

@interface DCTestItemList : NSObject

@property (nonatomic, strong) NSString * coverPath;
@property (nonatomic, assign) BOOL isDisplayCornerMark;
@property (nonatomic, strong) DCTestItemDetail * itemDetail;
@property (nonatomic, assign) NSInteger itemType;
@end

@interface DCTestItemDetail : NSObject

@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, assign) NSInteger categoryType;
@property (nonatomic, assign) BOOL filterSupported;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * title;
@end

NS_ASSUME_NONNULL_END
