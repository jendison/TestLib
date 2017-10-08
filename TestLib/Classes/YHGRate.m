//
//  YHGRate.m
//  TestLib
//
//  Created by andylee on 2017/10/8.
//

#import "YHGRate.h"
#import <iRate/iRate.h>

@implementation YHGRate

-(void)openAlertInVC:(UIViewController *)vc
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[self bundleString:@"hello"]
                                                                   message:[self bundleString:@"hello"]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:(UIAlertActionStyleDefault) handler:nil]];
    [vc presentViewController:alert animated:YES completion:nil];
}

void _OpenRateView(){
    [[iRate sharedInstance] promptIfNetworkAvailable];
    
}

- (NSString *)bundleString:(NSString *)key{
    NSBundle *bundle = [self.class bundleInFramework:@"TestLib.framework" bundleName:@"TestLib.bundle"];
    NSString *testString = NSLocalizedStringFromTableInBundle(key, @"PodInterLong", bundle, nil);
    return testString;
}

/**
 *  读取framework中的bundle
 *
 *  @param framework  bundle所在的framewok的名称
 *  @param bundleName bundle的名称
 *
 *  @return 如果存在则返回bundle,不存在则返回nil
 */
+ (NSBundle *)bundleInFramework:(NSString *)framework bundleName:(NSString *)bundleName {
    
    if ([framework length] == 0 || [bundleName length] == 0) {
        return nil;
    }
    
    NSString *tempFramework = [framework copy];
    NSString *frameExtension = @".framework";
    if (![framework hasSuffix:frameExtension]) {
        tempFramework = [framework stringByAppendingString:frameExtension];
    }
    NSString *tempBundle = [bundleName copy];
    NSString *bundleExtension = @".bundle";
    if (![bundleName hasSuffix:bundleExtension]) {
        tempBundle = [bundleName stringByAppendingString:bundleExtension];
    }
    
    NSString*path =  [[[NSBundle mainBundle] privateFrameworksPath] stringByAppendingPathComponent:framework];
    NSBundle *bundle = [NSBundle bundleWithPath:[path stringByAppendingPathComponent:tempBundle]];
    return bundle;
}

@end
