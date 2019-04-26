#import <Foundation/Foundation.h>

@class ItemModel;

NS_ASSUME_NONNULL_BEGIN

typedef NSArray<ItemModel *> ItemModelArray;

#pragma mark - Object interfaces

@interface ItemModel : NSObject
@property (nonatomic, nullable, strong) NSNumber *userID;
@property (nonatomic, nullable, strong) NSNumber *identifier;
@property (nonatomic, nullable, copy)   NSString *title;
@property (nonatomic, nullable, copy)   NSString *body;
@end

NS_ASSUME_NONNULL_END
