//
//  ItemListVC.m
//  ObjectiveC-API-MVVM
//
//  Created by Noh Tewolde on 4/25/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

#import "ItemListVC.h"
#import "ItemView.h"
#import "ItemViewModel.h"
#import "ItemModel.h" //Don't forget to remove it later

@interface ItemListVC ()
{
    ItemViewModel *itemVM;
    NSMutableArray<ItemModel *> *items;
}
@end

@implementation ItemListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self->items = NSMutableArray.new;
    [self fetchItemData];
}

- (void)fetchItemData{
    NSLog(@"Fetching data");
    NSString *urlString = @"https://jsonplaceholder.typicode.com/todos/1/posts";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        NSLog(@"Finsihed fetching data");
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        
//        NSLog(@"%@", jsonString);
        //        MessageTrack *track = [MessageTrackParser parseJson:json];
        //        callback(track, nil);
        for(NSDictionary *itemDict in json){
            ItemModel *item = ItemModel.new;
            item.userID = itemDict[@"userId"];
            item.identifier = itemDict[@"id"];
            item.title = itemDict[@"title"];
            item.body = itemDict[@"body"];
            [self->items addObject:item];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
    
    [task resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"Count: %lu", self->items.count);
    return self->items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ItemView *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    ItemModel * i = self->items[indexPath.row];
    [cell updateCell:i];
    return cell;
}





@end
