

#if __has_feature(objc_modules)
    @import Foundation;
    @import UIKit;
#else
    #import <Foundation/Foundation.h>
    #import <UIKit/UIKit.h>
#endif

#import "CDBTableViewHeightRow.h"


@interface CDBTableViewHeightCache : NSObject

@property (assign, nonatomic, readonly) NSUInteger sectionsCount;

/**
 use it on delete section event
 **/

- (void)deleteSectionAtIndex:(NSInteger)index;

/**
 use it on insert section event
 **/

- (void)insertSectionAtIndex:(NSInteger)index;

/**
 use it to get number of rows in section
 **/

- (NSUInteger)numberOfRowsInSection:(NSInteger)index;

/**
 use it on delete row event
 **/

- (void)deleteHeightAtIndexPath:(NSIndexPath * _Nonnull)indexPath;

/**
 use it on insert row event
 **/

- (void)insertEmptyHeightAtIndexPath:(NSIndexPath * _Nonnull)indexPath ;

/**
 use it on change row event
 **/

- (void)setEmptyHeightAtIndexPath:(NSIndexPath * _Nonnull)indexPath;

/**
 use it to store calculated value
 **/

- (void)setHeight:(CGFloat)height
     forIndexPath:(NSIndexPath * _Nonnull)indexPath;

/**
 use it to request cached row
 **/

- (CDBTableViewHeightRow * _Nullable)heightRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;

/**
 use it to handle reload data
 **/

- (void)clearCache;

@end
