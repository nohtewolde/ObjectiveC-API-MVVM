//
//  ItemListVC.h
//  ObjectiveC-API-MVVM
//
//  Created by Noh Tewolde on 4/25/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemListVC : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
