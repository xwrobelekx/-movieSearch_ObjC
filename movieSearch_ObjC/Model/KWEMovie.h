//
//  KWEMovie.h
//  movieSearch_ObjC
//
//  Created by Kamil Wrobel on 9/21/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWEMovie : NSObject

NS_ASSUME_NONNULL_BEGIN

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) NSNumber *rating;
@property (nonatomic, readonly, copy) NSString *overView;
@property (nonatomic, readonly, copy) NSString *posterUrlComponent;

NS_ASSUME_NONNULL_END

@end

//FIXME: - What is "(JSONConvertible)"? - is it just a mark to let other know that this if for converting the JSON file?
@interface KWEMovie (JSONConvertible)

-(instancetype)initWithResultDictionary: (NSDictionary *)singleResultDictionary;

@end
