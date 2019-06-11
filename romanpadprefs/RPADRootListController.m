#include "RPADRootListController.h"

#define PREFERNCES_PATH @"/Library/PreferenceBundles/RomanPadPrefs.bundle"

#define localizedString(string) [[NSBundle bundleWithPath:PREFERNCES_PATH] localizedStringForKey:string value:@"" table:nil]

@implementation RPADRootListController
- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:localizedString(@"RESPRING_BUTTON_TITLE")
												style:UIBarButtonItemStyleDone
												target:self
												action:@selector(askToRespring:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor redColor];
}
- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}
	return _specifiers;
}

- (CGFloat)tableView:(id)tableView heightForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		return 100;
	} else {
		return [super tableView:tableView heightForHeaderInSection:section];
	}
}
- (id)tableView:(id)tableView viewForHeaderInSection:(NSInteger)section {
	if (section == 0) {
		UIView *headerView = [[UIView alloc] initWithFrame:(CGRect){{0, 0}, {320, 85}}];
		headerView.backgroundColor = UIColor.clearColor;
		headerView.clipsToBounds = YES;

		UIImage *iconImage = [[UIImage alloc] initWithContentsOfFile:[[NSBundle bundleWithPath:PREFERNCES_PATH] pathForResource:@"Header" ofType:@"png"]];
		UIImageView *iconImageView = [[UIImageView alloc] initWithImage:iconImage];
		iconImageView.frame = (CGRect){{0, 0}, {85, 85}};
		iconImageView.center = (CGPoint){headerView.center.x, headerView.center.y};
		iconImageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
		[headerView addSubview:iconImageView];

		return headerView;
	} else {
		return [super tableView:tableView viewForHeaderInSection:section];
	}
}

- (void)askToRespring:(id)sender {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:localizedString(@"RESPRING_ALERT_TITLE")
									message:localizedString(@"RESPRING_ALERT_MESSAGE") preferredStyle:UIAlertControllerStyleActionSheet];

	UIAlertAction *restart = [UIAlertAction actionWithTitle:localizedString(@"RESPRING_ALERT_RESTART") style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
							[self respring:nil];
						}];
	UIAlertAction *cancel = [UIAlertAction actionWithTitle:localizedString(@"RESPRING_ALERT_CANCEL") style:UIAlertActionStyleCancel handler:nil];
	[alert addAction:cancel];
	[alert addAction:restart];
	[self presentViewController:alert animated:YES completion:nil];
}

- (void)respring:(id)sender {
    NSTask *task = [[[NSTask alloc] init] autorelease];
    [task setLaunchPath:@"/usr/bin/killall"];
    [task setArguments:[NSArray arrayWithObjects:@"SpringBoard", nil]];
    [task launch];
}

@end
