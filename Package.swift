// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "LetterCase",
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
