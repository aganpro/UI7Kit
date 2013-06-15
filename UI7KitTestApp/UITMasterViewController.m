//
//  UITMasterViewController.m
//  UIKitExtensionTestApp
//
//  Created by Jeong YunWon on 12. 10. 24..
//  Copyright (c) 2012 youknowone.org. All rights reserved.
//

#import "UITMasterViewController.h"

#import "UITDetailViewController.h"

@interface UITMasterViewController () {
    NSArray *_details;
}

@end

@implementation UITMasterViewController
						
- (void)dealloc
{
    [_details release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(changeTitle:)] autorelease];
    self.navigationItem.rightBarButtonItem = addButton;

    _details = [@[
                @"Detail",
//                @"PreparedCellTable",
                @"Text",
//                @"SubviewTable",
                ] retain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)changeTitle:(id)sender {
//    NSString *title = @"Is this test string can be as long as long cat? Or should I test long long longer cat? Like, caaaaaaaaaaaaaaaaaaaaaaaaaaat? I doubt even there is limitation of lines of title or not. Say, is this become long as much as burst to top and bottom of screen? And how much sentence should I write down to reach the end of the screen? I am not a good author. I feel tired to write this sentences. This can hide OK button not to be closed? Then it would be miserable result for must of developer. I am reaching the point soooooooooooooooon";
    NSString *title = @"Is this test string can be as long as long cat?";
    NSString *message = @"Is this test string can be as long as long cat? I don't know how much it long, but it should be long enough to finish my test.";
    UIAlertView *alertView = [[[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [alertView show];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _details.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [_details :indexPath.row];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    UIImage *originalImage = [UIImage imageNamed:@"UI7TableViewCellDisclosureIndicator"];
    // TEST: UIImage -imageByResizingToSize:
    UIImage *bulletImage = [originalImage imageByResizingToSize:CGSizeMake(15.0, 20.0)];
    cell.imageView.image = bulletImage;

    cell.textLabel.text = [_details :indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"HEADER!";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"FOOTER!";
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.listTableView setEditing:editing animated:animated];
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

@end
