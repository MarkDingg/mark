<template>
  <div class="app-container">
    <div>
      <el-row :gutter="20">

        <el-col :span="6" :xs="24">
          <book-detail/>
        </el-col>
        <el-col :span="18" :xs="24">
          <el-card>
            <el-tabs v-model="activeTab">
              <el-tab-pane label="图书鉴赏" name="bookComment">
                <activity/>
              </el-tab-pane>
            </el-tabs>
          </el-card>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script>
import BookDetail from './components/BookDetail.vue'
import Activity from './components/Activity'


export default {
  name: 'Profile',
  components: {BookDetail, Activity},
  data() {
    return {
      activeTab: 'bookComment',
      bookId: this.$route.query.bookId,
    }
  },
  created() {
  },
  computed: {},
  methods: {},
  watch: {
    $route(to, from) {
      console.log(to, from)
    }
  }
}
</script>
