//
//  DongwangZhuantiBangTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/26.
//

#import "DongwangZhuantiBangTableViewCell.h"
@interface DongwangZhuantiBangTableViewCell ()
@end
@implementation DongwangZhuantiBangTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor =[UIColor clearColor];
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        
        UIView * DongwangContentView = [[UIView alloc]initWithFrame:CGRectMake(K(15), 0, SCREEN_WIDTH-K(30), K(90))];
        DongwangContentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:DongwangContentView];
        
        
        UIView *donwganline = [[UIView alloc]initWithFrame:CGRectMake(K(24), K(89.5),SCREEN_WIDTH-K(30)-K(48), K(0.5))];
       donwganline.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
        [DongwangContentView addSubview:donwganline];
        
        
      
        UIImageView * DongwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(24.5), K(12), K(66), K(66))];
        DongwangImgView.layer.cornerRadius = K(33);
        DongwangImgView.layer.masksToBounds = YES;
        DongwangImgView.backgroundColor =  LGDLightGaryColor;
        [DongwangContentView addSubview:DongwangImgView];
        
        UILabel * DongwangNamelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangImgView.frame)+K(5), K(27.5), K(205), K(21))];
        DongwangNamelb.text = @"昵称";
        DongwangNamelb.font = KBlFont(font(15));
        DongwangNamelb.textColor =[UIColor colorWithHexString:@"#333330"];
        [DongwangContentView addSubview:DongwangNamelb];
        
        
        UILabel * DongwangTimelb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(DongwangImgView.frame)+K(5), K(54.5), K(205), K(15))];
        DongwangTimelb.text = @"2019-11-11 15:56:25";
        DongwangTimelb.font = KSysFont(font(11));
        DongwangTimelb.textColor =[UIColor colorWithHexString:@"#999999"];
        [DongwangContentView addSubview:DongwangTimelb];

        UILabel * DongwangJifenlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(240), K(27), K(200), K(21))];
        DongwangJifenlb.text = @"积分";
        DongwangJifenlb.textAlignment = NSTextAlignmentRight;
        DongwangJifenlb.font = KSysFont(font(15));
        DongwangJifenlb.textColor =[UIColor colorWithHexString:@"#999999"];
        [DongwangContentView addSubview:DongwangJifenlb];

        UILabel * DongwangJifennNumlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentView.frame)-K(250), K(54.5), K(200), K(15))];
        DongwangJifennNumlb.textAlignment = NSTextAlignmentRight;
        DongwangJifennNumlb.text = @"12";
        DongwangJifennNumlb.font = KSysFont(font(11));
        DongwangJifennNumlb.textColor =[UIColor colorWithHexString:@"#999999"];
        [DongwangContentView addSubview:DongwangJifennNumlb];
    
    
    }
    return self;
}
@end
