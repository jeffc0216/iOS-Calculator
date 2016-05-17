//
//  ViewController.m
//  Calculator
//
//  Created by Jeff Chen on 2016/5/15.
//  Copyright © 2016年 Jeff Chen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (nonatomic) NSString * tempEqual;
@property (nonatomic) NSString * tempString;
@property (nonatomic) BOOL plus;
@property (nonatomic) BOOL minus;
@property (nonatomic) BOOL multiply;
@property (nonatomic) BOOL divide;
@property (nonatomic) BOOL mr;
@property (nonatomic) BOOL mc;
@property (nonatomic) double numberA;
@property (nonatomic) double numberB;
@property (nonatomic) double answer;
@property (nonatomic) NSString * ansString;
@property (nonatomic) NSMutableArray * notes;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tempEqual = @"";
    self.tempString = @"";
    self.resultLabel.text = @"0";
    
}

- (IBAction)btnDot:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"."];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn0:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"0"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn1:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"1"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn2:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"2"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn3:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"3"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn4:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"4"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn5:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"5"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn6:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"6"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn7:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"7"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn8:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"8"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btn9:(UIButton *)sender {
    self.resultLabel.text = [self.tempString stringByAppendingString:@"9"];
    self.tempString = self.resultLabel.text;
}

- (IBAction)btnMR:(UIButton *)sender {
    NSUInteger finalMplus = self.notes.count;
   
    self.tempString = self.notes[finalMplus-1];
    _numberA = self.tempString.doubleValue;
    self.resultLabel.text = [NSString stringWithFormat:@"%f", _numberA];
    
}

- (IBAction)btnMplus:(UIButton *)sender {
    NSUserDefaults * userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray * notesFromUserDefault = [userDefaults objectForKey:@"notes"];
    self.notes = [NSMutableArray arrayWithArray:notesFromUserDefault];
    
    NSString * itemNote = self.tempString;
    //將筆記存入陣列
    [self.notes addObject:itemNote];
    //存入永久的儲存裡
    [[NSUserDefaults standardUserDefaults] setObject:self.notes forKey:@"notes"];
    //記得同步
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.resultLabel.text = @"";
}


- (IBAction)btnAdd:(UIButton *)sender {
    self.tempString = self.resultLabel.text;
    _numberA = self.tempString.doubleValue;
    _plus = YES;
    self.resultLabel.text = [self.tempString stringByAppendingString:@"+"];
    self.tempString = @"";
}

- (IBAction)btnMinus:(UIButton *)sender {
    self.tempString = self.resultLabel.text;
    _numberA = self.tempString.doubleValue;
    _minus = YES;
    self.resultLabel.text = [self.tempString stringByAppendingString:@"-"];
    self.tempString = @"";
}

- (IBAction)btnMultiply:(UIButton *)sender {
    self.tempString = self.resultLabel.text;
    _numberA = self.tempString.doubleValue;
    _multiply = YES;
    self.resultLabel.text = [self.tempString stringByAppendingString:@"*"];
    self.tempString = @"";
}

- (IBAction)btnDivide:(UIButton *)sender {
    self.tempString = self.resultLabel.text;
    _numberA = self.tempString.doubleValue;
    _divide = YES;
    self.resultLabel.text = [self.tempString stringByAppendingString:@"/"];
    self.tempString = @"";
}

- (IBAction)btnSum:(UIButton *)sender {
    _numberB = self.tempString.doubleValue;
    
    if(_plus == YES){
        self.answer = _numberA + _numberB;
        self.ansString = [NSString stringWithFormat:@"%f", self.answer];
        self.resultLabel.text = self.ansString;
        self.tempString = self.ansString;
        _plus = NO;
    }
    
    if(_minus == YES){
        self.answer = _numberA - _numberB;
        self.ansString = [NSString stringWithFormat:@"%f", self.answer];
        self.resultLabel.text = self.ansString;
        self.tempString = self.ansString;
        _minus = NO;
    }
    
    if(_multiply == YES){
        self.answer = _numberA * _numberB;
        self.ansString = [NSString stringWithFormat:@"%f", self.answer];
        self.resultLabel.text = self.ansString;
        self.tempString = self.ansString;
        _multiply = NO;
    }
    
    if(_divide == YES){
        self.answer = _numberA / _numberB;
        self.ansString = [NSString stringWithFormat:@"%f", self.answer];
        self.resultLabel.text = self.ansString;
        self.tempString = self.ansString;
        _divide = NO;
    }
}

- (IBAction)btnAC:(UIButton *)sender {
    self.resultLabel.text = @"";
    self.tempString = self.resultLabel.text;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
