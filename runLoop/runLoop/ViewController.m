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
#import "SingleInstanceObject.h"
#import <libkern/OSAtomic.h>
#import <pthread.h>
#import "EOCSubClass.h"
#import "TestModelWithKVC.h"
#import "BRStringPickerView.h"
#import "TestAVPlayerViewController.h"
#import "PPNetworkHelper.h"
#import "PPHTTPRequest.h"
#import "AFNetworking.h"
#import "TestSmsCodeViewController.h"
#import "UAV/WelcomeViewController.h"
#import "HMSegmentedControl.h"
#import "UAV/Test01ViewController.h"
#import "UAV/Text02ViewController.h"
#import "UAV/Test03ViewController.h"
#import "TestSegViewController.h"
#import <MessageUI/MessageUI.h>
#import "SKPSMTPMessage.h"
#import "NSData+Base64Additions.h"
#import "AccountManager.h"
#import "TestLoginViewController.h"
#import "Study/StudyGCD.h"
#import "Study/StudyExtern.h"
#import "Study/MyExtern.h"
#import "Study/StudyBlock.h"
#import "Study/StudyRuntime.h"
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

#ifdef DEBUG
#define PPLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define PPLog(...)
#endif

@interface ViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource ,UIWebViewDelegate, MFMailComposeViewControllerDelegate, SKPSMTPMessageDelegate> {
    dispatch_semaphore_t semaphoreLock;
}

@property (nonatomic, weak) UIScrollView *scroll;
@property (nonatomic, strong) LYPerson *lyPerson;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSString *dff;
@property (nonatomic, assign) int ticketSurplusCount;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) HMSegmentedControl *segmentedControl4;
@property (nonatomic, strong) UIWindow *window;

@end
#define UN_LOCK_SCREEN_NOTIFY @"UnLockScreenNotify"

@implementation ViewController

//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        NSLog(@"initWithNibName");
//    }
//    return self;
//}

//- (instancetype)initWithCoder:(NSCoder *)coder
//{
//    self = [super initWithCoder:coder];
//    if (self) {
//        NSLog(@"initWithCoder");
//    }
//    return self;
//}

- (void)loadView {
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 200)];
    NSLog(@"loadview !!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HEXRGB(0x275062);
    NSLog(@"come VC !!!");
//    NSMutableString *test01 = [NSMutableString stringWithFormat:@"可变字符串"];
//    _dff = test01;
    
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
//    [self testNSThread];
//    [self testObjectForNil];
//    [self testUrl];
//    [self testGif];
//    [self testNumber];
//    [self testInstance];
//    [self testLockForOSSpinLock];
//    [self testLockDispatchSemaphore];
//    [self testLockPThreadMutex];
//    [self test51Method];
//    [self testCollectionArray];
//    [self testBlock03];
//    [self testDispatchGroup];
    
//    [self testSpeak];
//    [self testMulToNOMul];
//    [self testImageView];
//    [self testSync];
//    [self asyncConcurrent];
//    [self syncSerial];
    
//    [self asyncSerial];
//    [self syncMain];
//    [NSThread detachNewThreadSelector:@selector(syncMain) toTarget:self withObject:nil];
//    [self asyncMain];
//    [self testThreadCommunication];
//    [self testBarrier];
//    [self testDispatchAfter];
//    [self apply];
    
//    [self testGroupNotify];
    
//    [self testGroupWait];
//    [self testGroupEnterAndLeave];
    
//    [self testGroupSemaphoreSync];
    
//    [self saleTicket];
//    [self testRoundFloorCell];
//    NSLog(@"width = %f height = %f", [[UIScreen mainScreen] bounds].size.width,[[UIScreen mainScreen] bounds].size.height);

//    [self testNilAndnil];

//    [self testModelKVC];
//    [self testBubbleSort];
//    [self testInsertionSort];

//    [self testPickView];
//    [self testAVPlayer];
//    [self testNetWorking];
//    [self testSmsCodeUI];
//    [self testWelcome];
//    [self testSegment];
//    [self testMasonry];
//    [self testSendEmail];
//    [self testLabelSize];
//    [self studyCGD];
//    [self studyExtern];
//    [self testBlock];
    [self testRuntime];
}

- (void)testRuntime {
    StudyRuntime *sr = [[StudyRuntime alloc] init];
    [sr testMSGForword];
}

- (void)studyExtern {
    [StudyExtern testExtern];
    [MyExtern testExtern];
}

- (void)studyCGD {
    StudyGCD *gcd = [[StudyGCD alloc] init];
//    [gcd createQueue];
    [gcd useGCD];
}

- (void)viewWillAppear:(BOOL)animated {
    if ([AccountManager hasToken]) {
        //正常lUI
    } else {
        _window = [[UIWindow alloc] initWithFrame:CGRectMake(0.0, 0.0, kWidth, kHeight)];
        _window.backgroundColor = COLOR_BLACK;
        _window.windowLevel = normal;
        TestLoginViewController *lc = [[TestLoginViewController alloc] init];
        _window.rootViewController = lc;
        [_window makeKeyAndVisible];

    }

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

- (void)testLabelSize {
    NSString *str = @"llkdksldkfsldf  sfsdf sdfs dsdf sdf sd  df";

    CGFloat titleWidth = S(288.0f);
    UILabel *showLabel = [[UILabel alloc] init];
    showLabel.textColor = COLOR_RED;
    showLabel.numberOfLines = -1;
    showLabel.font = fontAuto(16.0f);
    [self.view addSubview:showLabel];
    [showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(titleWidth);
        make.left.equalTo(self.view).offset(S(60.0f));
        make.top.equalTo(self.view).offset(S(100.0f));
    }];

    CGFloat spacingHeight = S(42.0f);
    CGSize titleMaxSize = CGSizeMake(titleWidth, MAXFLOAT);
    UILabel *questionLabel = [[UILabel alloc] init];
    questionLabel.text = @"--";
    questionLabel.textColor = COLOR_DARKGRAY;
    questionLabel.font = fontAuto(16.0f);
    questionLabel.numberOfLines = -1;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:S(5.0f)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [attributedString length])];
    questionLabel.attributedText = attributedString;
    CGFloat cellHeight = [questionLabel sizeThatFits:titleMaxSize].height;
    NSLog(@"titleH = %f", cellHeight);
    if (cellHeight - fontAuto(16.0f).lineHeight <= S(5.0f)) {//当为一行的时候去掉间距
        cellHeight = cellHeight - S(5.0f);
    }
    NSLog(@"titleH === = %f", cellHeight);
}

- (void)testSendEmail {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"smsCode" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(emailClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)emailClick:(UIButton *)sender {
    
//    if ([MFMailComposeViewController canSendMail]) {
//        [self sendEamil];
//    } else {
//        NSLog(@"setting email")
//    }

    SKPSMTPMessage *message = [[SKPSMTPMessage alloc] init];
    message.fromEmail = @"greenboy1@163.com";
    message.login = @"greenboy1@163.com";
    message.pass = @"likunpeng1";
    message.relayHost = @"smtp.163.com";

    message.toEmail = @"29784038@qq.com";
    message.requiresAuth = YES;
    message.wantsSecure = YES;
    message.delegate = self;
    message.subject = @"TEST TEST";
    NSString *content = @" 啦啦啦啦 content content 啦啦啦";
    NSDictionary *plainPart = [NSDictionary dictionaryWithObjectsAndKeys:@"text/plain; charset=UTF-8",kSKPSMTPPartContentTypeKey, content,kSKPSMTPPartMessageKey,@"8bit",kSKPSMTPPartContentTransferEncodingKey,nil];

    message.parts = [NSArray arrayWithObjects:plainPart,nil];
    [message send];
}

#pragma mark SKPSMTPMessageDelegate
- (void)messageFailed:(SKPSMTPMessage *)message error:(NSError *)error {
    NSLog(@"error = %@", error);
}

- (void)messageSent:(SKPSMTPMessage *)message {
    NSLog(@"success message = %@", message);
}

- (void)sendEamil {
    // 邮件服务器
    MFMailComposeViewController *mailCompose = [[MFMailComposeViewController alloc] init];
    // 设置邮件代理
    [mailCompose setMailComposeDelegate:self];

    // 设置邮件主题
    [mailCompose setSubject:@"我是邮件主题"];

    // 设置收件人
    [mailCompose setToRecipients:@[@"邮箱号码"]];
    // 设置抄送人
    [mailCompose setCcRecipients:@[@"邮箱号码"]];
    // 设置密抄送
    [mailCompose setBccRecipients:@[@"邮箱号码"]];

    /**
     *  设置邮件的正文内容
     */
    NSString *emailContent = @"我是邮件内容";
    // 是否为HTML格式
    [mailCompose setMessageBody:emailContent isHTML:NO];
    // 如使用HTML格式，则为以下代码
    //    [mailCompose setMessageBody:@"<html><body><p>Hello</p><p>World！</p></body></html>" isHTML:YES];

    /**
     *  添加附件
     */
    UIImage *image = [UIImage imageNamed:@"image"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [mailCompose addAttachmentData:imageData mimeType:@"" fileName:@"custom.png"];

    NSString *file = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"pdf"];
    NSData *pdf = [NSData dataWithContentsOfFile:file];
    [mailCompose addAttachmentData:pdf mimeType:@"" fileName:@"pdf文件"];

    // 弹出邮件发送视图
    [self presentViewController:mailCompose animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"取消发送");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"发送失败");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"保存草稿文件");
            break;
        case MFMailComposeResultSent:
            NSLog(@"发送成功");
            break;
        default:
            break;
    }

    // 关闭邮件发送视图
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)testMasonry {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0.0, 100, kWidth, 60.0f)];
    view.backgroundColor = COLOR_BG_GRAY;
    [self.view addSubview:view];

    UILabel *label01 = [[UILabel alloc] init];
    label01.text = @"测试测试测试测试测试测";
    [view addSubview:label01];
    [label01 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view);
        make.centerY.equalTo(view);
    }];

    UILabel *label02 = [[UILabel alloc] init];
    label02.text = @"右边右边";
    [label02 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [label02 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [view addSubview:label02];
    [label02 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label01.mas_right);
        make.centerY.equalTo(view);
        make.right.equalTo(view);
    }];

}

- (void)testSegment {
//    HMSegmentedControl *segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"One", @"Two", @"Three"]];
//    segmentedControl.frame = CGRectMake(10, 100, 300, 60);
//    [segmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:segmentedControl];
    self.segmentedControl4 = [[HMSegmentedControl alloc] initWithFrame:CGRectMake(S(50.0f), 260, S(251.0f), 50)];
    self.segmentedControl4.sectionTitles = @[@"PASS", @"ONGOING"];
    self.segmentedControl4.selectedSegmentIndex = 1;
    self.segmentedControl4.backgroundColor = [UIColor clearColor];
    self.segmentedControl4.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:13.0f]};
    self.segmentedControl4.selectedTitleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:13.0f]};
    self.segmentedControl4.selectionIndicatorColor = COLOR_WHITE;
    self.segmentedControl4.selectionStyle = HMSegmentedControlSelectionStyleFullWidthStripe;
    self.segmentedControl4.selectionIndicatorHeight = S(1.0f);
    self.segmentedControl4.selectionIndicatorLocation = HMSegmentedControlSelectionIndicatorLocationDown;
    self.segmentedControl4.tag = 2;

    __weak typeof(self) weakSelf = self;
    [self.segmentedControl4 setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.scrollView scrollRectToVisible:CGRectMake(kWidth * index, 0, kWidth, 200) animated:YES];
    }];

    [self.view addSubview:self.segmentedControl4];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 310, kWidth, 210)];
    self.scrollView.backgroundColor = COLOR_GOLD;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(kWidth * 2, 200);
    self.scrollView.delegate = self;
    [self.scrollView scrollRectToVisible:CGRectMake(kWidth, 0, kWidth, 200) animated:NO];
    [self.view addSubview:self.scrollView];

    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWidth - 100, 210)];

    label1.text = @"Worldwide";
    [self.scrollView addSubview:label1];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(kWidth, 0, kWidth -100, 210)];

    label2.text = @"Local";
    [self.scrollView addSubview:label2];
}

- (void)segmentedControlChangedValue:(HMSegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld (via UIControlEventValueChanged)", (long)segmentedControl.selectedSegmentIndex);
}

- (void)uisegmentedControlChangedValue:(UISegmentedControl *)segmentedControl {
    NSLog(@"Selected index %ld", (long)segmentedControl.selectedSegmentIndex);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger page = scrollView.contentOffset.x / pageWidth;

    [self.segmentedControl4 setSelectedSegmentIndex:page animated:YES];
}


- (void)testWelcome {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"smsCode" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(welcomeClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)welcomeClick:(UIButton *)btn {
//    WelcomeViewController *welcomeVC = [[WelcomeViewController alloc] init];
//    welcomeVC.callBack = ^{
//        NSLog(@"welcome callback");
//    };
//    [self presentViewController:welcomeVC animated:YES completion:nil];

//    Test03ViewController *vc = [[Test03ViewController alloc] init];
    Test01ViewController *vc = [[Test01ViewController alloc] init];
//        welcomeVC.callBack = ^{
//            NSLog(@"welcome callback");
//        };
//    TestSegViewController *vc = [[TestSegViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
}


- (void)testSmsCodeUI {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"smsCode" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(smsCodeClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)smsCodeClick:(UIButton *)btn {
    TestSmsCodeViewController *codeVC = [[TestSmsCodeViewController alloc] init];
    [self presentViewController:codeVC animated:YES completion:nil];
}

- (void)testNetWorking {
    /**
     设置网络请求参数的格式:默认为二进制格式
     PPRequestSerializerJSON(JSON格式),
     PPRequestSerializerHTTP(二进制格式)

     设置方式 : [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
     */

    /**
     设置服务器响应数据格式:默认为JSON格式
     PPResponseSerializerJSON(JSON格式),
     PPResponseSerializerHTTP(二进制格式)

     设置方式 : [PPNetworkHelper setResponseSerializer:PPResponseSerializerJSON];
     */

    /**
     设置请求头 : [PPNetworkHelper setValue:@"value" forHTTPHeaderField:@"header"];
     */

    // 开启日志打印
    [PPNetworkHelper openLog];

    // 获取网络缓存大小
//    PPLog(@"网络缓存大小cache = %fKB",[PPNetworkCache getAllHttpCacheSize]/1024.f);

    // 清理缓存 [PPNetworkCache removeAllHttpCache];

    // 实时监测网络状态
    [self monitorNetworkStatus];

    /*
     * 一次性获取当前网络状态
     这里延时0.1s再执行是因为程序刚刚启动,可能相关的网络服务还没有初始化完成(也有可能是AFN的BUG),
     导致此demo检测的网络状态不正确,这仅仅只是为了演示demo的功能性, 在实际使用中可直接使用一次性网络判断,不用延时
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self getCurrentNetworkStatus];
    });

    // 登陆
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setValue:@"15810531937" forKey:@"phone"];
    [params setValue:@"123123" forKey:@"smsCode"];
    [params setValue:@"1111111" forKey:@"token"];
    [params setValue:@"2222222" forKey:@"uid"];
    [PPHTTPRequest getLoginWithParameters:params success:^(id response) {
        PPLog(@"success");
    } failure:^(NSError *error) {

    }];

    // 退出
//    [PPHTTPRequest getExitWithParameters:@"参数" success:^(id response) {
//
//    } failure:^(NSError *error) {
//
//    }];

}

#pragma mark - 实时监测网络状态
- (void)monitorNetworkStatus {
    // 网络状态改变一次, networkStatusWithBlock就会响应一次
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType networkStatus) {

        switch (networkStatus) {
                // 未知网络
            case PPNetworkStatusUnknown:
                // 无网络
            case PPNetworkStatusNotReachable:
//                self.networkData.text = @"没有网络";
//                [self getData:YES url:dataUrl];
                PPLog(@"无网络,加载缓存数据");
                break;
                // 手机网络
            case PPNetworkStatusReachableViaWWAN:
                // 无线网络
            case PPNetworkStatusReachableViaWiFi:
//                [self getData:[[NSUserDefaults standardUserDefaults] boolForKey:@"isOn"] url:dataUrl];
                PPLog(@"有网络,请求网络数据");
                break;
        }

    }];

}

#pragma mark - 一次性获取当前最新网络状态
- (void)getCurrentNetworkStatus {
    if (kIsNetwork) {
        PPLog(@"有网络");
        if (kIsWWANNetwork) {
            PPLog(@"手机网络");
        }else if (kIsWiFiNetwork){
            PPLog(@"WiFi网络");
        }
    } else {
        PPLog(@"无网络");
    }
    // 或
    //    if ([PPNetworkHelper isNetwork]) {
    //        PPLog(@"有网络");
    //        if ([PPNetworkHelper isWWANNetwork]) {
    //            PPLog(@"手机网络");
    //        }else if ([PPNetworkHelper isWiFiNetwork]){
    //            PPLog(@"WiFi网络");
    //        }
    //    } else {
    //        PPLog(@"无网络");
    //    }
}

- (void)testAVPlayer {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"player" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(playerClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)playerClick:(id)sender {
    TestAVPlayerViewController *avPlayerVC = [[TestAVPlayerViewController alloc] init];
    [self.navigationController pushViewController:avPlayerVC animated:YES];
}

- (void)testPickView {
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [btn setTitle:@"pickView" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(pickViewClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pickViewClick:(id)sender {
    [BRStringPickerView showStringPickerWithTitle:@"地区" dataSource:@[@"中国", @"美国", @"日本", @"韩国", @"英国", @"德国"] defaultSelValue:@"中国" isAutoSelect:YES resultBlock:^(id selectValue) {
        NSLog(@"selectValue = %@", selectValue);
    }];
}

//测试算法
- (void)testBubbleSort {
    NSArray *arr0 = @[@2,@3,@7,@9,@3,@5,@8];
    NSMutableArray *arr = [arr0 mutableCopy];

    int times = 0;
    for (int i = 0; i < arr.count - 1 ; i++) {
        for (int j = 0; j < arr.count - 1- i; j++) {
            times++;
            if ([arr[j] intValue] > [arr[j + 1] intValue]) {
                NSNumber *temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
        NSLog(@"i = %d, arrTemp = %@", i, arr);
    }
    NSLog(@"arr = %@", arr);
    NSLog(@"times = %d", times);
}

- (void)testInsertionSort {
    NSArray *arr0 = @[@2,@3,@7,@9,@3,@5,@8];
    NSMutableArray *arr = [arr0 mutableCopy];

    long len = arr.count;
    int preIndex;
    NSNumber *current;

    int times = 0;
    for (int i = 1; i < len ; i++) {
        preIndex = i - 1;
        current = arr[i];
        while (preIndex >= 0 && [arr[preIndex] intValue] > [current intValue] ) {
            arr[preIndex + 1] = arr[preIndex];
            preIndex--;
            times++;
        }
        arr[preIndex + 1] = current;
        NSLog(@"i = %d, arrTemp = %@", i, arr);
    }
    NSLog(@"arr = %@", arr);
    NSLog(@"times = %d", times);
}

- (void)testModelKVC {
    NSDictionary *dic = @{@"name": @"", @"age": @"30"};


    TestModelWithKVC *mode = [TestModelWithKVC statusModelWithDic:dic];

    NSLog(@"model = %@", [mode valueForKey:@"name"]);

}

//测试下nil  和 Nil的区别
- (void)testNilAndnil {
    personName = nil;
    NSLog(@"start %@", personName);

    personName = Nil;
    NSLog(@"end %@", personName);

    //这样测试没有测试出来
}

- (void)testRoundFloorCell {
    float i = round(1.4f);
    NSLog(@"i = %f", i);
    
    float j = round(1.5f);
    NSLog(@"j = %f", j);
    
    float i1 = roundf(1.5f);
    NSLog(@"i1 = %f", i1);
    
    float x = ceil(-1.4f);
    NSLog(@"x = %f", x);
    
    float y = ceil(-1.5f);
    NSLog(@"y = %f", y);
    
    float z = ceilf(-1.5f);
    NSLog(@"z = %f", z);
}

- (void)saleTicket {
    NSLog(@"current thread ------- %@", [NSThread currentThread]);
    NSLog(@"semaphore ------ begin");
    semaphoreLock = dispatch_semaphore_create(1);
    
    self.ticketSurplusCount = 50;
    
    dispatch_queue_t queue1 = dispatch_queue_create("com.test.lkp01", DISPATCH_TARGET_QUEUE_DEFAULT);
    
    dispatch_queue_t queue2 = dispatch_queue_create("com.test.lkp02", DISPATCH_TARGET_QUEUE_DEFAULT);
    
    dispatch_queue_t queue3 = dispatch_queue_create("com.test.lkp03", DISPATCH_TARGET_QUEUE_DEFAULT);
    
    dispatch_queue_t queue4 = dispatch_queue_create("com.test.lkp04", DISPATCH_TARGET_QUEUE_DEFAULT);
    
    __weak typeof (self) weakSelf = self;
    
    dispatch_async(queue1, ^{
        [weakSelf saleTicketSafe];
    });
    
    dispatch_async(queue2, ^{
        [weakSelf saleTicketSafe];
    });
    
    dispatch_async(queue3, ^{
        [weakSelf saleTicketSafe];
    });
    
    dispatch_async(queue4, ^{
        [weakSelf saleTicketSafe];
    });
    
}

- (void)saleTicketSafe {
    while (YES) {
        //相当于加锁
        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        
        if (self.ticketSurplusCount > 0) {
            self.ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口： %@", self.ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else {
            NSLog(@"the ticket is over!!!!!!!!!!!");
            break;
        }
        
        //相当于解锁
        dispatch_semaphore_signal(semaphoreLock);
        
    }
}

- (void)testGroupSemaphoreSync {
    NSLog(@"current thread ------- %@", [NSThread currentThread]);
    NSLog(@"semaphore ------ begin");
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int number = 0;
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"1 --------- %@", [NSThread currentThread]);
        number = 100;
        dispatch_semaphore_signal(semaphore);
//        NSLog(@"hhhhh");
    });
//    NSLog(@"lllllllllllll");
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore group end");
    
}

- (void)testGroupEnterAndLeave {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1 ------------- %@", [NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 -------------- %@", [NSThread currentThread]);
        }
        dispatch_group_leave(group);
    });
    
//    dispatch_group_notify(group, queue, ^{
//        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"3 ------------ %@", [NSThread currentThread]);
//        }
//        NSLog(@"group end");
//    });
    
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    NSLog(@"group end");
    
}



- (void)testGroupWait {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC);
    dispatch_group_wait(group, t);
    NSLog(@"group end");
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    
}

- (void)testGroupNotify {
    NSLog(@"current thread %@", [NSThread currentThread]);
    NSLog(@"test begin");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT
                                                        , 0), ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    
    dispatch_group_notify(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
        NSLog(@"group ---- end");
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });

}

- (void)apply {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSLog(@"apply begin");
    dispatch_apply(6, queue, ^(size_t index) {
        NSLog(@"%zd ---- %@", index, [NSThread currentThread]);
    });
    
    NSLog(@"apply --------- end");
}


- (void)testDispatchAfter {
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncMain---begin");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"after = %@", [NSThread currentThread]);
    });
}




- (void)testBarrier {
    dispatch_queue_t queue = dispatch_queue_create("com.lkp.test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1 --------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 --------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_barrier_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"barrier --------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3 --------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"4 --------- %@", [NSThread currentThread]);
        }
    });
    
}

- (void)testThreadCommunication {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1 --------------- %@", [NSThread currentThread]);
        }
        
        dispatch_async(mainQueue, ^{
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 ----------- %@", [NSThread currentThread]);
        });
    });
}

- (void)asyncMain {
    NSLog(@"current thread %@", [NSThread currentThread]);
    NSLog(@"asyncMain begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1 ------------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 ------------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3 ------------- %@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"asyncMain end");
}

- (void)syncMain {
    NSLog(@"current thread %@", [NSThread currentThread]);
    NSLog(@"sync main begin");
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1 ----------- %@", [NSThread currentThread]);
        }
    });
    
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 ----------- %@", [NSThread currentThread]);
        }
    });
    
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3 ----------- %@", [NSThread currentThread]);
        }
    });
    NSLog(@"thread main end");
}
- (void)asyncSerial {
    NSLog(@"current thread ----%@", [NSThread currentThread]);
    NSLog(@"thread start");
    dispatch_queue_t queue = dispatch_queue_create("com.test.lkp", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1-------------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 ---------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3 ------------- %@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"thread end");
}

- (void)syncSerial {
    NSLog(@"current thread = %@", [NSThread currentThread]);
    NSLog(@"current start");
    dispatch_queue_t queue = dispatch_queue_create("com.test.lkp", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1 ------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 --------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3 --------- %@", [NSThread currentThread]);
        }
    });
    
    NSLog(@"thread end");
               
    
}

- (void)asyncConcurrent {
    NSLog(@"current Thread --- %@", [NSThread currentThread]);
    NSLog(@"asyncConcurrent start");
    dispatch_queue_t queue = dispatch_queue_create("com.test.lkp", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1 --------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 ----------- %@", [NSThread currentThread]);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3 ---------- %@", [NSThread currentThread]);
        }
    });
    NSLog(@"asyncConcurrent end");
}

- (void)testSync {
    NSLog(@"current thread ------- %@", [NSThread currentThread]);
    NSLog(@"syncConcurrent begin");
    dispatch_queue_t queue = dispatch_queue_create("net.test.lkp", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        //task 01
        for (int i = 0; i < 2;  i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1---------%@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2 ------ %@", [NSThread currentThread]);
        }
    });
    
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3 --------- %@", [NSThread currentThread]);
        }
    });
    NSLog(@"syncConcurrent end");
}

- (void)testImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, 100.0f, 100.0f)];
    
    //添加圆角 第一种方法 不过此方法会d强制core animation提前渲染屏幕的离屏绘制  而离屏绘制就会给性能带来y负面影响。
//    imageView.layer.cornerRadius = 10.0f;
//    imageView.layer.masksToBounds = YES;
    
    
    //第二种方法使用贝塞尔曲线 裁剪图片
    UIImage *anotherImage = [UIImage imageNamed:@"img02"];
    UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
    [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds
                                cornerRadius:10] addClip];
    [anotherImage drawInRect:imageView.bounds];
    imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.view addSubview:imageView];
    
    
}

- (void)testMulToNOMul {
    NSString *str = [NSString stringWithFormat:@"hhhh"];
    NSLog(@"str = %p", str);
//    NSMutableString *str1 = [NSMutableString stringWithFormat:@"llllll"];
//    str = str1;
//    str = @"aaa";
//    NSLog(@"str = %@", str);
}

//- (void)testSpeak {
//    id cls = [Person class];
//    void *obj = &cls;
////    [(__bridge id)obj speak];
//}



- (void)testDispatchGroup {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.net.queue  ", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, concurrentQueue, ^{
        [NSThread sleepForTimeInterval:2.0];
        NSLog(@"first download task success! %@", [NSThread currentThread]);
    });
    
    dispatch_group_async(group, concurrentQueue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"second download task success! %@", [NSThread currentThread]);
    });
    
    dispatch_group_notify(group, concurrentQueue, ^{
        NSLog(@"begin task three ! %@", [NSThread currentThread]);
    });
    NSLog(@"aaaaa");
}

- (void)testDispatchGroup02 {
    dispatch_queue_t concurrentQueue = dispatch_queue_create("con.net.queue02", DISPATCH_QUEUE_CONCURRENT);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    dispatch_async(concurrentQueue, ^{
        [NSThread sleepForTimeInterval:2.0];
        NSLog(@"first download task success! %@", [NSThread currentThread]);
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(concurrentQueue, ^{
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"second download task success! %@", [NSThread currentThread]);
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(concurrentQueue, ^{
        NSLog(@"begin task three ! %@", [NSThread currentThread]);
        dispatch_group_leave(group);
    });
}



- (void)testBlock03 {
    NSArray *array = @[@0,@1,@2,@3,@4,@5];
    __block NSInteger count = 0;
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj compare:@2] == NSOrderedAscending) {
            count++;
        }
    }];
    NSLog(@"count = %ld", count);
}

- (void)testCollectionArray {
    NSArray *array = @[@1,@2,@3,@4,@5];
    CFArrayRef aCFArray = (__bridge CFArrayRef)array;
    NSLog(@"size of array = %ld",CFArrayGetCount(aCFArray));
    NSLog(@"arrat = %@", aCFArray);
    
}

- (void)test51Method {
//    EOCSubClass *subClass = [[EOCSubClass alloc] init];
}


- (void)testLockPThreadMutex {
    static pthread_mutex_t pLock;
    pthread_mutex_init(&pLock, NULL);
    //thread 01
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"thread 01 准备上锁");
        pthread_mutex_lock(&pLock);
        sleep(3);
        NSLog(@"thread 01");
        pthread_mutex_unlock(&pLock);
    });
    
    //thread 02
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"thread 02 准备上锁");
        pthread_mutex_lock(&pLock);
        NSLog(@"thread 02");
        pthread_mutex_unlock(&pLock);
    });
}

- (void)testLockDispatchSemaphore {
//    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
//    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3.0f *NSEC_PER_SEC);
//    //thread 01
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"thread 01 等待ing");
//        dispatch_semaphore_wait(signal, overTime);
//        NSLog(@"thread 01");
//
//        dispatch_semaphore_signal(signal);
//        NSLog(@"thread 01 发送信号");
//        NSLog(@"-------------------------------");
//    });
//
//    //thread 02
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSLog(@"thread 02 等待ing");
//        dispatch_semaphore_wait(signal, overTime);
//        NSLog(@"thread 02");
//        dispatch_semaphore_signal(signal);
//        NSLog(@"thread 02 发信号了");
//    });
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
//    __block int j = 0;
//    dispatch_async(queue, ^{
//        j = 100;
//        dispatch_semaphore_signal(semaphore);
//    });
//
//    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
//    NSLog(@"finish j = %d", j);
    for (int i = 0; i < 100; i++) {
        dispatch_async(queue, ^{
            // 相当于加锁
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            NSLog(@"i = %d semaphore = %@", i, semaphore);
            // 相当于解锁
            dispatch_semaphore_signal(semaphore);
        });
    }
}

- (void)testLockForOSSpinLock {
    __block OSSpinLock osLock = OS_SPINLOCK_INIT;
    //thread 01
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"thread 01 准备上锁");
        OSSpinLockLock(&osLock);
        sleep(4);
        NSLog(@"thread 01");
        OSSpinLockUnlock(&osLock);
        NSLog(@"thread 01解锁成功");
        NSLog(@"---------------------");
    });
    
    //thread 02
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"thread 02 准备上锁");
        OSSpinLockLock(&osLock);
        NSLog(@"thread 02");
        OSSpinLockUnlock(&osLock);
        NSLog(@"thread 02 解锁成功");
    });
    
}

- (void)testInstance {
    SingleInstanceObject *instance1 = [SingleInstanceObject sharedInstance];
    NSLog(@"%@", instance1);
    
    SingleInstanceObject *instance2 = [[SingleInstanceObject alloc] init];
    NSLog(@"%@", instance2);
    
    SingleInstanceObject *instance3 = [SingleInstanceObject new];
    NSLog(@"%@", instance3);
    
}

- (void)testNumber {
    NSNumber *a = @1;
    if (a == 1) {
        NSLog(@"wrong method");
    }
    
    if ([a intValue] == 1) {
        NSLog(@"right method");
    }
}
- (void)testGif {
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 300, 400)];
    view.backgroundColor = UIColor.redColor;
    view.image = [UIImage imageNamed:@"git.png"];//不能正常播放
    [self.view addSubview:view];
}

- (void)testUrl {
    NSString *strUrl = @"/www.baidu.com";
    NSURL *url = [[NSURL URLWithString:strUrl] URLByAppendingPathComponent:@"12"];
    NSLog(@"url = %@", url);
}

- (void)testObjectForNil {
    NSDictionary *dic = [NSNull null];
    [[dic objectForKey:@"data"] objectForKey:@"coinFlag"];
}

//- (void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
////    [self.navigationController setNavigationBarHidden:YES animated:animated];
//    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
////    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
////        statusBar.backgroundColor = [UIColor blackColor];
////    }
//}
// 返回状态栏的样式
- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
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
    self.title = @"测试";
//    self.navigationController.navigationBar.hidden = YES;

    CGRect screenBounds = [UIScreen mainScreen].bounds;


    UIImage *img = [self createImageWithColor:[UIColor redColor] size:CGSizeMake(screenBounds.size.width, screenBounds.size.height)];
//    [self.navigationController.navigationBar setBackgroundImage: img forBarMetrics:UIBarMetricsDefault];
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"img02"] style:UIBarButtonItemStyleDone target:self action:@selector(doneTextAction:)];
//    self.navigationController.navigationBar.backgroundColor = [UIColor redColor];
//    self.navigationController.navigationBar
//    self.navigationController.navigationBar.translucent = NO;

    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 10, 100)];
    imgView.image = [UIImage imageNamed:@"img02"];
    [self.view addSubview:imgView];

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor greenColor];
    _tableView.delegate  = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];

    if (@available(iOS 11.0, *)) {
        NSLog(@"SafeAreaInsets.top = %f", self.tableView.safeAreaInsets.top);
        NSLog(@"SafeAreaInsets.right = %f", self.tableView.safeAreaInsets.right);
        NSLog(@"SafeAreaInsets.bottom = %f", self.tableView.safeAreaInsets.bottom);
        NSLog(@"SafeAreaInsets.left = %f", self.tableView.safeAreaInsets.left);

        NSLog(@"adjustedContentInset.top = %f", self.tableView.adjustedContentInset.top);
        NSLog(@"adjustedContentInset.right = %f", self.tableView.adjustedContentInset.right);
        NSLog(@"adjustedContentInset.bottom = %f", self.tableView.adjustedContentInset.bottom);
        NSLog(@"adjustedContentInset.left = %f", self.tableView.adjustedContentInset.left);
    } else {
        // Fallback on earlier versions
    }

//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 300)];
//    btn.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(customClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)doneTextAction:(id)sender {
    NSLog(@"---------------------");
}

- (UIImage *)createImageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef content = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(content, [color CGColor]);
    CGContextFillRect(content, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    return img;
}

- (void)customClick:(UIButton*)sender {
    NSLog(@"click");
}

- (void)testCagetory02{
    TestCategaryBaseClass *baseClass = [[TestCategaryBaseClass alloc] init];
    [baseClass baseMethod];
    
    baseClass.testStr = @"123";
    
    NSLog(@"str = %@", baseClass.testStr);
    
    
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
    int a = 2;
    int (^blc)(int) = ^(int count) {
        NSLog(@"a = %d", a);
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
//    EOCNetworkFetcher *fetcher = [[EOCNetworkFetcher alloc] init];
//    [fetcher customCreate];
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
    
    StudyBlock *st = [[StudyBlock alloc] init];
    [st testBlock];
    [st testCaptureValueBlock];
    [st testTypeOfBlock];
//    NSMutableString *str = [NSMutableString string];
//    int ss = 1;
//    NSLog(@"str addr = %p", str);
    
//    int (^someBlock)(int a, int b) = ^int(int a, int b) {
//        ss = 3;
//        str = @"123";
//        [str appendString:@"123"];
//        NSLog(@"str addr = %@", str);
//        return a + b;
//    };
    
//    int sum = someBlock(10, 20);
//    NSLog(@"sum = %d", sum);
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
    NSString *test01 = [NSString stringWithFormat:@"我爱字符串"];
    NSLog(@"test01 = %p ", &test01);
    NSLog(@"test01 = %p ", test01);
    NSString *test02 = [test01 copy];
    test01 = [NSString stringWithFormat:@"我爱字符串002"];
    NSLog(@"test01 = %p test02 = %p", test01, test02);
    NSLog(@"01 = %p 02 = %p", &test01, &test02);
    NSLog(@"01 = %@ 02 = %@", test01, test02);
//    test02 = @"12";
//    NSLog(@"\n\ntest01 = %p test02 = %p", test01, test02);
//    NSLog(@"01 = %p 02 = %p", &test01, &test02);
//    NSLog(@"01 = %@ 02 = %@", test01, test02);
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

#pragma mark UITableViewDelegate
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
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

