//
//  OCPADataModel.h
//  ObjCParentApp
//
//  Created by Steven Troughton-Smith on 02/10/2020.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class OCPAItem;
@interface OCPADataModel : NSObject

@property NSArray <OCPAItem *>*items;

@end

NS_ASSUME_NONNULL_END
