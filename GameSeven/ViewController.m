//
//  ViewController.m
//  GameSeven
//
//  Created by xiangxixids on 16/1/14.
//  Copyright © 2016年 xiangxixids. All rights reserved.
//

#import "ViewController.h"
#import "CardSeven.h"
#import "WheelSeven.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *betLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *tigerSlider;
@property (strong, nonatomic) NSMutableArray<NSNumber *> *pickerDatas;
@property (strong, nonatomic) WheelSeven *wheel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tigerSlider setDelegate:self];
    [self.tigerSlider setDataSource:self];
    if (!self.pickerDatas) {
        self.pickerDatas = [[NSMutableArray alloc]initWithCapacity:10];
    }
    for (int i=1; i<=1000; i++) {
        [self.pickerDatas addObject:[NSNumber numberWithInt:i]];
    }
    int midIndex = [self.pickerDatas count]/2;
    int midValue = [[self.pickerDatas objectAtIndex:midIndex] integerValue];
    [self.tigerSlider selectRow:midValue inComponent:0 animated:NO];
    [self.tigerSlider selectRow:midValue inComponent:1 animated:NO];
    [self.tigerSlider selectRow:midValue inComponent:2 animated:NO];
    if (self.wheel == nil) {
        self.wheel = [[WheelSeven alloc]init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeBet:(UISlider *)sender {

    NSLog(@"%0.0f", sender.value);
    int relayValue = sender.value;
    [self.betLabel setText:[NSString stringWithFormat:@"Bet: %d", relayValue]];

}

- (IBAction)startBet:(UIButton *)sender {
    int random0 = (arc4random() % 700) + 200;
    int random1 = (arc4random() % 700) + 200;
    int random2 = (arc4random() % 700) + 200;
    [self.tigerSlider selectRow:random0 inComponent:0 animated:YES];
    [self.tigerSlider selectRow:random1 inComponent:1 animated:YES];
    [self.tigerSlider selectRow:random2 inComponent:2 animated:YES];
}

// UIPickerViewDataSource
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerDatas count];
}

// UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"number %ld select %ld", (long)component, row%10);

}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%ld", row%10];
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    if (self.wheel == nil) {
        self.wheel = [[WheelSeven alloc]init];
    }
    NSLog(@"pickerView row: %ld", row%[self.wheel.getCards count]);
    CardSeven *card = [self.wheel.getCards objectAtIndex:row%[self.wheel.getCards count]];
    UIImage *_image = [UIImage imageNamed:card.imageName];
    UIImageView *_view = nil;
    if (!_view) {
//        _view = [[UIImageView alloc]initWithImage:_image];
        _view = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
        [_view setImage:_image];
        
    }
    return _view;
}


@end
