//
//  DongwangTuijianFooterCollectionReusableView.m
//  DongWang
//
//  Created by codehzx on 2020/12/15.
//

#import "DongwangTuijianFooterCollectionReusableView.h"
#import "DongwnagHotTizuTableViewCell.h"
@interface DongwangTuijianFooterCollectionReusableView ()<UITableViewDelegate,UITableViewDataSource,DongwnagHotTizuTableViewCellDelegate>
@property(nonatomic,strong) UITableView * DongwangChildHomeTableView;
@end
@implementation DongwangTuijianFooterCollectionReusableView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.DongwangChildHomeTableView];
    }
    return self;
}
-(UITableView *)DongwangChildHomeTableView{
    if (!_DongwangChildHomeTableView) {
        _DongwangChildHomeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, K(15), SCREEN_Width, 0) style:UITableViewStylePlain];
        _DongwangChildHomeTableView.delegate = self;
        _DongwangChildHomeTableView.dataSource = self;
        _DongwangChildHomeTableView.showsVerticalScrollIndicator = NO;
        _DongwangChildHomeTableView.showsHorizontalScrollIndicator = NO;
        _DongwangChildHomeTableView.separatorStyle =  UITableViewCellSelectionStyleNone;
        _DongwangChildHomeTableView.backgroundColor = [UIColor clearColor];
        _DongwangChildHomeTableView.scrollEnabled = NO;
    }
    return _DongwangChildHomeTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _DongwangHomeDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangHotIdentier = @"DongwnagHotTizuTableViewCell";
    DongwnagHotTizuTableViewCell  * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangHotIdentier];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwnagHotTizuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangHotIdentier];
    }
    DongwangCell.delegate = self;
    DongwangCell.tag =indexPath.row;
    DongwangCell.tuziModel = _DongwangHomeDataArr[indexPath.row];
    return DongwangCell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(129.5);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.delegate DongwangHomeTuijianDidSeltecdWithCellindex:indexPath.row];

}
#pragma mark--DongwnagHotTizuTableViewCellDelegate
-(void)DongwnagHotTizuTableViewCellBtnClickWithCellIndex:(NSInteger)CellIndex{
    [self.delegate DongwangHomeTuijianDidSeltecdWithCellindex:CellIndex];
}
-(void)setDongwangHomeDataArr:(NSMutableArray *)DongwangHomeDataArr{
    _DongwangHomeDataArr = DongwangHomeDataArr;
    [_DongwangChildHomeTableView reloadData];
    CGFloat TableViewHeight = DongwangHomeDataArr.count*K(129.5);
    _DongwangChildHomeTableView.height  = TableViewHeight;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(tintColor)]) {
        CGFloat cornerRadius = 10.f;
        cell.backgroundColor = UIColor.clearColor;
        CAShapeLayer *layer = [[CAShapeLayer alloc] init];
        CGMutablePathRef pathRef = CGPathCreateMutable();
        CGRect bounds = CGRectInset(cell.bounds, 10, 0);
        BOOL addLine = NO;
        if (indexPath.row == 0 && indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
        } else if (indexPath.row == 0) {

            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
            addLine = YES;

        } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
            CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
            CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
        } else {
            CGPathAddRect(pathRef, nil, bounds);
            addLine = YES;
        }
        layer.path = pathRef;
        CFRelease(pathRef);
        //颜色修改
        layer.fillColor = [UIColor whiteColor].CGColor;
        layer.strokeColor=[UIColor whiteColor].CGColor;
        if (addLine == YES) {
            CALayer *lineLayer = [[CALayer alloc] init];
            CGFloat lineHeight = (1.f / [UIScreen mainScreen].scale);
            lineLayer.frame = CGRectMake(CGRectGetMinX(bounds)+10, bounds.size.height-lineHeight, bounds.size.width-10, lineHeight);
            lineLayer.backgroundColor = tableView.separatorColor.CGColor;
            [layer addSublayer:lineLayer];
        }
        UIView *testView = [[UIView alloc] initWithFrame:bounds];
        [testView.layer insertSublayer:layer atIndex:0];
        testView.backgroundColor = UIColor.clearColor;
        cell.backgroundView = testView;
    }
}

@end
