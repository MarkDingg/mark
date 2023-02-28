<template>
  <div>
    <el-row :gutter="20">
      <el-col
        :span="9"
        class="hidden-xs-only"
      >
        <div @click="openUpdateBookCoverComponent">
          <img
            :src="imgUrl"
            class="image"
            alt=""
          >
          <div class="text-center">
            <book-cover ref="bookCoverEle" :url="imgUrl" :bookId="bookId" @ImgUrlChange="handleImgUrlChange"/>
          </div>
        </div>
      </el-col>
      <el-col :span="15">
        图书信息
        <ul class="list-group list-group-striped">
          <li class="list-group-item">
            <svg-icon icon-class="number"/>
            图书编号
            <div class="pull-right">{{ detail.number }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="book"/>
            图书名称
            <div class="pull-right">{{ detail.bookName }}</div>
          </li>

          <li class="list-group-item">
            <svg-icon icon-class="bookType"/>
            图书类型
            <div
              class="pull-right"
            >
              <span>
             {{ detail.bookTypesStr }}
              </span>
            </div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="publish"/>
            出版社
            <div class="pull-right">{{ detail.publishingHouse }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="price"/>
            价值
            <div class="pull-right">{{ detail.price }}</div>
          </li>

          <li class="list-group-item">
            <svg-icon icon-class="kucun"/>
            库存
            <div class="pull-right">{{ detail.price }}</div>
          </li>

          <li class="list-group-item">
            <svg-icon icon-class="description"/>
            描述
            <div class="pull-right">{{ detail.desc }}</div>
          </li>
          <li class="list-group-item">
            <svg-icon icon-class="date"/>
            创建日期
            <div class="pull-right">{{ detail.createTime }}</div>
          </li>
        </ul>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import 'element-ui/lib/theme-chalk/display.css'
import BookCover from '@/views/bkmgr/book/BookCover.vue'

export default {
  name: 'Detail',
  components: {BookCover},
  props: {
    detail: {
      type: Object,
      required: true
    },
    baseUrl: {
      type: String,
      required: true
    }
  },
  data() {
    return {
      imgUrl: this.baseUrl + this.detail.bookCover,
      bookId: this.detail.bookId
    }
  },
  methods: {
    openUpdateBookCoverComponent() {
      this.$refs.bookCoverEle.editCropper();
    },
    handleImgUrlChange(url) {
      this.imgUrl = url;
    }
  }
}
</script>

<style scoped>
.image {
  height: 100%;
  width: 100%
}
</style>
