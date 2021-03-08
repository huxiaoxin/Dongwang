//
//  DongwangSigninQiandaoFrameModel.m
//  DongWang
//
//  Created by codehzx on 2020/11/16.
//b

#import "DongwangSigninQiandaoFrameModel.h"

@implementation DongwangSigninQiandaoFrameModel
-(void)setQiandaoModel:(DongwangSignQiandaoModel *)qiandaoModel{
    _qiandaoModel = qiandaoModel;
    if (qiandaoModel.islast == NO) {
        self.ViewFrame = CGRectMake(0, 0, K(74), K(89));
        self.ToplbFrame = CGRectMake(0, K(8), K(74), K(13));
        self.BtomlbFrame = CGRectMake(0, K(66), K(74), K(13));
        self.ImgFrame = CGRectMake(K(18), K(26), K(37), K(37));
    }else{
        self.ImgFrame = CGRectMake(K(84), K(10), K(69), K(69));
        self.ToplbFrame = CGRectMake(K(10), K(10), K(100), K(13));
        self.BtomlbFrame = CGRectMake(K(10), K(32), K(100), K(13));
        self.ViewFrame = CGRectMake(K(2), 0, K(160), K(89));
    }
    
}
@end
