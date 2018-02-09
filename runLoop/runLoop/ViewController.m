//
//  ViewController.m
//  runLoop
//
//  Created by CFS on 2017/6/20.
//  Copyright © 2017年 CFS. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Student.h"
#import "EOCNetworkFetcher.h"
#import "Person+RunPerson.h"
#import "LYPerson.h"
#import "Dog.h"
#import "SecondViewController.h"

//@interface Pet : NSObject
//
//@end
//
//@implementation Pet
//
//+ (void)load {
//    NSLog(@"%@ %s", self, __FUNCTION__);
//}
//
//@end
//
//@interface Dog : Pet
//
//@end
//
//@implementation Dog
//
//+ (void)load {
//    NSLog(@"%@ %s", self, __FUNCTION__);
//}
//@end

@interface ViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UIScrollView *scroll;
@property (nonatomic, strong) LYPerson *lyPerson;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scroll.backgroundColor = [UIColor cyanColor];
    scroll.delegate = self;
    scroll.pagingEnabled = YES;
    [self.view addSubview:scroll];
    scroll.contentSize = CGSizeMake(self.view.frame.size.width * 3, 0);
    self.scroll = scroll;
//    Person *p = [[Person alloc] init];
//    [p test];
//    SEL aSelector = @selector(test);
//    [p performSelector:aSelector];
    
//    for (int i = 0; i < 3; i++) {
//        UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height)];
//        table.delegate = self;
//        table.dataSource = self;
//        [scroll addSubview:table];
//    }
//    [self testFile];
//    [self testCopy];
//    [self testSaveXML];
//    [self testSlicingImg];
//    [self testBlock];
//    [self testArray];
//    [self testString];
//    [self testBool];
//    [self testLoad];
//    [self testDelegate];
//    [self testCagetory];
//    [self testUIWebView];
//    [self testKVO];
//    [self testKVC];
//    [Person testStaticMethod];
//    [Student testStaticMethod];
//    [self testMethodName];
//    [self testStringAndCopy];
    [self testEqual];
}

- (void)testEqual {
    NSMutableSet *set = [[NSMutableSet alloc] init];
    
    NSMutableArray *array = [@[@1,@2] mutableCopy];
    [set addObject:array];
    NSLog(@"set = %@", set);
    NSLog(@"set addr = %p", array);
    
    NSMutableArray *array02 = [@[@1,@2] mutableCopy];
    [set addObject:array02];
    NSLog(@"set = %@", set);
    NSLog(@"set addr = %p", array02);
    if (array == array02) {
        NSLog(@"equal");
    }
    
    NSMutableArray *array03 = [@[@1] mutableCopy];
    [set addObject:array03];
    NSLog(@"set = %@", set);
    
    [array03 addObject:@2];
    
    NSLog(@"set = %@", set);
    

    NSSet *set02 = [set copy];
    NSLog(@"set02 = %@", set02);
    NSLog(@"set = %@", set);
    
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    SecondViewController *secVC = [[SecondViewController alloc] init];
    secVC.lyPerson.name = @"";
    [self.navigationController pushViewController:secVC animated:YES];
    
}


- (void)testStringAndCopy {
    Student *stu = [[Student alloc] init];
    [stu testStrongAndCopy];
    [stu testMutabelString];
}

- (void)testMethodName {
    Student *stu = [[Student alloc] init];
    [stu setRight:YES];
    NSLog(@"test %d", stu.isRight);
}

- (void)testKVC {
    Dog* dog = [[Dog alloc] init];
//    [dog setValue:@"newName" forKey:@"name"];
//    NSString* name = [dog valueForKey:@"name"];
//    NSLog(@"%@",name);

    NSLog(@"%@", [dog valueForKey:@"toSetName"]);
    [dog setValue:@"123123" forKey:@"toSetName"];
    NSLog(@"%@", [dog valueForKey:@"toSetName"]);
}

- (void)testKVO {
    LYPerson *person = [[LYPerson alloc] init];
    person.height = 180;
    person.name = @"lkp";
    person.age = 18;
    self.lyPerson = person;
    
    [person addObserver:self forKeyPath:@"height" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    person.height = 121;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@",change);
}

- (void)testUIWebView {
    UIWebView *uiWebView = [[UIWebView alloc] init];
    uiWebView.backgroundColor = [UIColor redColor];
    uiWebView.frame = CGRectMake(0, 0, 320, 480);
    [self.view addSubview:uiWebView];
}

- (void)testCagetory {
    Person *person = [[Person alloc] init];
    [person setHeight:@"100"];
    NSLog(@"height = %@", person.height);
}

- (void)testDelegate {
    EOCNetworkFetcher *fetcher = [[EOCNetworkFetcher alloc] init];
    [fetcher customCreate];
//    [fetcher.delegate networkFetcher:fetcher didReveiceData:nil];
    
}


- (void)testLoad {
//    Dog *dog = [Dog alloc];
    [Dog load];
}



- (void)testBool {
    BOOL testBool = 0001;
    if (testBool == YES) {
        NSLog(@"true");
    } else {
        NSLog(@"not true");
    }
}

- (void)testString {
//    NSString *str1 = @"hello";
//    NSString *str2 = @"hello";
//    if ([str1 isEqualToString:str2]) {
//        NSLog(@"the same");
//    }
//    NSString *str3 = [NSString stringWithFormat:@"hell%@", @"o"];
//    NSString *str4 = [[NSString alloc] initWithFormat:@"%@%@%@%@%@", @"h", @"e", @"l", @"l", @"o"];
//    if (str3 == str4) {
//        NSLog(@"the same too");
//    }
    
    NSString *str5 = @"hello";
    NSString *str6 = [NSString alloc];
    NSString *str7 = [str6 initWithString:@"hello"];
    if (str6 != str7) {
        NSLog(@"not same");
    }
    
    if (str5 == str7) {
        NSLog(@"the same");
    }
    
    Person *p1 = [[Person alloc] init];
    Person *p2 = [[Person alloc] init];
    if (p1 == p2) {
        NSLog(@"p the same");
    }
}


- (void)testArray {
    NSArray *arr = [[NSArray alloc] initWithObjects:@"123",@"456",@"89", nil];
    [arr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSLog(@"idx = %ld, id = %@",idx, obj);
//        *stop = YES;
    }];
    
    [arr enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         NSLog(@"idx02 = %ld, id02 = %@",idx, obj);
    }];
}


- (void)testBlock {
    int (^someBlock)(int a, int b) = ^int(int a, int b) {
        return a + b;
    };
    
    int sum = someBlock(10, 20);
    NSLog(@"sum = %d", sum);
}

- (void)testSlicingImg {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 306, 84)];
    imageView.image = [UIImage imageNamed:@"img"];
    [self.view addSubview:imageView];
}

- (void)testSaveXML {
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingPathComponent:@"testXML.plist"];
    NSLog(@"fileName = %@", fileName);
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"value01",@"key01",@"value02",@"key02", nil];
    if ([dic writeToFile:fileName atomically:YES] == NO) {
        NSLog(@"save fail");
    } else {
        NSLog(@"save success");
    }
    
    //archiver
    NSString *archiveName = [path stringByAppendingString:@"/testXml.archive"];
//    [NSKeyedArchiver archiveRootObject:dic toFile:archiveName];
    
    NSDictionary *readDic = [NSKeyedUnarchiver unarchiveObjectWithFile:archiveName];
    for (NSDictionary *key in readDic) {
        NSLog(@"key = %@ value = %@", key, [readDic objectForKey:key]);
    }
    
}
- (void)testCopy {
//    NSString *test01 = @"123456";
//    NSString *test02 = [test01 copy];
//    NSLog(@"test01 = %d test02 = %d", test01, test02);
//    NSString *test03 = [ test01 mutableCopy];
//    NSLog(@"test03 = %d", test03);
//    NSMutableString *test04 = [test01 copy];
//    NSMutableString *test05 = [test01 mutableCopy];
//    NSLog(@"test04 = %d, test05 = %d", test04, test05);
}

- (void)testCopy02 {
    NSString *test01 = @"123456";
    NSString *test02 = [test01 copy];
    NSLog(@"test01 = %d test02 = %d", test01, test02);
    NSString *test03 = [ test01 mutableCopy];
    NSLog(@"test03 = %d", test03);
    NSMutableString *test04 = [test01 copy];
    NSMutableString *test05 = [test01 mutableCopy];
    NSLog(@"test04 = %d, test05 = %d", test04, test05);
}

- (void)testCoyp {
    NSMutableArray *dataArray = [NSMutableArray arrayWithObjects:
                                 [NSMutableString stringWithString:@"one"],
                                 [NSMutableString stringWithString:@"two"],
                                 [NSMutableString stringWithString:@"three"],
                                 nil];
    
    NSMutableArray *dataArray2;
    NSMutableString *mStr;
    NSLog(@"dataArray");
    for (NSString *str in dataArray) {
        NSLog(@"str = %@", str);
        
    }
}

- (void)testFile {
    NSFileHandle *inFile, *outFile;
    //create file
    [[NSFileManager defaultManager] createFileAtPath:@"testOut" contents:nil attributes:nil];
    outFile = [NSFileHandle fileHandleForReadingAtPath:@"testOut"];
    if (outFile == nil) {
        NSLog(@"open testOut faile");
    } else {
        
    }
    
}

- (void)testNSStringAndPath {
    NSString *str1 = @"1111";
    NSString *str2 = @"2222";
    NSString *res = [str1 stringByAppendingString:str2];
    NSLog(@"res = %@", res);
    
    NSNumber *number = [NSNumber numberWithInt:100];
    NSLog(@"number = %@",number);
    
    NSString *str = @"abcd";
    NSString *result = [str substringFromIndex:2];
    NSLog(@"result = %@", result);
    NSString *result01 = [[str substringFromIndex:1] substringToIndex:2];
    NSLog(@"result01 = %@", result01);
    
    NSString *result02 = [str substringWithRange:NSMakeRange(1, 2)];
    NSLog(@"result02 = %@", result02);
    
    NSString *fName = @"testFile02";
    NSFileManager *fm;
    NSDictionary *attr;
    
    fm = [NSFileManager defaultManager];
    
    NSString *fmPath = [[NSBundle mainBundle] pathForResource:fName ofType:@""];
    NSLog(@"fmPath = %@", fmPath);
    if ([fm fileExistsAtPath:fmPath] == NO) {
        NSLog(@"file is not exist!");
    } else {
        NSLog(@"file is exist!");
    }
    
    if ([self isFileExist:fName]) {
        NSLog(@"success");
    } else {
        NSLog(@"sssssssss");
    }
    
    NSString *homeDictionary = NSHomeDirectory();
    NSLog(@"homeD = %@", homeDictionary);
    
    NSArray *documentDirs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"document = %@", [documentDirs objectAtIndex:0]);
    
    NSArray *chachesDirs = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSLog(@"chachesDir = %@", [chachesDirs objectAtIndex:1]);
    
    NSString *tempPath = NSTemporaryDirectory();
    NSLog(@"tempPath = %@", tempPath);
}


- (BOOL) isFileExist:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:fileName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL result = [fileManager fileExistsAtPath:filePath];
    return result;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"abc"];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"abc"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd",indexPath.row];
    return cell;
}

- (void)test {
    NSLog(@"viewcontroller");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 滚动就会触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scroll) {
        NSLog(@"只有scrollview是跟滚动状态就会调用此方法");
    } else {
        NSLog(@"只有tableview是跟滚动状态就会调用此方法");
    }
}

@end

