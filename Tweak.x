#include "udp.h"
#include "Tweak.h"

%group NotifyMe
 %hook NCNotificationShortLookView
 	- (void)didMoveToWindow {
		%orig;

		#ifdef ENABLE_DEBUG
			NSLog(@"NFME Title = %@", [self title]);
			NSLog(@"NFME Primary = %@", [self primaryText]);
			NSLog(@"NFME Primary Subtitle = %@", [self primarySubtitleText]);
			NSLog(@"NFME Secondary = %@", [self secondaryText]);
			NSLog(@"NFME Summary = %@", [self summaryText]);
		#endif

		NSString* descText;
		
		if ([self primarySubtitleText] != nil) {
			descText = [NSString stringWithFormat:@"%@\n%@", [self primaryText], [self primarySubtitleText]];
		} else {
			descText = [self primaryText];
		}
		sendNotify(
			[self title],
			descText
		);
	}
 %end
%end


%ctor {
	%init(NotifyMe);
}
