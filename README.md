FHSegmentedViewController
==========================
![1](https://raw.github.com/iDay/FHSegmentedViewController/master/1.png)
![2](https://raw.github.com/iDay/FHSegmentedViewController/master/2.png)
![3](https://raw.github.com/iDay/FHSegmentedViewController/master/3.png)

## Requirements

* iOS 6.1+
* ARC

## Installation

#### From [CocoaPods](http://www.cocoapods.org)

`pod 'FHSegmentedViewController'`

#### From source

* Drag the `FHSegmentedViewController` folder to your project

## Getting Started

1. Create a subclass of `FHSegmentedViewController` in your project

````objective-c
#import "FHSegmentedViewController.h"

@interface MasterViewController : FHSegmentedViewController
````

2.Implement `- (void)viewDidLoad`

````objective-c
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setViewControllers:@[[self.storyboard instantiateViewControllerWithIdentifier:@"firstSubViewController"], [self.storyboard instantiateViewControllerWithIdentifier:@"secondSubViewController"]]];
}
````

3. Push an instance of `AnotherViewController`.

````objective-c
    UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"firstSubViewController"];
    [self pushViewController:viewController title:@"anotherViewController"];
````

