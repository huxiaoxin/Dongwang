//
//  DongwangZhuantiBangdanCollectionReusableView.m
//  DongWang
//
//  Created by codehzx on 2020/11/26.
//

#import "DongwangZhuantiBangdanCollectionReusableView.h"

@implementation DongwangZhuantiBangdanCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UILabel * DongwangTitle = [[UILabel alloc]initWithFrame:CGRectMake(K(12.5), K(5), K(250), K(18.5))];
        DongwangTitle.textColor = LGDBLackColor;
        DongwangTitle.font = KBlFont(font(15));
        DongwangTitle.text = @"当前排名";
        [self addSubview:DongwangTitle];
        
    }
    return self;
}
@end
