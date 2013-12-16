//
//  BTSCoreDataManger.m
//  Chat
//
//  Created by iButs on 12/9/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import "BTSCoreDataManger.h"
#import "BTS2AppDelegate.h"
#import "Message.h"
#import "NetMessage.h"
@implementation BTSCoreDataManger
@synthesize managedObjectContex = _managedObjectContex;

-(NSManagedObjectContext *)managedObjectContex
{
    return [(BTS2AppDelegate*) [[UIApplication sharedApplication] delegate] managedObjectContext];
}

+(BTSCoreDataManger *)sharedInstance
{
    static BTSCoreDataManger *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super alloc] initUniqueInstance];
    });
    return sharedInstance;
}

-(instancetype) initUniqueInstance {
    return [super init];
}

-(void)saveData
{
    [self.managedObjectContex save:nil];
}

-(void)deleteAllObjects
{

    NSArray* objects =[self allObjectsFromCoreData];
    for (NSManagedObject *object in objects) {
        [self.managedObjectContex deleteObject:object];
    }
    [self saveData];
}

-(NSArray*)allObjectsFromCoreData
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"BTSMessage"];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES]];
    NSArray *result = [self.managedObjectContex executeFetchRequest:fetchRequest error:nil];
    return result;
}

-(void)setNewMessageWithID:(NSManagedObjectID*) anId withName:(NSString*) aName withText:(NSString*) aText withTime:(NSDate*) aTime andWithMine:(BOOL) isMine
{
    NSManagedObject *newMessage = [NSEntityDescription insertNewObjectForEntityForName:@"BTSMessage" inManagedObjectContext:self.managedObjectContex];
    [newMessage setValue:anId forKey:@"ident"];
    [newMessage setValue:aName forKey:@"nickname"];
    [newMessage setValue:aText forKey:@"text"];
    [newMessage setValue:aTime forKey:@"date"];
    [newMessage setValue:[NSNumber numberWithBool:isMine] forKey:@"isMine"];
    [self saveData];


}
-(void)setNewMessageWithMessage:(NetMessage*) message
{
    NSManagedObject *newMessage = [NSEntityDescription insertNewObjectForEntityForName:@"BTSMessage" inManagedObjectContext:self.managedObjectContex];
    [newMessage setValue:message.ident forKey:@"ident"];
    [newMessage setValue:message.nickname forKey:@"nickname"];
    [newMessage setValue:message.text forKey:@"text"];
    [newMessage setValue:message.date forKey:@"date"];
    [newMessage setValue:message.isMine forKey:@"isMine"];
    [self saveData];
}
@end
