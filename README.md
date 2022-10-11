## アプリケーション名
地域密着イベント探しアプリケーション「いべたん！」

##　アプリケーション概要
「いべたん！」は、住まい地域で参加できるイベントの情報を集めます。イベントの検索には、スマホのSNSや雑誌などが使われますが、地域の自治体のイベントは存在自体知らなかったりします。地域のイベント情報はオープンデータで提供されている場合があるため、本アプリで取得し、SNSなどの情報と合わせてイベント一覧として表示します。気になるイベントがあれば「お気に入り」ボタンでストックし「しおり」ボタンでイベント開催日をカレンダーに登録し確認できます。

### 開発言語
<ul>
  <li>Ruby
  <li>Rails
  <li>PostgreSQL 14.5
</ul>

### インフラ
AWS

### 導入したGem
GoogleMap系
<ul>
<li>JavaScript API
<br>　Google Maps をウェブサイトに表示する

<li>Directions API
<br>　最適化された経路検索を自動でできる

<li>Distance Matrix API
<br>　複数の始点・終点の組み合わせルートの「距離」「時間」を求められる

<li>Places API
<br>　施設検索の API、一億件以上の詳細情報を検索・表示できる

</ul>

## 実行手順
```
$ git clone
$ cd 
$ bundle install
$ rails db:create db:migrate
$ rails s
```

## カタログ設計
https://docs.google.com/spreadsheets/d/1EYnPyTVao9NgTIP9SUbL1AImMYYjSJZmA7Hq0IoZ1Ig/edit#gid=782464957

## テーブル設計
https://docs.google.com/spreadsheets/d/1EYnPyTVao9NgTIP9SUbL1AImMYYjSJZmA7Hq0IoZ1Ig/edit#gid=2020033787

## 画面遷移図
https://app.diagrams.net/#G1EvBxrhue4H-MsAJLpDibsYzhQZXq8ggE

## ER図
https://app.diagrams.net/#G1EvBxrhue4H-MsAJLpDibsYzhQZXq8ggE

## ワイヤーフレーム
https://app.diagrams.net/#G1EvBxrhue4H-MsAJLpDibsYzhQZXq8ggE
