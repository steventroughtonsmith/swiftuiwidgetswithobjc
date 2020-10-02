#  swiftuiwidgetswithobjc

This is a trivial example showing an Objective-C app, and example data model, with a SwiftUI widget designed for iOS 14.

### Notes

- Your Objective-C class prefix is not respected by Xcode when you add a Widget Extension target, so be prepared to manually add it to any instances of 'ConfigurationIntent' in the template
- Once you add any Objective-C code into a Widget Extension, its Intent will automatically generate code in ObjC and not Swift and no longer compile by default, which means you must manually add an Objective-C Bridging Header and manually import the Configuration Intent's header file — which will not physically be in your project, and is based on a filename convention generated from the items in your intentdefinition file. See `Swift-Bridging-Header.h`

### Screenshot

![https://hccdata.s3.us-east-1.amazonaws.com/gh_objc_widget.jpg "Screenshot of ObjC-backed widget running in Xcode Preview Pane"](https://hccdata.s3.us-east-1.amazonaws.com/gh_objc_widget.jpg "Screenshot of ObjC-backed widget running in Xcode Preview Pane")
