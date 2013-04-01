# ALActionBlocks

ALActionBlocks is an Objective-C category on UIControl that allows for handling of control events with blocks.

- Handle control events with blocks
- Remove blocks for control events
- Works with all of your existing subclasses of UIControl

This category was inspired by [Dave Delong] (https://github.com/davedelong)'s StackOverflow [answer] (http://stackoverflow.com/a/4582061/315074).

##### Adding blocks

```objc
// Assuming you have a UIButton named 'button'
[button handleControlEvents:UIControlEventTouchUpInside withBlock:^() {
    NSLog(@"buttton pressed: %@", [button titleForState:UIControlStateNormal]);
}];
```

##### Removing Blocks

```objc
[button removeActionBlocksForControlEvents:UIControlEventTouchUpInside];
```

That's it!


*Check out the demo project for more details.*