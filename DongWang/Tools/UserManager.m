//
//  UserManager.m
//  DongWang
//
//  Created by codehzx on 2020/10/29.
//

#import "UserManager.h"
#import "AFNetworkTool.h"
@implementation UserInfo

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    if ([dictionary isKindOfClass:[NSDictionary class]])
    {
        if (self = [super init])
        {
            [self setValuesForKeysWithDictionary:dictionary];
        }
    }
    return self;
}

- (void)setValue:(id)value forKey:(NSString *)key
{
    if ([value isKindOfClass:[NSNull class]])
    {
        value = @"";
        return;
    }
    [super setValue:value forKey:key];
}

#pragma mark ————————— 对未定义key的处理方法 —————————————
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    // id 变量名现在可以直接使用，比如你要将服务器的 id 转成 userid
    if([key isEqualToString:@"id"])
    {
        self.userid = value;
        return;
    }
    
}

@end

@implementation UserManager

+ (BOOL)saveUserInfo:(NSDictionary *)dic
{
    return [NSKeyedArchiver archiveRootObject:dic toFile:[self path]];
}
+(NSDictionary * ) userInfoTojsonStr{
    id  data = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
    NSDictionary * responeDic = (NSDictionary *)data;
//  NSString * jsonStr =  [NSString dictionaryTurnJsonString:responeDic];
    return responeDic;
}
+ (UserInfo *)userInfo
{
    id  data = [NSKeyedUnarchiver unarchiveObjectWithFile:[self path]];
    NSDictionary * responeDic = (NSDictionary *)data;
    if (responeDic.allKeys.count == 0) {
        UserInfo * emtymodel = [[UserInfo alloc]init];
        emtymodel.loginTime = @"";
        emtymodel.ip = @"";
        emtymodel.loginCount = @"";
        emtymodel.nickName = @"";
        emtymodel.account = @"";
        emtymodel.code = @"";
        emtymodel.status = @"";
        emtymodel.wxOpenId = @"";
        emtymodel.updateTime = @"";
        emtymodel.updateUser = @"";
        emtymodel.headId = @"";
        emtymodel.realName = @"";
        emtymodel.wxStatus = @"";
        emtymodel.answerNum = @"";
        emtymodel.wxHeader = @"";
        emtymodel.idCard = @"";
        emtymodel.userid = @"";
        emtymodel.insertUser = @"";
        emtymodel.gender = @"";
        emtymodel.email = @"";
        emtymodel.registerTime = @"";
        emtymodel.phone = @"";
        emtymodel.versions = @"";
        emtymodel.appleId = @"";
        emtymodel.header = @"";
        emtymodel.addressStatus = @"";
        emtymodel.createTime = @"";
        emtymodel.password = @"";
        emtymodel.remark = @"";
        emtymodel.certification = @"";
        return emtymodel;
    }else{
        UserInfo *model = [[UserInfo alloc]initWithDictionary:data];
        return model;
    }
    
}

+ (BOOL)clearUserInfo
{
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    if ([defaultManager isDeletableFileAtPath:[self path]])
    {
        //删除归档文件
        return [defaultManager removeItemAtPath:[self path] error:nil];
    }
    else
    {
        return NO;
    }
}
+(BOOL)userisLogoin{
    NSString * loginState = [[NSUserDefaults standardUserDefaults] objectForKey:@"loginState"];
    if ([loginState isEqualToString:@"1"]) {
        return YES;
    }else{
        return NO;
    }
}
+(NSString *)token{
    NSString * token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//    NSLog(@"获取到的token：%@",token);
    return token;
    
}
+(void)userLoginSucced{
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"loginState"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(void)userLoginout{
    [UserManager clearUserInfo];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:AppisHaveactivity];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"token"];
    [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:@"loginState"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 Documents/ 保存应用程序的重要数据文件和用户数据文件等。用户数据基本上都放在这个位置(例如从网上下载的图片或音乐文件)，该文件夹在应用程序更新时会自动备份，在连接iTunes时也可以自动同步备份其中的数据。
 
 Library：这个目录下有两个子目录,可创建子文件夹。可以用来放置您希望被备份但不希望被用户看到的数据。该路径下的文件夹，除Caches以外，都会被iTunes备份.
 
 Library/Caches: 保存应用程序使用时产生的支持文件和缓存文件(保存应用程序再次启动过程中需要的信息)，还有日志文件最好也放在这个目录。iTunes 同步时不会备份该目录并且可能被其他工具清理掉其中的数据。
 Library/Preferences: 保存应用程序的偏好设置文件。NSUserDefaults类创建的数据和plist文件都放在这里。会被iTunes备份。
 
 @return <#return value description#>
 */
+(NSString *)path
{
    // 获取沙盒根目录路径
    NSString *homeDir   = NSHomeDirectory();
    // 获取Documents目录路径
    NSString *docDir    = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) firstObject];
    //获取Library的目录路径
    NSString *libDir    = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask,YES) lastObject];
    // 获取cache目录路径
    NSString *cachesDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) firstObject];
    // 获取tmp目录路径
    NSString *tmpDir = NSTemporaryDirectory();
    // 获取应用程序程序包中资源文件路径的方法：
    NSString *bundle = [[NSBundle mainBundle] bundlePath];
    NSString *name = @"userinfo";
    NSString *type = @"sql";
    NSString *allName = [NSString stringWithFormat:@"%@.%@",name,type];
    return [docDir stringByAppendingPathComponent:allName];;
}
+(void)UserManagerRealoadinfomationSuuced:(void(^)(void))Successblock fairler:(void(^)(void))failerblock{
    if (![UserManager userisLogoin]) {
        if (failerblock) {
            failerblock();
        }
        return;
    }
//    NSLog(@"%@",[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_Info]);
    [AFNetworkTool GET:[NSString stringWithFormat:@"%@%@",Dongwang_BaseUrl,User_Info] HttpHeader:@{}.mutableCopy Parameters:@{}.mutableCopy Success:^(id responseObject) {
        NSDictionary * data = [responseObject objectForKey:@"data"];
        NSLog(@"个人信息:%@",data);
        if (data.allKeys.count > 0) {
        [UserManager saveUserInfo:data];
        }
        if (Successblock) {
        Successblock();
        }
    } Failure:^(id failure) {
        NSDictionary * emtyDic = [NSDictionary dictionary];
//        [UserManager saveUserInfo:emtyDic];
        if (failerblock) {
            failerblock();
        }
    }];
}
@end
