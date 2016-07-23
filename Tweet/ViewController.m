 //
//  ViewController.m
//  Tweet
//
//  Created by Saurabh on 24/07/16.
//  Copyright © 2016 Saurabh. All rights reserved.
//

#import "ViewController.h"
#import "Social/Social.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tweetTextView;
- (void) configureTweetTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTweetTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)showShareAction:(id)sender {

    //Disabling the keyboard
    if ([self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    }
   
    
    
    //Addition of a pop-up object
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"Test Title" message:@"Tweet your note." preferredStyle:UIAlertControllerStyleAlert];
    
    
    //Cancelling the pop-up
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    //addition to the actionController 
    [actionController addAction:cancelAction];
    
                                   
    //Calling the pop-up
    [self presentViewController:actionController animated:YES completion:nil];
}

- (void) configureTweetTextView {
    self.tweetTextView.layer.backgroundColor = [ UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0].CGColor;
    self.tweetTextView.layer.cornerRadius = 10.0;
    self.tweetTextView.layer.borderColor = [UIColor colorWithWhite:0 alpha:0.5].CGColor;
    self.tweetTextView.layer.borderWidth = 2.0;
}
@end
