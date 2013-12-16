//
//  Message.h
//  Chat
//
//  Created by iButs on 12/10/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Message : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSNumber * ident;
@property (nonatomic, retain) NSString * nickname;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) NSNumber * isMine;

@end
