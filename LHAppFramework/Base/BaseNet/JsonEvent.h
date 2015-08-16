//
//  JsonEvent.h
//  GasStation
//
//  Created by Xu Wei on 14-5-15.
//  Copyright (c) 2014年 qiangao. All rights reserved.
//

#ifndef GasStation_JsonEvent_h
#define GasStation_JsonEvent_h

//参数返回
#define kREQUEST_JSPARAMETERS   @"jsParameters"
#define kREQUEST_RETURN_JSON    @"returnJson"

#define CMD_NEED_TOKEN 1000

typedef enum {
    kJSON_EVENT_TYPE_NONE = -1,                 //未定义
    kJSON_EVENT_TYPE_GET_SERVICE = 1,           //获取服务器地址
    
}JsonEventType;

#endif
