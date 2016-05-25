//
//  main.m
//  NumberOfPairs


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        NSString *line = @"2,4,7,6,9,10,15;20";
        
        NSArray *semicolonSepArray = [line componentsSeparatedByString:@";"];
        
        NSArray *numStringArray = [[semicolonSepArray objectAtIndex:0] componentsSeparatedByString:@","];
        
        NSInteger targetSum = [[semicolonSepArray objectAtIndex:1] integerValue];
        
        NSMutableString *solutionString = [[NSMutableString alloc]init];
        
        BOOL foundAPair = NO;
        
        
        NSInteger i = 0;
        for (i = 0; i < numStringArray.count -1; i++) {
            NSInteger firstInt = [[numStringArray objectAtIndex:i] integerValue];
            
            
            NSInteger j = 0;
            for (j = 1; j < numStringArray.count - i; j++) {
                NSInteger secondInt = [[numStringArray objectAtIndex:i + j] integerValue];
                NSLog(@"firstInt: %ld  secondInt: %ld", firstInt, secondInt);
                
                if (firstInt + secondInt == targetSum) {
                    [solutionString appendFormat:@"%ld,%ld;", firstInt, secondInt];
                    foundAPair = YES;
                }
            }
        }
        if (!foundAPair) {
            NSLog(@"NULL");
        }
        else {
            NSRange lastSemicolonRange = NSMakeRange(solutionString.length - 1, 1);
            [solutionString deleteCharactersInRange:lastSemicolonRange];
            NSLog(@"solutionString: %@", solutionString);
        }
    }
    return 0;
}
