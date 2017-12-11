//
//  WaveViewEx.m
//  HuaXiaLoan
//
//  Created by Ye Yang on 2017/5/2.
//  Copyright © 2017年 花虾金融. All rights reserved.
//

#import "WaveViewEx.h"
#import "YYWeakProxy.h"

@interface WaveViewEx ()

@property (nonatomic, strong) CAShapeLayer *frontWaveLayer;
@property (nonatomic, strong) CAShapeLayer *midWaveLayer;
@property (nonatomic, strong) CAShapeLayer *backWaveLayer;

@property (nonatomic, strong) CAGradientLayer *frontGradientLayer;
@property (nonatomic, strong) CAGradientLayer *midGradientLayer;
@property (nonatomic, strong) CAGradientLayer *backGradientLayer;

@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, assign) CGFloat waveWidth;        // 波形直线长度
@property (nonatomic, assign) CGFloat waveAmplitude;    // 振幅

@property (nonatomic, assign) CGFloat frontOffsetX;     // x轴偏移量
@property (nonatomic, assign) CGFloat frontMoveX;
@property (nonatomic, assign) CGFloat frontMoveXStep;   // 移动步进
@property (nonatomic, assign) CGFloat midOffsetX;
@property (nonatomic, assign) CGFloat midMoveX;
@property (nonatomic, assign) CGFloat midMoveXStep;
@property (nonatomic, assign) CGFloat backOffsetX;
@property (nonatomic, assign) CGFloat backMoveX;
@property (nonatomic, assign) CGFloat backMoveXStep;

@property (nonatomic, assign) BOOL doUpdate;

@property (nonatomic, assign) CGFloat colorStyle;

@property (nonatomic, assign) CGFloat kWidth;


@end



@implementation WaveViewEx

- (instancetype)init {
    self = [super init];
    if (self) {
        self.colorStyle = WaveViewColorStyleDark;
        [self createWaveLayer];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.colorStyle = WaveViewColorStyleDark;
        [self createWaveLayer];
    }
    return self;
}

- (instancetype)initWithAmplitude:(CGFloat)amplitude colorStyle:(WaveViewColorStyle)colorStyle {
    self = [super init];
    if (self) {
        self.kWidth = [[UIScreen mainScreen] bounds].size.width;
        self.waveAmplitude = amplitude;
        self.colorStyle = colorStyle;
        [self createWaveLayer];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self clearWaveLayer];
    [self createWaveLayer];
}

- (void)dealloc {
    [self stop];
}

- (void)clearWaveLayer {
    if (_frontWaveLayer) {
        [_frontWaveLayer removeAllAnimations];
        [_frontWaveLayer removeFromSuperlayer];
        self.frontWaveLayer = nil;
    }

    if (_midWaveLayer) {
        [_midWaveLayer removeAllAnimations];
        [_midWaveLayer removeFromSuperlayer];
        self.midWaveLayer = nil;
    }

    if (_backWaveLayer) {
        [_backWaveLayer removeAllAnimations];
        [_backWaveLayer removeFromSuperlayer];
        self.backWaveLayer = nil;
    }

    if (_frontGradientLayer) {
        [_frontGradientLayer removeAllAnimations];
        [_frontGradientLayer removeFromSuperlayer];
        self.frontGradientLayer = nil;
    }

    if (_midGradientLayer) {
        [_midGradientLayer removeAllAnimations];
        [_midGradientLayer removeFromSuperlayer];
        self.midGradientLayer = nil;
    }

    if (_backGradientLayer) {
        [_backGradientLayer removeAllAnimations];
        [_backGradientLayer removeFromSuperlayer];
        self.backGradientLayer = nil;
    }
}

- (void)createWaveLayer {
    self.waveWidth  = CGRectGetWidth(self.bounds);
    if (_waveAmplitude == 0.0f) {
        self.waveAmplitude = 16.0f;
    }

    self.frontOffsetX = 0.0f;
    self.midOffsetX = _waveWidth / 4.0f;
    self.backOffsetX = _waveWidth / 2.0f;

    self.frontMoveXStep = 0.4f;
    self.midMoveXStep = 0.8f;
    self.backMoveXStep = 1.2f;

    self.frontWaveLayer = [CAShapeLayer layer];
    _frontWaveLayer.frame = self.bounds;
    _frontWaveLayer.backgroundColor = [UIColor clearColor].CGColor;
    _frontWaveLayer.fillColor = [UIColor whiteColor].CGColor;

    self.midWaveLayer = [CAShapeLayer layer];
    _midWaveLayer.frame = self.bounds;
    _midWaveLayer.backgroundColor = [UIColor clearColor].CGColor;
    _midWaveLayer.fillColor = [UIColor whiteColor].CGColor;

    self.backWaveLayer = [CAShapeLayer layer];
    _backWaveLayer.frame = self.bounds;
    _backWaveLayer.backgroundColor = [UIColor clearColor].CGColor;
    _backWaveLayer.fillColor = [UIColor whiteColor].CGColor;

    self.frontGradientLayer = [CAGradientLayer layer];
    _frontGradientLayer.frame = self.bounds;
    if (_colorStyle == WaveViewColorStyleLight) {
        [_frontGradientLayer setColors:@[(id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor,
                                         (id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor,
                                         (id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor]];
    } else {
        [_frontGradientLayer setColors:@[(id)[UIColor whiteColor].CGColor,
                                         (id)[[UIColor whiteColor] colorWithAlphaComponent:0.5f].CGColor,
                                         (id)[[UIColor whiteColor] colorWithAlphaComponent:0.2f].CGColor]];
    }
    [_frontGradientLayer setLocations:@[@0.1, @0.6, @1.0]];
    [_frontGradientLayer setStartPoint:CGPointMake(0.5f, 1.0f)];
    [_frontGradientLayer setEndPoint:CGPointMake(0.5f, 0.0f)];
    [_frontGradientLayer setMask:_frontWaveLayer];

    self.midGradientLayer = [CAGradientLayer layer];
    _midGradientLayer.frame = self.bounds;
    if (_colorStyle == WaveViewColorStyleLight) {
        [_midGradientLayer setColors:@[(id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor,
                                       (id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor,
                                       (id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor]];
    } else {
        [_midGradientLayer setColors:@[(id)[UIColor whiteColor].CGColor,
                                       (id)[[UIColor whiteColor] colorWithAlphaComponent:0.5f].CGColor,
                                       (id)[[UIColor whiteColor] colorWithAlphaComponent:0.2f].CGColor]];
    }
    [_midGradientLayer setLocations:@[@0.1, @0.6, @1.0]];
    [_midGradientLayer setStartPoint:CGPointMake(0.5f, 1.0f)];
    [_midGradientLayer setEndPoint:CGPointMake(0.5f, 0.0f)];
    [_midGradientLayer setMask:_midWaveLayer];

    self.backGradientLayer = [CAGradientLayer layer];
    _backGradientLayer.frame = self.bounds;
    if (_colorStyle == WaveViewColorStyleLight) {
        [_backGradientLayer setColors:@[(id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor,
                                        (id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor,
                                        (id)[[UIColor whiteColor] colorWithAlphaComponent:0.15f].CGColor]];
    } else {
        [_backGradientLayer setColors:@[(id)[UIColor whiteColor].CGColor,
                                        (id)[[UIColor whiteColor] colorWithAlphaComponent:0.5f].CGColor,
                                        (id)[[UIColor whiteColor] colorWithAlphaComponent:0.2f].CGColor]];
    }
    [_backGradientLayer setLocations:@[@0.1, @0.6, @1.0]];
    [_backGradientLayer setStartPoint:CGPointMake(0.5f, 1.0f)];
    [_backGradientLayer setEndPoint:CGPointMake(0.5f, 0.0f)];
    [_backGradientLayer setMask:_backWaveLayer];

    [self.layer addSublayer:_backGradientLayer];
//    [self.layer addSublayer:_midGradientLayer];
//    [self.layer addSublayer:_frontGradientLayer];
}

- (void)start {
    [_displayLink invalidate];
    self.displayLink = [CADisplayLink displayLinkWithTarget:[YYWeakProxy proxyWithTarget:self] selector:@selector(drawWave:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)stop {
    [_displayLink invalidate];
    [self clearWaveLayer];
}

- (void)drawWave:(CADisplayLink *)displayLink {
    self.doUpdate = !_doUpdate;
    if (!_doUpdate) {
        // 隔帧绘制(每隔一帧CPU占用降低一半，移动速度降低一半)
        return;
    }
    if (_waveWidth <= 0.0f) {
        // 布局未完成时不绘制
        return;
    }
    self.frontMoveX = ((int)(_frontMoveX * 10.0f + _frontMoveXStep * 10.0f) % (int)(self.kWidth * 10.0f)) / 10.0f;
    self.midMoveX = ((int)(_midMoveX * 10.0f + _midMoveXStep * 10.0f) % (int)(self.kWidth * 10.0f)) / 10.0f;
    self.backMoveX = ((int)(_backMoveX * 10.0f + _backMoveXStep * 10.0f) % (int)(self.kWidth * 10.0f)) / 10.0f;

    self.frontWaveLayer.path = [self createWavePath:NO toLeft:YES offsetX:_frontOffsetX moveX:_frontMoveX].CGPath;
    self.midWaveLayer.path = [self createWavePath:YES toLeft:NO offsetX:_midOffsetX moveX:_midMoveX].CGPath;
    self.backWaveLayer.path = [self createWavePath:NO toLeft:YES offsetX:_backOffsetX moveX:_backMoveX].CGPath;
}

/* y = Asin(ωx + φ) + k
 * A - 振幅，即波峰的高度
 * (ωx + φ) - 相位，反应变量y所处的状态
 * ω - 角速度，控制正弦周期（单位角度内震动的次数）
 * φ - 初相，x=0时的相位，反映在坐标系上则为图像的左右移动
 * k - 偏距，反映在坐标系上则为图像的上移或下移
 *
 * 波形左移或右移：
 * y=Asin(ωx+φ)，先变形公式为：y=Asin(ω(x+φ/ω))
 * 右移m角度：y=Asin(ω(x+φ/ω-m))
 * 左移m角度：y=Asin(ω(x+φ/ω+m))
 *
 * 公式参考：http://baike.gaofen.com/gzbk/ct_1644.html
 */
- (UIBezierPath *)createWavePath:(BOOL)isSinType toLeft:(BOOL)toLeft offsetX:(CGFloat)offsetX moveX:(CGFloat)moveX {
    UIBezierPath *wavePath = [UIBezierPath bezierPath];
    CGFloat endX = 0.0f;
    for (CGFloat x = 0.0f; x <= self.kWidth;) {
        CGFloat y = 0.0f;
        if (isSinType) {
            if (toLeft) {
                y = _waveAmplitude * tanf((2 * M_PI / _waveWidth) * (x + offsetX / (2 * M_PI / _waveWidth) + moveX)) + _waveAmplitude;
            } else {
                y = _waveAmplitude * tanf((2 * M_PI / _waveWidth) * (x + offsetX / (2 * M_PI / _waveWidth) - moveX)) + _waveAmplitude;
            }
        } else {
            if (toLeft) {
                y = _waveAmplitude * sinf((2 * M_PI / _waveWidth) * (x + offsetX / (2 * M_PI / _waveWidth) + moveX)) + _waveAmplitude;
            } else {
                y = _waveAmplitude * sinf((2 * M_PI / _waveWidth) * (x + offsetX / (2 * M_PI / _waveWidth) - moveX)) + _waveAmplitude;
            }
        }

        if (x == 0) {
            [wavePath moveToPoint:CGPointMake(x, y)];
        } else {
            [wavePath addLineToPoint:CGPointMake(x, y)];
        }

        endX = x;

        if (x == self.kWidth) {
            break;
        } else {
            x = MIN(x + 15.0f, self.kWidth); // 隔点绘制，降低CPU占用
        }
    }

    CGFloat endY = CGRectGetHeight(self.bounds) + 1.0f;
    [wavePath addLineToPoint:CGPointMake(endX, endY)];
    [wavePath addLineToPoint:CGPointMake(0.0f, endY)];

    return wavePath;
}

@end
