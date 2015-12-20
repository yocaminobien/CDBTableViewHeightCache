

#if __has_feature(objc_modules)
    @import Foundation;
    @import UIKit;
#else
    #import <Foundation/Foundation.h>
    #import <UIKit/UIKit.h>
#endif


@interface CDBTableViewHeightRow : NSObject

/**
 use it to request cached value
 **/
@property (assign, nonatomic, readonly) CGFloat height;
/**
 use it to determinate if row has cached value
 **/
@property (assign, nonatomic, readonly, getter=isDetermined) BOOL determined;


+ (instancetype)emptyRow;
+ (instancetype)rowWithHeight:(CGFloat)height;

- (void)registerHeight:(CGFloat)height;
- (void)clearHeight;

@end
