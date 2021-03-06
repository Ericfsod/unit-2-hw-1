//
//  FourSquareTableViewController.m
//  TalkinToTheNet
//
//  Created by Eric Sanchez on 9/27/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "FourSquareTableViewController.h"
#import "FSViewController.h"
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>
#import "Venue.h"
@import GoogleMaps;





@interface FourSquareTableViewController ()

<UITableViewDataSource,
UITableViewDelegate,
UITextViewDelegate,
CLLocationManagerDelegate>

@property (nonatomic) NSMutableArray *dataSource;



@end

@implementation FourSquareTableViewController


-(void)makeVenueRequest {
	
	//NSURL *url = [NSURL URLWithString:@"https://api.foursquare.com/v2/venues/40a55d80f964a52020f31ee3"];
	
	// Convenience constructor
	//NSURLRequest *URLRequest = [NSURLRequest requestWithURL:url];
	
	// Instance
	// NSURLRequest *test = [[NSURLRequest alloc] initWithURL:url];
	
	AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
	[manager GET:@"https://api.foursquare.com/v2/venues/search?client_id=M52XSJPJX2XO4DBE1SFGRDXSHZCAMWEAHL10OTBZM3SYLEFW&client_secret=QBOBMEZR3WBFOPMKGF5DUNG3UFSLRY2Y045Z5SE0HJ0NRGLY&v=20130815&ll=40.7,-74&query=icecream" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
		// this code gets called when the request is successful
		NSLog(@"Success %@", responseObject);
		//responseObject is the json results
		
		NSDictionary *responseDictionary = [responseObject valueForKey:@"response"];
		NSLog(@"response %@", responseDictionary);
		//responseDictionary is printing out the dictionary for string "response" in json results
		
		NSArray *venues = [responseDictionary valueForKey:@"venues"];
		NSLog(@"%@", venues);
		//printing out the venues dictionary in json results and storing it in array
	
		
		for (int i = 0; i < venues.count - 1; i++) {
			NSDictionary *venueDictionary = [venues objectAtIndex:i];
			Venue *venue = [[Venue alloc] init];
			venue.name = [venueDictionary valueForKey:@"name"];
			venue.latitude = [venueDictionary valueForKey:@"lat"];
			venue.longitude = [venueDictionary valueForKey:@"lng"];
			
			//looping through venue dictionary and adding venue to datasource
			
			[self.dataSource addObject:venue];
			//here's where venue is added to datasource.
		}
		
		[self.tableView reloadData];
		
	} failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
		// this code gets called when there's an error
		NSLog(@"Failure");
	}];
	
}

- (void) viewDidLoad {
	[super viewDidLoad];
	
	self.dataSource = [[NSMutableArray alloc] init];
	[self makeVenueRequest];
	//initializing datasource in memory
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
	return self.dataSource.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
	Venue *venue = [self.dataSource objectAtIndex:indexPath.row];
	cell.textLabel.text = venue.name;
	//grabbing venues from the datasource and getting the name to print in cell. Awesome.
	
	return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
	
	
	}

@end
