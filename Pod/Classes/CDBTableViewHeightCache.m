

#import "CDBTableViewHeightCache.h"
#import "CDBTableViewHeightSection.h"


@interface CDBTableViewHeightCache ()

@property (strong, nonatomic) NSMutableArray<CDBTableViewHeightSection *> * sections;

@end


@implementation CDBTableViewHeightCache

#pragma mark - Public -

- (void)deleteSectionAtIndex:(NSInteger)index {
    if (index >= self.sections.count) {
        return;
    }
    
    [self.sections removeObjectAtIndex:index];
}

- (void)insertSectionAtIndex:(NSInteger)index {
    if (index >= self.sections.count) {
        [self populateSectionsToReachValidIndex:index];
        return;
    }
    
    [self.sections insertObject:[CDBTableViewHeightSection new]
                        atIndex:index];
}

- (NSUInteger)numberOfRowsInSection:(NSInteger)index {
    if (index >= self.sections.count) {
        return 0;
    }
    CDBTableViewHeightSection * section = [self validSectionAtIndex:index];
    NSUInteger result = section.rowsCount;
    return result;
}

- (void)deleteHeightAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    if (indexPath.section >= self.sections.count) {
        return;
    }
    
    CDBTableViewHeightSection * section = [self validSectionAtIndex:indexPath.section];
    [section deleteHeightAtIndex:indexPath.row];
}

- (void)insertEmptyHeightAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    CDBTableViewHeightSection * section = [self validSectionAtIndex:indexPath.section];
    [section insertEmptyHeightAtIndex:indexPath.row];
}

- (void)setEmptyHeightAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    CDBTableViewHeightSection * section = [self validSectionAtIndex:indexPath.section];
    [section setEmptyHeightAtIndex:indexPath.row];
}

- (void)setHeight:(CGFloat)height
     forIndexPath:(NSIndexPath * _Nonnull)indexPath {
    CDBTableViewHeightSection * section = [self validSectionAtIndex:indexPath.section];
    [section setHeight:height
              forIndex:indexPath.row];
}

- (CDBTableViewHeightRow * _Nullable)heightRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
    if (indexPath.section >= self.sections.count) {
        return nil;
    }
    
    CDBTableViewHeightSection * section = [self validSectionAtIndex:indexPath.section];
    CDBTableViewHeightRow * result = [section heightRowAtIndex:indexPath.row];
    return result;
}

- (void)clearCache {
    [self.sections removeAllObjects];
}

#pragma mark - Private -

- (CDBTableViewHeightSection * _Nonnull)validSectionAtIndex:(NSInteger)index {
    if (index >= self.sections.count) {
        [self populateSectionsToReachValidIndex:index];
    }
    
    CDBTableViewHeightSection * result = self.sections[index];
    return result;
}

- (void)populateSectionsToReachValidIndex:(NSInteger)index {
    for (NSInteger count = self.sections.count; count <= index + 1; ++count) {
        [self addEmptySection];
    }
}

- (void)addEmptySection {
    CDBTableViewHeightSection * section = [CDBTableViewHeightSection new];
    [self.sections addObject:section];
}

#pragma mark - Description -

- (NSString *)description {
    NSString * result = [NSString stringWithFormat:@"%@ has %@ sections:",
                         NSStringFromClass([self class]), @(self.sectionsCount)];
    for (CDBTableViewHeightSection * section in self.sections) {
        result = [result stringByAppendingFormat:@"\n %@", section.description];
    }
    
    return result;
}

#pragma mark - Property -

#pragma mark Getter

- (NSUInteger)sectionsCount {
    NSUInteger result = self.sections.count;
    return result;
}

#pragma mark Lazy loading

- (NSMutableArray<CDBTableViewHeightSection *> *)sections {
    if (_sections == nil) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}

@end

