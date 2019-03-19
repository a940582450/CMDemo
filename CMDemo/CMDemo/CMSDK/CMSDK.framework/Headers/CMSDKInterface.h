//
//  CMSDKInterface.h
//  CMSDK
//
//  Created by tianlong on 2019/2/20.
//  Copyright © 2019 tianlong. All rights reserved.
//

#import <Foundation/Foundation.h>

//检测服务类型
typedef enum{
    CMDetectionTypeBlackList ,//黑名单检测服务
    CMDetectionTypeNetLoan,//网贷检测服务
    CMDetectionTypeComprehensive//综合检测服务
}CMDetectionType;

@interface CMSDKInterface : NSObject
/**
 @brief 通过使用在信用精灵注册的应用的信息，启动信用精灵查询服务
 
 @param appKey 通过信用精灵申请的应用AppKey
 @param appSecret 通过信用精灵申请的应用appSecret
 @note 接口所需参数必须要正确填写，反之信用精灵将不能正确为应用提供服务
 */
+(void)initWithAppKey:(NSString*)appKey appSecret:(NSString*)appSecret;

/**
 @brief 启动信用精灵检测服务
 
 @param mobile 需要使用查询服务的用户手机号
 @param detectionType 检测服务的类型
 */
+(void)startWithMobile:(NSString*)mobile detectionType:(CMDetectionType)detectionType;


//临时接口，后面会删掉
//获取验证码
+(void)getCode:(NSString*)mobile;
+(void)login:(NSString*)mobile code:(NSString*)code;
@end

