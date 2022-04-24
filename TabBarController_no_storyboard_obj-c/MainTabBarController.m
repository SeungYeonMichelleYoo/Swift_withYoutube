//
//  MainTabBarController.m
//  TabBarController_no_storyboard_obj-c
//
//  Created by SeungYeon Yoo on 2022/04/24.
//

#import "MainTabBarController.h"
#import "MyViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"MainTabBarController - ViewDidLoad() called");
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    MyViewController * firstMyVC = [[MyViewController alloc] initWithParams:@"첫번째" bgColor:[UIColor redColor]];
    MyViewController * secondMyVC = [[MyViewController alloc] initWithParams:@"두번째" bgColor:[UIColor yellowColor]];
    MyViewController * thirdMyVC = [[MyViewController alloc] initWithParams:@"세번째" bgColor:[UIColor orangeColor]];
    MyViewController * forthMyVC = [[MyViewController alloc] initWithParams:@"네번째" bgColor:[UIColor greenColor]];
    MyViewController * fifthMyVC = [[MyViewController alloc] initWithParams:@"다섯번째" bgColor:[UIColor purpleColor]];
    
    UINavigationController * firstNC = [[UINavigationController alloc] initWithRootViewController: firstMyVC];
    UINavigationController * secondNC = [[UINavigationController alloc] initWithRootViewController: secondMyVC];
    UINavigationController * thirdNC = [[UINavigationController alloc] initWithRootViewController: thirdMyVC];
    UINavigationController * forthNC = [[UINavigationController alloc] initWithRootViewController: forthMyVC];
    UINavigationController * fifthNC = [[UINavigationController alloc] initWithRootViewController: fifthMyVC];

    
    UITabBarItem * firstTabBarItem = [[UITabBarItem alloc] initWithTitle:@"첫번째" image:[UIImage systemImageNamed:@"folder.fill"] tag:0];
    UITabBarItem * secondTabBarItem = [[UITabBarItem alloc] initWithTitle:@"두번째" image:[UIImage systemImageNamed:@"square.and.arrow.down.fill"] tag:1];
    UITabBarItem * thirdTabBarItem = [[UITabBarItem alloc] initWithTitle:@"세번째" image:[UIImage systemImageNamed:@"paperplane.fill"] tag:2];
    UITabBarItem * forthTabBarItem = [[UITabBarItem alloc] initWithTitle:@"네번째" image:[UIImage systemImageNamed:@"book.fill"] tag:3];
    UITabBarItem * fifthTabBarItem = [[UITabBarItem alloc] initWithTitle:@"다섯번째" image:[UIImage systemImageNamed:@"smoke.fill"] tag:4];
    
    firstNC.tabBarItem = firstTabBarItem;
    secondNC.tabBarItem = secondTabBarItem;
    thirdNC.tabBarItem = thirdTabBarItem;
    forthNC.tabBarItem = forthTabBarItem;
    fifthNC.tabBarItem = fifthTabBarItem;
    
    
    // 배열 준비
    NSMutableArray * ncArray = [NSMutableArray array];
    
    [ncArray addObject:firstNC];
    [ncArray addObject:secondNC];
    [ncArray addObject:thirdNC];
    [ncArray addObject:forthNC];
    [ncArray addObject:fifthNC];
    
    self.viewControllers = ncArray;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
