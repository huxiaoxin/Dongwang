//
//  DongwangMofangModel.h
//  DongWang
//
//  Created by codehzx on 2020/12/9.
//

#import "DongWangBaseModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface MagicList :DongWangBaseModel
@property (nonatomic , copy) NSString              * id;
@property (nonatomic , copy) NSString              * enable;
@property (nonatomic , copy) NSString              * style;
@property (nonatomic , copy) NSString              * updateTime;
@property (nonatomic , copy) NSString              * magicList;
@property (nonatomic , copy) NSString              * insertUser;
@property (nonatomic , copy) NSString              * url;
@property (nonatomic , copy) NSString              * imageUrl;
@property (nonatomic , copy) NSString              * type;
@property (nonatomic , copy) NSString              * action;
@property (nonatomic , copy) NSString              * createTime;
@property (nonatomic , copy) NSString              * versions;
@property (nonatomic , copy) NSString              * updateUser;
@property (nonatomic , copy) NSString              * sort;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , copy) NSString              * parentId;
@property(nonatomic,assign)   CGSize  mofangSize;
@property(nonatomic,assign)  NSInteger  countNums;
@property(nonatomic,assign) CGFloat Cellheight;
@end
@interface DongwangMofangModel : DongWangBaseModel
@property (nonatomic , assign) NSInteger              id;
@property (nonatomic , assign) NSInteger              style;
@property (nonatomic , assign) NSInteger              enable;
@property (nonatomic , assign) NSInteger              updateTime;
@property (nonatomic , copy) NSArray<MagicList *>              * magicList;
@property (nonatomic , assign) NSInteger              insertUser;
@property (nonatomic , copy) NSString              * url;
@property (nonatomic , copy) NSString              * imageUrl;
@property (nonatomic , copy) NSString              * logo;
@property (nonatomic , assign) NSInteger              createTime;
@property (nonatomic , copy) NSString              * versions;
@property (nonatomic , copy) NSString              * updateUser;
@property (nonatomic , assign) NSInteger              sort;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , assign) NSInteger              parentId;
@end

NS_ASSUME_NONNULL_END
