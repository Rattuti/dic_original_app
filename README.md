## アプリケーション名
地域密着イベント探しアプリケーション「いべたん！」

## アプリケーション概要
「いべたん！」は、住まい地域で参加できるイベントの情報を集めます。イベントの検索には、スマホのSNSや雑誌などが使われますが、地域の自治体のイベントは存在自体知らなかったりします。地域のイベント情報はオープンデータで提供されている場合があるため、本アプリで取得し、SNSなどの情報と合わせてイベント一覧として表示します。気になるイベントがあれば「タグ」ボタンでストックし「ブックマーク」ボタンでイベント開催日をカレンダーに登録し確認できます。

### 開発環境
#### 使用PC
<ul>
  <li>Google Chrome OS v105.0.5195.134(64 bit)
</ul>

#### 使用言語
<ul>
  <li>Ruby v3.1.2
  <li>Rails v6.0.6
  <li>PostgreSQL 14.5
  <li>Vue.js v5.0.6
  <li>npm v8.19.2
  <li>yarn v1.22.18
</ul>

#### インフラ
<ul>
  <li>AWS(仮)
</ul>

### 使用ライブラリ
<ul>Gem
  <li>mechanize
    <br>　指定するWebサイトから取り出したいHTML要素を探して持ってくる
</ul>


## 実行手順
```
$ git clone git@github.com:Rattuti/dic_original_app.git
$ cd dic_original_app
$ bundle install
$ rails db:create db:migrate
$ rails s
```

## カタログ設計
https://docs.google.com/spreadsheets/d/1EYnPyTVao9NgTIP9SUbL1AImMYYjSJZmA7Hq0IoZ1Ig/edit#gid=782464957

## テーブル設計
https://docs.google.com/spreadsheets/d/1EYnPyTVao9NgTIP9SUbL1AImMYYjSJZmA7Hq0IoZ1Ig/edit#gid=2020033787

## 画面遷移図
![image](https://user-images.githubusercontent.com/93857649/195608872-d4b8033a-5a2b-41c7-a70c-148a5b7177bb.png)

## ER図
![image](https://user-images.githubusercontent.com/93857649/227437690-54b2cce3-bb80-49bb-9099-1fe24feb0381.png)

## ワイヤーフレーム
https://drive.google.com/file/d/1EvBxrhue4H-MsAJLpDibsYzhQZXq8ggE/view?usp=sharing
