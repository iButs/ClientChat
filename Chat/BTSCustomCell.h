//
//  BTSCustomCell.h
//  Chat
//
//  Created by iButs on 12/9/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"

@interface BTSCustomCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UITextView *textField;
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *userName;
@property (strong, nonatomic) IBOutlet UILabel *messageTime;
@property (strong, nonatomic) Message* currentMessage;
- (BTSCustomCell *)customCellFromMessage:(Message*) aMessage WithTableView:(UITableView *)tableView;
- (id) initCustomCellWithTable:(UITableView *)tableView withIdentifer:(NSString *)identifer;
@end
