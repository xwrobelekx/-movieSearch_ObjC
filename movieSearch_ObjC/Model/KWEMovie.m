//
//  KWEMovie.m
//  movieSearch_ObjC
//
//  Created by Kamil Wrobel on 9/21/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import "KWEMovie.h"

@implementation KWEMovie


@end

@implementation KWEMovie (JSONConvertible)

-(instancetype)initWithResultDictionary: (NSDictionary *)singleResultDictionary
{
    NSString *title = singleResultDictionary[@"title"];
    NSString *overView = singleResultDictionary[@"overview"];
    NSString *posterURLComponent = singleResultDictionary[@"poster_path"];
    NSNumber *rating = singleResultDictionary[@"vote_average"];
    
    
    self = [self init];
    if (self) {
        _title = title;
        _overView = overView;
        _posterUrlComponent = posterURLComponent;
        _rating = rating;
    }
    return self;
}

@end
