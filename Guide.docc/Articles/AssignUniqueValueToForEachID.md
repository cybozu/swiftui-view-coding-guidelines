# ForEachのIDにはuniqueな値を使う

`ForEach`のIDには描画範囲を特定させるためにuniqueな値を使用します。

## Overview

`ForEach`のIDは繰り返しのうちどの要素であるかを特定するために利用されるView Identityです。  
IDが変化すると値の変化の有無にかかわらず描画がアップデートされます。  
適切なIDを与えることで不要な描画アップデートを防ぎ、良いパフォーマンスのViewを作成できます。

### IDの有効期間
IDにはViewのライフタイムより長い有効期間を持つuniqueな値を使用します。  
例えば表示に用いるデータのArrayのindexはuniqueですが、先頭への要素の追加などの操作によって変化するため、Viewのライフタイムより短い有効期間となります。  
ArrayのindexをIDとして用いると、先頭に要素が追加された場合に全ての要素で描画をアップデートすることとなり、パフォーマンスに悪影響を及ぼします。

## See Also
- <doc:WhatISViewIdentity>
