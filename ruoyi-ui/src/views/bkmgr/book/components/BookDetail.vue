<template>
  <el-card style="margin-bottom:20px;">
    <div slot="header" class="clearfix">
      <span>图书信息 </span>
    </div>

    <div class="user-profile">
      <div class="box-center" @click="openUpdateBookCoverComponent">
        <img :src="imgUrl" alt="" style="height: 150px">
        <div class="text-center">
          <book-cover ref="bookCoverEle" :imgUrl="imgUrl" :book-id="detail.bookId" @ImgUrlChange="handleImgUrlChange"/>
        </div>
      </div>
      <div class="box-center">
        <div class="user-name text-center">{{ detail.bookName }}</div>

      </div>
    </div>

    <div class="user-bio">
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

    </div>
  </el-card>
</template>

<script>
import PanThumb from '@/components/PanThumb'
import BookCover from "@/views/bkmgr/book/BookCover.vue";
import {getBook} from "@/api/bkmgr/book";

export default {
  components: {BookCover, PanThumb},
  data() {
    return {
      imgUrl: '',
      detail: {}
    }
  },
  created() {
    this.getBookDetail();
  },
  methods: {
    handleImgUrlChange(url) {
      this.imgUrl = url
    },
    openUpdateBookCoverComponent() {
      this.$refs.bookCoverEle.editCropper();
    },
    async getBookDetail() {
      const bookId = this.$route.query.bookId
      const {data} = await getBook(bookId)
      this.detail = data
      this.imgUrl = data.bookCover ? process.env.VUE_APP_BASE_API + data.bookCover : require("@/assets/images/default_book.png")
    },
  }
}
</script>

<style lang="scss" scoped>
.box-center {
  margin: 0 auto;
  display: table;
}

.text-muted {
  color: #777;
}

.user-profile {
  .user-name {
    font-weight: bold;
  }

  .box-center {
    padding-top: 10px;
  }

  .user-role {
    padding-top: 10px;
    font-weight: 400;
    font-size: 14px;
  }

  .box-social {
    padding-top: 30px;

    .el-table {
      border-top: 1px solid #dfe6ec;
    }
  }

  .user-follow {
    padding-top: 20px;
  }
}

.user-bio {
  margin-top: 20px;
  color: #606266;

  span {
    padding-left: 4px;
  }

  .user-bio-section {
    font-size: 14px;
    padding: 15px 0;

    .user-bio-section-header {
      border-bottom: 1px solid #dfe6ec;
      padding-bottom: 10px;
      margin-bottom: 10px;
      font-weight: bold;
    }
  }
}
</style>
