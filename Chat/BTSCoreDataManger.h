//
//  BTSCoreDataManger.h
//  Chat
//
//  Created by iButs on 12/9/13.
//  Copyright (c) 2013 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@class NetMessage;

@interface BTSCoreDataManger : NSObject

@property (nonatomic, readonly) NSManagedObjectContext *managedObjectContex;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


-(void)deleteAllObjects;
-(void)saveData;

-(void)setNewMessageWithID:(NSManagedObjectID*) anId withName:(NSString*) aName withText:(NSString*) aText withTime:(NSDate*) aTime andWithMine:(BOOL) isMine;
-(NSArray*)allObjectsFromCoreData;
-(void)setNewMessageWithMessage:(NetMessage*) message;
-(NSManagedObjectContext *)managedObjectContex;
+(BTSCoreDataManger *)sharedInstance;
-(instancetype) initUniqueInstance;
+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));
@end
