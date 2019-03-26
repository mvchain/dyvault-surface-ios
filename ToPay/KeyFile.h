//
//  KeyFile.h
//  ToPay
//
//  Created by 蒲公英 on 2019/3/6.
//  Copyright © 2019年 MVC. All rights reserved.
//
#define TPCacheName @"TPCacheName"
#define TPUserInfoKey @"TPUserInfoKey"
#define TPTokenCurrencyListKey @"TPTokenCurrencyListKey"
#define TPCurrencyNameKey @"TPCurrencyNameKey"
#define TPLegalCurrencyListKey @"TPLegalCurrencyListKey"
#define TPNowLegalCurrencyKey @"TPNowLegalCurrencyKey"
#define TPNowLegalSymbolKey @"TPNowLegalSymbolKey"
#define TPNowLegalNameKey @"TPNowLegalNameKey"
#define TPCurrencyRatioKey @"TPCurrencyRatioKey"
#define TPLegalSwitchNotification @"TPLegalSwitchNotification"

#define UserInfoCacheKey @"UserInfoCacheKey"
#define UserInfoCacheKey_IDCard @"UserInfoCacheKey_IDCard"

#define EVENT_ChangeLegalCurrency @"change-legal-currency"
#define EVENT_BuyCurrency @"buy-currency"
#define NotiChangeLanguage @"NotiChangeLanguage"

#define APP_SERVER_VERSION_KEY @"APP_SERVER_VERSION_KEY"

// 已完成
// 已取消
// 已收款
// 待收款
typedef NS_ENUM(NSInteger, OneKeyBuyTokenStatus)
{
    OneKeyBuyTokenStatusAlreadyComplete,
    OneKeyBuyTokenStatusAlreadyCancle,
    OneKeyBuyTokenStatusAlreadyReceivables,
    OneKeyBuyTokenStatusWaitingReceivables
};
