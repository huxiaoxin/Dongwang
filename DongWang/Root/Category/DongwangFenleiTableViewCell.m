//
//  DongwangFenleiTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/27.
//

#import "DongwangFenleiTableViewCell.h"
@interface DongwangFenleiTableViewCell ()
{
    UIImageView * _thubImgView;
    UILabel * _DongwangToplb;
    UILabel * _DongwangBtomlb;
    UIButton * _DongwangbindingBtn;
}
@end
@implementation DongwangFenleiTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView * DongwangContentView = [[UIImageView alloc]initWithFrame:CGRectMake(K(13), K(0), SCREEN_WIDTH-K(20), K(75))];
        DongwangContentView.image = [UIImage imageNamed:@"renwutaskback"];
//        DongwangContentView.userInteractionEnabled = YES;
//        DongwangContentView.layer.cornerRadius = K(5);
//        DongwangContentView.layer.masksToBounds = YES;
        DongwangContentView.backgroundColor = [UIColor clearColor];
        [self addSubview:DongwangContentView];
        
//        DongwangContentView.layer.shadowColor = [UIColor colorWithHexString:@"#40CAFF"].CGColor;//阴影颜色
//        DongwangContentView.layer.shadowOffset = CGSizeMake(2, 2);//偏移距离
//        DongwangContentView.layer.shadowOpacity = 1;//不透明度
//        DongwangContentView.layer.shadowRadius = 5.0;//半径
        
        
        
        UIImageView * thubImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(20), K(15), K(45), K(45))];
        thubImgView.image = [UIImage imageNamed:@"编组 14"];
        [DongwangContentView addSubview:thubImgView];
        _thubImgView = thubImgView;
        
        
        UILabel * DongwangToplb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(thubImgView.frame)+K(10), K(18), K(300), K(21))];
        DongwangToplb.textColor =  [UIColor whiteColor];
        DongwangToplb.font = PFS15Font;
        DongwangToplb.text = @"完成一次答题";
        [DongwangContentView addSubview:DongwangToplb];
        _DongwangToplb = DongwangToplb;
        
        
        UILabel * DongwangBtomlb = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(thubImgView.frame)+K(9), K(6)+CGRectGetMaxY(DongwangToplb.frame), K(300), K(15))];
        DongwangBtomlb.textColor =  [UIColor colorWithHexString:@"#FFFFFF"];
        DongwangBtomlb.font = PFR11Font;
        DongwangBtomlb.text = @"积分+20";
        [DongwangContentView addSubview:DongwangBtomlb];
        _DongwangBtomlb = DongwangBtomlb;
        
        
        UIButton * DongwangbindingBtn = [[UIButton alloc]initWithFrame:CGRectMake(K(266), K(18), K(74), K(39))];
        [DongwangbindingBtn setBackgroundImage:[UIImage imageNamed:@"任务模块"] forState:UIControlStateNormal];
        [DongwangbindingBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        DongwangbindingBtn.adjustsImageWhenHighlighted = NO;
        DongwangbindingBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        DongwangbindingBtn.titleLabel.font = KSysFont(font(11));
        [DongwangbindingBtn setTitle:@"去绑定" forState:UIControlStateNormal];
        [DongwangbindingBtn addTarget:self action:@selector(DongwangbindingBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [DongwangContentView addSubview:DongwangbindingBtn];
        _DongwangbindingBtn  =DongwangbindingBtn;
        
    }
    return self;
}
-(void)DongwangbindingBtnClick{
    
    [self.delegate DongwangFenleiTableViewCellDidSeltecdWithCellIndex:self.tag];
}
-(void)setTaskModel:(DongwangPersonaltaskModel *)taskModel{
    _taskModel = taskModel;
    _thubImgView.image = [UIImage imageNamed:taskModel.imgName];
    _DongwangToplb.text = taskModel.title;
    _DongwangBtomlb.text = taskModel.detaildesc;
    [_DongwangbindingBtn setTitle:taskModel.btnTitle forState:UIControlStateNormal];
    [_DongwangbindingBtn setBackgroundImage:[UIImage imageNamed:taskModel.iscomplete ? @"已完成": @"去完成"] forState:UIControlStateNormal];
    [_DongwangbindingBtn setTitle:taskModel.iscomplete ? @"已完成" : taskModel.btnTitle forState:UIControlStateNormal];
}
@end
