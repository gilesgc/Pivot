#import <libcolorpicker.h>

static BOOL tweakIsEnabled = YES;

static UIColor *topLeftColor;
static UIColor *middleColor;
static UIColor *bottomRightColor;

static void loadPrefs() {
  NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gilesgc.pivot.plist"];
  tweakIsEnabled = [prefs objectForKey:@"isEnabled"] ? [[prefs objectForKey:@"isEnabled"] boolValue] : YES;

  NSDictionary *colorPrefs = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/com.gilesgc.pivot.color.plist"];
  topLeftColor = LCPParseColorString([colorPrefs objectForKey:@"topLeftColor"], @"#000000");
  middleColor = LCPParseColorString([colorPrefs objectForKey:@"middleColor"], @"#000000");
  bottomRightColor = LCPParseColorString([colorPrefs objectForKey:@"bottomRightColor"], @"#000000");
}

%hook FFGradientBackgroundView

- (void)layoutSubviews {
  %orig;

  if(tweakIsEnabled == YES) {
    ((CAGradientLayer *) [self layer]).colors = @[(id)[topLeftColor CGColor], (id)[middleColor CGColor], (id)[bottomRightColor CGColor]];
  }
}

%end

%ctor {
  loadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.gilesgc.pivot/prefChanged"), NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
  %init(FFGradientBackgroundView = objc_getClass("Firefox_Focus.GradientBackgroundView"));
}
