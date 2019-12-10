// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "LetterCase",
    platforms: [
        .iOS("8.0")
    ],
    products: [
        .library(
            name: "LetterCase",
            targets: ["LetterCase"]
        )
    ],
    targets: [
        .target(
            name: "LetterCase",
            path: "LetterCase/Classes"
        )
    ]
)
