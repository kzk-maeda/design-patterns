# Study for Design Patterns
- デザインパターンについて勉強するメモ用のProject

# 前提知識
## 継承
- 継承には３つの特徴がある
    - 親クラスに新しいメソッドを加える・親クラスのメソッドを上書きする
    - 親クラスのメソッドを抽象化
    - 子クラスで共通する処理を親クラスでテンプレート化
- is-a / has-a

## self/this
- 自らのオブジェクト自身を差す

## 抽象クラス・メソッド
- Swift/GoのInterfaceみたいなこと
- メソッドの名前、引数と戻り値だけ定義し、実際のメソッドの実装は子クラスに移譲する
  - 詳細実装をする子クラスをコンクリートクラスと呼ぶ
- 抽象クラスを継承した子クラスでは、必ず抽象メソッドを実装する必要がある
- Rubyではサポートされていない

## 浅いコピーと深いコピー
- 浅いコピー
  - プリミティブ型変数では内容がコピーされる
  - クラス型変数（値と機能をもつ）では参照ポインタだけがコピーされて同一の内容を参照する
- 深いコピー
  - クラス型変数も内容そのものを別物としてコピーする

## 委譲（デリゲート）
- 受け取ったイベントをそのまま別の処理に任せること

## カプセル化
- オブジェクトがもつ内部のデータ、状態、動作に至るまでの一切を、特定のIFを経由する意外に外部から参照や変更をできないように規制すること

## 構文木
- 演算をツリー状で表現したもの

## 変更容易性
- Intrinsic／Extrinsic
  - 環境や状況の変化に影響されずに変化しないものをIntrinsic
  - 変化するものをExtrinsic
- Mutable/Immutable
  - 内容が変更可能なものをMutable
  - 変更できないものをImmutable

## リフレクション
- クラスのインスタンス生成やメソッド呼び出しを文字列で指定して、動的に変更する方法
- 実行時にクラスやメソッドが決まるために、存在しないものを渡してもコンパイルエラーにならない点に注意

# デザインパターンの種類
## オブジェクトの生成に関するパターン
- オブジェクト生成に関する処理をユーザープログラムから切り離し、結合度を下げるテクニック
- 具体例
  - Singleton
    - instanceの生成処理と生成数を管理
    - インスタンスが一つしかないことを保証する
  - AbstractFactory
    - 抽象インターフェースを操作するだけで必要なインスタンスを取得できる方法
  - Builder
    - 処理手順と構築作業を分離
      - Director：全体処理手順を記述
      - Builder：インターフェイス定義
      - COncreteBuilder：構築作業を行うメソッドの実装
  - Prototype
    - 原型のインスタンスを複製してオブジェクトを作り出す
      - newなどでのオブジェクト生成では内部状態が初期化されてしまう
      - 現在の内部状態のままオブジェクトを複製し、内部状態を変更しながら利用する場合など
        - Prototype：インターフェース定義
        - ContretePrototype：複製される原型オブジェクト
  - FactoryMethod
    - インスタンスの生成をFactoryとして分離する手法
    - 前後処理を含めたテンプレートメソッドを準備することで、インスタンス生成周辺の複雑な処理も含めて分離することが可能

## オブジェクトの構造に関するパターン
- プログラムの再利用性を高めるためのテクニック
- 具体例
  - Adapter
    - 既存クラスを交換する場合、IF定義が異なり、そのまま利用できない場合がある
    - AdapterがIFを仲介して、新たに導入するクラスを利用できるようにする
      - Target：ユーザー側で変更できないIF
      - Adapter：Targetからの呼び出しをAdaptee呼び出しに変換
      - Adaptee：このクラスにあるメソッドが使いたい
  - Bridge
    - クラスの機能と実装の両方を拡張し、かつ、参照関係がある場合、これを一つの継承関係で実現することは無駄が多くなる
    - それぞれを独立した別の継承クラスとし、両者を委譲（has-a）で結ぶ
  - Composite
    - プログラムで扱いデータが木構造で表現される場合、全てに一括で処理を行いたい場合などはまるで一つのオブジェクトのように一括処理できるとプログラムを簡潔に記述することができる
    - 再起処理の技術を利用して各要素を統一的に扱うことを可能とする
  - Decorator
    - あるクラスの機能の前後に機能を追加したい場合に用いられる（Pythonでは標準）
    - 元のクラスを維持したまま、機能を動的に拡張する
  - Facade
    - 機能全体の基本操作を簡単に行うための窓口を提供する
      - Facadeオブジェクトは背後のクラス群を参照する
      - 背後のクラス群はFacadeオブジェクトを参照しない
  - Flyweight
    - 再利用できるオブジェクトは何度も使えるよう、一度生成したインスタンスを管理して共有する
    - 要求されるインスタンスがあればそれを使い、なければ生成して提供する
  - Proxy
    - プロセス間通信、NW越しの通信、画面表示など、プログラムだけでは解決しないPLF全体最適を考慮する

## オブジェクトの振る舞いに関するパターン
- 状態遷移への対応、ステータス監視など
- 具体例
  - Iterator
    - オブジェクトの集合には様々な形式がある
    - オブジェクト集合から要素を取り出したり、先頭や最後を意識する操作は内部構造に依存するため、ユーザーが直接扱うのは難しい
    - 内部構造依存の操作を分離させ、ユーザーにオブジェクト集合にいぞんしない汎用的な操作性を与える
  - Command
    - オブジェクトを呼び出す場合、呼び出すオブジェクトをinstance化し、パラメータを設定し、メソッドを呼び出す
    - この手順を丸ごとオブジェクトにまとめるパターン
  - Chain of Responsibility
    - オブジェクトへメッセージを送った時、受信したオブジェクトが対応処理ができない場合、次に対応するオブジェクトへと順送りに要求する
    - 要求を受け取ったオブジェクトが、自身で処理可能かどうかを決定して転送することで、ユーザー側に転送処理や転送順位づけなどの負担を分離することができる
  - Memento
    - インスタンスの状態を保存し、復元できるようにする手法
    - Prototypeではインスタンスを丸ごとコピーするのに対して、Mementoでは必要なインスタンス情報に限って保存・回復機能を果たす
  - Observer
    - あるオブジェクトで状態が変化した場合、その状態変化を起こしたオブジェクトが「変化を知らせてほしい」と希望するオブジェクトに通知する仕組み
  - Mediator
    - 複数のオブジェクト間にある複雑な参照関係を簡潔にするため、Meriatorが仲介の中心となってすべてのオブジェクトがMeriator経由で要求と対応の処理をする
    - 変化があればMediatorに知らせ、Mediatorは他のオブジェクトに対応処理を要求する
  - Interpreter
    - ある文法規則で記述された情報をオブジェクトで表現し、末端と非末端を区別することなく再起的に処理することで結果を出す
    - Compositeはオブジェクトへの統一的な処理を目的とし、Interpreterは演算や文法処理を目的としたもの
  - State
    - 一つの状態を一つのオブジェクトで表現することで、状態遷移をシンプルに記述する方法
      - 通常はif-elseなどで管理
  - Strategy
    - アルゴリズムと処理手順を分離して、アルゴリズムを動的に変更可能とする
  - Template Method
    - 親クラスにてテンプレートとしての処理の枠組みを抽象メソッドを使って記述
      - その抽象メソッドを子クラスで実装
    - 処理に依存しない部分と依存する部分を分離する
  - Visitor
    - データ構造と処理を分離して保守性を高める
      - データ構造が同じでも処理が若干違うと別のオブジェクトを作成する必要があることへの対処