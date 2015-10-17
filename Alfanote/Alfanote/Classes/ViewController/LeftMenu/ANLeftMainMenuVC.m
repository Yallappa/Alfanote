//
//  ANLeftMainMenuVC.m
//  Alfanote
//
//  Created by Yallappa Kuntennavar on 6/5/14.
//  Copyright (c) 2014 YPK. All rights reserved.
//

#import "ANLeftMainMenuVC.h"
#import "MMDrawerController.h"
#import "ANDrawerBaseVC.h"

@interface ANLeftMainMenuVC () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *menuTableView;
@property (strong, nonatomic) NSIndexPath *previousSelection;

@property (strong, nonatomic) NSArray *mainMenuOptions;

@end

@implementation ANLeftMainMenuVC

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
 */

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.mainMenuOptions = [NSArray arrayWithObjects:@"Dashboard",
                                                         @"Invoice",
                                                         @"Client",
                                                         @"Expense",
                                                         @"Reports",
                                                         @"Log Out", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.menuTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _menuTableView.dataSource = self;
    _menuTableView.delegate = self;
    [self.view addSubview:_menuTableView];
    
    [_menuTableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_menuTableView deselectRowAtIndexPath:_previousSelection animated:YES];
}

#pragma mark -
#pragma mark UITableViewDataSource
#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _mainMenuOptions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"Main Menu Cell"];
    
    if (!tableViewCell)
    {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Main Menu Cell"];
    }
    
    NSString *imageName = nil;
    
    switch (indexPath.row)
    {
        case eMainMenuItemDashboard:
        {
            imageName = @"leftmenu_dashboard";
            break;
        }
            
        case eMainMenuItemInvoice:
        {
            imageName = @"leftmenu_invoice";
            break;
        }
            
        case eMainMenuItemClient:
        {
            imageName = @"leftmenu_client";
            break;
        }
            
        case eMainMenuItemExpense:
        {
            imageName = @"leftmenu_expense";
            break;
        }
            
        case eMainMenuItemReports:
        {
            imageName = @"leftmenu_report";
            break;
        }
            
        case eMainMenuItemLogout:
        {
            imageName = @"leftmenu_logout";
            break;
        }
            
        default:
            break;
    }
    
    tableViewCell.imageView.image = [UIImage imageNamed:imageName];
    tableViewCell.textLabel.text = [_mainMenuOptions objectAtIndex:indexPath.row];
    
    return tableViewCell;
}

#pragma mark -
#pragma mark UITableViewDelegate
#pragma mark -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:_previousSelection animated:YES];
    
    UIViewController *viewController = [[ANDrawerBaseVC alloc] init];
    
    switch (indexPath.row)
    {
        case eMainMenuItemDashboard:
        {
            
            break;
        }
            
        case eMainMenuItemInvoice:
        {
            
            break;
        }
            
        case eMainMenuItemClient:
        {
            
            break;
        }
            
        case eMainMenuItemExpense:
        {
            
            break;
        }
            
        case eMainMenuItemReports:
        {
            
            break;
        }
            
        case eMainMenuItemLogout:
        {
            viewController = nil;
            break;
        }
            
        default:
            break;
    }
    
    if (viewController)
    {
        viewController.title = [_mainMenuOptions objectAtIndex:indexPath.row];
        UINavigationController *navController = [[MMNavigationController alloc] initWithRootViewController:viewController];
        
        [APP_DELEGATE.drawerController setCenterViewController:navController withCloseAnimation:YES completion:nil];
    }
}

#pragma mark -
#pragma mark Memory Management
#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
