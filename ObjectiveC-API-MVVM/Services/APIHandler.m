//
//  APIHandler.m
//  ObjectiveC-API-MVVM
//
//  Created by Noh Tewolde on 4/26/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

#import "APIHandler.h"

typedef void (^MessageCallback)(id _Nullable result, NSError * _Nullable error);


@implementation APIHandler


+ (void)fetchData:(NSString *)someId callback:(nullable MessageCallback)callback {
    NSString *urlString = @"https://jsonplaceholder.typicode.com/todos/1/posts";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSLog(@"Finsihed fetching data");
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", jsonString);
//        MessageTrack *track = [MessageTrackParser parseJson:json];
//        callback(track, nil);
    }];
    
    [task resume];
}




@end
