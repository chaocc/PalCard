//
//  PalMainMenuViewController.m
//  PalCard
//
//  Created by FlyinGeek on 13-1-31.
//  Copyright (c) 2013年 FlyinGeek. All rights reserved.
//

#import "PalMainMenuViewController.h"
#import "PalModeMenuViewController.h"
#import "PalAchievementViewController.h"
#import "PalInstructionViewController.h"
#import "PalInformationViewController.h"
#import "MCSoundBoard.h"

#define _BGPIC "UIimages/main_bg.jpg"
#define _BGPIC2 "UIimages/cloud-front.png"
#define _BGPIC3 "UIimages/main_bg.jpg"
#define _LOGOPIC "UIimages/main_logo.png"

#define _GameStartButtonImg "UIimages/button_start.png"
#define _GameStartButtonPressedImg "UIimages/button_start_p.png"
#define _AchievementButtonImg "UIimages/button_lib.png"
#define _AchievementButtonPressedImg "UIimages/button_lib_p.png"
#define _InstructionButtonImg "UIimages/button_instruction.png"
#define _InstructionButtonPressedImg "UIimages/button_instruction_p.png"
#define _InformationButtonImg "UIimages/button_info.png"
#define _InformationButtonPressedImg "UIimages/button_info_p.png"
#define _SoundOffImg "UIimages/sound_off1.png"
#define _SoundOnImg "UIimages/sound_on.png"

#define _DefaultCardImg "palsource/888.png"

#define _ReturnButtonImg "UIimages/back.png"
#define _ReturnButtonPressedImg "UIimages/back_push.png"
#define _InfoBG "UIimages/info_bg.png"
#define _NameTagImg "UIimages/NameTag2.png"

#define _ButtonPressedSound "button_pressed.wav"
#define _MenuSelectedSound "selected.wav"

#define _ThemeMusic "main01.mp3"

#define DEVICE_IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568)

@interface PalMainMenuViewController (){
    bool _soundOff;
}

@property (strong, nonatomic) IBOutlet UIImageView *bgPic;
@property (strong, nonatomic) IBOutlet UIImageView *bgPic2;
@property (strong, nonatomic) IBOutlet UIImageView *bgPic3;
@property (strong, nonatomic) IBOutlet UIImageView *blackBG;
@property (strong, nonatomic) IBOutlet UIImageView *soundSwitch;


@property (strong, nonatomic) IBOutlet UIButton *gameStartButton;
@property (strong, nonatomic) IBOutlet UIButton *achViewButton;
@property (strong, nonatomic) IBOutlet UIButton *instructionButton;
@property (strong, nonatomic) IBOutlet UIButton *informationButton;


@property (strong, nonatomic) IBOutlet UIImageView *logoPic;

@end

@implementation PalMainMenuViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)prepare
{
    
    if (![MCSoundBoard audioPlayerForKey:@"MainBGM"] && !_soundOff)
    {
        [MCSoundBoard addAudioAtPath:[[NSBundle mainBundle] pathForResource:@_ThemeMusic ofType:nil] forKey:@"MainBGM"];
        
        [MCSoundBoard addSoundAtPath:[[NSBundle mainBundle] pathForResource:@_ButtonPressedSound ofType:nil]     forKey:@"button"];
        
    
        AVAudioPlayer *player = [MCSoundBoard audioPlayerForKey:@"MainBGM"];
    
        player.numberOfLoops = -1;  // Endless
        [player play];
        [MCSoundBoard playAudioForKey:@"MainBGM" fadeInInterval:1.0];
    }
    
    
    self.blackBG.alpha = 1.0;
    
    self.bgPic.image  = [UIImage imageNamed:@_BGPIC];
    self.bgPic2.image = [UIImage imageNamed:@_BGPIC2];
    self.logoPic.image = [UIImage imageNamed:@_LOGOPIC];

    self.bgPic2.alpha = 0.7;
    
    
    [self.gameStartButton setBackgroundImage:[UIImage imageNamed:@_GameStartButtonImg] forState:UIControlStateNormal];
    
    [self.gameStartButton setBackgroundImage:[UIImage imageNamed:@_GameStartButtonPressedImg] forState:UIControlStateHighlighted];
    
    [self.achViewButton setBackgroundImage:[UIImage imageNamed:@_AchievementButtonImg] forState:UIControlStateNormal];
    
    [self.achViewButton setBackgroundImage:[UIImage imageNamed:@_AchievementButtonPressedImg] forState:UIControlStateHighlighted];
    
    [self.instructionButton setBackgroundImage:[UIImage imageNamed:@_InstructionButtonImg] forState:UIControlStateNormal];
    
    [self.instructionButton setBackgroundImage:[UIImage imageNamed:@_InstructionButtonPressedImg] forState:UIControlStateHighlighted];
    
    [self.informationButton setBackgroundImage:[UIImage imageNamed:@_InformationButtonImg] forState:UIControlStateNormal];
    
    [self.informationButton setBackgroundImage:[UIImage imageNamed:@_InformationButtonPressedImg] forState:UIControlStateHighlighted];
    
    
    
    CGRect frame = self.bgPic.frame;
    frame.origin.x = 0;
    self.bgPic.frame = frame;
    
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:20.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:9999];
    
    frame = self.bgPic.frame;
    frame.origin.x = -frame.size.width + 320;
    self.bgPic.frame = frame;
    
    [UIView commitAnimations];
    
    // cloud
    
    CGRect frame2 = self.bgPic2.frame;
    frame2.origin.x = 0;
    self.bgPic2.frame = frame2;
    
    [UIView beginAnimations:@"testAnimation2" context:NULL];
    [UIView setAnimationDuration:8.0];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:9999];
    
    frame2 = self.bgPic2.frame;
    frame2.origin.x = -frame2.size.width + 285;
    self.bgPic2.frame = frame2;
    
    [UIView commitAnimations];
    
    
    [UIView beginAnimations:@"fadeIn" context:nil];
    [UIView setAnimationDuration:0.5];
    self.blackBG.alpha = 0.0f;
    [UIView commitAnimations];
    

}

- (void) viewWillAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh) name:UIApplicationWillEnterForegroundNotification object:nil];
}

- (void) refresh{
    
    [self prepare];
    //NSLog(@"trigger event when will enter foreground.");
}


- (void)viewDidAppear:(BOOL)animated
{
    [self prepare];

}

-(void) viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if (!DEVICE_IS_IPHONE5) {
        
        [self.gameStartButton setFrame:CGRectMake(22, 210, 60, 180)];
        
        [self.achViewButton setFrame:CGRectMake(94, 245, 60, 180)];
        
        [self.instructionButton setFrame:CGRectMake(169, 210, 60, 180)];
        
        [self.informationButton setFrame:CGRectMake(242, 245, 60, 180)];
        
        [self.soundSwitch setFrame:CGRectMake(260, 430, 30, 30)];
    }
    
    
    // App 第一次启动，加载 UserDefault 默认信息
    
    // 声音默认开启
    
    NSString *turnOffSound = [[NSUserDefaults standardUserDefaults] valueForKey:@"turnOffSound"];
    
    if (turnOffSound) {
        
        if ([turnOffSound isEqualToString:@"YES"]) {
            _soundOff = YES;
            self.soundSwitch.image = [UIImage imageNamed:@_SoundOffImg];
        }
        else if ([turnOffSound isEqualToString:@"NO"]) {
            _soundOff = NO;
            self.soundSwitch.image = [UIImage imageNamed:@_SoundOnImg];
                                      
        }
    }
    else {
        
        NSString *sound = [NSString stringWithFormat:@"NO"];
        [[NSUserDefaults standardUserDefaults] setValue:sound forKey:@"turnOffSound"];
        
        _soundOff = NO;
        self.soundSwitch.image = [UIImage imageNamed:@_SoundOnImg];
    }
    
    
    
    NSString *myLove = [[NSUserDefaults standardUserDefaults] valueForKey:@"myLove"];
    
    if (!myLove) {
        
        [[NSUserDefaults standardUserDefaults] setValue:@"FY" forKey:@"myLove"];

        //  成就系统： 卡牌全部锁定
        
        NSMutableArray *CardIsUnlocked = [[NSUserDefaults standardUserDefaults] valueForKey:@"CardIsUnlocked"];
    
        if (!CardIsUnlocked) {
            
            CardIsUnlocked = [NSMutableArray arrayWithCapacity:100];
            for (int i = 0; i < 100; i++) {
                CardIsUnlocked[i] = @"NO";
            }
        
            [[NSUserDefaults standardUserDefaults] setValue:CardIsUnlocked forKey:@"CardIsUnlocked"];
        }
        
        // General Data
        NSNumber *totalGames = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalGames forKey:@"totalGames"];

        NSNumber *totalWins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalWins forKey:@"totalWins"];

        NSNumber *totalLosses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalLosses forKey:@"totalLosses"];

        NSNumber *wins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:wins forKey:@"wins"];

        NSNumber *losses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:losses forKey:@"losses"];
        
        
        // Specific Data
        
        NSNumber *totalEasyWins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalEasyWins forKey:@"totalEasyWins"];
        
        NSNumber *totalNormalWins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalNormalWins forKey:@"totalNormalWins"];
        
        NSNumber *totalHardWins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalHardWins forKey:@"totalHardWins"];
        
        
        NSNumber *totalEasyLosses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalEasyLosses forKey:@"totalEasyLosses"];
        
        NSNumber *totalNormalLosses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalNormalLosses  forKey:@"totalNormalLosses"];
        
        NSNumber *totalHardLosses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:totalHardLosses forKey:@"totalHardLosses"];

        
        
        NSNumber *easyWins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:easyWins forKey:@"easyWins"];

        NSNumber *normalWins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:normalWins forKey:@"normalWins"];
        
        NSNumber *hardWins = @0;
        [[NSUserDefaults standardUserDefaults] setValue:hardWins forKey:@"hardWins"];
        
        
        NSNumber *easyLosses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:easyLosses forKey:@"easyLosses"];
        
        NSNumber *normalLosses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:normalLosses forKey:@"normalLosses"];
        
        NSNumber *hardLosses = @0;
        [[NSUserDefaults standardUserDefaults] setValue:hardLosses forKey:@"hardLosses"];
    }


    [self prepare];
    

    
	// Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)gameStartButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"button"];
    }
    
    PalModeMenuViewController *modeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainGameSegue"];
    [self presentViewController:modeVC animated:NO completion:nil];
    
}

- (IBAction)achievementButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"button"];
    }
    PalAchievementViewController *achVC = [self.storyboard instantiateViewControllerWithIdentifier:@"achRootSegue"];
    
    [self presentViewController:achVC animated:NO completion:nil];

}

- (IBAction)instructionButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"button"];
    }
    PalInstructionViewController *insVC = [self.storyboard instantiateViewControllerWithIdentifier:@"instructionSegue"];
    
    [self presentViewController:insVC animated:NO completion:nil];

}

- (IBAction)informationButtonPressed:(UIButton *)sender {
    
    if (!_soundOff) {
        [MCSoundBoard playSoundForKey:@"button"];
    }
    PalInformationViewController *infoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"informationSegue"];
    
    [self presentViewController:infoVC animated:NO completion:nil];

}




- (IBAction)soundOnOffButtonPressed:(UITapGestureRecognizer *)sender {
    
    if (_soundOff) {
        
        _soundOff = NO;
        self.soundSwitch.image = [UIImage imageNamed:@_SoundOnImg];
        
        NSString *sound = [NSString stringWithFormat:@"NO"];
        [[NSUserDefaults standardUserDefaults] setValue:sound forKey:@"turnOffSound"];
        
        if (![MCSoundBoard audioPlayerForKey:@"MainBGM"])
        {
            [MCSoundBoard addAudioAtPath:[[NSBundle mainBundle] pathForResource:@_ThemeMusic ofType:nil] forKey:@"MainBGM"];
        }
        
        AVAudioPlayer *player = [MCSoundBoard audioPlayerForKey:@"MainBGM"];
        
        player.numberOfLoops = -1;  // Endless
        [player play];
        [MCSoundBoard playAudioForKey:@"MainBGM" fadeInInterval:1.0];
        
    }
    else {
        _soundOff = YES;
        self.soundSwitch.image = [UIImage imageNamed:@_SoundOffImg];
        
        AVAudioPlayer *player = [MCSoundBoard audioPlayerForKey:@"MainBGM"];
        [player stop];
        
        NSString *sound = [NSString stringWithFormat:@"YES"];
        [[NSUserDefaults standardUserDefaults] setValue:sound forKey:@"turnOffSound"];
    }
}

@end
