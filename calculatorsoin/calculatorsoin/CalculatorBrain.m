//
//  CalculatorBrain.m
//  calculatorsoin
//
//  Created by Christopher Jimenez on 4/1/14.
//  Copyright (c) 2014 SOIN. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain ( )

@property (strong , nonatomic) NSMutableArray * calculations;

@end


@implementation CalculatorBrain
@synthesize calculations = _calculations;

-(NSMutableArray *) calculations
{
    if(_calculations == nil)
    {
        _calculations = [[NSMutableArray alloc] init];
    }
    
    return _calculations;
}

-(double) performOperation:(NSString *) operator
{
    double result = 0;
    
    if([operator isEqualToString: @"+"])
    {
        result = [self popOperand] + [self popOperand];
    }
    else if([operator isEqualToString: @"-"])
    {
        result = [self popOperand] - [self popOperand];
    }
    
    [self pushOperand:result];

    return result;
}

-(void) pushOperand:(double)operand
{
    [self.calculations addObject:[NSNumber numberWithDouble:operand]];
}

-(double) popOperand
{
    NSNumber  * value = [self.calculations lastObject];
    
    if(value != nil) [self.calculations removeLastObject];
    
    return [value doubleValue];
}


@end
