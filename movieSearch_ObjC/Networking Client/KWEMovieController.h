//
//  KWEMovieController.h
//  movieSearch_ObjC
//
//  Created by Kamil Wrobel on 9/21/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWEMovieController : NSObject

+(KWEMovieController *)shared;

-(void)fetchMovieData: (NSString *)movieName completion:(void(^)(BOOL))completion;

@property (nonatomic, copy) NSMutableArray *searchResults;


@end
