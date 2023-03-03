<template>
  <div class="content">
    <h2>カレンダー：{{ displayDate }}</h2>
    <div class="button-area">
      <!--clickイベントでprevMonth、nextMonthメソッド-->
      <button @click="prevMonth" class="button">前の月</button>
      <button @click="nextMonth" class="button">次の月</button>
    </div>
    <div class="calendar">
      <div class="calendar-weekly">
        <div class="calendar-youbi" v-for="n in 7" :key="n"> 
          {{ youbi(n-1) }}
        </div>
      </div>
      <div class="calendar-weekly" v-for="(week, index) in calendars" :key="index">
        <!--classバインディングでcurrentMouthの値とday.monthの値が違うとclassのoutsideを適用する-->
        <div 
        class="calendar-daily" 
        :class="{outside: currentMonth !== day.month}" 
        v-for="(day, index) in week" :key="index">
          <div class="calendar-day">
            {{ day.day }}
          </div>
          <div v-for="dayEvent in day.dayEvents" :key="dayEvent.id" >
            <!--styleバインドで背景の色を読み込む。イベント名を表示する-->
            <!--dayEventオブジェクトには、id,color,name,start,endプロパティを含む-->
            <!--draggable属性でカレンダーのイベント名をドラッグ&ドロップする-->
            <div 
              class="calendar-event"
              :style="`background-color:${dayEvent.color}`"
            >
                {{ dayEvent.name }}
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
//日付データの作成 $ npm i moment
import moment from "moment"

export default {
  data() {
    return {
      //
      currentDate: moment(),
    
  events:[
    //name：イベント名, start：イベント開始日, end：イベント終了日, color：背景の色
  { id: 1, name: "ミーティング", start: "2023-02-01", end:"2023-02-01", color:"blue"},
  { id: 2, name: "イベント", start: "2023-02-02", end:"2023-02-03", color:"limegreen"},
  { id: 3, name: "会議", start: "2023-02-06", end:"2023-02-06", color:"deepskyblue"},
  { id: 4, name: "有給", start: "2023-02-08", end:"2023-02-08", color:"dimgray"},
  { id: 5, name: "海外旅行", start: "2023-02-10", end:"2023-02-15", color:"navy"},
  { id: 6, name: "誕生日", start: "2023-02-16", end:"2023-02-16", color:"orange"},
  { id: 7, name: "イベント", start: "2023-02-12", end:"2023-02-15", color:"limegreen"},
  { id: 8, name: "出張", start: "2023-02-12", end:"2023-02-13", color:"teal"},
  { id: 9, name: "客先訪問", start: "2023-02-14", end:"2023-02-14", color:"red"},
  { id: 10, name: "パーティ", start: "2023-02-15", end:"2023-02-15", color:"royalblue"},
  { id: 12, name: "ミーティング", start: "2023-02-18", end:"2023-02-19", color:"blue"},
  { id: 13, name: "イベント", start: "2023-02-21", end:"2023-02-21", color:"limegreen"},
  { id: 14, name: "有給", start: "2023-02-20", end:"2023-02-20", color:"dimgray"},
  { id: 15, name: "イベント", start: "2023-02-25", end:"2023-02-28", color:"limegreen"},
  { id: 16, name: "会議", start: "2023-02-21", end:"2023-02-21", color:"deepskyblue"},
  { id: 17, name: "旅行", start: "2023-02-23", end:"2023-02-24", color:"navy"},
  { id: 18, name: "ミーティング", start: "2023-02-28", end:"2023-02-28", color:"blue"},
  { id: 19, name: "会議", start: "2023-02-12", end:"2023-02-12", color:"deepskyblue"},
  { id: 20, name: "誕生日", start: "2023-02-30", end:"2023-02-30", color:"orange"},
  ],
    };
  },
  //
  methods: {
    //1週目の曜日
    youbi(dayIndex) {
      const week = ["日", "月", "火", "水", "木", "金", "土"];
      return week[dayIndex];
    },
    //カレンダーの最初の日
    getStartDate() {
      //momentのsubstractメソッド第一引数に曜日の数字、第二引数に日付の引き算
      let date = moment(this.currentDate);
      //startOfメソッドの引数に"month"を入れると、その月の最初の日を取得する
      date.startOf("month");
      //dayメソッドで曜日を取得。
      const youbiNum = date.day();
      return date.subtract(youbiNum, "days");
    },
    //カレンダーの最後の日
    getEndDate() {
      let date = moment(this.currentDate);
      //endOfメソッドの引数に"month"を入れると、その月の最後の日を取得する
      date.endOf("month");
      const youbiNum = date.day();
      //その月の最終日から、その週の土曜日の日付を出すため引き算
      return date.add(6 - youbiNum, "days");
    },
    //カレンダー表用の配列を作る
    //カレンダーの日付をgetCalendarメソッドに保存する
    getCalendar() {
      let startDate = this.getStartDate();
      let endDate = this.getEndDate();
      //カレンダーに表示する週の数の計算
      //カレンダー表示の最初と最後の日を引いて（diffメソッド）7で割り、Math.ceilで小数点切り上げる
      const weekNumber = Math.ceil(endDate.diff(startDate, "days") / 7);

      //週の数でループ、その中で更に1週間分ループ
      //ループごとに日付を1ずつ追加
      //dateに日付を登録
      let calendars = [];
      let calendarDate = this.getStartDate();

      for (let week = 0; week < weekNumber; week++) {
        let weekRow = [];
        for (let day = 0;  day < 7; day++) {
          //getDayEventsメソッドの中でcalendarDateの日に開催されているイベントをすべて取得する
          let dayEvents = this.getDayEvents(calendarDate);
          //weekRowの中にオブジェクトとして保存
          //pushメソッドは配列の最後に新しい要素を追加する
          weekRow.push({
            //getメソッドに文字列dateを指定すると日のみ取得できる
            day: calendarDate.get("date"),
            month: calendarDate.format("YYYY-MM"),
            dayEvents
          });
          //addメソッドで最初の日（stateDate）をループの度に1日増やす
          calendarDate.add(1, "days");
        }
        calendars.push(weekRow);
      }
      return calendars;
    },
    //イベントの取得
    //getDayEventsを実行すると引数のdateが含まれるイベントを取得する
    getDayEvents(date){
      //各イベントをeventsプロパティから取得する
      //filter関数でeventsを展開し、各イベントの開始日と終了日の間でイベントを取得したい日が含まれるかチェック
      return this.events.filter(event => {
        let startDate = moment(event.start).format('YYYY-MM-DD')
        let endDate = moment(event.end).format('YYYY-MM-DD')
        let Date = date.format('YYYY-MM-DD')
      if(startDate <= Date && endDate >= Date) return true;
      });
      },
    //getDayEvents(date){
      //let dayEvents = [];
      //forEach関数でイベント開始日が取得したいイベントの日と一致する場合のみ取り出す
      //return this.events.filter(event => {
        //開始日と終了日を取得
        //let startDate = moment(event.start).format('YYYY-MM-DD')
        //let endDate = moment(event.end).format('YYYY-MM-DD')
        //let Date = date.format('YYYY-MM-DD')

        //if(startDate === Date){
        //  let betweenDays = moment(endDate).diff(moment(startDate), "days")
        //  let width = betweenDays * 100 + 95;
//
        //  dayEvents.push({...event,width})
        //}
        //if(startDate <= Date && endDate >= Date) return true;
        //});
      //},
        //if(startDate == Date){
        //  let width = this.getEventWidth(startDate, endDate, day)
        //  dayEvents.push({...event,width})
      //  }else if(day === 0){
      //    let width = this.getEventWidth(date, endDate, day)
      //    dayEvents.push({...event,width})
      //  }
        //}
      //});
    
      //return dayEvents;
    //},
        //if(startDate <= Date && endDate >= Date){
        //開始日のみに制限
        //if(startDate === Date){
          //終了日から開始日間の日数を取得する
          //let betweenDays = moment(endDate).diff(moment(startDate), "days")
      //    //取得した日数に100かけてwidthを設定
      //    //複数の日数がなければwidthは95になる
      //    //style="width:95%"幅をイベント要素に表示させる
      //    //let width = betweenDays * 100 + 95;
      //    let width = this.getEventWidth(startDate, endDate, day)
      //    dayEvents.push({...event,width})
//
      //  }else if(day === 0){
      //    let width = this.getEventWidth(date, endDate, day)
      //    dayEvents.push({...event,width})
      //  }
      //    //dayEvents.push(event)
      //  }
      //});
      //return dayEvents;
    //},//
    //カレンダー幅に、連日イベントの要素の幅を納める
    //開始日、終了日、曜日(day)を使い、イベントの長さを計算する
    getEventWidth(end, start, day){
      //カレンダーのイベント項目の幅を収めるメソッド作り
      //例、海外旅行：2023/2/10(金)〜13(月)なら、期間は4日
      //金曜日の曜日は日曜：0なので"5"になり、widthは195長さになる
      let betweenDays = moment(end).diff(moment(start), "days")
        if(betweenDays > 6 - day){
          return (6 - day) * 100 + 95; 
        }else{
          return betweenDays * 100 + 95;
        }
    },

    //sortedEvents(){
    //  //イベント項目のソートのメソッド作り
    //  return this.events.slice().sort(function(a,b) {
    //    let startDate = moment(a.start).format('YYYY-MM-DD')
    //    let startDate_2 = moment(b.start).format('YYYY-MM-DD')
    //    if( startDate < startDate_2 ) return -1;
    //    if( startDate > startDate_2 ) return 1;
    //    return 0;
    //  })
    //},
    // 翌月
    nextMonth() {
      this.currentDate = moment(this.currentDate).add(1, "month");
    },
    // 前月
    prevMonth() {
      this.currentDate = moment(this.currentDate).subtract(1, "month");
    },
  },
  //カレンダーの表示に算出プロパティ（computed）を使う
  //条件式が使える
  //複雑なデータを表現するに使う
  computed: {
    calendars() {
      return this.getCalendar();
    },
    //日付タイトルの表示を変える
    //format関数を使い表示の設定を変える
    displayDate(){
    return this.currentDate.format('YYYY[年]M[月]')
    },
    //
    currentMonth(){
    return this.currentDate.format('YYYY-MM')
    },
  },
}
</script>

<style>
.content{
  margin:2em auto;
  width:900px;
}
.button-area{
  margin:0.5em 0;
}
.button{
  padding:4px 8px;
  margin-right:8px;
}
.calendar{
  max-width:600px;
  border-top:1px solid #E0E0E0;
  font-size:0.8em;
}
.calendar-weekly{
  display:flex;
  border-left:1px solid #E0E0E0;
  /* background-color: black; */
}
.calendar-daily{
  flex:1;
  min-height:125px;
  border-right:1px solid #E0E0E0;
  border-bottom:1px solid #E0E0E0;
  margin-right:-1px;
}
.calendar-day{
  text-align: center;
}
.calendar-youbi{
  flex:1;
  border-right:1px solid #E0E0E0;
  margin-right:-1px;
  text-align:center;
}
.outside{
  background-color: #f7f7f7;
}
.calendar-event{
  color:white;
  margin-bottom:1px;
  height:25px;
  line-height:25px;
}
</style>