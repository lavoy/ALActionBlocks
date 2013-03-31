# ALActionBlocks

ALActionBlocks is an Objective-C category on UIControl that allows for handling of control events with blocks
* Handle control events with block
* Remove blocks for control events
* Works with all your existing UIControl subclasses

This category was inspired by [Dave Delong] (https://github.com/davedelong)'s StackOverflow [answer] (http://stackoverflow.com/a/4582061/315074)

##### Adding blocks

```objc
// Assuming you have a UIButton named 'button'
[button handleControlEvents:UIControlEventTouchUpInside withBlock:^(UIButton *sender) {
    NSLog(@"buttton pressed: %@", [sender titleForState:UIControlStateNormal]);
}];
```

##### Removing Blocks

```objc
[button removeActionBlocksForControlEvents:handleControlEvents:UIControlEventTouchUpInside];
```

That's it!
