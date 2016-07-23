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
- (void) showAlertMessage: (NSString *) myMessage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTweetTextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//Function for Alert message
- (void) showAlertMessage: (NSString *) myMessage{
    UIAlertController *alertController;
    alertController = [UIAlertController alertControllerWithTitle:@"Sharing" message:myMessage preferredStyle:UIAlertControllerStyleAlert];
    
    //ADDED a button for Alert message
    [alertController addAction:[UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (IBAction)showShareAction:(id)sender {

    //Disabling the keyboard
    if ([self.tweetTextView isFirstResponder]) {
        [self.tweetTextView resignFirstResponder];
    }
   
    
    
    //Addition of a pop-up object
    UIAlertController *actionController = [UIAlertController alertControllerWithTitle:@"" message:@"Share your note!" preferredStyle:UIAlertControllerStyleAlert];
    
    
    //Cancell Action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
    
    //Tweet UI Alert Action
    UIAlertAction *tweetAction = [UIAlertAction actionWithTitle:@"Tweet" style:UIAlertActionStyleDefault handler:
                                  ^(UIAlertAction *action){
                                      if( [ SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
                                          
                                         //Generating the connection with twitter and Creating twitter view
                                          SLComposeViewController *twitterVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
                                          
                                          //Tweet the text if Text is less than 140 character
                                          if ([self.tweetTextView.text length] < 140){
                                              [twitterVC setInitialText:self.tweetTextView.text];
                                          }
                                          //Else select only 140 characters and add to twitterVC
                                          else{
                                              NSString *shortText = [self.tweetTextView.text substringToIndex:140];
                                              [twitterVC setInitialText:shortText];
                                              
                                          }
                                          
                                          [self presentViewController:twitterVC animated:YES completion:nil];
                                      }
                                      
                                          else {
                                          //Alert the user
                                          [self showAlertMessage: @"Please sign in to twitter"];
                                      }
                                  }
                                  
                                  
                                  ];
    
    //Facbook UI Alert Action
    UIAlertAction *facebookAction = [UIAlertAction actionWithTitle:@"Post to facebook" style:UIAlertActionStyleDefault handler:
                                  ^(UIAlertAction *action){
                                      if( [ SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
                                          
                                          //Generating the connection with Facebook and Creating Facebook view
                                          SLComposeViewController *facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
                                          
                                          [facebookVC setInitialText:self.tweetTextView.text];
                                          [self presentViewController:facebookVC animated:YES completion:nil];
                                      
                                      }
                                          else{
                                              [self showAlertMessage:@"Please sign in to facebook."];
                                          }
                                  }
                                     ];
    
    // addition of Facebook action to the actionController
    [actionController addAction:facebookAction];
    
    
    // addition of Tweet action to the actionController
    [actionController addAction:tweetAction];
    
    //addition of cancelAction to the actionController
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
