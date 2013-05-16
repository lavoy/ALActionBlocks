# ALActionBlocks

ALActionBlocks is an Objective-C category on UIControl and UIBarButtonItem that allows for handling of control events with blocks.

- Handle control events with blocks
- Remove blocks for control events
- Gives you a weak reference to your control in the block
- Works with all of your existing subclasses of UIControl & UIBarButtonItem

This category was inspired by [Dave DeLong] (https://github.com/davedelong)'s StackOverflow [answer] (http://stackoverflow.com/a/4582061/315074).

#### Simple Example


```objc
#import "ALActionBlocks.h"
```
```objc
// Assuming you have a UIButton named 'button'
[button handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakControl) {
    NSLog(@"button pressed");
}];
```

#### Removing Blocks

```objc
[button removeActionBlocksForControlEvents:UIControlEventTouchUpInside];
```

That's it!

*Check out the demo project for more details.*


#### Requirements

ALActionBlocks is compatible with [iOS 5.0](http://developer.apple.com/library/ios/#releasenotes/General/WhatsNewIniOS/Articles/iOS5.html) and above.

### ARC

Yuuuup!

### Creator

[Andy LaVoy](http://github.com/lavoy)  
[@lavoy](https://twitter.com/lavoy)

### License

ALActionBlocks is available under the [MIT] (http://opensource.org/licenses/MIT) license.
