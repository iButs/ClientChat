//
//  Message.m
//  Chat
//
//  Created by iButs on 12/10/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "Message.h"


@implementation Message

@dynamic date;
@dynamic ident;
@dynamic nickname;
@dynamic text;
@dynamic isMine;

-(Message*)init
{
    self = [super init];
    return  self;
}

@end
