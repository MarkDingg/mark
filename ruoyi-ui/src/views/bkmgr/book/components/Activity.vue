<template>
  <div class="user-activity">
    <div class="post" v-for="(comment ,index) in bookComments" :key="index">
      <div class="user-block">
        <img class="img-circle"
             :src="avatarPrefix+comment.userAvatar">
        <span class="username text-muted">{{ comment.userName }}</span>
        <span class="description">分享时间：{{ comment.createTime }}</span>
        <span class="description">推荐指数：<el-rate style="display: inline"
          v-model="comment.star"
          disabled
          show-score
          text-color="#ff9900"
          score-template="{value}">
        </el-rate>
        </span>
      </div>
      <p>
        {{ comment.comment }}
      </p>
<!--      <ul class="list-inline">-->
<!--        <li>-->
<!--          <span class="link-black text-sm">-->
<!--            <i class="el-icon-share"/>-->
<!--            Share-->
<!--          </span>-->
<!--        </li>-->
<!--        <li>-->
<!--          <span class="link-black text-sm">-->
<!--            <svg-icon icon-class="like"/>-->
<!--            Like-->
<!--          </span>-->
<!--        </li>-->
<!--      </ul>-->
    </div>

  </div>
</template>

<script>
import {bookCommentById} from "@/api/bkmgr/comment";


export default {
  data() {
    return {
      avatarPrefix: process.env.VUE_APP_BASE_API,
      bookComments: [],
    }
  },
  created() {
    this.getBookCommentById();
  },
  methods: {
    async getBookCommentById() {
      const id = this.$route.query.bookId
      const {data} = await bookCommentById(id)
      this.bookComments = data;
    }
  }
}
</script>

<style lang="scss" scoped>
.user-activity {
  .user-block {

    .username,
    .description {
      display: block;
      margin-left: 50px;
      padding: 2px 0;
    }

    .username {
      font-size: 16px;
      color: #000;
    }

    :after {
      clear: both;
    }

    .img-circle {
      border-radius: 50%;
      width: 40px;
      height: 40px;
      float: left;
    }

    span {
      font-weight: 500;
      font-size: 12px;
    }
  }

  .post {
    font-size: 14px;
    border-bottom: 1px solid #d2d6de;
    margin-bottom: 15px;
    padding-bottom: 15px;
    color: #666;

    .image {
      width: 100%;
      height: 100%;

    }

    .user-images {
      padding-top: 20px;
    }
  }

  .list-inline {
    padding-left: 0;
    margin-left: -5px;
    list-style: none;

    li {
      display: inline-block;
      padding-right: 5px;
      padding-left: 5px;
      font-size: 13px;
    }

    .link-black {

      &:hover,
      &:focus {
        color: #999;
      }
    }
  }

}

.box-center {
  margin: 0 auto;
  display: table;
}

.text-muted {
  color: #777;
}
</style>
