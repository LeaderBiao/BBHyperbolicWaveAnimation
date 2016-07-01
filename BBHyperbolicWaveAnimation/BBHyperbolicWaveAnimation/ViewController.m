//
//  ViewController.m
//  BBHyperbolicWaveAnimation
//
//  Created by Biao on 16/7/1.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "ViewController.h"
#import "BBHyperbolic.h"

@interface ViewController ()
@property (nonatomic,strong)BBHyperbolic * hyperbolic;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    BBHyperbolic * hyperbolic = [[BBHyperbolic alloc]initWithFrame:CGRectMake(0,0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    self.hyperbolic = hyperbolic;
    hyperbolic.present = 0.5;
    [self.view addSubview:hyperbolic];
    hyperbolic.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width/2.0;
    hyperbolic.layer.masksToBounds = YES;
    //给图层添加一个有色边框
    hyperbolic.layer.borderWidth = 2;
    
    hyperbolic.layer.borderColor = [[UIColor colorWithRed:0.52 green:0.09 blue:0.07 alpha:1] CGColor];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(50, [UIScreen mainScreen].bounds.size.height - 40, 300, 20)];
    slider.minimumValue = 0;// 设置最小值
    slider.maximumValue = 100;// 设置最大值
    slider.value = (slider.minimumValue + slider.maximumValue) / 2;// 设置初始值
    slider.continuous = YES;// 设置可连续变化
    [slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];// 针对值变化添加响应方法
    [self.view addSubview:slider];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)sliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *)sender;
    self.hyperbolic.present = slider.value/100.0;
    // self.valueLabel.text = [NSString stringWithFormat:@"%.1f", slider.value];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
