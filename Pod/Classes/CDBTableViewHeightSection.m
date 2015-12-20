

#import "CDBTableViewHeightSection.h"
#import "CDBTableViewHeightRow.h"


@interface CDBTableViewHeightSection ()

@property (strong, nonatomic) NSMutableArray<CDBTableViewHeightRow *> * rows;

@end


@implementation CDBTableViewHeightSection

#pragma mark - Public -

- (void)deleteHeightAtIndex:(NSInteger)index {
    if (index >= self.rows.count) {
        return;
    }
    
    [self.rows removeObjectAtIndex:index];
}

- (void)insertEmptyHeightAtIndex:(NSInteger)index {
    if (index >= self.rows.count) {
        [self populateRowsToReachValidIndex:index];
        return;
    }
    
    CDBTableViewHeightRow * emptyRow = [CDBTableViewHeightRow emptyRow];
    [self.rows insertObject:emptyRow
                    atIndex:index];
}

- (void)setEmptyHeightAtIndex:(NSInteger)index {
    CDBTableViewHeightRow * row = [self validHeightRowAtIndex:index];
    [row clearHeight];
}

- (void)setHeight:(CGFloat)height
         forIndex:(NSInteger)index {
    CDBTableViewHeightRow * row = [self validHeightRowAtIndex:index];
    [row registerHeight:height];
}

- (CDBTableViewHeightRow * _Nullable)heightRowAtIndex:(NSInteger)index {
    if (index >= self.rows.count) {
        return nil;
    }
    
    CDBTableViewHeightRow * result = self.rows[index];
    return result;
}

#pragma mark - Private -

- (CDBTableViewHeightRow * _Nullable)validHeightRowAtIndex:(NSInteger)index {
    if (index >= self.rows.count) {
        [self populateRowsToReachValidIndex:index];
    }
    
    CDBTableViewHeightRow * result = self.rows[index];
    return result;
}

- (void)populateRowsToReachValidIndex:(NSInteger)index {
    for (NSInteger count = self.rows.count; count < index + 1; ++count) {
        [self addEmptyRow];
    }
}

- (void)addEmptyRow {
    CDBTableViewHeightRow * emptyRow = [CDBTableViewHeightRow emptyRow];
    [self.rows addObject:emptyRow];
}

- (void)addRowWithHeight:(CGFloat)height {
    CDBTableViewHeightRow * row = [CDBTableViewHeightRow rowWithHeight:height];
    [self.rows addObject:row];
}

#pragma mark - Description -

- (NSString *)description {
    NSString * result = [NSString stringWithFormat:@"%@ has %@ rows;",
                         NSStringFromClass([self class]), @(self.rowsCount)];
    return result;
}

#pragma mark - Property -

#pragma mark Getter

- (NSUInteger)rowsCount {
    NSInteger result = self.rows.count;
    return result;
}

#pragma mark Lazy loading

- (NSMutableArray<CDBTableViewHeightRow *> *)rows {
    if (_rows == nil) {
        _rows = [NSMutableArray new];
    }
    return _rows;
}

@end
