//
//  DongwangSigninQiandaoFrameModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/16.
//

#import "DongWangBaseModel.h"
#import "DongwangSignQiandaoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DongwangSigninQiandaoFrameModel : DongWangBaseModel
@property(nonatomic,strong) DongwangSignQiandaoModel * qiandaoModel;
@property(nonatomic,assign) CGRect  ViewFrame;
@property(nonatomic,assign) CGRect  ToplbFrame;
@property(nonatomic,assign) CGRect  BtomlbFrame;
@property(nonatomic,assign) CGRect  ImgFrame;
@end

NS_ASSUME_NONNULL_END
