<template>


</template>

<script>
/*import axios from "axios"*/

export default{
    /*props: ['articles'],*/
    data(){
        return{
            uid: localStorage.getItem('uid')
        }
    },
    methods: {
        async createFavoriteMark(articleId){
            try{
                const res = await axios.post(`http://localhost:3000/articles/${articleId}/favorites`,{},{
                    headers: {
                        uid: window.localStorage.getItem('uid'),
                        "access-token": window.localStorage.getItem('access-token'),
                        client:window.localStorage.getItem('client')
                }})
                if (!res) {
                    new Error('favoritemark not')
                }
            } catch (err) {
                this.err = 'favoritemark not'
            }
        }
    },
}

</script>