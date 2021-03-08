//
//  DongwangAdressTableViewCell.m
//  DongWang
//
//  Created by codehzx on 2020/11/9.
//

#import "DongwangAdressTableViewCell.h"
@interface DongwangAdressTableViewCell ()
{
    UIView * _Dongwangline;
    UILabel * _DongwangNamelb;
    UILabel * _DongwangPhonelb;
    UILabel * _DongwangAdressDetaillb;
    UIButton * _DongwangBiBtn;
    UIImageView * _DongwangDefaultImgView;
}
@end
@implementation DongwangAdressTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle =  UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];

        UIView * Dongwangline = [[UIView alloc]initWithFrame:CGRectMake(RealWidth(30), RealWidth(82), SCREEN_WIDTH-RealWidth(60), RealWidth(1))];
        Dongwangline.backgroundColor = [UIColor colorWithHexString:@"#ECECEC"];
        [self.contentView addSubview:Dongwangline];
        _Dongwangline = Dongwangline;
        
        
        UILabel * DongwangNamelb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(30), RealWidth(11), RealWidth(30), RealWidth(21))];
        DongwangNamelb.textColor = [UIColor blackColor];
        DongwangNamelb.font = KBlFont(font(15));
        DongwangNamelb.text =  @"张默默 ";
        [self.contentView addSubview:DongwangNamelb];
        _DongwangNamelb = DongwangNamelb;
        
        
        UILabel * DongwangPhonelb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(33)+CGRectGetMaxX(DongwangNamelb.frame), RealWidth(12), RealWidth(200), RealWidth(21))];
        DongwangPhonelb.textColor = [UIColor colorWithHexString:@"#333330"];
        DongwangPhonelb.font = KSysFont(font(15));
        DongwangPhonelb.text =  @"张150****1251";
        [self.contentView addSubview:DongwangPhonelb];
        _DongwangPhonelb = DongwangPhonelb;
        
        //
        
        
        UIImageView * DongwangDefaultImgView = [[UIImageView alloc]initWithFrame:CGRectMake(RealWidth(30), CGRectGetMaxY(DongwangNamelb.frame)+RealWidth(7), RealWidth(24.5), RealWidth(14))];
        DongwangDefaultImgView.image = [UIImage imageNamed:@"默认收货"];
        [self.contentView addSubview:DongwangDefaultImgView];
        _DongwangDefaultImgView = DongwangDefaultImgView;
        
        
        UILabel * DongwangAdressDetaillb = [[UILabel alloc]initWithFrame:CGRectMake(RealWidth(30), RealWidth(36.5), RealWidth(255), RealWidth(33))];
//        [DongwangAdressDetaillb setBackgroundColor:LGDMianColor];
        DongwangAdressDetaillb.numberOfLines = 0;
        DongwangAdressDetaillb.textColor = [UIColor colorWithHexString:@"#999999"];
        DongwangAdressDetaillb.font = KSysFont(font(12));
        DongwangAdressDetaillb.text =  @"浙江省杭州市西湖区文二西路国际科技大A座901";
        [self.contentView addSubview:DongwangAdressDetaillb];
        _DongwangAdressDetaillb = DongwangAdressDetaillb;
        
        
        UIButton * DongwangBiBtn = [[UIButton alloc]initWithFrame:CGRectMake(RealWidth(325), RealWidth(46), RealWidth(22), RealWidth(22))];
        [DongwangBiBtn setEnlargeEdgeWithTop:K(10) right:K(10) bottom:K(10) left:K(10)];
        [DongwangBiBtn setBackgroundImage:[UIImage imageNamed:@"收货地址"] forState:UIControlStateNormal];
        [DongwangBiBtn addTarget:self action:@selector(DongwangBiBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:DongwangBiBtn];
        _DongwangBiBtn = DongwangBiBtn;
        
        
    }
    return self;
}
-(void)setShipingModel:(ShippingAddressListModel *)ShipingModel{
    _ShipingModel = ShipingModel;
    CGSize nameSize = [ShipingModel.userName cxl_sizeWithString:KBlFont(font(15))];
    _DongwangNamelb.text =  ShipingModel.userName;
    _DongwangNamelb.width = nameSize.width+RealWidth(2);
    _DongwangPhonelb.x =  CGRectGetMaxX(_DongwangNamelb.frame)+RealWidth(31);
    _DongwangPhonelb.text = [NSString numberPhoneSuitScanf:[NSString stringWithFormat:@"%@",ShipingModel.phone] strRange:NSMakeRange(3, 4)];
    if ([[NSString stringWithFormat:@"%@",ShipingModel.defaultReceiveAddress] isEqualToString:@"0"]) {
        //默认地址
        _DongwangDefaultImgView.hidden = NO;
        _DongwangAdressDetaillb.x = RealWidth(60);
        
    }else{
        _DongwangAdressDetaillb.x = RealWidth(30);
        _DongwangDefaultImgView.hidden = YES;
    }
    
    NSString * AdressDetailText = [NSString stringWithFormat:@"%@%@",ShipingModel.area,ShipingModel.detailAddress];
    [_DongwangAdressDetaillb setText:AdressDetailText lineSpacing:RealWidth(3)];
    
    _DongwangAdressDetaillb.size = [_DongwangAdressDetaillb getSpaceLabelHeight:AdressDetailText withFont:KSysFont(font(12)) withWidth:RealWidth(255) lineSpacing:RealWidth(3)];
    
    _DongwangDefaultImgView.y = CGRectGetMinY(_DongwangAdressDetaillb.frame);

    _Dongwangline.y = CGRectGetMaxY(_DongwangAdressDetaillb.frame)+RealWidth(13.5);
    ShipingModel.cellheight = CGRectGetMaxY(_Dongwangline.frame)+RealWidth(10);
    _DongwangBiBtn.y =  CGRectGetMidY(_DongwangAdressDetaillb.frame)-RealWidth(11);
}
-(void)DongwangBiBtnClick{
    [self.delegate DongwangAdressTableViewCellChangeAdressWithCellIndex:self.tag];
}
@end
