// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADG-UnityAds-iOS-Adapter",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ADGUnityAdsAdapter",
            type: .static,
            targets: ["ADGUnityAdsAdapterTarget"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/AdGeneration/ADG-iOS-SDK.git",
            "2.43.0"..<"7.0.0"
        ),
        .package(
            url: "https://github.com/Unity-Technologies/Unity-Ads-Swift-Package",
            exact: "4.22.0"
        ),
    ],
    targets: [
        .target(
            name: "ADGUnityAdsAdapterTarget",
            dependencies: [
                .target(name: "ADGUnityAdsAdapter"),
                .product(name: "ADG", package: "ADG-iOS-SDK"),
                .product(name: "UnityAds", package: "Unity-Ads-Swift-Package"),
            ],
            path: "ADGUnityAdsAdapterTarget"
        ),
        .binaryTarget(
            name: "ADGUnityAdsAdapter",
            url: "https://github.com/AdGeneration/ADG-UnityAds-iOS-Adapter/releases/download/4.22.0/ADGUnityAds.xcframework.zip",
            checksum: "baad91e62483692b94fc9049147f68ec8869b6d5e6d78753b39875c726fc57dd"
        ),
    ]
)
