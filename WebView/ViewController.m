//
//  ViewController.m
//  WebView
//
//  Created by Chris Air on 8/21/12.
//  Copyright (c) 2012 Chris Air. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize viewWeb;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *fullURL = @"http://ingress.com/intel";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [viewWeb loadRequest:requestObj];
    
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"ittc" ofType:@"js" inDirectory:@""];
                          
                          NSData *fileData = [NSData dataWithContentsOfFile:filePath];
                          
                          NSString *jsString = [[NSMutableString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
                          
                          [viewWeb stringByEvaluatingJavaScriptFromString:jsString];*/
    
    //[viewWeb loadHTMLString:@"<script src=\"iitc.js\"></script>"
    //                baseURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] resourcePath]]];
}

- (void)viewDidUnload
{
    [self setViewWeb:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
