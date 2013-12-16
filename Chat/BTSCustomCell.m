//
//  BTSCustomCell.m
//  Chat
//
//  Created by iButs on 12/9/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "BTSCustomCell.h"

@implementation BTSCustomCell
@synthesize userImage;
@synthesize userName;
@synthesize messageTime;
@synthesize textField;
@synthesize currentMessage;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (id) initCustomCellWithTable:(UITableView *)tableView withIdentifer:(NSString *)identifer
{
    BTSCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[BTSCustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
    }
    return cell;
}

- (BTSCustomCell *)customCellFromMessage:(Message*) aMessage WithTableView:(UITableView *)tableView
{
    if ([aMessage.isMine isEqual:@1]){
        self.userImage.image = [UIImage imageNamed:@"Trollface.png"];
        NSLog(@"isMine");
    } else {
        self.userImage.image = [UIImage imageNamed:@"TrollFace2_original.jpg"];
    }
    self.currentMessage = aMessage;
    self.textField.text = currentMessage.text;
    self.userName.text = currentMessage.nickname;
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM dd, yyyy HH:mm"];
    NSString *dateString = [format stringFromDate:currentMessage.date];
    self.messageTime.text = dateString;
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

@end
