
static BOOL isEnabled = NO;
static BOOL isLetterAsistanceEnabled = NO;
static int zeroStyle = 0; //0 = "-" / 1 = "0"

static BOOL isScramblePassInstalled = NO;
static BOOL isDummyPassInstalled = NO;

#define PREFERENCES_PATH @"/var/mobile/Library/Preferences/beta.simalary.romanpadprefs.plist"
#define PREFERENCES_CHANGED_NOTIFICATION "beta.simalary.romanpad.preferences-changed"
#define PREFERENCES_ENABLED_KEY @"enabledSwitch"
#define PREFERENCES_LETTERASSISTANCE_KEY @"letterAssistanceSwitch"
#define PREFERENCES_ZEROSTYLE_KEY @"zeroStyle"

UIView *buttonView;

%group Stock
%hook TPNumberPadLightStyleButton
-(UIView *)circleView{
    buttonView = %orig;
    return buttonView;
}

+(id)imageForCharacter:(unsigned)arg1{
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    if (preferences == nil) {
        preferences = @{ PREFERENCES_ENABLED_KEY : @(YES), PREFERENCES_LETTERASSISTANCE_KEY : @(YES), PREFERENCES_ZEROSTYLE_KEY : @(0) };
        [preferences writeToFile:PREFERENCES_PATH atomically:YES];
        isEnabled = YES;
        isLetterAsistanceEnabled = YES;
        zeroStyle = 0;
    } else {
        isEnabled = [preferences[PREFERENCES_ENABLED_KEY] boolValue];
        isLetterAsistanceEnabled = [preferences[PREFERENCES_LETTERASSISTANCE_KEY] boolValue];
        zeroStyle = [preferences[PREFERENCES_ZEROSTYLE_KEY] intValue];
    }
    if (isEnabled) {
        UILabel *numLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        UILabel *lettersLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        switch (arg1) {
            case 0:
                numLbl.text = @"I";
                break;
            case 1:
                numLbl.text = @"II";
                lettersLbl.text = @"A B C";
                break;
            case 2:
                numLbl.text = @"III";
                lettersLbl.text = @"D E F";
                break;
            case 3:
                numLbl.text = @"IV";
                lettersLbl.text = @"G H I";
                break;
            case 4:
                numLbl.text = @"V";
                lettersLbl.text = @"J K L";
                break;
            case 5:
                numLbl.text = @"VI";
                lettersLbl.text = @"M N O";
                break;
            case 6:
                numLbl.text = @"VII";
                lettersLbl.text = @"P Q R S";
                break;
            case 7:
                numLbl.text = @"VIII";
                lettersLbl.text = @"T U V";
                break;
            case 8:
                numLbl.text = @"IX";
                lettersLbl.text = @"W X Y Z";
                break;
            case 9:
                numLbl.text = @"*";
                break;
            case 10:
                if (zeroStyle == 0) {
                    numLbl.text = @"-";
                } else {
                    numLbl.text = @"0";
                }
                break;
            case 11:
                numLbl.text = @"#";
                break;
            default:
                return %orig;
                break;
        }
        if (isLetterAsistanceEnabled) {
            if (!([numLbl.text isEqualToString:@"-"] || [numLbl.text isEqualToString:@"0"])) {
                numLbl.frame = CGRectMake(numLbl.frame.origin.x, numLbl.frame.origin.y - 8, numLbl.frame.size.width, numLbl.frame.size.height);
            }
            lettersLbl.font = [UIFont boldSystemFontOfSize:11];
            lettersLbl.textAlignment = NSTextAlignmentCenter;
            [lettersLbl sizeToFit];
            lettersLbl.center = buttonView.center;
            lettersLbl.frame = CGRectMake(lettersLbl.frame.origin.x, lettersLbl.frame.origin.y + 15, lettersLbl.frame.size.width, lettersLbl.frame.size.height);
            [buttonView.superview addSubview:lettersLbl];
        }
        numLbl.font = [UIFont systemFontOfSize:buttonView.frame.size.width / 3];
        numLbl.textAlignment = NSTextAlignmentCenter;
        [buttonView.superview addSubview:numLbl];
        return %orig(-1);
    } else {return %orig;}
}
%end

%hook TPNumberPadDarkStyleButton
-(UIView *)circleView{
    buttonView = %orig;
    return buttonView;
}

+(id)imageForCharacter:(unsigned)arg1{
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    if (preferences == nil) {
        preferences = @{ PREFERENCES_ENABLED_KEY : @(YES), PREFERENCES_LETTERASSISTANCE_KEY : @(YES), PREFERENCES_ZEROSTYLE_KEY : @(0) };
        [preferences writeToFile:PREFERENCES_PATH atomically:YES];
        isEnabled = YES;
        isLetterAsistanceEnabled = YES;
        zeroStyle = 0;
    } else {
        isEnabled = [preferences[PREFERENCES_ENABLED_KEY] boolValue];
        isLetterAsistanceEnabled = [preferences[PREFERENCES_LETTERASSISTANCE_KEY] boolValue];
        zeroStyle = [preferences[PREFERENCES_ZEROSTYLE_KEY] intValue];
    }
    if (isEnabled) {
        UILabel *numLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        UILabel *lettersLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        switch (arg1) {
            case 0:
                numLbl.text = @"I";
                break;
            case 1:
                numLbl.text = @"II";
                lettersLbl.text = @"A B C";
                break;
            case 2:
                numLbl.text = @"III";
                lettersLbl.text = @"D E F";
                break;
            case 3:
                numLbl.text = @"IV";
                lettersLbl.text = @"G H I";
                break;
            case 4:
                numLbl.text = @"V";
                lettersLbl.text = @"J K L";
                break;
            case 5:
                numLbl.text = @"VI";
                lettersLbl.text = @"M N O";
                break;
            case 6:
                numLbl.text = @"VII";
                lettersLbl.text = @"P Q R S";
                break;
            case 7:
                numLbl.text = @"VIII";
                lettersLbl.text = @"T U V";
                break;
            case 8:
                numLbl.text = @"IX";
                lettersLbl.text = @"W X Y Z";
                break;
            case 9:
                numLbl.text = @"*";
                break;
            case 10:
                if (zeroStyle == 0) {
                    numLbl.text = @"-";
                } else {
                    numLbl.text = @"0";
                }
                break;
            case 11:
                numLbl.text = @"#";
                break;
            default:
                return %orig;
                break;
        }
        if (isLetterAsistanceEnabled) {
            if (!([numLbl.text isEqualToString:@"-"] || [numLbl.text isEqualToString:@"0"])) {
                numLbl.frame = CGRectMake(numLbl.frame.origin.x, numLbl.frame.origin.y - 8, numLbl.frame.size.width, numLbl.frame.size.height);
            }
            lettersLbl.font = [UIFont boldSystemFontOfSize:11];
            lettersLbl.textColor = [UIColor whiteColor];
            lettersLbl.textAlignment = NSTextAlignmentCenter;
            [lettersLbl sizeToFit];
            lettersLbl.center = buttonView.center;
            lettersLbl.frame = CGRectMake(lettersLbl.frame.origin.x, lettersLbl.frame.origin.y + 15, lettersLbl.frame.size.width, lettersLbl.frame.size.height);
            [buttonView.superview addSubview:lettersLbl];
        }
        numLbl.font = [UIFont systemFontOfSize:buttonView.frame.size.width / 3];
        numLbl.textAlignment = NSTextAlignmentCenter;
        numLbl.textColor = [UIColor whiteColor];
        [buttonView.superview addSubview:numLbl];
        return %orig(-1);
    } else {return %orig;}
}
%end
%end

%group Hive
%hook TPNumberPadLightStyleButton
-(UIView *)circleView{
    buttonView = %orig;
    return buttonView;
}

+(id)imageForCharacter:(unsigned)arg1{
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    if (preferences == nil) {
        preferences = @{ PREFERENCES_ENABLED_KEY : @(YES), PREFERENCES_LETTERASSISTANCE_KEY : @(YES), PREFERENCES_ZEROSTYLE_KEY : @(0) };
        [preferences writeToFile:PREFERENCES_PATH atomically:YES];
        isEnabled = YES;
        isLetterAsistanceEnabled = YES;
        zeroStyle = 0;
    } else {
        isEnabled = [preferences[PREFERENCES_ENABLED_KEY] boolValue];
        isLetterAsistanceEnabled = [preferences[PREFERENCES_LETTERASSISTANCE_KEY] boolValue];
        zeroStyle = [preferences[PREFERENCES_ZEROSTYLE_KEY] intValue];
    }
    if (isEnabled) {
        UILabel *numLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        UILabel *lettersLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        switch (arg1) {
            case 0:
                numLbl.text = @"I";
                break;
            case 1:
                numLbl.text = @"II";
                lettersLbl.text = @"A B C";
                break;
            case 2:
                numLbl.text = @"III";
                lettersLbl.text = @"D E F";
                break;
            case 3:
                numLbl.text = @"IV";
                lettersLbl.text = @"G H I";
                break;
            case 4:
                numLbl.text = @"V";
                lettersLbl.text = @"J K L";
                break;
            case 5:
                numLbl.text = @"VI";
                lettersLbl.text = @"M N O";
                break;
            case 6:
                numLbl.text = @"VII";
                lettersLbl.text = @"P Q R S";
                break;
            case 7:
                numLbl.text = @"VIII";
                lettersLbl.text = @"T U V";
                break;
            case 8:
                numLbl.text = @"IX";
                lettersLbl.text = @"W X Y Z";
                break;
            case 9:
                numLbl.text = @"*";
                break;
            case 10:
                if (zeroStyle == 0) {
                    numLbl.text = @"-";
                } else {
                    numLbl.text = @"0";
                }
                break;
            case 11:
                numLbl.text = @"#";
                break;
            default:
                return %orig;
                break;
        }
        if (isLetterAsistanceEnabled) {
            if (!([numLbl.text isEqualToString:@"-"] || [numLbl.text isEqualToString:@"0"])) {
                numLbl.frame = CGRectMake(numLbl.frame.origin.x, numLbl.frame.origin.y - 8, numLbl.frame.size.width, numLbl.frame.size.height);
            }
            lettersLbl.font = [UIFont boldSystemFontOfSize:11];
            lettersLbl.textAlignment = NSTextAlignmentCenter;
            [lettersLbl sizeToFit];
            lettersLbl.center = buttonView.center;
            lettersLbl.frame = CGRectMake(lettersLbl.frame.origin.x, lettersLbl.frame.origin.y + 15, lettersLbl.frame.size.width, lettersLbl.frame.size.height);
            [buttonView.superview addSubview:lettersLbl];
        }
        numLbl.font = [UIFont systemFontOfSize:buttonView.frame.size.width / 3];
        numLbl.textAlignment = NSTextAlignmentCenter;
        [buttonView.superview addSubview:numLbl];
        return %orig(-1);
    } else {return %orig;}
}
%end

%hook TPNumberPadDarkStyleButton
-(UIView *)circleView{
    buttonView = %orig;
    return buttonView;
}

+(id)imageForCharacter:(unsigned)arg1{
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    if (preferences == nil) {
        preferences = @{ PREFERENCES_ENABLED_KEY : @(YES), PREFERENCES_LETTERASSISTANCE_KEY : @(YES), PREFERENCES_ZEROSTYLE_KEY : @(0) };
        [preferences writeToFile:PREFERENCES_PATH atomically:YES];
        isEnabled = YES;
        isLetterAsistanceEnabled = YES;
        zeroStyle = 0;
    } else {
        isEnabled = [preferences[PREFERENCES_ENABLED_KEY] boolValue];
        isLetterAsistanceEnabled = [preferences[PREFERENCES_LETTERASSISTANCE_KEY] boolValue];
        zeroStyle = [preferences[PREFERENCES_ZEROSTYLE_KEY] intValue];
    }
    if (isEnabled) {
        UILabel *numLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        UILabel *lettersLbl = [[UILabel alloc] initWithFrame:buttonView.frame];
        switch (arg1) {
            case 0:
                numLbl.text = @"I";
                break;
            case 1:
                numLbl.text = @"II";
                lettersLbl.text = @"A B C";
                break;
            case 2:
                numLbl.text = @"III";
                lettersLbl.text = @"D E F";
                break;
            case 3:
                numLbl.text = @"IV";
                lettersLbl.text = @"G H I";
                break;
            case 4:
                numLbl.text = @"V";
                lettersLbl.text = @"J K L";
                break;
            case 5:
                numLbl.text = @"VI";
                lettersLbl.text = @"M N O";
                break;
            case 6:
                numLbl.text = @"VII";
                lettersLbl.text = @"P Q R S";
                break;
            case 7:
                numLbl.text = @"VIII";
                lettersLbl.text = @"T U V";
                break;
            case 8:
                numLbl.text = @"IX";
                lettersLbl.text = @"W X Y Z";
                break;
            case 9:
                numLbl.text = @"*";
                break;
            case 10:
                if (zeroStyle == 0) {
                    numLbl.text = @"-";
                } else {
                    numLbl.text = @"0";
                }
                break;
            case 11:
                numLbl.text = @"#";
                break;
            default:
                return %orig;
                break;
        }
        if (isLetterAsistanceEnabled) {
            if (!([numLbl.text isEqualToString:@"-"] || [numLbl.text isEqualToString:@"0"])) {
                numLbl.frame = CGRectMake(numLbl.frame.origin.x, numLbl.frame.origin.y - 8, numLbl.frame.size.width, numLbl.frame.size.height);
            }
            lettersLbl.font = [UIFont boldSystemFontOfSize:11];
            lettersLbl.textColor = [UIColor whiteColor];
            lettersLbl.textAlignment = NSTextAlignmentCenter;
            [lettersLbl sizeToFit];
            lettersLbl.center = buttonView.center;
            lettersLbl.frame = CGRectMake(lettersLbl.frame.origin.x, lettersLbl.frame.origin.y + 15, lettersLbl.frame.size.width, lettersLbl.frame.size.height);
            [buttonView.superview addSubview:lettersLbl];
        }
        numLbl.font = [UIFont systemFontOfSize:buttonView.frame.size.width / 3];
        numLbl.textAlignment = NSTextAlignmentCenter;
        numLbl.textColor = [UIColor whiteColor];
        [buttonView.superview addSubview:numLbl];
        return %orig(-1);
    } else {return %orig;}
}
%end

%hook HexagonButton
-(void)setButtonNo:(unsigned int)arg1{
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    if (preferences == nil) {
        preferences = @{ PREFERENCES_ENABLED_KEY : @(YES), PREFERENCES_LETTERASSISTANCE_KEY : @(YES), PREFERENCES_ZEROSTYLE_KEY : @(0) };
        [preferences writeToFile:PREFERENCES_PATH atomically:YES];
        isEnabled = YES;
        isLetterAsistanceEnabled = YES;
        zeroStyle = 0;
    } else {
        isEnabled = [preferences[PREFERENCES_ENABLED_KEY] boolValue];
        isLetterAsistanceEnabled = [preferences[PREFERENCES_LETTERASSISTANCE_KEY] boolValue];
        zeroStyle = [preferences[PREFERENCES_ZEROSTYLE_KEY] intValue];
    }
    %orig;
    if (isEnabled) {
        UILabel *numLbl = (UILabel *)([self valueForKey:@"numLbl"]);
        UILabel *lettersLbl = [[UILabel alloc] initWithFrame:numLbl.frame];
        if ([numLbl.text isEqualToString:@"1"]) {
            numLbl.text = @"I";
        } else if ([numLbl.text isEqualToString:@"2"]){
            numLbl.text = @"II";
            lettersLbl.text = @"A B C";
        } else if ([numLbl.text isEqualToString:@"3"]){
            numLbl.text = @"III";
            lettersLbl.text = @"D E F";
        } else if ([numLbl.text isEqualToString:@"4"]){
            numLbl.text = @"IV";
            lettersLbl.text = @"G H I";
        } else if ([numLbl.text isEqualToString:@"5"]){
            numLbl.text = @"V";
            lettersLbl.text = @"J K L";
        } else if ([numLbl.text isEqualToString:@"6"]){
            numLbl.text = @"VI";
            lettersLbl.text = @"M N O";
        } else if ([numLbl.text isEqualToString:@"7"]){
            numLbl.text = @"VII";
            lettersLbl.text = @"P Q R S";
        } else if ([numLbl.text isEqualToString:@"8"]){
            numLbl.text = @"VIII";
            lettersLbl.text = @"T U V";
        } else if ([numLbl.text isEqualToString:@"9"]){
            numLbl.text = @"IX";
            lettersLbl.text = @"W X Y Z";
        } else if ([numLbl.text isEqualToString:@"0"]){
            if (zeroStyle == 0) {
                numLbl.text = @"-";
            } else {
                numLbl.text = @"0";
            }
        }
        if (isLetterAsistanceEnabled) {
            if (!([numLbl.text isEqualToString:@"-"] || [numLbl.text isEqualToString:@"0"])) {
                numLbl.frame = CGRectMake(numLbl.frame.origin.x, numLbl.frame.origin.y - 8, numLbl.frame.size.width, numLbl.frame.size.height);
            }
            lettersLbl.font = [UIFont boldSystemFontOfSize:11];
            lettersLbl.textColor = [UIColor whiteColor];
            lettersLbl.textAlignment = NSTextAlignmentCenter;
            [lettersLbl sizeToFit];
            lettersLbl.center = numLbl.center;
            lettersLbl.frame = CGRectMake(lettersLbl.frame.origin.x, lettersLbl.frame.origin.y + 25, lettersLbl.frame.size.width, lettersLbl.frame.size.height);
            [numLbl.superview addSubview:lettersLbl];
        }
    }
}

%end
%end

static void PreferencesChanged(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
    NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    isEnabled = [preferences[PREFERENCES_ENABLED_KEY] boolValue];
    isLetterAsistanceEnabled = [preferences[PREFERENCES_LETTERASSISTANCE_KEY] boolValue];
    zeroStyle = [preferences[PREFERENCES_ZEROSTYLE_KEY] intValue];
}

%ctor {
    // NSDictionary *preferences = [[NSDictionary alloc] initWithContentsOfFile:PREFERENCES_PATH];
    // if (preferences == nil) {
    //     preferences = @{ PREFERENCES_ENABLED_KEY : @(YES) };
    //     [preferences writeToFile:PREFERENCES_PATH atomically:YES];
    //     isEnabled = YES;
    // }
    // else {
    //     isEnabled = [preferences[PREFERENCES_ENABLED_KEY] boolValue];
    // }

    isScramblePassInstalled = [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/ScramblePass.dylib"];

    isDummyPassInstalled = [[NSFileManager defaultManager] fileExistsAtPath:@"/Library/MobileSubstrate/DynamicLibraries/DummyPass.dylib"];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *pathForHive = @"/Library/MobileSubstrate/DynamicLibraries/Hive.dylib";
    if ([fileManager fileExistsAtPath:pathForHive]) { 
        %init(Hive);
    } else {
        %init(Stock);
    }

    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, PreferencesChanged, CFSTR(PREFERENCES_CHANGED_NOTIFICATION), NULL, CFNotificationSuspensionBehaviorCoalesce);
}