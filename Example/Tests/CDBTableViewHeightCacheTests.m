

#import <XCTest/XCTest.h>

@import CDBTableViewHeightCache;


typedef NS_ENUM(NSUInteger, CDBCacheTestAction) {
    CDBCacheTestActionUndefined = 0,
    CDBCacheTestActionAddRow = 1,
    CDBCacheTestActionInsertRow = 2,
    CDBCacheTestActionRefreshRow = 3,
    CDBCacheTestActionDeleteRow = 4,
    CDBCacheTestActionAddSection = 5,
    CDBCacheTestActionInsertSection = 6,
    CDBCacheTestActionDeleteSection = 7,
    CDBCacheTestActionClearCache = 8
};


@interface CDBTableViewHeightCacheTests : XCTestCase

@end

@implementation CDBTableViewHeightCacheTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testRunOfHeightCache {
    CDBTableViewHeightCache * cache = [CDBTableViewHeightCache new];
    NSMutableArray * mockHeightsStorage = [NSMutableArray array];
    
    for (NSInteger cycle = 0; cycle <= 50000; ++cycle) {
        CDBCacheTestAction action = [self requestNextAction];
        switch (action) {
            case CDBCacheTestActionAddRow: {
            }
                break;
            case CDBCacheTestActionRefreshRow: {
            }
                break;
            case CDBCacheTestActionInsertRow: {
            }
                break;
            case CDBCacheTestActionDeleteRow: {
            }
                break;
            case CDBCacheTestActionAddSection: {
                [self addSectionToCache:cache
                       usingMockStorage:mockHeightsStorage];
            }
                break;
            case CDBCacheTestActionInsertSection: {
                [self insertSectionToCache:cache
                          usingMockStorage:mockHeightsStorage];
            }
                break;
            case CDBCacheTestActionDeleteSection: {
                [self deleteSectionFromCache:cache
                            usingMockStorage:mockHeightsStorage];
            }
                break;
                
            default:
                break;
        }
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma mark helper methods

- (CDBCacheTestAction)requestNextAction {
    CDBCacheTestAction result = CDBCacheTestActionUndefined;
    
    static NSInteger cacheTestActionAddRowCounter = 0;
    static NSInteger cacheTestActionRefreshRowCounter = 0;
    static NSInteger cacheTestActionInsertCounter = 0;
    static NSInteger cacheTestActionDeleteRowCounter = 0;
    static NSInteger cacheTestActionAddSectionCounter = 0;
    static NSInteger cacheTestActionInsertSectionCounter = 0;
    static NSInteger cacheTestActionDeleteSectionCounter = 0;
    
    do {
        result = arc4random_uniform(CDBCacheTestActionClearCache);
        switch (result) {
            case CDBCacheTestActionAddRow: {
                cacheTestActionAddRowCounter++;
                if (cacheTestActionAddRowCounter < 3) {
                    result = CDBCacheTestActionUndefined;
                } else {
                    cacheTestActionAddRowCounter = 0;
                }
            }
                break;
            case CDBCacheTestActionRefreshRow: {
                cacheTestActionRefreshRowCounter++;
                if (cacheTestActionRefreshRowCounter < 10) {
                    result = CDBCacheTestActionUndefined;
                } else {
                    cacheTestActionRefreshRowCounter = 0;
                }
            }
                break;
            case CDBCacheTestActionInsertRow: {
                cacheTestActionInsertCounter++;
                if (cacheTestActionInsertCounter < 20) {
                    result = CDBCacheTestActionUndefined;
                } else {
                    cacheTestActionInsertCounter = 0;
                }
            }
                break;
            case CDBCacheTestActionDeleteRow: {
                cacheTestActionDeleteRowCounter++;
                if (cacheTestActionDeleteRowCounter < 10) {
                    result = CDBCacheTestActionUndefined;
                } else {
                    cacheTestActionDeleteRowCounter = 0;
                }
            }
                break;
            case CDBCacheTestActionAddSection: {
                cacheTestActionAddSectionCounter++;
                if (cacheTestActionAddSectionCounter < 50) {
                    result = CDBCacheTestActionUndefined;
                } else {
                    cacheTestActionAddSectionCounter = 0;
                }
            }
                break;
            case CDBCacheTestActionInsertSection: {
                cacheTestActionInsertSectionCounter++;
                if (cacheTestActionInsertSectionCounter < 70) {
                    result = CDBCacheTestActionUndefined;
                } else {
                    cacheTestActionInsertSectionCounter = 0;
                }
            }
                break;
            case CDBCacheTestActionDeleteSection: {
                cacheTestActionDeleteSectionCounter++;
                if (cacheTestActionDeleteSectionCounter < 100) {
                    result = CDBCacheTestActionUndefined;
                } else {
                    cacheTestActionDeleteSectionCounter = 0;
                }
            }
                break;
                
            default:
                break;
        }
    } while (result == CDBCacheTestActionUndefined);
    
    return result;
}

- (CGFloat)requestRandomHeight {
    CGFloat result = (CGFloat)arc4random_uniform(1000);
    return result;
}

#pragma mark Sections logic

- (void)addSectionToCache:(CDBTableViewHeightCache *)cache
         usingMockStorage:(NSMutableArray *)storage {
    NSInteger addSectionIndex = storage.count;
    [storage addObject:[NSMutableArray new]];
    [cache insertSectionAtIndex:addSectionIndex];
    
    [self verifySectionsInCache:cache
               usingMockStorage:storage];
}

- (void)insertSectionToCache:(CDBTableViewHeightCache *)cache
            usingMockStorage:(NSMutableArray *)storage {
    NSInteger sectionsCount = storage.count;
    NSUInteger insertSectionIndex = (NSUInteger)arc4random_uniform(sectionsCount);
    [storage insertObject:[NSMutableArray new]
                  atIndex:insertSectionIndex];
    [cache insertSectionAtIndex:insertSectionIndex];
    
    [self verifySectionsInCache:cache
               usingMockStorage:storage];
}

- (void)deleteSectionFromCache:(CDBTableViewHeightCache *)cache
              usingMockStorage:(NSMutableArray *)storage {
    NSInteger sectionsCount = storage.count;
    NSUInteger deleteSectionIndex = (NSUInteger)arc4random_uniform(sectionsCount);
    [storage removeObjectAtIndex:deleteSectionIndex];
    [cache deleteSectionAtIndex:deleteSectionIndex];
    
    [self verifySectionsInCache:cache
               usingMockStorage:storage];
}

- (void)verifySectionsInCache:(CDBTableViewHeightCache *)cache
             usingMockStorage:(NSMutableArray *)storage  {
    [storage enumerateObjectsUsingBlock:^(NSMutableArray * section, NSUInteger idx, BOOL * _Nonnull stop) {
        NSUInteger shouldBeRowsCount = section.count;
        NSUInteger hasRowsCount = [cache numberOfRowsInSection:idx];
        XCTAssertTrue(shouldBeRowsCount == hasRowsCount,
                      @"Section at index %@ should be %@ rows but has %@",
                      @(idx),
                      @(shouldBeRowsCount),
                      @(hasRowsCount));
    }];
}

@end
