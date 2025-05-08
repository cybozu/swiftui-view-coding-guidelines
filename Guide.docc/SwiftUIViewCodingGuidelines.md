# SwiftUI View Coding Guidelines

@Metadata {
  @TechnologyRoot
}

@Options(scope: global) {
  @AutomaticSeeAlso(disabled)
  @AutomaticTitleHeading(disabled)
  @AutomaticArticleSubheading(disabled)
}

## Overview

高い表現力でコンポーネントと構文の対応が読み取りやすい、優れた`View`実装のガイドラインを提示します。

> 重要：このガイドラインが唯一の推奨される方法だと思わないでください。他のアプローチも自信を持って試してみてください。

## Contributing
- [repository][]を参照する
- [Discussions][]からフィードバック、要望を追加する

[repository]: https://github.com/cybozu/swiftui-view-coding-guidelines
[Discussions]: https://github.com/cybozu/swiftui-view-coding-guidelines/discussions

## New and updated
@Links(visualStyle: compactGrid) {
    - <doc:ProvideModifierWithParameter>
}

## SwiftUI Fundamentals
@Links(visualStyle: detailedGrid) {
    - <doc:WhatISViewIdentity>
    - <doc:ViewValuesAreEphemeral>
    - <doc:LayoutProcessTableOfContents>
}

## Topics
### Separate Responsibilities
- <doc:SeparatingStylingResponsibilities>
- <doc:SeparateDataBindingFromStyles>
- <doc:SeparateContentUnavailableCases>
- <doc:SpacingIsManagedByParentComponent>

### For better performance
- <doc:ChangeValueWhenSwitchingStyle>
- <doc:HideViewWithOpacityWhenAvailable>
- <doc:AssignUniqueValueToForEachID>
- <doc:MakeInitializerLowCost>

### The Art of API Design
- <doc:ProvidesContainerViewAccessViaProxy>
- <doc:ProvideModifierWithParameter>

### Key priciples of the User Interface
- <doc:UserOwnsTheirInput>

### View debugging
- <doc:SendViewUpdatesToConsole>

### Select implementation way
- <doc:SelectImplementationOfViewOverlap>
