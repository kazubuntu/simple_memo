# simple_memo

## 概要
タイトルと内容を入力可能なシンプルなメモアプリケーションです。メモの追加、変更、削除をすることができます。

![demo](https://user-images.githubusercontent.com/123526027/230894254-07683e19-e6b9-4458-8897-b7b5a17b78c0.gif)

## インストール方法
`Gem`のインストールに`Bundler`を使用します。インストールされていない場合は以下のコマンドでインストールする必要があります。
```
gem install bundler
```

1. 任意のフォルダで`git clone`します。
    ```
    git clone https://github.com/kazubuntu/simple_memo.git
    ```
2. `simple_memo`ディレクトリに移動し、必要な`Gem`をインストールします。
    ```
    cd simple_memo
    bundle install
    ```
3. `app.rb`を起動します。
    ```
    bundle exec ruby app.rb
    ```
4. ブラウザで`localhost:4567`にアクセスします。
    ![image](https://user-images.githubusercontent.com/123526027/230909631-9e8a655d-93bb-4e3b-b2d8-21021c5ef125.png)

## 使い方
- メモの追加  
追加ボタンをクリックすると新規作成画面に移動します。メモのタイトル、内容を入力し、保存ボタンをクリックすることでメモが保存されます。タイトルは省略できません。
- メモの表示  
保存されたメモのタイトルをクリックするとメモの詳細を表示することができます。
- メモの編集  
詳細画面の変更ボタンをクリックすると編集画面に移動します。メモのタイトル、内容を変更し、変更ボタンをクリックすることでメモが変更されます。
- メモの削除  
詳細画面の削除ボタンをクリックすることで、そのメモを削除できます。
