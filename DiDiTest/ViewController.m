//
//  ViewController.m
//  DiDiTest
//
//  Created by dahuoshi on 26/12/2017.
//  Copyright © 2017 dahuoshi. All rights reserved.
//



#import "ViewController.h"

@protocol TTaskDelegate <NSObject>

- (void)doneTask;

@end

@interface TTask:NSObject

@property (assign, nonatomic) id<TTaskDelegate> delegate;

@property (strong, nonatomic) NSTimer *timer;

- (void)doneSomething;

@end

@implementation TTask


- (void)dealloc {
    NSLog(@"task dealloc...");
}

- (void)doneSomething {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(doneTask)]) {
//        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(ticktick) userInfo:nil repeats:YES];
        [self.delegate doneTask];
        NSLog(@"[self.delegate doneTask]");
    }
    
    [self cleanup];
}

- (void)ticktick {
    NSLog(@"ticktick");
}

- (void)cleanup {
    
}

@end

@interface ViewController ()<TTaskDelegate>

@property (strong, nonatomic) TTask *task;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.task = [[TTask alloc] init];
    self.task.delegate = self;
    
    [_task doneSomething];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)doneTask {
    self.task = nil;
    NSLog(@"self.task = nil;");
}

@end
