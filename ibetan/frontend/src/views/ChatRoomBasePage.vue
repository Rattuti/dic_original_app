<template>
    <div class="container">
        <NavHeaderBar />
        <ArticleBasePage @connectCable="connectCable" />
        <ChatWindow @connectCable="connectCable" :messages="formattedMessages" ref="chatWindow" />
        <NewChatForm @connectCable="connectCable" />
        <CalendarBasePage />
    </div>
</template>

<script>
//export default外はJavascriptの領地
//JavaScriptで定義した関数などはvueでも使えてしまう
import NavHeaderBar from '../components/NavHeaderBar'
import ArticleBasePage from './ArticleBasePage'
import ChatWindow from '../components/ChatWindow'
import NewChatForm from '../components/NewChatForm'
import CalendarBasePage from './CalendarBasePage'
//import NavFooterBar from '../components/NavFooterBar'

import axios from 'axios'
import ActionCable from 'actioncable'

import { formatDistanceToNow } from 'date-fns'
//data-fnsから{}内の関数を指定して呼び出し
import { ja } from 'date-fns/locale'

export default {
//export default内はVueの領地
    components: { 
        NavHeaderBar,
        ArticleBasePage,
        ChatWindow,
        NewChatForm,
        CalendarBasePage,
        //NavFooterBar,
    },
    data () {
        return {
            messages: [],
        }
    },
    computed: {
    //算出プロパティ
    //値が変わると自動で計算し、結果を1つだけ持つ
    //呼び出すたびに計算せず、計算済の結果を返す
        formattedMessages(){
            if(!this.messages.length){ return [] }
            //this.は、vueの領域だけで決めた変数や処理を、vueの領域で呼び出すために使う
            //this.をつけてmessagesを指定しvue内で呼び出している
            //※JavaScriptとの区別のため
            return this.messages.map(message => {
                let time = formatDistanceToNow(new Date(message.created_at),{ locale: ja } )
                return { ...message, created_at: time }
            })
        }
    },
    methods: {
        async getMessages () {
            try {
                const res = await axios.get('http://localhost:3000/messages', {
                headers: {
                    uid: window.localStorage.getItem('uid'),
                    "access-token": window.localStorage.getItem('access-token'),
                    client:window.localStorage.getItem('client')
                }})
                if (!res) {
                    new Error('メッセージ一覧を取得できませんでした')
                }
                this.messages = res.data
            } catch (err) {
                this.error = 'メッセージ一覧を取得できませんでした'
            }
        },
        connectCable (message) {
            this.messageChannel.perform('receive', {
            message: message,
            email: window.localStorage.getItem('uid')
            })
        }
    },
    mounted() {
        const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
        this.messageChannel = cable.subscriptions.create('RoomChannel', {
            connected: () => {
                this.getMessages().then(() => {
                    this.$refs.chatWindow.scrollToBottom()
                })
            },
            received: () => {
                this.getMessages().then(() => {
                    this.$refs.chatWindow.scrollToBottom()
                })
            }
        })
    },
    beforeDestory ()  { 
        this.messageChannel.unsubscribe()
    }
}
</script>

<style scoped>
</style>