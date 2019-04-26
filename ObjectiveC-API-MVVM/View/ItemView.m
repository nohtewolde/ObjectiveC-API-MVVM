//
//  ItemView.m
//  ObjectiveC-API-MVVM
//
//  Created by Noh Tewolde on 4/25/19.
//  Copyright © 2019 Noh Tewolde. All rights reserved.
//

#import "ItemView.h"
#import "ItemModel.h"
@implementation ItemView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCell:(ItemModel *)item {
    self.identifier.text = item.identifier.stringValue;
    self.title.text = item.title;
    self.userID.text = item.userID.stringValue;
    self.body.text = item.body;
}

@end
