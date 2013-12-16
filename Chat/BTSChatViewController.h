//
//  BTSChatViewController.h
//  Chat
//
//  Created by iButs on 12/9/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Network.h"
@class BTSCoreDataManger;

@interface BTSChatViewController : UITableViewController<NetworkDelegate>
@property (strong, nonatomic) Network* bot;
@property (strong, nonatomic) BTSCoreDataManger *coreDataManager;
@property (strong, nonatomic) NSArray *messages;
@end
