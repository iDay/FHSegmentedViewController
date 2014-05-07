//
//  KPSegmentedViewController.m
//  KPKuaiPai
//
//  Created by Johnny iDay on 13-12-14.
//  Copyright (c) 2013年 Johnny iDay. All rights reserved.
//

#import "FHSegmentedViewController.h"

@interface FHSegmentedViewController () {
    CGRect containerFrame;
}

@end

@implementation FHSegmentedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
	
- (void)viewDidLayoutSubviews
{
	[super viewDidLayoutSubviews];

	containerFrame = _viewContainer.frame;
	for (UIViewController *childViewController in self.childViewControllers) {
		childViewController.view.frame = (CGRect){0,0,containerFrame.size};
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if (!_segmentedControl) {
        _segmentedControl = [[UISegmentedControl alloc] init];
        _segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
        self.navigationItem.titleView = _segmentedControl;
    } else {
        [_segmentedControl removeAllSegments];
    }
    [_segmentedControl addTarget:self action:@selector(segmentedControlSelected:) forControlEvents:UIControlEventValueChanged];
    if (!_viewContainer) {
        [self setViewContainer:self.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewContainer:(UIView *)viewContainer
{
    _viewContainer = viewContainer;
    containerFrame = _viewContainer.frame;
}

- (void)setViewControllers:(NSArray *)viewControllers titles:(NSArray *)titles
{
    if ([_segmentedControl numberOfSegments] > 0) {
        return;
    }
    for (int i = 0; i < [viewControllers count]; i++) {
        [self pushViewController:viewControllers[i] title:titles[i]];
    }
    [_segmentedControl setSelectedSegmentIndex:0];
    self.selectedViewControllerIndex = 0;
}

- (void)setViewControllers:(NSArray *)viewControllers imagesNamed:(NSArray *)imageNames {
	if ([_segmentedControl numberOfSegments] > 0) {
		return;
	}
	for (int i = 0; i < [viewControllers count]; i++) {
		[self pushViewController:viewControllers[i] imageNamed:imageNames[i]];
	}
	[_segmentedControl setSelectedSegmentIndex:0];
	self.selectedViewControllerIndex = 0;
}

- (void)setViewControllers:(NSArray *)viewControllers images:(NSArray *)images {
	if ([_segmentedControl numberOfSegments] > 0) {
		return;
	}
	for (int i = 0; i < [viewControllers count]; i++) {
		[self pushViewController:viewControllers[i] image:images[i]];
	}
	[_segmentedControl setSelectedSegmentIndex:0];
	self.selectedViewControllerIndex = 0;
}

- (void)setViewControllers:(NSArray *)viewControllers
{
    if ([_segmentedControl numberOfSegments] > 0) {
        return;
    }
    for (int i = 0; i < [viewControllers count]; i++) {
        [self pushViewController:viewControllers[i] title:[viewControllers[i] title]];
    }
    [_segmentedControl setSelectedSegmentIndex:0];
    self.selectedViewControllerIndex = 0;
}

- (void)pushViewController:(UIViewController *)viewController
{
    [self pushViewController:viewController title:viewController.title];
}
- (void)pushViewController:(UIViewController *)viewController title:(NSString *)title
{
    [_segmentedControl insertSegmentWithTitle:title atIndex:_segmentedControl.numberOfSegments animated:NO];
    [self addChildViewController:viewController];
    [_segmentedControl sizeToFit];
}

- (void)pushViewController:(UIViewController *)viewController imageNamed:(NSString *)imageName
{
	[_segmentedControl insertSegmentWithImage:[UIImage imageNamed:imageName] atIndex:_segmentedControl.numberOfSegments animated:NO];
	[self addChildViewController:viewController];
	[_segmentedControl sizeToFit];
}

- (void)pushViewController:(UIViewController *)viewController image:(UIImage *)image {
	[_segmentedControl insertSegmentWithImage:image atIndex:_segmentedControl.numberOfSegments animated:NO];
	[self addChildViewController:viewController];
	[_segmentedControl sizeToFit];
}

- (void)segmentedControlSelected:(id)sender
{
    self.selectedViewControllerIndex = _segmentedControl.selectedSegmentIndex;
}

- (void)setSelectedViewControllerIndex:(NSInteger)index
{
    if (!_selectedViewController) {
        _selectedViewController = self.childViewControllers[index];
        [_viewContainer addSubview:[_selectedViewController view]];
        [_selectedViewController didMoveToParentViewController:self];
    } else if (index != _selectedViewControllerIndex) {
        [self transitionFromViewController:_selectedViewController toViewController:self.childViewControllers[index] duration:0.0f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
            _selectedViewController = self.childViewControllers[index];
            _selectedViewControllerIndex = index;
        }];
    }
	
	[_segmentedControl setSelectedSegmentIndex:index];
}

@end
