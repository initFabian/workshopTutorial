//
//  FormViewController.m
//  workShopTutorial
//
//  Created by Fabian Buentello on 9/24/15.
//  Copyright © 2015 Fabian Buentello. All rights reserved.
//

#import "FormViewController.h"
#import "config.h"
#import "TPKeyboardAvoidingScrollView.h"

@interface FormViewController ()
@property (weak, nonatomic) IBOutlet UIMenuBtn *sideBarMenuBtn;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextField;
@property (weak, nonatomic) IBOutlet UIIconBtn *loginButton;
@property (weak, nonatomic) IBOutlet UIIconBtn *fbButton;
@property (weak, nonatomic) IBOutlet UIIconBtn *twitterButton;
@property (weak, nonatomic) IBOutlet UIIconBtn *linkedInButton;

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
    [_sideBarMenuBtn IconAs:FABars withAction:@selector(revealToggle:)];
    [[self navigationItem] setBackBarButtonItem:_sideBarMenuBtn];
    self.navigationController.navigationBar.barTintColor = mainColor;
    
    [_loginButton setBackgroundColor:subColor];
    [_fbButton SocialMediaBtnWithIcon:FAFacebook andTitle:@"Connect with Facebook" andColor:facebookColor];
    [_twitterButton SocialMediaBtnWithIcon:FATwitter andTitle:@"Connect with Twitter" andColor:twitterColor];
    [_linkedInButton SocialMediaBtnWithIcon:FALinkedin andTitle:@"Connect with LinkedIn" andColor:linkedInColor];
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
