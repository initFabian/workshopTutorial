//
//  FormViewController.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/24/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import "FormViewController.h"
#import "config.h"

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
                                 NSForegroundColorAttributeName: subColor,
                                 NSFontAttributeName: [UIFont fontWithName:kFontAwesomeFamilyName size:20.0f]
                                 };
    
    [_sideBarMenuBtn setTitleTextAttributes:attributes forState:UIControlStateNormal];
    _sideBarMenuBtn.title = [NSString fontAwesomeIconStringForEnum:FABars];
    [_sideBarMenuBtn setAction:@selector(revealToggle:)];
    [[self navigationItem] setBackBarButtonItem:_sideBarMenuBtn];
    
    self.navigationController.navigationBar.barTintColor = baseColor;

    [_loginButton setBackgroundColor: subColor];
    
    _fbButton.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    [_fbButton setTitle:[NSString stringWithFormat:@"%@  %@",[NSString fontAwesomeIconStringForEnum:FAFacebook],@"Connect with Facebook"] forState:UIControlStateNormal];
    [_fbButton setTitleColor: whiteColor forState:UIControlStateHighlighted];
    [_fbButton setBackgroundColor:facebookColor];

    _twitterButton.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    [_twitterButton setTitle:[NSString stringWithFormat:@"%@  %@",[NSString fontAwesomeIconStringForEnum:FATwitter],@"Connect with Twitter"] forState:UIControlStateNormal];
    [_twitterButton setTitleColor:whiteColor forState:UIControlStateHighlighted];
    [_twitterButton setBackgroundColor:twitterColor];

    _linkedInButton.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    [_linkedInButton setTitle:[NSString stringWithFormat:@"%@  %@",[NSString fontAwesomeIconStringForEnum:FALinkedin],@"Connect with LinkedIn"] forState:UIControlStateNormal];
    [_linkedInButton setTitleColor:whiteColor forState:UIControlStateHighlighted];
    [_linkedInButton setBackgroundColor:linkedInColor];
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
