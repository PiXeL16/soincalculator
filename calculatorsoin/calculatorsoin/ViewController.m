//
//  ViewController.m
//  calculatorsoin
//
//  Created by Christopher Jimenez on 4/1/14.
//  Copyright (c) 2014 SOIN. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel * display;
@property (nonatomic) BOOL userIsInTheMiddleOfTyping;
@property (strong, nonatomic ) CalculatorBrain * brain;

@end

@implementation ViewController
@synthesize display = _display;
@synthesize userIsInTheMiddleOfTyping = _userIsInTheMiddleOfTyping;
@synthesize brain = _brain;

-(CalculatorBrain *) brain
{
    if(_brain == nil)
    {
        _brain = [[CalculatorBrain alloc] init];
    }
    
    return _brain;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)numberPressed:(UIButton *)sender
{

    NSString * number = self.display.text;
    
    if(self.userIsInTheMiddleOfTyping)
    {
        number = [number stringByAppendingString:sender.currentTitle];
    }
    else
    {
        number = sender.currentTitle;
        self.userIsInTheMiddleOfTyping = YES;
    }
    
    self.display.text = number;
    
}

-(IBAction)enterPressed
{
    NSString * numbers = self.display.text;
    
    self.userIsInTheMiddleOfTyping = NO;
    
    [self.brain pushOperand:[numbers doubleValue]];
    
}

- (IBAction)operatorPressed:(UIButton *)sender
{
    
    double result = 0;
    
    [self enterPressed];
    
    result = [self.brain performOperation:sender.currentTitle];
    
    self.display.text = [NSString stringWithFormat:@"%g",result];
    
}

@end
