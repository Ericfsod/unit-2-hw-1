//
//  FSViewController.m
//  TalkinToTheNet
//
//  Created by Eric Sanchez on 9/27/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

#import "FSViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import "FourSquareTableViewController.h"

@interface FSViewController ()

@end

@implementation FSViewController
GMSMapView *mapView_;

//Create a GMSCameraPosition object that specifies the center and zoom level of the map. When you instantiate the GMSMapView object, you must pass the GMSCameraPosition object as a required parameter.

- (void)loadView {
	GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:1.285
															longitude:103.848
																 zoom:12];
	mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
	self.view = mapView_;
	mapView_.mapType = kGMSTypeSatellite;
}

@end

