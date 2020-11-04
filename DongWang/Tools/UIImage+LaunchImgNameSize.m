
#import "UIImage+LaunchImgNameSize.h"
@implementation UIImage (LaunchImgNameSize)
+ (UIImage *)LaunchImgNameSize {
UIImage               *wwllacimg      = nil;
NSString              *viewOrientation = nil;
CGSize                 viewSize        = [UIScreen mainScreen].bounds.size;
UIInterfaceOrientation orientation     = [[UIApplication sharedApplication] statusBarOrientation];
if (orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight) {
    viewOrientation = @"Landscape";
} else {
    viewOrientation = @"Portrait";
}
NSArray *imagesDictionary = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
for (NSDictionary *dict in imagesDictionary) {
    CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);
    if (CGSizeEqualToSize(imageSize, viewSize) && [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {
        wwllacimg = [UIImage imageNamed:dict[@"UILaunchImageName"]];
    }
}
return wwllacimg;
}
+ (UIImage *)getLaunchImage {

    CGSize viewSize = [UIScreen mainScreen].bounds.size;

    NSString *viewOrientation = @"Portrait";//方向

    NSString *imageName = nil;

    NSArray *lauchImages = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];

    for (NSDictionary *dict in lauchImages) {

        CGSize imageSize = CGSizeFromString(dict[@"UILaunchImageSize"]);

        if (CGSizeEqualToSize(viewSize, imageSize) &&

            [viewOrientation isEqualToString:dict[@"UILaunchImageOrientation"]]) {

            imageName = dict[@"UILaunchImageName"];

        }

    }

    return [UIImage imageNamed:imageName];

}
@end
