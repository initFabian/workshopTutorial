//
//  FeedTableViewController.m
//  
//
//  Created by Fabian Buentello on 9/17/15.
//
//

#import "FeedTableViewController.h"
#import "config.h"
#import "FeedCell.h"
#import "FeedObj.h"
#import "DetailViewController.h"

static NSString * const FeedCellIdentifier = @"FeedCell";
@interface FeedTableViewController () {
    ApiConnect *ApiObj;
}
@property (strong, nonatomic) IBOutlet UIMenuBtn *sideBarMenuBtn;

@end

@implementation FeedTableViewController
@synthesize feedArray;

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_sideBarMenuBtn IconAs:FABars withAction:@selector(revealToggle:)];
    [[self navigationItem] setBackBarButtonItem:_sideBarMenuBtn];
    
    ApiObj = [ApiConnect new];
    feedArray = [NSMutableArray new];
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController ) {
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    [self getFeedData];
    // Initialize the refresh control.
    self.refreshControl = [UIRefreshControl new];
    [self.refreshControl addTarget:self
                            action:@selector(pulledRefresh)
                  forControlEvents:UIControlEventValueChanged];
    self.navigationController.navigationBar.barTintColor = mainColor;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pulledRefresh {
    if (self.refreshControl) {
        
        NSDateFormatter *formatter = [NSDateFormatter new];
        [formatter setDateFormat:@"MMM d, h:mm a"];
        NSString *title = [NSString stringWithFormat:@"Last update: %@", [formatter stringFromDate:[NSDate date]]];
        NSDictionary *attrsDictionary = [NSDictionary dictionaryWithObject:[UIColor lightGrayColor] forKey:NSForegroundColorAttributeName];
        NSAttributedString *attributedTitle = [[NSAttributedString alloc] initWithString:title attributes:attrsDictionary];
        self.refreshControl.attributedTitle = attributedTitle;
        
        [self getFeedData];
    }
}


- (void)getFeedData {
    __block FeedTableViewController *weakSelf = self;
    [ApiObj getDataWithURL:API_URL uponCompletion:^(NSError *error, NSMutableArray *response) {
        if (error) {
            NSLog(@"ERROR:%@",error);
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSMutableArray *tempArr = [NSMutableArray new];
                
                for (int x = 0; x < 10; x++) {
                    NSString *username = [[response objectAtIndex:x] objectForKey:@"username"];
                    NSString *firstname = [[response objectAtIndex:x] objectForKey:@"firstname"];
                    NSString *lastname = [[response objectAtIndex:x] objectForKey:@"lastname"];
                    NSString *aboutText = [[response objectAtIndex:x] objectForKey:@"about"];
                    NSString *imageUrl = [[response objectAtIndex:x] objectForKey:@"picture_large"];
                    FeedObj *obj = [[FeedObj alloc] initWithUserName:username andFirstName:firstname andLastName:lastname andAbout:aboutText andImgURL:imageUrl];
                    [tempArr addObject:obj];
                    
                }
                weakSelf.feedArray = [NSMutableArray arrayWithArray:tempArr];
                [weakSelf.refreshControl endRefreshing];
                // Reload table data
                [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
            });

        }

    }];
}
#pragma mark - Table view data source
- (BOOL)hasImageAtIndexPath:(NSIndexPath *)indexPath {
    FeedObj *item = [self.feedArray objectAtIndex: indexPath.row];
    return item.imageUrl != nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
 
    if (self.feedArray.count > 0) {
        self.tableView.backgroundView = nil;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [activityIndicator stopAnimating];
    } else {
        
        activityIndicator.alpha = 1.0;
        activityIndicator.center = CGPointMake(160, 360);
        activityIndicator.hidesWhenStopped = NO;
        [activityIndicator startAnimating];
        
        self.tableView.backgroundView = activityIndicator;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.feedArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self galleryCellAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Do some stuff when the row is selected
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (FeedCell *)galleryCellAtIndexPath:(NSIndexPath *)indexPath {
    FeedCell *cell = [self.tableView dequeueReusableCellWithIdentifier:FeedCellIdentifier forIndexPath:indexPath];
    [self configureImageCell:cell atIndexPath:indexPath];
    return cell;
}

#pragma mark Configure Cell

- (void)configureImageCell:(FeedCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    FeedObj *currObj = [self.feedArray objectAtIndex:indexPath.row];
    
    [self setUserNameForCell:cell item:currObj];
    [self setSubtitleForCell:cell item:currObj];
    [self setImageForCell:(id)cell item:currObj];
}

- (void)setUserNameForCell:(FeedCell *)cell item:(FeedObj *)item {
    NSString *userName = item.username ?: NSLocalizedString(@"[No Title]", nil);
    [cell.userName setText:userName];
}

- (void)setFullNameForCell:(FeedCell *)cell item:(FeedObj *)item {
    NSString *fullName =  item.fullName ?: NSLocalizedString(@"[No Title]", nil);
    [cell.fullName setText:fullName];
}

- (void)setSubtitleForCell:(FeedCell *)cell item:(FeedObj *)item {
    NSString *aboutText = item.aboutUser ?: item.aboutUser;
    
    // Some subtitles can be really long, so only display the
    // first 200 characters
    if (aboutText.length > 200) {
        aboutText = [NSString stringWithFormat:@"%@...", [aboutText substringToIndex:200]];
    }
    
    [cell.aboutText setText:aboutText];
}

- (void)setImageForCell:(FeedCell *)cell item:(FeedObj *)item {
    [cell.userImage sd_setImageWithURL:[NSURL URLWithString:item.imageUrl]
                      placeholderImage: [UIImage imageNamed:@"placeholder.png"]];
}

#pragma mark - Height for Cell
- (BOOL)isLandscapeOrientation {
    return UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self isLandscapeOrientation]) {
        if ([self hasImageAtIndexPath:indexPath]) {
            return 100.0f;
        } else {
            return 120.0f;
        }
    } else {
        if ([self hasImageAtIndexPath:indexPath]) {
            return 180.0f;
        } else {
            return 155.0f;
        }
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self heightForImageCellAtIndexPath:indexPath];
}

- (CGFloat)heightForImageCellAtIndexPath:(NSIndexPath *)indexPath {
    static FeedCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:FeedCellIdentifier];
    });
    
    [self configureImageCell:sizingCell atIndexPath:indexPath];
    return [self calculateHeightForConfiguredSizingCell:sizingCell];
}

- (CGFloat)calculateHeightForConfiguredSizingCell:(UITableViewCell *)sizingCell {
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.frame), CGRectGetHeight(sizingCell.bounds));
    [sizingCell layoutIfNeeded];
    
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f; // Add 1.0f for the cell separator height
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *DVC = segue.destinationViewController;
        [DVC setPersonObj:[feedArray objectAtIndex:indexPath.row]];
    }
}


@end
