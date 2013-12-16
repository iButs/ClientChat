//
//  BTSChatViewController.m
//  Chat
//
//  Created by iButs on 12/9/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "BTSChatViewController.h"
#import "BTSCoreDataManger.h"
#import "BTS2AppDelegate.h"
#import "BTSCustomCell.h"
#import "NetMessage.h"
@interface BTSChatViewController ()

@property (strong, nonatomic) IBOutlet UITextField *messageField;
@property (strong, nonatomic) NSString *currentName;
@property (strong, nonatomic) IBOutlet UIButton *toClearStory;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *toTop;
@end

@implementation BTSChatViewController
@synthesize  coreDataManager;
@synthesize messageField;
@synthesize messages;
@synthesize currentName;
@synthesize toClearStory;
@synthesize toTop;
@synthesize bot;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.bot = [Network new];
    self.bot.delegate = self;
    self.messages = [self.coreDataManager allObjectsFromCoreData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifer = @"Cell";
    Message *object = [self.messages objectAtIndex:(self.messages.count-1)-indexPath.row];
    if ([object.isMine isEqual:@1]){
        cellIdentifer = @"anotherCell";
    }
    BTSCustomCell *cell = [[BTSCustomCell alloc]initCustomCellWithTable:tableView withIdentifer:cellIdentifer];
    return [cell customCellFromMessage:object WithTableView:tableView];

}

-(BTSCoreDataManger*)coreDataManager
{
    return [BTSCoreDataManger sharedInstance];
}

- (IBAction)endOfEditing:(id)sender
{
    NSLog(@"end of typing");

}

- (IBAction)toSend:(id)sender
{
    [self.messageField resignFirstResponder];
    if (![self.messageField.text isEqualToString:@""]){
        NetMessage *tempMessage = [[NetMessage alloc]init];
        tempMessage.text = self.messageField.text;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.bot sendMessage:tempMessage];});
        self.messageField.text = nil;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 130;
}

-(void)reloadTableView
{
    self.messages = [self.coreDataManager allObjectsFromCoreData];
    [self.tableView reloadData];
}

-(void)didSendMessage:(NetMessage *)sentMessage initialMessage:(NetMessage *)message
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.coreDataManager setNewMessageWithMessage:sentMessage];
        [self reloadTableView];
    });
}

-(void)didReceiveMessage:(NetMessage *)message
{
    dispatch_sync(dispatch_get_main_queue(), ^{
        [self.coreDataManager setNewMessageWithMessage:message];
        [self reloadTableView];
    });
}
- (IBAction)clearAllStory:(id)sender
{
    [self.coreDataManager deleteAllObjects];
    [self reloadTableView];
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    if (targetContentOffset->y > 1500)
    {
        self.navigationController.toolbarHidden = NO;
    }else{
        self.navigationController.toolbarHidden = YES;
    }
}

- (IBAction)tabBarButtonIsPressed:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:YES];
    [self.searchDisplayController.searchResultsTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    self.navigationController.toolbarHidden = YES;
}
@end
