//
//  CalculatorBrain.h
//  calculatorsoin
//
//  Created by Christopher Jimenez on 4/1/14.
//  Copyright (c) 2014 SOIN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(double) performOperation:(NSString *) operator;

-(void) pushOperand:(double)operand;

-(double) popOperand;


@end
