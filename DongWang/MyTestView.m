//
//  MyTestView.m
//  DongWang
//
//  Created by codehzx on 2020/11/17.
//

#import "MyTestView.h"
@interface MyTestView ()
{
    NSMutableArray * list;
}
@end
@implementation MyTestView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        NSArray *bklist=@[@"12",@"12",@"123"];
        list=[[NSMutableArray alloc]initWithArray:bklist];
        self.backgroundColor=[UIColor whiteColor];
        [self initBkList:bklist];
        [self setUserInteractionEnabled:YES];
        UITapGestureRecognizer *tapGestureTel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewReload)];
        [self addGestureRecognizer:tapGestureTel];
    }
    return self;
}
-(void)initBkList:(NSArray *)bklist//存放NSString数组
{
        int locatag=0;
        for (int j=0; j<bklist.count; j++)
        {
            UILabel * label = [[UILabel alloc]init];
            label.font=[UIFont systemFontOfSize:18];
             NSTimeInterval animationDuration = 0.50f;
             [UIView beginAnimations:nil context:nil];
             [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            label.textAlignment=NSTextAlignmentLeft;
            label.text=bklist[j] ;
            label.frame= [self randomRect:bklist[j] AndLabelCount:j];
//            [self randomRect:[bklist[j] baikeTitel] AndLabelCount:j];
            label.backgroundColor  = [UIColor redColor];
            [self addSubview:label];
             [UIView commitAnimations];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(CGSize)labelAuto:(NSString *)str
{
    UIFont * tfont = [UIFont systemFontOfSize:18];
    CGSize size =CGSizeMake(1024,50);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    CGSize  actualsize =[str boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    return actualsize;
}


-(CGRect)randomRect:(NSString *)str AndLabelCount:(NSInteger)count
{
    BOOL isIntersect=NO;
    int x = arc4random() % (int)self.frame.size.width;
    int y =  arc4random() % (int)self.frame.size.height;
    CGSize actualsize=[self labelAuto:str];
    
    CGRect labelFrame= CGRectMake(x, y, actualsize.width, actualsize.height);
    
    do {
        int i=0;
        if ((labelFrame.origin.x+labelFrame.size.width)>self.frame.size.width||(labelFrame.origin.y+labelFrame.size.height)>self.frame.size.height)
        {
            isIntersect=YES;
        }else
        {
        isIntersect=NO;
        for (id obj in self.subviews)
        {
            if ([obj isKindOfClass:[UILabel class]])
            {
                i++;
                UILabel * mylabel = (UILabel*)obj;
                if (CGRectIntersectsRect(labelFrame,mylabel.frame))
                {
                    isIntersect=YES;
                    break;
                }
            }
            if (i==count)
            {
                isIntersect=NO;
            }
        }
        }
        
        if (isIntersect)
        {
            x = arc4random() % (int)self.frame.size.width;
            y = arc4random() % (int)self.frame.size.height;
            labelFrame= CGRectMake(x, y, actualsize.width, actualsize.height);
        }
    } while (isIntersect);
    return labelFrame;
}
-(void)viewReload
{
    for (id obj in self.subviews)
    {
        if ([obj isKindOfClass:[UILabel class]])
        {
            UILabel * mylabel = (UILabel*)obj;
            [mylabel removeFromSuperview];
        }

    }
    [self initBkList:list];
}


@end
