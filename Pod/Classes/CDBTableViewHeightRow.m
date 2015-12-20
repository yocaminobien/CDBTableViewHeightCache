

#import "CDBTableViewHeightRow.h"


#define NSACachedHeightDefault 0.0f


@interface CDBTableViewHeightRow ()

@property (assign, nonatomic, readwrite) CGFloat height;
@property (assign, nonatomic, readwrite, getter=isDetermined) BOOL determined;

@end


@implementation CDBTableViewHeightRow

#pragma mark - Class -

+ (instancetype)rowWithHeight:(CGFloat)height {
    CDBTableViewHeightRow * result = [[CDBTableViewHeightRow alloc] init];
    result.height = height;
    result.determined = YES;
    return result;
}

+ (instancetype)emptyRow {
    CDBTableViewHeightRow * result = [[CDBTableViewHeightRow alloc] init];
    result.height = NSACachedHeightDefault;
    result.determined = NO;
    return result;
}

#pragma mark - Private -

- (void)clearHeight {
    self.height = NSACachedHeightDefault;
    self.determined = NO;
}

- (void)registerHeight:(CGFloat)height {
    self.height = height;
    self.determined = YES;
}

@end
