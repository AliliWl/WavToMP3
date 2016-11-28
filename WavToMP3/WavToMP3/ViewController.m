//
//  ViewController.m
//  WavToMP3
//
//  Created by wangli on 2016/11/28.
//  Copyright © 2016年 wangli. All rights reserved.
//

#import "ViewController.h"
#import "WavToMP3.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *wavPath = [[NSBundle mainBundle] pathForResource:@"49" ofType:@"wav"];
    
    NSString *tempPcm = [NSTemporaryDirectory() stringByAppendingPathComponent:@"change.mp3"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    [fileManager createFileAtPath:tempPcm  contents:nil attributes:nil];
    
    [WavToMP3 wavToMP3WithwavPath:wavPath mp3Path:tempPcm];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
