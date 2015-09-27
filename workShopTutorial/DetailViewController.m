//
//  DetailViewController.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/23/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import "DetailViewController.h"
#import "FeedTableViewController.h"
#import "config.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIMenuBtn *backButton;
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIIconBtn *phoneBtn;
@property (weak, nonatomic) IBOutlet UIIconBtn *emailBtn;
@property (weak, nonatomic) IBOutlet UIIconBtn *thumbsBtn;
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
    [backButton IconAs:FAChevronLeft withAction:@selector(popViewControllerAnimated:)];
    [[self navigationItem] setBackBarButtonItem:backButton];
    [_phoneBtn CircleBtnWithIcon:FAPhone];
    [_emailBtn CircleBtnWithIcon:FAEnvelope];
    [_thumbsBtn CircleBtnWithIcon:FAThumbsUp];
    
    self.view.backgroundColor = mainColor;
    topView.backgroundColor = mainColor;
    self.title = _personObj.fullName;
    _aboutText.text = _personObj.aboutUser;
    _userNameLabel.text = [NSString stringWithFormat:@"@%@",_personObj.username];
    _userImage.layer.backgroundColor=[[UIColor clearColor] CGColor];
    _userImage.layer.cornerRadius = _userImage.frame.size.width/2;
    _userImage.layer.borderWidth = 2.0;
    _userImage.layer.masksToBounds = YES;
    _userImage.layer.borderColor = [subColor CGColor];

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
