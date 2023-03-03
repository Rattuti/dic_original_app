<template>

<CalendarBase />

</template>

<script>
//import moment from 'moment'
//import VueTailwindDatepicker from 'vue-tailwind-datepicker'
import { mapGetters, mapActions } from 'vuex'
import CalendarBase from '../components/CalendarBase'

export default {
    components:{
        CalendarBase,
    },
    data(){
    },
    computed: {
        ...mapGetters('events', ['events']),
    },
    methods: {
        ...mapActions('events', ['fetchEvents']),
    }
}
</script>
<style>
.content{
    margin:2em auto;
    width:90px auto;
}
.button-area{
    margin:10em 10;
}
.calendar{
    max-width:900px auto;
    border-top:1px solid gray;
    font-size:0.8em;
}
.calendar-weekly{
    display:flex;
    /*border-left:1px solid gray;*/
}
.calendar-daily{
    flex:1;
    min-height:125px;
    border-right:1px solid gainsboro;
    border-bottom:1px solid gainsboro;
}
.calendar-day{
    text-align: center;
}
.calendar-youbi{
    flex:1;
    border-right:1px solid gainsboro;
    text-align:center;
}
.outside{
    background-color: #979797;
}
</style>