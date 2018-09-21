//
//  KWEMovie.h
//  movieSearch_ObjC
//
//  Created by Kamil Wrobel on 9/21/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWEMovie : NSObject


//title:        String
//poster_path : String -> but needs to be added to url - its not a full image url
//overview :    String
//vote_average: Int


@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) NSInteger rating;
@property (nonatomic, readonly, copy) NSString *overView;
@property (nonatomic, readonly, copy) NSString *posterUrlComponent;

@end

//FIXME: - What is "(JSONConvertible)"? - is it just a mark to let other know that this if for converting the JSON file?
@interface KWEMovie (JSONConvertible)

-(instancetype)initWithResultDictionary: (NSDictionary *)singleResultDictionary;

@end
