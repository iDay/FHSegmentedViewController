//
//  MasterViewController.m
//  FHSegmentedViewControllerDemo
//
//  Created by Johnny iDay on 13-12-29.
//  Copyright (c) 2013年 Johnny iDay. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addSubViewController:)];

    [self setViewControllers:@[[self.storyboard instantiateViewControllerWithIdentifier:@"firstSubViewController"], [self.storyboard instantiateViewControllerWithIdentifier:@"secondSubViewController"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSubViewController:(id)sender
{
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"firstSubViewController"];
    [self pushViewController:viewController title:@"New"];
}

@end
