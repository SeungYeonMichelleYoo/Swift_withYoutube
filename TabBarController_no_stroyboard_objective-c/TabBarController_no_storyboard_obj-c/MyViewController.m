//
//  ViewController.m
//  TabBarController_no_storyboard_obj-c
//
//  Created by SeungYeon Yoo on 2022/04/24.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (id) initWithParams:(NSString *)title bgColor:(UIColor *)bgColor {
    self.title = title;
    self.view.backgroundColor = bgColor;
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
