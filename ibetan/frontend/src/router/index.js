//vue-routerから{}内で関数を指定して呼び出し
//createRouter()で、ルーティング情報を使えるルータを作られる
import { createRouter, createWebHistory } from 'vue-router'
import Welcome from '../views/Welcome'
import ChatRoomBasePage from '../views/ChatRoomBasePage'
import UserProfileBasePage from '../views/UserProfileBasePage'

import useValidate from '../auth/validate'
//import { faArrowLeftRotate } from '@fortawesome/free-solid-svg-icons'

//未ログイン/サインアップのユーザを認証させる
const { error, validate } = useValidate()

const requireAuth = async (to, from, next) => {
  const uid = window.localStorage.getItem('uid')
  const client = window.localStorage.getItem('client')
  const accessToken = window.localStorage.getItem('access-token')

  if (!uid || !client || !accessToken) {
    console.log('ログイン情報なし')
    alert('ログインまたはサインアップしてください')
    next({ name: 'Welcome' })
    return
  }

  await validate()

  if (error.value) {
    console.log('ログイン情報なし')
    alert('ログインまたはサインアップしてください')
    next({ name: 'Welcome' })
  } else {
    console.log('ログイン成功')
    next()
  }
}

//ログイン認証できたユーザーをTopページへ遷移させる
const noRequireAuth = async (to, from, next) => {
  const uid = window.localStorage.getItem('uid')
  const client = window.localStorage.getItem('client')
  const accessToken = window.localStorage.getItem('access-token')

  if (!uid && !client && !accessToken) {
    next()
    return
  }

  await validate()

  if (!error.value) {
    next({ name: 'ChatRoomBasePage' })
  } else {
    next()
  }
}

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: Welcome,
    beforeEnter: noRequireAuth
  },
  {
    path: '/chatroom',
    name: 'ChatRoomBasePage',
    component: ChatRoomBasePage,
    beforeEnter: requireAuth
  },
  {
    path: '/userprofile',
    name: 'UserProfileBasePage',
    component: UserProfileBasePage,
    //beforeEnter: requireAuth
  },
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router