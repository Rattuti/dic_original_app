<template>
<!--<form @submit.prevent="createProfile">
<div>
    <label for="gender">性別</label>
    <input
        id="gender"
        v-model="gender"
        name="gender"
        value="男性"
    >男性
    <input
        id="gender"
        v-model="gender"
        name="gender"
        value="女性"
    >女性
</div>

<div>
    <label for="age">年齢</label>
    <select
        id="age"
        v-model="age">
        <option
            disabled
            value=""
        >
            選択してください
        </option>
        <option>20代</option>
        <option>30代</option>
        <option>40代</option>
        <option>50代</option>
        <option>60代</option>
        <option>70代</option>
    </select>
</div>

<div>
    <label for="residence">住所(都道府県)</label>
    <select
        id="residence"
        v-model="residence"
        name="residence">
        <option
            disabled
            value=""
        >
            選択してください
        </option>
        ~北海道~
        <option>北海道</option>
        ~東北~
        <option>青森県</option>
        <option>岩手県</option>
        <option>宮城県</option>
        <option>秋田県</option>
        <option>山形県</option>
        <option>福島県</option>
        ~関東~
        <option>茨城県</option>
        <option>栃木県</option>
        <option>群馬県</option>
        <option>埼玉県</option>
        <option>千葉県</option>
        <option>東京都</option>
        <option>神奈川県</option>
        <option>新潟県</option>
        <option>富山県</option>
        <option>石川県</option>
        <option>福井県</option>
        <option>山梨県</option>
        <option>長野県</option>
        <option>岐阜県</option>
        <option>静岡県</option>
        <option>愛知県</option>
        <option>三重県</option>
        <option>滋賀県</option>
        <option>京都府</option>
        <option>大阪府</option>
        <option>兵庫県</option>
        <option>奈良県</option>
        <option>和歌山県</option>
        <option>鳥取県</option>
        <option>島根県</option>
        <option>岡山県</option>
        <option>広島県</option>
        <option>山口県</option>
        <option>徳島県</option>
        <option>香川県</option>
        <option>愛媛県</option>
        <option>高知県</option>
        ~九州~
        <option>福岡県</option>
        <option>佐賀県</option>
        <option>長崎県</option>
        <option>熊本県</option>
        <option>大分県</option>
        <option>宮崎県</option>
        <option>鹿児島県</option>
        ~沖縄~
        <option>沖縄県</option>
    </select>
</div>

<div>
    <label for="introduction">自己紹介</label>
    <textarea
        id="introduction"
        v-model="introduction"
        name="introduction"
        cols="30"
        rows="5"
        placeholder="入力してください"
    >
    </textarea>
</div>

<div>
    <label for="hobby">趣味</label>
    <input
        id="hobby"
        v-model="hobby"
        type="text"
        placeholder="入力してください"
    >
</div>

<p>
    <button>
        登録する
    </button>
</p>

<p>{{ responseMessage.error }}</p>
</form>-->
</template>


<script>
////import { reactive, toRefs } from 'vue'
//import { useRouter } from 'vue-router'
//import axios from 'axios'
//
//const formDatas = reactive({
//    gender: '',
//    age: '',
//    residence: '',
//    introduction: '',
//    hobby: '',
//})
//
//const {
//    gender,
//    age,
//    residence,
//    introduction,
//    hobby,
//} = toRefs(formDatas)
//
//const responseMessage = reactive({
//    error: '',
//})
//
//const router = useRouter()
//
//const user = reactive({
//    id: localStorage.getItem('uid')
//})
//
//const createProfile = () => {
//    axios.post('http://localhost:3000/profiles', {
//        gender: formDatas.gender,
//        age: formDatas.age,
//        residence: formDatas.residence,
//        introduction: formDatas.introduction, 
//        hobby: formDatas.hobby,
//    })
//    .then ((response) => {
//        console.log('登録できました')
//        console.log({response })
//        router.path({
//            path: `/profiles/${user.id}`,
//            query: { successMessage: '登録しました'},
//        })
//    })
//    .catch ((error) => {
//        console.log('登録できませんでした')
//        console.log({ error })
//        responseMessage.error = '登録できませんでした'
//    })
//}
</script>


<style>

</style>