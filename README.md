# Higher-Order-Functions
Objective-C Higher Order Functions:Map, Filter, Reduce like swift 

# Installation

Simple copy over NSArray+HigherOrderFunctions.h and NSArray+HigherOrderFunctions.m into your project.

# Usage

there is a JSON array studentJSONList like this: 
``` objc
[
    {"number":"100366","name":"Alice","age":14,"score":80,"gender":"female"},
    {"number":"100368","name":"Scarlett","age":15,"score":90,"gender":"female"},
    {"number":"100370","name":"Morgan","age":16,"score":69.5,"gender":"male"},
    {"number":"100359","name":"Taylor","age":14,"score":86,"gender":"female"},
    {"number":"100381","name":"John","age":17,"score":72,"gender":"male"}
]

``` objc
NSArray *studentJSONList = [self stdJSONList];

//studentJSONList map to NSArray<Student *>
NSArray <Student *>*students = [studentJSONList map:^id(id obj) {
    return [[Student alloc]initWithDictionary:obj];
}];

// use reduce to get average score
NSNumber *sum = [students reduce:@0 combine:^id(id accumulator, Student *item) {
    return @([accumulator floatValue] + item.score);
}];
float averageScore = sum.floatValue/students.count;

// use filter to find all student of score greater than 70
NSArray <Student *> *greaterthan = [students filter:^BOOL(Student *obj) {
    return obj.score > 70;
}];

//use contains check students whether contain the student named 'Alice'
BOOL contains = [students contains:^BOOL(Student *obj) {
    return [obj.name isEqual:@"Alice"];
}];
```

 
