<template>
<div class="article-window">
    article
    <table v-if="articles" class="articles">
        <thead>
            <tr>
                <th v-for="(article,key) in header" :key="key">
                    {{ article }}
                </th>
            </tr>
        </thead>

        <tbody>
            <tr v-for="article in articles" :key="article.id">
                <td>
                    <span>{{ article.id }}</span>
                    <div class="article">
                        <a v-bind:href= article.url>
                            <span>{{ article.title }}</span>
                        </a>
                    </div>
                </td>
                <td>
                    <font-awesome-icon icon="tag" class="tag" />
                        <span class="favorite-count"
                        @dblclick="handleFavorite(article)">
                            {{ article.favorites.length }}
                        </span>
                </td>
                <td>
                    <font-awesome-icon icon="book" class="book" />
                        <span class="bookmark-count"
                        @dblclick="handleBookmark(article)">
                            {{ article.bookmarks.length }}
                        </span>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</template>

<script>
import axios from 'axios'

export default {
    emits: ['connectCable'],
    props: ['articles'],
    data () {
        return {
            uid: localStorage.getItem('uid'),
            header: {title:'title',favorite:'tag/', bookmark: 'bookmark'},
            article:[

            ]
        }
    },
    methods: {
        handleFavorite(article) {
        for (let i = 0; i < article.favorites.length; i++) {
            const favorite = article.favorites[i]
        if(favorite.email === this.uid){
            this.deleteFavorite(favorite.id, article.id)
            return
        }
        }
        this.createFavorite(article.id)
    },
        async createFavorite (articleId) {
            try {
                const res = await axios.post(`http://localhost:3000/articles/${articleId}/favorites`, {}, {
                    headers: {
                        uid: this.uid,
                        "access-token": window.localStorage.getItem('access-token'),
                        client: window.localStorage.getItem('client')
                    }
                })
            if (!res) {
                new Error('tagできませんでした')
            }
            this.$emit('connectCable')
            } catch (error) {
                console.log(error)
            }
        },
        async deleteFavorite (favoriteId) {
            try {
                const res = await axios.delete(`http://localhost:3000/favorites/${favoriteId}`, {
                    headers: {
                        uid: this.uid,
                        "access-token": window.localStorage.getItem('access-token'),
                        client: window.localStorage.getItem('client')
                    }
                })
            if (!res) {
                new Error('tagを削除できませんでした')
            }
            this.$emit('connectCable')
            } catch (error) {
                console.log(error)
            }
        },

    handleBookmark(article) {
        for (let i = 0; i < article.bookmarks.length; i++) {
            const bookmark = article.bookmarks[i]
        if(bookmark.email === this.uid){
            this.deleteBookmark(bookmark.id, article.id)
            return
        }
        }
        this.createBookmark(article.id)
    },
        async createBookmark (articleId) {
            try {
                const res = await axios.post(`http://localhost:3000/articles/${articleId}/bookmarks`, {}, {
                    headers: {
                        uid: this.uid,
                        "access-token": window.localStorage.getItem('access-token'),
                        client: window.localStorage.getItem('client')
                    }
                })
            if (!res) {
                new Error('bookmarkできませんでした')
            }
            this.$emit('connectCable')
            } catch (error) {
                console.log(error)
            }
        },
        async deleteBookmark (bookmarkId) {
            try {
                const res = await axios.delete(`http://localhost:3000/bookmarks/${bookmarkId}`, {
                    headers: {
                        uid: this.uid,
                        "access-token": window.localStorage.getItem('access-token'),
                        client: window.localStorage.getItem('client')
                    }
                })
            if (!res) {
                new Error('bookmarkを削除できませんでした')
            }
            this.$emit('connectCable')
            } catch (error) {
                console.log(error)
            }
        },
    }
}

</script>

<style scope>
.article-window{
    width: 90% auto;
    height: 500px;
    background: white;
    padding: 10px 20px;
    border-bottom: 2px solid blue;
}

.articles{
    max-height: 400px;
    overflow: auto;
}

ul {
    list-style: none;
    margin: 0;
    padding: 0;
}

ul li {
    display:inline-block;
    clear: both;
}


</style>