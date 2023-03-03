import App from './App.vue'
import { createApp } from 'vue'
import router from './router'
import store from './store'
import VCalendar from 'v-calendar'
import vuetify from "@/plugins/vuetify"

import './assets/style.css'

import { FontAwesomeIcon } from "@fortawesome/vue-fontawesome"
import { library } from "@fortawesome/fontawesome-svg-core"
import { faHeart, faTag ,faBook } from "@fortawesome/free-solid-svg-icons"

library.add(faHeart, faTag, faBook)

const app = createApp(App)
app.use(router)
app.use(store)
app.use(VCalendar, {
    formats: {
        title: 'MMMM YYYY',
        weekdays: 'W',
        navMonths: 'MMM',
        input: ['L', 'YYYY-MM-DD', 'YYYY/MM/DD'],
        dayPopover: 'L',
        data: ['L', 'YYYY-MM-DD', 'YYYY/MM/DD']
    }
})
app.component("font-awesome-icon", FontAwesomeIcon)
app.mount('#app')
app.use(vuetify)