//
//  ViewController.m
//  WebView
//
//  Created by Chris Air on 8/21/12.
//  Copyright (c) 2012 Chris Air. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize viewWeb;

- (void)viewDidLoad {
    [super viewDidLoad];
	
    NSString *fullURL = @"http://ingress.com/intel";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [viewWeb loadRequest:requestObj];
}

- (void)viewDidUnload {
    [self setViewWeb:nil];
    [super viewDidUnload];
}

- (NSUInteger)supportedInterfaceOrientations {
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	if ([webView.request.URL.absoluteString isEqualToString:@"http://www.ingress.com/intel"]) {
		NSString *jsString = [NSString stringWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"iitc" withExtension:@"js"] encoding:NSUTF8StringEncoding error:nil];
		[webView stringByEvaluatingJavaScriptFromString:jsString];
	}
}

@end
