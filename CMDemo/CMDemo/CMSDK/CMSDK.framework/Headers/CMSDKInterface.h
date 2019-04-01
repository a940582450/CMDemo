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
 @brief 启动信用精灵检测服务，如果报告在有效期内，SDK直接展示报告，如果过了有效期，会生成一份新的报告
 
 @param mobile 需要使用查询服务的用户手机号
 @param detectionType 检测服务的类型
 */
+(void)startWithMobile:(NSString*)mobile detectionType:(CMDetectionType)detectionType;

/**
 @brief 查询各类检测报告状态
 
 @param detectionType 检测服务的类型
 @param block ：
        hasReport 是否产生过报告；
        reportDate 报告创建的日期；
        updateDate 报告可以进行更新的日期
 */

+(void)queryReportStatusWithMobile:(NSString*)mobile detectionType:(CMDetectionType)detectionType block:(void(^)(BOOL hasReport, NSString* reportDate,NSString *updateDate))block;
@end

