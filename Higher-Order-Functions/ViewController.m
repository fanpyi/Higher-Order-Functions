//
//  ViewController.m
//  Higher-Order-Functions
//
//  Created by bee on 19/06/2017.
//  Copyright © 2017 bee. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+HigherOrderFunctions.h"
@interface Student:NSObject
@property(nonatomic,strong)NSString *number;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSUInteger age;
@property(nonatomic,assign)float score;
@property(nonatomic,strong)NSString *gender;
-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
@implementation Student
-(instancetype)initWithDictionary:(NSDictionary *)dic{
    self = [super init];
    if (self) {
        _number = dic[@"number"];
        _name = dic[@"name"];
        _age = [dic[@"age"]unsignedIntegerValue];
        _score = [dic[@"score"]floatValue];
        _gender = dic[@"gender"];
    }
    return self;
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@:number=%@; name=%@; age=%lu; score=%f; gender=%@",NSStringFromClass([self class]),_number,_name,(unsigned long)_age,_score,_gender];
}
@end
@interface ViewController ()

@end

@implementation ViewController
-(NSArray *)stdJSONList{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"student" ofType:@"txt"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:NULL];
    return json;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *studentJSONList = [self stdJSONList];
    //studentJSONList map to NSArray<Student *>
    NSArray *students = [studentJSONList map:^id(id obj) {
        return [[Student alloc]initWithDictionary:obj];
    }];
    NSLog(@"students:%@",students);

    // use reduce to get average score
    NSNumber *sum = [students reduce:@0 combine:^id(id accumulator, id item) {
        Student *std = (Student *)item;
        return @([accumulator floatValue] + std.score);
    }];
    float averageScore = sum.floatValue/students.count;
    NSLog(@"averageScore: %f",averageScore);
    
    // use filter to find all student of score greater than 70
    NSArray *greaterthan = [students filter:^BOOL(id obj) {
        Student *std = (Student *)obj;
        return std.score > 70;
    }];
    NSLog(@"score greater than 70: %@",greaterthan);
    
    //use contains check students whether contain the student named 'Alice'
    BOOL contains = [students contains:^BOOL(id obj) {
        Student *std = (Student *)obj;
        return [std.name isEqual:@"Alice"];
    }];
    NSLog(@"contains:%d",contains);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
