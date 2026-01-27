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

## View API Design Principles
@Row(numberOfColumns: 2) {
    @Column {
        ### Harmony
        Harmonyは、コードがSwiftUIの環境に自然に溶け込むことです。Viewやmodifier、命名はフレームワークのイディオムに従い、コードを全体の一部とします。
    }

    @Column {
        ### Honesty
        Honestyは、コードが見たままの意味を持つことです。意図を覆い隠す抽象化、実態と異なる名前、本当の目的を隠す構造を避けてください。
    }

    @Column {
        ### Simplicity
        Simplicityは、複雑な対象に小さな構造を与えて再構築することです。対象の構造をそのまま宣言的に記述し、合成によって全体を統合します。
    }

    @Column {
        ### Aesthetics
        Aestheticsは、最後に信じるべきものです。これらの原則と矛盾するように見えても、美しいと感じるなら、その感覚に委ねてください。
    }
}

[repository]: https://github.com/cybozu/swiftui-view-coding-guidelines
[Discussions]: https://github.com/cybozu/swiftui-view-coding-guidelines/discussions

## New and updated
@Links(visualStyle: compactGrid) {
    - <doc:ContentUnavailableViewExtensions>
    - <doc:ProvideModifierWithParameter>
}

## SwiftUI Fundamentals
@Links(visualStyle: detailedGrid) {
    - <doc:WhatISViewIdentity>
    - <doc:ViewValuesAreEphemeral>
    - <doc:LayoutProcessTableOfContents>
}

## Contributing
- [repository][]を参照する
- [Discussions][]からフィードバック、要望を追加する

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
- <doc:ContentUnavailableViewExtensions>
- <doc:ProvidesContainerViewAccessViaProxy>
- <doc:ProvideModifierWithParameter>

### Key priciples of the User Interface
- <doc:UserOwnsTheirInput>

### View debugging
- <doc:SendViewUpdatesToConsole>

### Select implementation way
- <doc:SelectImplementationOfViewOverlap>
