//
//  ANDrawerBaseVC.m
//  Alfanote
//
//  Created by Yallappa Kuntennavar on 6/4/14.
//  Copyright (c) 2014 YPK. All rights reserved.
//

#import "ANDrawerBaseVC.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"

@interface ANDrawerBaseVC ()

@end

@implementation ANDrawerBaseVC

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Dashboard";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self setupLeftMenuButton];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 100.0, 100.0, 30.0)];
    [button setTitle:@"Touch" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didTapBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)didTapBtn:(id)sender
{
    UIViewController *viewController = [[UIViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)setupLeftMenuButton
{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

#pragma mark -
#pragma mark Button Handlers
#pragma mark -

-(void)leftDrawerButtonPress:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

-(void)rightDrawerButtonPress:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideRight animated:YES completion:nil];
}

-(void)doubleTap:(UITapGestureRecognizer*)gesture
{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideLeft completion:nil];
}

-(void)twoFingerDoubleTap:(UITapGestureRecognizer*)gesture
{
    [self.mm_drawerController bouncePreviewForDrawerSide:MMDrawerSideRight completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
