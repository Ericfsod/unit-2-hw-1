//
//  FourSquareTableViewController.m
//  TalkinToTheNet
//
//  Created by Eric Sanchez on 9/27/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "FourSquareTableViewController.h"
#import "AFNetworking.h"

@interface MyObject : NSObject

@property (nonatomic) NSUInteger ObjectID;

+ (instancetype)anObject;
- (instancetype)init;

@end

@implementation MyObject

+ (instancetype)anObject
{
    MyObject *o = [[MyObject alloc] init];
    return o;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.ObjectID = 1;
    }
    
    return self;
}

@end

@interface FourSquareTableViewController ()

@end

@implementation FourSquareTableViewController

-(void)makeVenueRequest {
    
	NSURL *url = [NSURL URLWithString:@"https://api.foursquare.com/v2/venues/"];
    
    // Convenience constructor
    NSURLRequest *URLRequest = [NSURLRequest requestWithURL:url];
   
    // Instance
    // NSURLRequest *test = [[NSURLRequest alloc] initWithURL:url];
    
    
    //AFNetworking url request
    // Need an instance of NSURLRequest...
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:URLRequest];
	[operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"REQUEST SUCCEEDED");
        
        NSDictionary* d = (NSDictionary *)responseObject; // Typecast: Tell the compiler to interpret this type as requested
        // (Desired Type *)actualType
        
        // If dictionary contains this key "venueName"
        if (d[@"venueName"]) {
            // Extract the data for the key "venueName"
        }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"REQUEST Failed with Error %@", error.localizedDescription);
    }];
    
    [operation start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

@end
