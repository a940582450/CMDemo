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
 
 @param appID 通过信用精灵申请的应用ID
 @note 接口所需参数必须要正确填写，反之信用精灵将不能正确为应用提供服务
 */
+(void)initWithAppID:(NSString*)appID;


/**
 @brief 获取信用精灵App登录态
 
 @param mobile 用户的手机号码
 @param token 用户在使用者app的登录态
 @param resultBlock 获取信用精灵登录态是否成功
 */

+(void)loginWithMobile:(NSString*)mobile token:(NSString*)token resultBlock:(void(^)(BOOL success))resultBlock;


/**
 @brief 启动信用精灵检测服务
 
 @param detectionType 检测服务的类型
 */
+(void)startWithDetectionType:(CMDetectionType)detectionType;
@end

