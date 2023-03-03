<template>
    <div class="container">
        login profile

        name
        nickname
        mail
        pass
        <NavHeaderBar />
        <!--<UserProfileCoreEdit />-->
        <!--<UserProfileCreate />-->
    </div>
</template>

<script>
import NavHeaderBar from '../components/NavHeaderBar'
//import UserProfileCoreEdit from '../components/UserProfileCoreEdit'//
//import UserProfileCreate from '../components/UserProfileCreate'

export default {
    components: { 
        NavHeaderBar,
        //UserProfileCoreEdit,
        //UserProfileCreate,
    }
}
</script>

<style>
</style>