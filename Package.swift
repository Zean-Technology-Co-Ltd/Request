// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Request",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "Request", targets: ["Request"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
        .package(url: "https://github.com/antitypical/Result.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.8.0")),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.5.0"))
    ],
    targets: [
        .target(
            name: "Request",
            dependencies: [
              "Result",
              "Moya",
              "Alamofire",
              "RxSwift"
            ]),
        .testTarget(
            name: "RequestTests",
            dependencies: ["Request"]),
    ]
)
