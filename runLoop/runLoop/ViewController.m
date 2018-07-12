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
#import "VBViewController.h"
#import "VCViewController.h"
#import <sqlite3.h>
#import "TestValueViewController.h"
#import "TestCategaryBaseClass.h"
#import "TestCategaryBaseClass+MyCategary.h"

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

@interface ViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource ,UIWebViewDelegate>

@property (nonatomic, weak) UIScrollView *scroll;
@property (nonatomic, strong) LYPerson *lyPerson;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
////    scroll.backgroundColor = [UIColor cyanColor];
//    scroll.delegate = self;
//    scroll.pagingEnabled = YES;
//    [self.view addSubview:scroll];
//    scroll.contentSize = CGSizeMake(self.view.frame.size.width * 3, 0);
//    self.scroll = scroll;
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
//    [self testSlicingImg01];
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
//    [self testEqual];
//    [self gifImg]; error
//    [self testExtern];
//    [self testTranslateValueInVC];
//    [self testVC];
//    [self testBlock];
//    [self testBlock02];
//    [self testBlock3];
//    [self testCopy];
//    [self testWebView];
//    [self testColor];
//    [self delArray];
//    [self testReg];
//    [self testGCD];
//    [self testGCD2];
//    [self testCagetory02];
//    [self testTableView];
    [self testNSThread];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:animated];
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = [UIColor blackColor];
    }
}
// 返回状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:animated];
    //    SecondViewController *secVC = [[SecondViewController alloc] init];
    //    secVC.lyPerson.name = @"";
    //    [self.navigationController pushViewController:secVC animated:YES];
    //    [self testVC];
    //    [self testWriteToFile];
    //    [self testReadFile];
    //    [self testPreference];
    //    [self testSqlLite3];
}


- (void)testNSThread {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadRunMethod) object:nil];
    [thread start];
    [NSThread sleepForTimeInterval:2.0f];
    NSLog(@"name11 = %@", NSThread.currentThread);
//    [NSThread detachNewThreadSelector:@selector(threadRunMethod) toTarget:self withObject:nil];
}

- (void)threadRunMethod {
    NSLog(@"thread run method");
    NSLog(@"name = %@", [NSThread currentThread]);
}

- (void)testTableView {
//    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
//    [self.view addSubview:view];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_tableView];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 300)];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(customClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)customClick:(UIButton*)sender {
    NSLog(@"click");
}

- (void)testCagetory02{
    TestCategaryBaseClass *baseClass = [[TestCategaryBaseClass alloc] init];
    [baseClass baseMethod];
}

- (void)testGCD {
    dispatch_queue_t currentQueue = dispatch_queue_create("com.serial.test.queue", DISPATCH_QUEUE_SERIAL);
    dispatch_async(currentQueue, ^{
        for (int i = 0; i < 100; i ++) {
            NSLog(@"串行队列异步事件：%tu ---",i);
        }
    });
    
    dispatch_sync(currentQueue, ^{
        for (int i = 0; i < 100; i ++) {
            NSLog(@"串行队列同步事件：%tu +++",i);
        }
    });
}

- (void)testGCD2 {
    dispatch_queue_t serialQueue = dispatch_queue_create("com.starming.gcddemo.serialqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t firstQueue = dispatch_queue_create("com.starming.gcddemo.firstqueue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t secondQueue = dispatch_queue_create("com.starming.gcddemo.secondqueue", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_set_target_queue(firstQueue, serialQueue);
    dispatch_set_target_queue(secondQueue, serialQueue);
    
    dispatch_async(firstQueue, ^{
        NSLog(@"1");
        [NSThread sleepForTimeInterval:3.f];
    });
    dispatch_async(secondQueue, ^{
        NSLog(@"2");
        [NSThread sleepForTimeInterval:2.f];
    });
    dispatch_async(secondQueue, ^{
        NSLog(@"3");
        [NSThread sleepForTimeInterval:1.f];
    });
}

- (void)testReg {
    NSString *phoneNo = @"13143503442";
    NSRange range = [phoneNo rangeOfString:@"^1[3]\\d{9}$" options:NSRegularExpressionSearch];
    if (range.location != NSNotFound) {
        NSLog(@"%@", [phoneNo substringWithRange:range]);
    }
}
- (void)delArray {
//    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5"]];
//    for (NSString *obj in array.reverseObjectEnumerator) {
//        if ([obj isEqualToString:@"5"]) {
//            [array removeObject:obj];
//        }
//
//        if ([obj isEqualToString:@"1"]) {
//            [array removeObject:obj];
//        }
//    }
//    NSLog(@"%@",array);
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:@[@"1",@"2",@"5"]];
    for (int i = array.count - 1; i >= 0; i--) {
        NSString *obj = array[i];
        if ([obj isEqualToString:@"1"]) {
            [array removeObject:obj];
        }
        
        if ([obj isEqualToString:@"2"]) {
            [array removeObject:obj];
        }
        
        if ([obj isEqualToString:@"5"]) {
            [array removeObject:obj];
        }
    }
    NSLog(@"%@",array);
}

- (void)testColor {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    label.layer.backgroundColor = [UIColor redColor].CGColor;
    label.layer.cornerRadius = 20.0f;
    label.layer.shadowColor = [UIColor greenColor].CGColor;
    label.layer.shadowRadius = 20.0f;
    label.layer.shadowOpacity = 0.5;
    [self.view addSubview:label];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 100)];
    
    btn.layer.backgroundColor = [UIColor blueColor].CGColor;
    btn.backgroundColor = [UIColor redColor];
    btn.layer.cornerRadius = 20.0f;
    btn.layer.shadowColor = [UIColor greenColor].CGColor;
    btn.layer.shadowRadius = 20.0f;
    btn.layer.shadowOpacity = 0.5;
    [self.view addSubview:btn];
    
}

- (void)testWebView {
    self.webView = [[UIWebView alloc] init];
    self.webView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_webView];
    self.webView.frame = CGRectMake(0, 0, self.view.bounds.size.width , self.view.bounds.size.height);
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    [(UIScrollView *)[[self.webView subviews] objectAtIndex:0] setBounces:NO];
//    NSString *urlStr = @"https://www.baidu.com";
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlStr]];
//    [self.webView loadRequest:request];
    
//    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
//    NSString *fileName = [path stringByAppendingPathComponent:@"index.html"];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [[NSURL alloc] initWithString:htmlPath];
//    [self.webView stringByEvaluatingJavaScriptFromString:url];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:htmlPath]];
    [self.webView loadRequest:request];
    
}

#pragma mark UIWebViewDelegate start
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
}

#pragma mark UIWebViewDelegate start

- (void)testBlock3 {
    int (^blc)(int) = ^(int count) {
        return count + 1;
    };
    NSLog(@"count + 1 = %d", blc(3));
}


- (void)testBlock02 {
    void (^myBlock)() = ^(void) {
        NSLog(@"111");
    };
    myBlock();
}



- (void)testTranslateValueInVC {
    TestValueViewController *testVC = [[TestValueViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}



- (void)testSqlLite3 {
    sqlite3 *db;
    NSString *path = NSHomeDirectory();
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",path,@"Documents/data.db"];
    int result = sqlite3_open([filePath UTF8String], &db);
    if (result == SQLITE_OK) {
        NSLog(@"create success");
    } else {
        NSLog(@"create error");
    }
    
    //创建表
//    char *errorMsg;
//    char *sql = "create table if not exists t_person(id integer primary key autoincrement, name text, age integer);";
//    int result01 = sqlite3_exec(db, sql, NULL, NULL, &errorMsg);
}

- (void)testPreference {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"lisi" forKey:@"account"];
    [defaults setFloat:123.2f forKey:@"point"];
    NSString *path = NSHomeDirectory();
    NSLog(@"path : %@", path);
}

- (void)testWriteToFile {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:@"muji" forKey:@"name"];
    [dict setObject:@"120" forKey:@"phone"];
    NSString *path = NSHomeDirectory();
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",path,@"Documents/stu.plist"];
    NSLog(@"path = %@",filePath);
    [dict writeToFile:filePath atomically:YES];
}

- (void)testReadFile {
    NSString *path = NSHomeDirectory();
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",path,@"Documents/stu.plist"];
    NSLog(@"path = %@",filePath);
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"name = %@", [dict objectForKey:@"name"]);
    NSLog(@"tel = %@", [dict objectForKey:@"phone"]);
}

- (void)testVC {
    self.title = @"AAA";
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
//    VCViewController *vc = [[VCViewController alloc] init];
//    vc.view.backgroundColor = [UIColor blueColor];
//    [vb presentViewController:vc animated:false completion:^{
//        NSLog(@"completion turn VC");
//    }];
//    [self dismissModalStack];
}

- (void)btnClick:(UIButton *)btn {
    VBViewController *vb = [[VBViewController alloc] init];
    vb.name = @"lkp";
    vb.view.backgroundColor = [UIColor redColor];
    [self presentViewController:vb animated:false completion:^{
        NSLog(@"completion turn VB");
    }];
}

- (void)testExtern {
    Student *s = [[Student alloc] init];
    [s testExtern];
}

- (void)gifImg {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.frame = CGRectMake(100, 100, 400, 300);
    imgView.image = [UIImage imageNamed:@"gifImg"];
    [self.view addSubview:imgView];
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
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 306, 84)];
    imageView.image = [UIImage imageNamed:@"img"];
    [self.view addSubview:imageView];
}

- (void)testSlicingImg01{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 300, 141, [UIImage imageNamed:@"img01"].size.height)];
    imageView.image = [UIImage imageNamed:@"img01"];
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
    NSString *test01 = @"123456";
    NSString *test02 = [test01 mutableCopy];
    NSLog(@"test01 = %p test02 = %p", test01, test02);
    NSLog(@"01 = %p 02 = %p", &test01, &test02);
    NSLog(@"01 = %@ 02 = %@", test01, test02);
    test02 = @"12";
    NSLog(@"\n\ntest01 = %p test02 = %p", test01, test02);
    NSLog(@"01 = %p 02 = %p", &test01, &test02);
    NSLog(@"01 = %@ 02 = %@", test01, test02);
//    NSString *test03 = [ test01 mutableCopy];
//    NSLog(@"test03 = %d", test03);
//    NSMutableString *test04 = [test01 copy];
//    NSMutableString *test05 = [test01 mutableCopy];
//    NSLog(@"test04 = %d, test05 = %d", test04, test05);
}

- (void)testCopy02 {
    NSString *test01 = @"123456";
    NSString *test02 = [test01 copy];
    NSLog(@"test01 = %p test02 = %p", test01, test02);
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

