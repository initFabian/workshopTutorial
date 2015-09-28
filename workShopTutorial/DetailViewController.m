//
//  DetailViewController.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/23/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import "DetailViewController.h"
#import "FeedTableViewController.h"

#warning FIX: Colors
#warning FIX: Buttons(DupCode)
//#import "config.h"
#import "AFNetworking.h" //FIXME: REMOVE ME
#import "NSString+FontAwesome.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButton; //FIXME: UIMenuBtn *backButton
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn; //FIXME: UIIconBtn *phoneBtn
@property (weak, nonatomic) IBOutlet UIButton *emailBtn; //FIXME: UIIconBtn *emailBtn
@property (weak, nonatomic) IBOutlet UIButton *thumbsBtn; //FIXME: UIIconBtn *thumbsBtn
@property (weak, nonatomic) IBOutlet UILabel *aboutText;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;

@end

@implementation DetailViewController
@synthesize backButton,topView;

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:240.0/255.0 green:73.0/255.0 blue:67.0/255.0 alpha:1.0],
                                 NSFontAttributeName: [UIFont fontWithName:kFontAwesomeFamilyName size:20.0f]
                                 };
    
    [backButton setTitleTextAttributes:attributes forState:UIControlStateNormal];
    backButton.title = [NSString fontAwesomeIconStringForEnum:FAChevronLeft];
    [backButton setAction:@selector(popViewControllerAnimated:)];
    [[self navigationItem] setBackBarButtonItem:backButton];

//    FIXME: REPEATIVE CODE!
    _phoneBtn.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _phoneBtn.clipsToBounds = YES;
    _phoneBtn.layer.cornerRadius = 60.0f/2.0f;
    _phoneBtn.layer.borderColor = _phoneBtn.titleLabel.textColor.CGColor;
    [_phoneBtn setTitle:[NSString fontAwesomeIconStringForEnum:FAPhone] forState:UIControlStateNormal];
    _phoneBtn.tintColor = [UIColor whiteColor];
    _phoneBtn.backgroundColor = [UIColor colorWithRed:70.0/255.0 green:137.0/255.0 blue:143.0/255.0 alpha:1.0];
    
    _emailBtn.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _emailBtn.clipsToBounds = YES;
    _emailBtn.layer.cornerRadius = 60.0f/2.0f;
    _emailBtn.layer.borderColor = _emailBtn.titleLabel.textColor.CGColor;
    [_emailBtn setTitle:[NSString fontAwesomeIconStringForEnum:FAEnvelope] forState:UIControlStateNormal];
    _emailBtn.tintColor = [UIColor whiteColor];
    _emailBtn.backgroundColor = [UIColor colorWithRed:70.0/255.0 green:137.0/255.0 blue:143.0/255.0 alpha:1.0];
    
    _thumbsBtn.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    _thumbsBtn.clipsToBounds = YES;
    _thumbsBtn.layer.cornerRadius = 60.0f/2.0f;
    _thumbsBtn.layer.borderColor = _thumbsBtn.titleLabel.textColor.CGColor;
    [_thumbsBtn setTitle:[NSString fontAwesomeIconStringForEnum:FAThumbsUp] forState:UIControlStateNormal];
    _thumbsBtn.tintColor = [UIColor whiteColor];
    _thumbsBtn.backgroundColor = [UIColor colorWithRed:70.0/255.0 green:137.0/255.0 blue:143.0/255.0 alpha:1.0];
    
    
    self.view.backgroundColor = [UIColor colorWithRed:129.0/255.0 green:212.0/255.0 blue:220.0/255.0 alpha:1.0];

    topView.backgroundColor = [UIColor colorWithRed:129.0/255.0 green:212.0/255.0 blue:220.0/255.0 alpha:1.0];
;
    self.title = _personObj.fullName;
    _aboutText.text = _personObj.aboutUser;
    _userNameLabel.text = [NSString stringWithFormat:@"@%@",_personObj.username];
    _userImage.layer.backgroundColor=[[UIColor clearColor] CGColor];
    _userImage.layer.cornerRadius = _userImage.frame.size.width/2;
    _userImage.layer.borderWidth = 2.0;
    _userImage.layer.masksToBounds = YES;
    _userImage.layer.borderColor = [[UIColor colorWithRed:240.0/255.0 green:73.0/255.0 blue:67.0/255.0 alpha:1.0] CGColor]; //FIXME: [subColor CGColor];

    [_userImage sd_setImageWithURL:[NSURL URLWithString:_personObj.imageUrl]
                  placeholderImage:[UIImage imageNamed:@"placeholder.png" ]];
    // Do any additional setup after loading the view.
}


- (IBAction)phoneButtonPressed:(id)sender {
    NSLog(@"phoneButtonPressed");
}
- (IBAction)emailButtonPressed:(id)sender {
    NSLog(@"emailButtonPressed");
}
- (IBAction)thumbButtonPressed:(id)sender {
    NSLog(@"thumbButtonPressed");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
