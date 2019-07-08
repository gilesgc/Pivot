
%hook FFGradientBackgroundView

-(void)layoutSubviews {
  %orig;
  ((CAGradientLayer *) [self layer]).colors = @[(id)[[UIColor blackColor] CGColor], (id)[[UIColor blackColor] CGColor], (id)[[UIColor blackColor] CGColor]];
}

%end

%ctor {
  %init(FFGradientBackgroundView = objc_getClass("Firefox_Focus.GradientBackgroundView"));
}
