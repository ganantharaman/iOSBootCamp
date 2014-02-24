//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Anantharaman, Gopal on 2/23/14.
//  Copyright (c) 2014 Anantharaman, Gopal. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
- (IBAction)onTapSettings:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *tipText;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTip = [defaults integerForKey:@"defaultTip"];
    if(defaultTip == 0)
        defaultTip = 10;
    self.tipText.text = [NSString stringWithFormat:@"%d", defaultTip];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTapSettings:(id)sender {
     [self.view endEditing:YES];
    int tip =  [self.tipText.text intValue];
    if(tip < 10)
        tip = 10;
    if( tip > 10 && tip < 15)
        tip = 15;
    if(tip > 15 && tip < 20)
        tip  = 20;
    if(tip > 20)
        tip = 20;
    self.tipText.text = [NSString stringWithFormat:@"%d", tip];

    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger: tip forKey:@"defaultTip"];
    [userDefaults synchronize];
    
}

@end
