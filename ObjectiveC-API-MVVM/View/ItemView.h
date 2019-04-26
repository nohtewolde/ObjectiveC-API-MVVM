//
//  ItemView.h
//  ObjectiveC-API-MVVM
//
//  Created by Noh Tewolde on 4/25/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemView : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *userID;
@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *body;

- (void)updateCell:(ItemModel *)item;

@end

NS_ASSUME_NONNULL_END
