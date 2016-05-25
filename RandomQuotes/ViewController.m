//
//  ViewController.m
//  RandomQuotes
//
//  Created by tstone10 on 5/24/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

/*
 Create an app that meets the following requirements:
 Your app should display a humorous, random, or motivational quote on the screen
 The quote should change to a new quote every 5 seconds (5-7 quotes total)
 Each quote should have a random text color
 Each quote should have a random background color
*/

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int timeTick;
NSTimer *timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNewQuote];
    timeTick = 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadNewQuote {
    [self setQuoteText];
    [self setTextColor];
    [self setBackgroundColor];
    [self startTimer];
}

- (void)setQuoteText {
    NSArray *quotesArray = @[@"Always borrow money from a pessimist. He won’t expect it back.", @"My therapist told me the way to achieve true inner peace is to finish what I start. So far I’ve finished two bags of M&Ms and a chocolate cake. I feel better already.", @"I believe that if life gives you lemons, you should make lemonade... And try to find somebody whose life has given them vodka, and have a party.", @"My fake plants died because I did not pretend to water them.", @"Don't talk about yourself; it will be done when you leave.", @"A day without sunshine is like, you know, night.", @"Politics is supposed to be the second oldest profession. I have come to realize that it bears a very close resemblance to the first.",];
    self.txtQuote.text = quotesArray[[self randomize:7]];
}

- (void)setTextColor {
    NSArray *textColorArray = @[[UIColor whiteColor],[UIColor yellowColor], [UIColor cyanColor]];
    self.txtQuote.textColor = textColorArray[[self randomize:3]];
}

- (void)setBackgroundColor {
    NSArray *backgroundColorArray = @[[UIColor redColor], [UIColor orangeColor], [UIColor magentaColor], [UIColor brownColor], [UIColor blueColor], [UIColor purpleColor]];
    self.view.backgroundColor = backgroundColorArray[[self randomize:6]];
}

- (int)randomize:(int)num {
    return arc4random_uniform(num);
}

- (void)startTimer {
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(myTicker) userInfo:nil repeats:YES];
}

- (void)myTicker {
    timeTick--;
    if (timeTick == 0) {
        [timer invalidate];
        timeTick = 5;
        [self loadNewQuote];
    }
}

@end
