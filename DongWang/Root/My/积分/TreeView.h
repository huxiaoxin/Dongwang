//
//  TreeView.h
//  仿支付宝蚂蚁森林
//
//  Created by Dian Xin on 2019/1/6.
//  Copyright © 2019年 com.ovix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DongwangJifenTreeModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    FruitTypeUnknown,
    FruitTypeTimeLimited,
    FruitTypeUnlimited,
} FruitType;

@protocol TreeViewDelegate <NSObject>

- (void)selectTimeLimitedBtnAtIndex:(NSInteger)index;

- (void)selectUnlimitedBtnAtIndex:(NSInteger)index;

- (void)allCollected;

@end

@interface TreeView : UIView
@property(nonatomic,assign) CGFloat JifenHeaderHeight;

@property(nonatomic,strong) NSArray<DongwangJifenTreeModel * > *treesModelArr;

@property (nonatomic, strong) NSArray <NSString *> *timeLimitedArr;

@property (nonatomic, strong) NSArray <NSString *> *unimitedArr;

- (void)createRandomBtnWithType:(FruitType)fruitType andText:(NSString *)textString;

- (void)removeRandomIndex:(NSInteger)index;

- (void)removeAllRandomBtn;
-(void)realoduserInteagers;

@property (nonatomic, weak) id <TreeViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
