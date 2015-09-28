//
//  FormViewController.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/24/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import "FormViewController.h"
//#import "config.h"
#import "NSString+FontAwesome.h"
#import "SWRevealViewController.h"

#warning FIX: Colors
#warning FIX: Buttons(DupCode)
@interface FormViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sideBarMenuBtn;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *fbButton;
@property (weak, nonatomic) IBOutlet UIButton *twitterButton;
@property (weak, nonatomic) IBOutlet UIButton *linkedInButton;

@end

@implementation FormViewController

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _emailTextField.delegate = self;
    _pwdTextField.delegate = self;
    NSDictionary *attributes = @{
                                 NSForegroundColorAttributeName: [UIColor colorWithRed:240.0/255.0 green:73.0/255.0 blue:67.0/255.0 alpha:1.0],
                                 NSFontAttributeName: [UIFont fontWithName:kFontAwesomeFamilyName size:20.0f]
                                 };
    
    [_sideBarMenuBtn setTitleTextAttributes:attributes forState:UIControlStateNormal];
    _sideBarMenuBtn.title = [NSString fontAwesomeIconStringForEnum:FABars];
    [_sideBarMenuBtn setAction:@selector(revealToggle:)];
    [[self navigationItem] setBackBarButtonItem:_sideBarMenuBtn];
    
    //FIXME: FIX ALL THIS!!!
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:129.0/255.0 green:212.0/255.0 blue:220.0/255.0 alpha:1.0]; //FIXME: mainColor;

    [_loginButton setBackgroundColor:[UIColor colorWithRed:240.0/255.0 green:73.0/255.0 blue:67.0/255.0 alpha:1.0]]; //FIXME: subColor];
    
    _fbButton.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    [_fbButton setTitle:[NSString stringWithFormat:@"%@  %@",[NSString fontAwesomeIconStringForEnum:FAFacebook],@"Connect with Facebook"] forState:UIControlStateNormal];
    [_fbButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_fbButton setBackgroundColor:[UIColor colorWithRed:59.0/255.0 green:89.0/255.0 blue:152.0/255.0 alpha:1.0]];

    _twitterButton.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    [_twitterButton setTitle:[NSString stringWithFormat:@"%@  %@",[NSString fontAwesomeIconStringForEnum:FATwitter],@"Connect with Twitter"] forState:UIControlStateNormal];
    [_twitterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_twitterButton setBackgroundColor:[UIColor colorWithRed:85.0/255.0 green:172.0/255.0 blue:238.0/255.0 alpha:1.0]];

    _linkedInButton.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    [_linkedInButton setTitle:[NSString stringWithFormat:@"%@  %@",[NSString fontAwesomeIconStringForEnum:FALinkedin],@"Connect with LinkedIn"] forState:UIControlStateNormal];
    [_linkedInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_linkedInButton setBackgroundColor:[UIColor colorWithRed:1.0/255.0 green:115.0/255.0 blue:178.0/255.0 alpha:1.0]];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //[[self.view viewWithTag:textField.tag+1] becomeFirstResponder];

    UIView *view = [self.view viewWithTag:textField.tag + 1];
    if (!view)
        [textField resignFirstResponder];
    else
        [view becomeFirstResponder];
    return YES;
}
- (IBAction)FB_Clicked:(id)sender {
    NSLog(@"%@ was pressed!",[sender titleLabel].text);
}
- (IBAction)twitter_Clicked:(id)sender {
    NSLog(@"%@ was pressed!",[sender titleLabel].text);
}
- (IBAction)linkedIn_Clicked:(id)sender {
    NSLog(@"%@ was pressed!",[sender titleLabel].text);
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
