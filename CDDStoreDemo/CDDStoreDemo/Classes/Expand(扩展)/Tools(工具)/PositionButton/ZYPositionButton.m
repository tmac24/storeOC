#import "ZYPositionButton.h"

@interface ZYPositionButton ()

/**
 图片距离上下的距离
 */
@property (nonatomic, assign) CGFloat space;

@end

@implementation ZYPositionButton

+ (id)buttonWithType:(UIButtonType)buttonType withSpace:(CGFloat)space {
    ZYPositionButton *button = [super buttonWithType:buttonType];
    button.space = space;
    return button;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //文案的宽度
    CGFloat labelWidth = self.titleLabel.frame.size.width;
    //文案的高度
    CGFloat labelHeight = self.titleLabel.frame.size.height;
    //图片宽
    CGFloat imageWidth = self.imageView.frame.size.width;

    switch (self.buttonStyle) {
        case ZYPButtonImageLeft: {
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space, -self.padding / 2, self.space, self.padding / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(0, self.padding / 2, 0, -self.padding / 2);
        }
            break;
        case ZYPButtonImageRight: {
            //设置后的image显示的高度
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space, labelWidth + self.padding / 2, self.space, -labelWidth - (self.padding / 2));
            self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - (self.padding / 2), 0, imageWidth + (self.padding / 2));
        }
            break;
        case ZYPButtonImageTop: {
            //设置后的image显示的高度
            CGFloat imageHeight = self.frame.size.height - (2 * self.space) - labelHeight - self.padding;
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space, (self.frame.size.width - imageHeight) / 2, self.space + labelHeight + self.padding, (self.frame.size.width - imageHeight) / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(self.space + imageHeight + self.padding, -imageWidth, self.space, 0);
            self.titleEdgeInsets = UIEdgeInsetsMake(self.space + imageHeight + self.padding, -imageWidth, self.space, 0);
        }
            break;
        case ZYPButtonImageBottom: {
            //设置后的image显示的高度
            CGFloat imageHeight = self.frame.size.height - (2 * self.space) - labelHeight - self.padding;
            self.imageEdgeInsets = UIEdgeInsetsMake(self.space + labelHeight + self.padding, (self.frame.size.width - imageHeight) / 2, self.space, (self.frame.size.width - imageHeight) / 2);
            self.titleEdgeInsets = UIEdgeInsetsMake(self.space, -imageWidth, self.padding + imageHeight + self.space, 0);
        }
            break;
        default:
            break;
    }
}

@end
