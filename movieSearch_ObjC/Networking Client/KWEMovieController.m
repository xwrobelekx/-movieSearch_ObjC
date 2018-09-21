//
//  KWEMovieController.m
//  movieSearch_ObjC
//
//  Created by Kamil Wrobel on 9/21/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import "KWEMovieController.h"
#import "KWEMovie.h"

@implementation KWEMovieController


static NSString *baseURLAsString = @"https://api.themoviedb.org/3/search/movie";



//MARK: - Shared Instance
+(KWEMovieController *)shared
{
    static KWEMovieController *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [KWEMovieController new];
    });
    return shared;
    
}

//MARK: - Source of Truth





//MARK: - Fetch Method
-(void)fetchMovieData: (NSString *)movieName completion:(void(^)(NSArray<KWEMovie *> * _Nullable movie))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLAsString];
    
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *apiKeyQuerryItem = [[NSURLQueryItem alloc] initWithName: @"api_key" value: @"df27e0c0e10e50e785b375686ccc7895"];
    NSURLQueryItem *searchTermQuerryItem = [[NSURLQueryItem alloc]initWithName: @"query" value: movieName];
    components.queryItems = @[apiKeyQuerryItem, searchTermQuerryItem];
    
    NSLog(@"🏁🏁🏁 %@    ", [components URL]);
    
    
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL: [components URL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error){
            NSLog(@"Error in %s, %@, %@", __PRETTY_FUNCTION__, error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSLog(@"🔊response: %@", response);
        
        if (!data){
            NSLog(@"NO DATA AVAILABLE");
            completion(nil);
            return;
        }
        
       NSDictionary *topLevelJSONDictionary = [NSJSONSerialization JSONObjectWithData : data options : NSJSONReadingAllowFragments error : &error];
        if (topLevelJSONDictionary == nil) {
            NSLog(@"TOP LEVEL JSON DICTIONARY IS EMPTY");
            completion(nil);
            return;
        }
        
        //FIXME: - Idk if this is good - should i allocate the array frist?
        NSMutableArray *resultsArray = topLevelJSONDictionary[@"results"];
        NSMutableArray<KWEMovie *> *results = [[NSMutableArray alloc] init];
        
        for (NSDictionary *allResults in resultsArray){
            KWEMovie *singleResult = [[KWEMovie alloc] initWithResultDictionary: allResults];
            [results addObject : singleResult];
        }
        
//        self.searchResults = results;
//        self.searchResults = resultsArray;
        completion(results);
    
    }];
    [dataTask resume];
}






















@end
