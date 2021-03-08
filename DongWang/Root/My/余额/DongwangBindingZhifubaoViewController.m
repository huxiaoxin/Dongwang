//
//  DongwangBindingZhifubaoViewController.m
//  DongWang
//
//  Created by codehzx on 2020/11/11.
//

#import "DongwangBindingZhifubaoViewController.h"
#import "DongwangBingdingZhifubaoTableViewCell.h"
#import "DongwangBindingZhifubaoFooterView.h"
#import "DongwangLogoinViewModel.h"
#import "RITLTimer.h"
#import "DongwangMyViewModel.h"
#import "DongwangAlipayAlterView.h"
@interface DongwangBindingZhifubaoViewController ()<UITableViewDelegate,UITableViewDataSource,DongwangBindingZhifubaoFooterViewDelegate,DongwangAlipayAlterViewDelegate>
@property(nonatomic,strong) UITableView * DongwnagTableView;
@property(nonatomic,strong) NSMutableArray * DongwangleftDataArr;
@property(nonatomic,strong) NSMutableArray * DongwangrighttDataArr;
@property(nonatomic,strong) NSMutableArray * DongwangHolderDataArr;
@property(nonatomic,strong) DongwangBindingZhifubaoFooterView * DongwangFooterView;
@property(nonatomic,strong)  NSTimer *  timer;
@property(nonatomic,assign) NSInteger Count;
@property(nonatomic,strong) DongwangAlipayAlterView * alterView;

@property(nonatomic,strong)  NSString * showTimeStr;
@property(nonatomic,strong)  NSString * leaveTimeStr;
@end

@implementation DongwangBindingZhifubaoViewController
-(DongwangAlipayAlterView *)alterView{
    if (!_alterView) {
        _alterView  =[[DongwangAlipayAlterView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _alterView.delegate = self;
    }
    return _alterView;
}
-(NSMutableArray *)DongwangHolderDataArr{
    if (!_DongwangHolderDataArr) {
        _DongwangHolderDataArr = [[NSMutableArray alloc]initWithArray:@[@"请填写您的收款支付宝账号",@"请填写支付宝号对应的真实姓名"]];
    }
    return _DongwangHolderDataArr;
}
-(NSMutableArray *)DongwangrighttDataArr{
    if (!_DongwangrighttDataArr) {
        NSString * realname = [NSString stringWithFormat:@"%@",[UserManager userInfo].realName];
        _DongwangrighttDataArr = [[NSMutableArray alloc]initWithArray:@[realname,@""]];
    }
    return _DongwangrighttDataArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShowBtomImgView = NO;
    self.Count = 60;
    self.gk_navTitle =  @"绑定支付宝";
    self.view.backgroundColor =[UIColor colorWithHexString:@"#804AB7"];
    [self.view addSubview:self.DongwnagTableView];
    _DongwnagTableView.tableFooterView = self.DongwangFooterView;
    


}
-(NSMutableArray *)DongwangleftDataArr{
    if (!_DongwangleftDataArr) {
        _DongwangleftDataArr = [[NSMutableArray alloc]initWithArray:@[@"真实姓名：",@"支付宝号："]];
    }
    return _DongwangleftDataArr;
}
-(UITableView *)DongwnagTableView{
    if (!_DongwnagTableView) {
        _DongwnagTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NaviH, SCREEN_WIDTH, SCREEN_HEIGHT-NaviH-SafeAreaBottom_Height) style:UITableViewStylePlain];
        _DongwnagTableView.delegate = self;
        _DongwnagTableView.dataSource = self;
        _DongwnagTableView.showsVerticalScrollIndicator  = NO;
        _DongwnagTableView.showsHorizontalScrollIndicator = NO;
        _DongwnagTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _DongwnagTableView.backgroundColor = [UIColor clearColor];
    }
    return _DongwnagTableView;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DongwangleftDataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return K(56.5);
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * DongwangZhifubaoIdentifer = @"DongwangBingdingZhifubaoTableViewCell";
    DongwangBingdingZhifubaoTableViewCell * DongwangCell = [tableView dequeueReusableCellWithIdentifier:DongwangZhifubaoIdentifer];
    if (DongwangCell == nil) {
        DongwangCell = [[DongwangBingdingZhifubaoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DongwangZhifubaoIdentifer];
    }
    DongwangCell.DongwangCodeTextField.tag = indexPath.row;
    [DongwangCell.DongwangCodeTextField addTarget:self action:@selector(textFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    [DongwangCell DongwangBingdingZhifubaoTableViewCellConfigerleftArr:self.DongwangleftDataArr rightDataList:self.DongwangrighttDataArr holderTextList:self.DongwangHolderDataArr indexPath:indexPath.row];
    return DongwangCell;
}
- (DongwangBindingZhifubaoFooterView *)DongwangFooterView{
    if (!_DongwangFooterView) {
        _DongwangFooterView = [[DongwangBindingZhifubaoFooterView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, K(120+200))];
        _DongwangFooterView.delegate = self;
        _DongwangFooterView.backgroundColor = [UIColor clearColor];
    }
    return _DongwangFooterView;
}
-(void)textFieldEditingChanged:(UITextField *)textField{
[self.DongwangrighttDataArr replaceObjectAtIndex:textField.tag withObject:textField.text];
    NSString * RealnameStr = [self.DongwangrighttDataArr firstObject];
    NSString * AlipyPhoneStr = [self.DongwangrighttDataArr objectAtIndex:1];
    if (RealnameStr.length > 0 && AlipyPhoneStr.length > 0 ) {
    [_DongwangFooterView.DongwangTixianBtn   setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
        _DongwangFooterView.DongwangTixianBtn.enabled = YES;
    }else{
        [_DongwangFooterView.DongwangTixianBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _DongwangFooterView.DongwangTixianBtn.enabled = NO;
        [_DongwangFooterView.DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    }

  
}
#pragma mark--DongwangBindingZhifubaoFooterViewDelegate
-(void)DongwangBindingZhifubaoFooterViewBingdingZhifubao{
    NSString * RealnameStr = [self.DongwangrighttDataArr firstObject];
    NSString * AlipyPhoneStr = [self.DongwangrighttDataArr objectAtIndex:1];
    MJWeakSelf;
    [DongwangMyViewModel DongwangMyViewModelWithBindingAliPay:@{@"realName":[RealnameStr stringByReplacingOccurrencesOfString:@" " withString:@""],@"payAccount":[AlipyPhoneStr stringByReplacingOccurrencesOfString:@" " withString:@""]}.mutableCopy RequestCuurentControlers:self DeleAccountSuuced:^(id  _Nonnull object) {
        if (weakSelf.bindblock) {
            weakSelf.bindblock();
        }
        [weakSelf.alterView show];
    } Deleaccountfairler:^(id  _Nonnull message) {
        
    }];
    
}
-(void)DongwangBindingZhifubaoFooterViewTextFieldexdingWithText:(NSString *)TextStr{
    NSString * RealnameStr = [self.DongwangrighttDataArr firstObject];
    NSString * AlipyPhoneStr = [self.DongwangrighttDataArr objectAtIndex:1];
    if (RealnameStr.length > 0 && AlipyPhoneStr.length > 0 ) {
        [_DongwangFooterView.DongwangTixianBtn   setBackgroundImage:[UIImage imageNamed:@"登录按钮背景"] forState:UIControlStateNormal];
        _DongwangFooterView.DongwangTixianBtn.enabled = YES;
    }else{
        [_DongwangFooterView.DongwangTixianBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        _DongwangFooterView.DongwangTixianBtn.enabled = NO;
        [_DongwangFooterView.DongwangTixianBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];
    }
    
}
-(void)DongwangBindingZhifubaoFooterViewgetmsgCode{
    MJWeakSelf;
    [DongwangLogoinViewModel CodeloginRequestWithParmtersw:@{@"phone":[NSString stringWithFormat:@"%@",[UserManager userInfo].phone],@"type":@"1"}.mutableCopy RequestCuurentControlers:self logoinSuuced:^(id  _Nonnull object) {
        [weakSelf DongwangSendSuccedCodeRequest];
    } logoinfairler:^{
    
    }];
}
-(void)DongwangSendSuccedCodeRequest{
    MJWeakSelf;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.timer = [RITLTimer scheduledTimerWithTimeInterval:1 userInfo:nil repeats:YES BlockHandle:^(id  _Nonnull info) {
            weakSelf.Count --;
            if (weakSelf.Count == 0) {
                [weakSelf.timer invalidate];
                weakSelf.timer = nil;
                weakSelf.Count = 60;
                weakSelf.DongwangFooterView.DongwangCodeBtn.enabled = YES;
                weakSelf.DongwangFooterView.DongwangTixianBtn.enabled = YES;
                [weakSelf.DongwangFooterView.DongwangCodeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
                [weakSelf.DongwangFooterView.DongwangCodeBtn  setBackgroundColor:LGDMianColor];

            }else{
                weakSelf.DongwangFooterView.DongwangCodeBtn.enabled = NO;
                [weakSelf.DongwangFooterView.DongwangCodeBtn setTitle:[NSString stringWithFormat:@"重新获取(%lds)",weakSelf.Count] forState:UIControlStateNormal];
                [weakSelf.DongwangFooterView.DongwangCodeBtn setBackgroundColor:[UIColor colorWithHexString:@"#999999"]];

            }
        }];
        
    });

}
#pragma mark--DongwangAlipayAlterViewDelegate
-(void)DongwangAlipayAlterViewSucced{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.showTimeStr = [NSString currentTimeStr];

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.leaveTimeStr =  [NSString currentTimeStr];

    [[DataBuried ShareManager] CLLogoninWithParmesWithShowTimeStr:self.showTimeStr LeaveTimeStr:self.leaveTimeStr ViewPageName:9];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
