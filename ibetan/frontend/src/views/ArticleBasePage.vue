<template>
scraping
<div class="container">
    <ArticleWindow @connectCable="connectCable" :articles="articles"/>
</div>
</template>

<script>
import ArticleWindow from '../components/ArticleWindow'

import axios from 'axios'
import ActionCable from 'actioncable'

export default{
    components: { 
        ArticleWindow,
    },
    data(){
        return{
            articles: [],
        }
    },
    methods: {
        async getArticles () {
            try{
                const res = await axios.get('http://localhost:3000/articles',{
                headers: {
                    uid: window.localStorage.getItem('uid'),
                    "access-token": window.localStorage.getItem('access-token'),
                    client:window.localStorage.getItem('client')
                }})
                if (!res) {
                    new Error('article一覧を取得できませんでした')
                }
                this.articles = res.data
            } catch (err) {
                this.err = 'article一覧を取得できませんでした'
            }
        },
        connectCable (article) {
            this.articleChannel.perform('receive', {
            article: article,
            email: window.localStorage.getItem('uid')
            })
        }
    },
    mounted() {
        const cable = ActionCable.createConsumer('ws://localhost:3000/cable')
        this.articleChannel = cable.subscriptions.create('RoomChannel', {
            connected: () => {
                this.getArticles()
            },
            received: () => {
                this.getArticles()
            }
        })
    },
    beforeDestory ()  { 
        this.articleChannel.unsubscribe()
    }
}
</script>

<style scope>
</style>