//
//  DongwangGardesDetailTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/18.
//

#import "DongwangGardesDetailTableViewCell.h"
@interface DongwangGardesDetailTableViewCell ()
@property(nonatomic,strong) UIImageView * DongwangContentImgView;
@property(nonatomic,strong) UILabel * DongwangTopTitle;
@property(nonatomic,strong) UILabel * DongwangDetailb ;
@property(nonatomic,strong) UILabel * DongwangAnsureRightlb;
@property(nonatomic,strong) UILabel * DongwangYourlb;
@property(nonatomic,strong) UIImageView * DonwangImgView;
@end
@implementation DongwangGardesDetailTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        UIImageView * DongwangContentImgView = [[UIImageView alloc]initWithFrame:CGRectMake(K(40), K(28), SCREEN_WIDTH-K(80), K(168))];
        DongwangContentImgView.image = [UIImage imageNamed:@"题组背景"];
        [self.contentView addSubview:DongwangContentImgView];
        _DongwangContentImgView = DongwangContentImgView;
        
        
        UILabel * DongwangTopTitle  = [[UILabel alloc]initWithFrame:CGRectMake(0, K(15), CGRectGetWidth(DongwangContentImgView.frame), K(25))];
        DongwangTopTitle.textAlignment = NSTextAlignmentCenter;
        DongwangTopTitle.font = KSysFont(font(18));
        DongwangTopTitle.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangTopTitle.text = @"第1题答题记录";
        [DongwangContentImgView addSubview:DongwangTopTitle];
        _DongwangTopTitle = DongwangTopTitle;
        
        CGRect  DongwangRect  = [@"长吉体”诗善于运用神话传说和怪诞、华美的词汇，创造出异想天开、从未有过的意象。开创“长吉体”诗歌的是__" cxl_sizeWithMoreString:KSysFont(font(12)) maxWidth:CGRectGetWidth(DongwangContentImgView.frame)-K(24)];
        
        UILabel * DongwangDetailb  = [[UILabel alloc]initWithFrame:CGRectMake(K(12), K(10)+CGRectGetMaxY(DongwangTopTitle.frame), DongwangRect.size.width, DongwangRect.size.height)];
        DongwangDetailb.font = KSysFont(font(12));
        DongwangDetailb.numberOfLines = 0;
        DongwangDetailb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangDetailb.text = @"长吉体”诗善于运用神话传说和怪诞、华美的词汇，创造出异想天开、从未有过的意象。开创“长吉体”诗歌的是__";
        [DongwangContentImgView addSubview:DongwangDetailb];
        _DongwangDetailb = DongwangDetailb;
        
        
        UILabel * DongwangAnsureRightlb  = [[UILabel alloc]initWithFrame:CGRectMake(K(12), K(10)+CGRectGetMaxY(DongwangDetailb.frame), CGRectGetWidth(DongwangContentImgView.frame), K(17))];
        DongwangAnsureRightlb.font = KSysFont(font(12));
        DongwangAnsureRightlb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangAnsureRightlb.text = @"正确答案：李贺";
        [DongwangContentImgView addSubview:DongwangAnsureRightlb];
        _DongwangAnsureRightlb = DongwangAnsureRightlb;
        
        
        UILabel * DongwangYourlb  = [[UILabel alloc]initWithFrame:CGRectMake(K(12), K(7)+CGRectGetMaxY(DongwangAnsureRightlb.frame), CGRectGetWidth(DongwangContentImgView.frame), K(17))];
        DongwangYourlb.font = KSysFont(font(12));
        DongwangYourlb.textColor = [UIColor colorWithHexString:@"#333333"];
        DongwangYourlb.text = @"你的答案：李商隐";
        [DongwangContentImgView addSubview:DongwangYourlb];
        _DongwangYourlb = DongwangYourlb;
        
        
        UIImageView * DonwangImgView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetWidth(DongwangContentImgView.frame)-K(50+27), CGRectGetMaxY(DongwangDetailb.frame)+K(8), K(55), K(38))];
        DonwangImgView.image = [UIImage imageNamed:@"正确"];
        [DongwangContentImgView addSubview:DonwangImgView];
        _DonwangImgView = DonwangImgView;
        
    }
    return self;
}
-(void)setDetailModel:(DongwangGradesDetailModel *)detailModel{
    _detailModel = detailModel;
    _DongwangTopTitle.text = [NSString stringWithFormat:@"%@",detailModel.orderNo];
    _DongwangDetailb.text =  detailModel.questionTitle;
    CGRect  DongwangRect  = [detailModel.questionTitle cxl_sizeWithMoreString:KSysFont(font(12)) maxWidth:CGRectGetWidth(_DongwangContentImgView.frame)-K(30)];
    _DongwangDetailb.size = DongwangRect.size;
    _DonwangImgView.y =CGRectGetMaxY(_DongwangDetailb.frame)+K(8);
    _DongwangAnsureRightlb.y = CGRectGetMaxY(_DongwangDetailb.frame)+K(10);
    _DongwangAnsureRightlb.text = [NSString stringWithFormat:@"正确答案:%@",detailModel.rightAnswer];
    _DongwangYourlb.y = CGRectGetMaxY(_DongwangAnsureRightlb.frame)+K(10);
    _DongwangYourlb.text = [NSString stringWithFormat:@"你的答案:%@",detailModel.myAnswer];
    if ([detailModel.status intValue] == 0) {
        //正确
        _DonwangImgView.image = [UIImage imageNamed:@"正确"];

    }else if ([detailModel.status intValue] == 1){
        _DonwangImgView.image = [UIImage imageNamed:@"错误"];

    }else if ([detailModel.status intValue] == 2){
        _DonwangImgView.image = [UIImage imageNamed:@"未答"];
    }
    
    _DongwangContentImgView.height = CGRectGetMaxY(_DongwangYourlb.frame)+K(20);
    detailModel.Cellheight = CGRectGetMaxY(_DongwangContentImgView.frame)+K(5);
    
}
@end
