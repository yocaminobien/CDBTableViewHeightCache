

#if __has_feature(objc_modules)
    @import Foundation;
    @import UIKit;
#else
    #import <Foundation/Foundation.h>
    #import <UIKit/UIKit.h>
#endif


@class CDBTableViewHeightRow;


@interface CDBTableViewHeightSection : NSObject

@property (assign, nonatomic, readonly) NSUInteger rowsCount;

- (void)deleteHeightAtIndex:(NSInteger)index;
- (void)setEmptyHeightAtIndex:(NSInteger)index;
- (void)insertEmptyHeightAtIndex:(NSInteger)index;
- (void)setHeight:(CGFloat)height
         forIndex:(NSInteger)index;

- (CDBTableViewHeightRow * _Nullable)heightRowAtIndex:(NSInteger)index;

@end