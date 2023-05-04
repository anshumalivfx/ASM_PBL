//
//  ViewController.m
//  Thermodynamics_Calculator_iOS
//
//  Created by Anshumali Karna on 04/05/23.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
 NSString *result;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];

    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard
{
    [_pressureTextField resignFirstResponder];
    [_volumeTextField resignFirstResponder];
    [_temperatureTextField resignFirstResponder];
    
}

- (IBAction)calculateButtonTapped:(UIBarButtonItem *)sender {
    double pressure = [self.pressureTextField.text doubleValue];
        double volume = [self.volumeTextField.text doubleValue];
        double temperature = [self.temperatureTextField.text doubleValue];
        
        double gasConstant = 8.31;
        
        NSString *pressureUnit = @"Pa";
        NSString *volumeUnit = @"m³";
        NSString *temperatureUnit = @"K";
        
        if (pressure && volume && temperature) {
            double idealGasLawResult = pressure * volume / (gasConstant * temperature);
            NSString *formattedResult = [NSString stringWithFormat:@"%.2f %@ %@/(%@ * mol)", idealGasLawResult, pressureUnit, volumeUnit, temperatureUnit];
            
            result = [NSString stringWithFormat:@"Result: %@", formattedResult];
            
            
            
        } else {
            result = @"Invalid input";
            
            
        }
    UIViewController *vc = [[UIViewController alloc] init];
    [vc.view setBackgroundColor:[UIColor systemBackgroundColor]];
    UILabel *label = [[UILabel alloc] init];
    [label setText:result];
    [label setCenter:[vc.view center]];
    [label setFont:[UIFont systemFontOfSize:26.0]];
    CGSize labelSize = [label sizeThatFits:CGSizeZero];
    label.frame = CGRectMake((vc.view.frame.size.width - labelSize.width) / 2,
                                  (vc.view.frame.size.height - labelSize.height) / 2,
                                  labelSize.width, labelSize.height);
    
    [vc.view addSubview:label];
    
    [self.navigationController pushViewController:vc animated:true];
}
@end
