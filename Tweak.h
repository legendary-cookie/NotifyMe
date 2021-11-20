@interface MTPlatterView : UIView
@end

@interface MTTitledPlatterView : MTPlatterView
@end

@interface NCNotificationShortLookView : MTTitledPlatterView
@property(nonatomic, copy)NSArray* icons;
@property(nonatomic, copy)NSString* title;
@property(nonatomic, copy)NSString* primaryText;
@property(nonatomic, copy)NSString* secondaryText;
@property (nonatomic,copy) NSString * primarySubtitleText; 
@property (nonatomic,copy) NSString * summaryText; 
-(NSString *)secondaryText;
@end
