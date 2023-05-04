//
//  ViewController.h
//  Thermodynamics_Calculator_iOS
//
//  Created by Anshumali Karna on 04/05/23.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *pressureTextField;
@property (weak, nonatomic) IBOutlet UITextField *volumeTextField;
@property (weak, nonatomic) IBOutlet UITextField *temperatureTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *calculateButton;
@end

