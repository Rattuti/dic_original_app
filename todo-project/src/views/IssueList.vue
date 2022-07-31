<template>
  <div>
    <h1>issueリスト</h1>
    <el-button type="success">issue取得</el-button>
  </div>
</template>

<script>
import axios from 'axios'; 

export default {
  name: 'IssueList',
  data() {
    return {
      issues: []
    }
  }
}
</script>