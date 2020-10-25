# Moments

### In this version

* List of flows
* Image cache using Kingfisher (could use NSCache<NSString, UIImage>())
* List of galleries
* Unit tests
* Componentization
    * ButtonReload
    * RefreshControl
    * BackButton
    * InfoView: *cell's footer to snow information of the gallery*
* Base view controller
* Internationalization
* Error management

### Concepts covered
* SOLID
* Design Patterns
    * Decorator
    * Builder
    * Facade
* Inheritance
* Encapsulation
* Maintainability
* Scalability
* Readability

### Future items
* Pull refreh.
* Simulate diferent flow from home screen.
* Enable more environments using Schemes.
* Enable dark mode.
* Add app icon.
* Create a custom loader image.
* Request more than one gallery page.
* Create more unit tests.
* Use RxSwift
* Use NSCache<NSString, UIImage>()

### To be fixed (need more time)
* Some constraints are brok.
* Check cell's life cycle to stop loader.
* Check image momory reference after download to link with cell.

### Libraries

| Name | **Version** |
|:---:|:---:|
| **[Alamofier](https://github.com/Alamofire/Alamofire)** | ~> 5.2.x
| **[Kingfisher](https://github.com/onevcat/Kingfisher)** | ~> 5.9.x
| **[SwiftLint](https://github.com/realm/SwiftLint)** | ~> 0.36.x

### Architecture

* **MVVM-C**

``` We are using MVVM as base of the architecture plus C (Coordinator)```

### Git
* [GitFlow](https://datasift.github.io/gitflow/IntroducingGitFlow.html)

### Requirements

* iOS 13.6  or later
* Xcode 12.0.x or later
* Swift 5.0  or later
* [CocoaPods](https://cocoapods.org)

### Instalation

* Using terminal, go to the project folder where there is the **Podfile** and execute the command bellow.

`pod install`

### Contribution

Discussion and pull requests are welcomed

### Authors

* Jáder Nunes

### License

Movies is under MIT license. See the [LICENSE](LICENSE) for more info.
