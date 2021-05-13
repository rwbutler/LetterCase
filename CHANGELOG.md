# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.6.1] - 2021-05-13
### Changed
- Made options public so that they are accessible for use - see `LetterCaseOptions`.

## [1.6.0] - 2020-08-25
### Added
- Backwards compatibility to Swift 4.2
- Allow only extension API only enabled

## [1.5.1] - 2020-08-23
### Changed
- Updated `Package.swift` to make backwards compatible to Swift 4.2 & compatible with non-iOS platforms where using Swift Package Manager.

## [1.5.0] - 2020-08-22
### Added
- Added implementations of `JSONEncoder.KeyEncodingStrategy`.
- Improved documentation.

## [1.4.0] - 2020-08-20
### Added
- Added support for train case.
- Add new implementations of `JSONDecoder.KeyDecodingStrategy`.
- Added `convert` function for converting from one lettercase to another.

## [1.3.1] - 2020-08-19
### Changed
- Moved KeyDecodingStrategyAdditions for SPM.

## [1.3.0] - 2020-08-19
### Added
- Added `JSONDecoder.KeyDecodingStrategy` for `convertFromKebabCase`.

## [1.2.0] - 2019-12-10
### Added
- Added convenience methods `capitalized`, `lowerCased` and `upperCased`.

## [1.1.0] - 2019-12-10
### Added
- Added `Package.swift` in order to support Swift Package Manager.

## [1.0.0] - 2019-11-19
### Added
- Initial release.
