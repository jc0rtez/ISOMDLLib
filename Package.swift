// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "ISOMDLLib",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "ISOMDLLib",
            targets: ["ISOMDLLibWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/sqlcipher/SQLCipher.swift", exact: "4.16.0")
    ],
    targets: [
        .binaryTarget(
            name: "ISOMDLLib",
            url: "https://github.com/jc0rtez/ISOMDLLib/releases/download/1.0.7/ISOMDLLib.xcframework.zip",
            checksum: "c7466c6d0ea1fd9fb45413dc6fb9251d0cd62de4912b9480084d1c946b052775"
        ),
        .target(
            name: "ISOMDLLibWrapper",
            dependencies: [
                .target(name: "ISOMDLLib"),
                .product(name: "SQLCipher", package: "SQLCipher.swift")
            ],
            path: "Sources/Wrapper"
        )
    ]
)
