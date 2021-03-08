//
//  DongwangShouriMingxiTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangShouriMingxiTableViewCell.h"
@interface DongwangShouriMingxiTableViewCell  ()
@property(nonatomic,strong) UILabel * DongwangLeftToplb;
@property(nonatomic,strong) UILabel * DongwangTimmeBtomlb;
@property(nonatomic,strong) UILabel * DongwangMoneylb;
@end
@implementation DongwangShouriMingxiTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        UIView * dongwangline = [[UIView alloc]initWithFrame:CGRectMake(K(32), K(58), SCREEN_WIDTH-K(64), K(1))];
        dongwangline.backgroundColor =  LGDLightGaryColor;
        [self.contentView addSubview:dongwangline];
        
        UILabel * DongwangLeftToplb = [[UILabel alloc]initWithFrame:CGRectMake(K(32), K(11), K(300), K(18.5))];
        DongwangLeftToplb.font = KSysFont(font(13));
        DongwangLeftToplb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangLeftToplb.text = @"答题奖励";
        [self.contentView addSubview:DongwangLeftToplb];
        _DongwangLeftToplb = DongwangLeftToplb;
        
        
        UILabel * DongwangTimmeBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(K(20.5), K(34), K(300), K(15))];
        DongwangTimmeBtomlb.font = KSysFont(font(11));
        DongwangTimmeBtomlb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangTimmeBtomlb.text = @"2020-10-26 17:38:13";
        [self.contentView addSubview:DongwangTimmeBtomlb];
        _DongwangTimmeBtomlb =  DongwangTimmeBtomlb;
        
        
        UILabel * DongwangMoneylb = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-K(222), K(18.5), K(200), K(15))];
        DongwangMoneylb.textAlignment = NSTextAlignmentRight;
        DongwangMoneylb.font = KSysFont(font(15));
        DongwangMoneylb.textColor = [UIColor colorWithHexString:@"#FF2D2D"];
        DongwangMoneylb.text = @"+0.13";
        [self.contentView addSubview:DongwangMoneylb];
        _DongwangMoneylb = DongwangMoneylb;
        
        
    }
    return self;
}
-(void)setMingxiModel:(DongwangShouriMingxiModel *)mingxiModel{
    _mingxiModel = mingxiModel;
    _DongwangLeftToplb.text =  mingxiModel.sourceTypeValue;
    _DongwangTimmeBtomlb.text = mingxiModel.gainTimeStr;
    _DongwangMoneylb.text = [NSString stringWithFormat:@"+%@",mingxiModel.worth];    
}
@end
