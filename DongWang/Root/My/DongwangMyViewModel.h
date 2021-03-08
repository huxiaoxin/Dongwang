//
//  DongwangMyViewModel.h
//  DongWang
//
//  Created by codehzx on 2020/11/19.
//

#import <Foundation/Foundation.h>
#import "ShippingAddressListModel.h"
#import "DongwangAdressInfoDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface DongwangMyViewModel : NSObject
#pragma mark--注销账户
+(void)DongwangMyViewModelWithDeleAccoutn:(NSMutableDictionary *)mutablParmerDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark-- 编辑 头像、性别、昵称
+(void)DongwangMyViewModelWithupheaderImg:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark-- 实名认证
+(void)DongwangMyViewModelWithrealAuth:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark-- 绑定微信
+(void)DongwangMyViewModelWithbindingWechat:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark-- 绑定微信（2.0）
+(void)DongwangMyViewModelWithbindingWechat_hwc:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark--收货地址列表
+(void)DongwangMyViewModelWithAdressList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark--提交收货地址
+(void)DongwangMyViewModelWithCommiteAdress:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark--删除收货地址
+(void)DongwangMyViewModelWithDeleateAdress:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark--编辑收货地址
+(void)DongwangMyViewModelWitheditAdress:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark--地址详情接口
+(void)DongwangMyViewModelWithAdressDetail:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(DongwangAdressInfoDetailModel *))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark--获取省市区
+(void)DongwangMyViewModelWithProvinceList:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark -- 添加收货地址省市区数据组装
+ (NSArray *)addShippingAddressCityDictionary:(NSDictionary *)dic;
#pragma mark -- 修改地址, 自动滑动到选择的省市区
+ (NSDictionary *)scrollShippingAddressAllArray:(NSArray *)allArray currentModel:(ShippingAddressListModel *)shippingAddModel;


#pragma mark -- 我的奖品
+(void)DongwangMyViewModelWithMyprize:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 我的道具（
+(void)DongwangMyViewModelWithMydaoju:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark -- 我的成绩
+(void)DongwangMyViewModelWithMychenji:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 我的成绩详情
+(void)DongwangMyViewModelWithMychenjiDetail:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 我的消息
+(void)DongwangMyViewModelWithMymessage:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 我的消息详情（有问题， get请求 参数放body报错）
+(void)DongwangMyViewModelWithMymessageDetail:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 用户反馈
+(void)DongwangMyViewModelWithMyfeedBack:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 绑定支付宝
+(void)DongwangMyViewModelWithBindingAliPay:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark -- 提现
+(void)DongwangMyViewModelWithgoWithdraw:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
#pragma mark -- 明细
+(void)DongwangMyViewModelWithdrawlist:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 签到
+(void)DongwangMyViewModelWithSign:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object,NSDictionary * dic))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;

#pragma mark -- 去签到
+(void)DongwangMyViewModelWithgoSign:(NSMutableDictionary *)mutableParmterDic RequestCuurentControlers:(DongwangBaseViewController *)CurrentVc DeleAccountSuuced:(void(^)(id object))Succedblock Deleaccountfairler:(void(^)(id message))failerblock;
@end

NS_ASSUME_NONNULL_END
