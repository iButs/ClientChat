//
//  NetMessage.m
//  Chat
//
//  Created by iButs on 12/10/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "NetMessage.h"

@implementation NetMessage

@synthesize isMine;
@synthesize date;
@synthesize text;
@synthesize nickname;
@synthesize ident;

-(NetMessage*)init
{
    self = [super init];
    self.date = [[NSDate alloc]init];
    self.text = [NSString alloc];
    self.nickname = [[NSString alloc]init];
    self.ident = [[NSNumber alloc]init];
    return self;
}


//-(void)dealloc
//{
//    self.text = nil;
//    self.date = nil;
//}

@end
