//
//  NSDictionary+describe.m
//  TGO
//
//  Created by 王飞 on 17/2/27.
//  Copyright © 2017年 chongqinjialetao. All rights reserved.
//

#import "NSDictionary+describe.h"

@implementation NSDictionary (describe)

#if DEBUG
- (NSString *)descriptionWithLocale:(nullable id)locale{
    
    NSString *logString;
    @try {
        
        logString=[[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
        
    } @catch (NSException *exception) {
        
        NSString *reason = [NSString stringWithFormat:@"reason:%@",exception.reason];
        logString = [NSString stringWithFormat:@"转换失败:\n%@,\n转换终止,输出如下:\n%@",reason,self.description];
        
    } @finally {
        
    }
    return logString;
}
#endif

@end
