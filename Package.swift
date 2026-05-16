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
            url: "https://github.com/jc0rtez/ISOMDLLib/releases/download/1.0.5/ISOMDLLib.xcframework.zip",
            checksum: "c2fd6c55f6f2a981ce6609f01b877350a88449f0ef68f4f6ff971c6a1fc3f0e3"
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
