# Viewの値は一時的なもの

Viewの値は一時的なものであり、Viewのライフタイムよりも短いものとして扱います。

## Overview

SwiftUIのViewは値の変更によって描画がアップデートされます。  
Viewのinitによって値は変化していますが、View Identityが変化しない限り同じViewとして認識されます。    
ViewのライフタイムはView Identityによって決定され、Viewの値の寿命はViewのライフタイムとは別のものとして扱います。

> Demystify SwiftUI - WWDC21 - [18:33](https://developer.apple.com/videos/play/wwdc2021/10022?time=1113)

## Avoid anti-patterns
### ViewのinitでStateを作成しない
ViewのinitでStateを作成すると、Viewの値が変更されたときに新しいStateが作成されます。  
Viewの値は一時的なものなので、Viewのライフタイムより短いライフタイムを持ったStateを作成することになります。    
通常Viewに与えるStateはViewのライフタイムと同じかそれ以上のライフタイムを持つものを使うので、ViewのinitでのState作成は避けるようにします。

## See Also
- <doc:WhatISViewIdentity>
