# NameThatPet-ObjC-Swift

## What The App Does
Generate a fun name for your pet!

Set the parameters for **Title Gender**
and **Suffix** and press the button! A fun name will be generated for you
along with a randomly selected picture. If you want to change the picture,
click on it in the main screen and it will take you to a photo gallery, where
you can select a more suitable picture to go with the name that was created!

## Where To Download It
To try the app for yourself, you can download it from the
[App Store](http://bit.ly/NameThatPet)

![Main Screen](/screenshots/MainScreen.png)
![Picture Gallery](/screenshots/PictureGallery.png)

## A Few Notes on Objective-C and Swift Interoperability

NameThatPet is a "simple" iOS app written in Objective-C and Swift.
While the app itself doesn't have a lot of screens, it is a good example of
a project written with Objective-C and Swift code working together.
There are a lot of resources out there if you need to convert an existing ObjC
project to Swift, but this one was done on a smaller scale so you can use it as
a reference to get started on doing the same for your own project.

I recommend using this resource as a guide:
https://developer.apple.com/documentation/swift/migrating_your_objective-c_code_to_swift

### Extensions
I created a Swift extension file in order to add extra functionality to an
existing ObjC file whenever possible, rather than rewriting an entire ObjC file in Swift from scratch in one fell swoop. This makes it possible to add new Swift code incrementally to your project, and then you can go back and rewrite the ObjC pieces when you have time.

You can see the use of extensions in this project with the `ViewController`
and `NameData` classes.

### Importing Objective-C Into Swift
You can also create completely new Swift files and call ObjC code from within
your new Swift files.

You can see an example of this where the `animalImageView` property in
the `ViewController.h` file is made accessible to the `ViewController.swift` file.

Use the following as a resource for additional info:
https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_objective-c_into_swift

### Importing Swift Into Objective-C
You can also go the other way around, and import Swift function calls into
your ObjC files.

You can see an example of this in `NameData.m`, where the `randomImageName` function
is using the `random` function defined in `NameData.swift`.

Use the following as a resource for additional info:
https://developer.apple.com/documentation/swift/imported_c_and_objective-c_apis/importing_swift_into_objective-c
