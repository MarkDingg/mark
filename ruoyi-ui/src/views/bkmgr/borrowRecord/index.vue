<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="图书名称" prop="bookName">
        <el-input
          v-model="queryParams.bookName"
          placeholder="请输入图书名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="借用时间" prop="borrowTime">
        <el-date-picker
          clearable
          v-model="borrowTimeRange"
          type="datetimerange"
          placeholder="请选择借用时间"
          range-separator="至"
          value-format="yyyy-MM-dd HH:mm:ss"
          start-placeholder="开始日期"
          end-placeholder="结束日期">
        </el-date-picker>

      </el-form-item>
      <el-form-item label="归还时间" prop="returnTime">
        <el-date-picker
          clearable
          v-model="returnTimeRange"
          type="datetimerange"
          placeholder="请选择借用时间"
          range-separator="至"
          value-format="yyyy-MM-dd HH:mm:ss"
          start-placeholder="开始日期"
          end-placeholder="结束日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="借用用户" prop="borrowUser">
        <el-input
          v-model="queryParams.borrowUser"
          placeholder="请输入借用用户"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="归还用户" prop="returnUser" v-show="activeName!=='unReturnPage'">
        <el-input
          v-model="queryParams.returnUser"
          placeholder="请输入归还用户"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <!--      <el-form-item label="最后更新用户" prop="updateBy">-->
      <!--        <el-input-->
      <!--          v-model="queryParams.updateBy"-->
      <!--          placeholder="请输入最后更新用户"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->
      <!--      <el-form-item label="更新时间" prop="updateTime">-->
      <!--        <el-date-picker clearable-->
      <!--                        v-model="queryParams.updateTime"-->
      <!--                        type="date"-->
      <!--                        value-format="yyyy-MM-dd"-->
      <!--                        placeholder="请选择更新时间"-->
      <!--        >-->
      <!--        </el-date-picker>-->
      <!--      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <!--      <el-col :span="1.5">-->
      <!--        <el-button-->
      <!--          type="primary"-->
      <!--          plain-->
      <!--          icon="el-icon-plus"-->
      <!--          size="mini"-->
      <!--          @click="handleAdd"-->
      <!--          v-hasPermi="['bkmgr:borrowRecord:add']"-->
      <!--        >新增-->
      <!--        </el-button>-->
      <!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['bkmgr:borrowRecord:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['bkmgr:borrowRecord:export']"
        >导出
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          size="mini"
          plain
          type="info"
          @click="handleReturn()"
          v-hasPermi="['bkmgr:book:return']"
          :disabled="activeName!=='unReturnPage'"
        >
          <svg-icon icon-class="bookReturn"></svg-icon>
          批量归还
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-tabs v-model="activeName" @tab-click="handleClickChangePage" :key="Math.random()">
      <el-tab-pane label="未归还" name="unReturnPage" :key="Math.random()">
        <el-table v-loading="loading" :data="borrowRecordList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center"/>
          <el-table-column label="序号" align="center" type="index"/>
          <el-table-column label="书名" align="center" prop="bookName"/>
          <el-table-column label="借用用户" align="center" prop="borrowUserName"/>
          <el-table-column label="借用时间" align="center" prop="borrowTime" width="180"/>
          <el-table-column label="归还用户" align="center" prop="returnUserName"/>
          <el-table-column label="归还时间" align="center" prop="returnTime" width="180"/>
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleShare(scope.row)"
                :disabled="scope.row.disabled"
                v-hasPermi="['bkmgr:borrowRecord:edit']"
              >分享
              </el-button>

              <el-button
                size="mini"
                type="text"
                @click="handleReturn(scope.row)"
                v-hasPermi="['bkmgr:book:return']"
                :disabled="scope.row.returnUserName!=null||(scope.row.createBy!=null&&scope.row.createBy!==name)"
              >
                <svg-icon icon-class="bookReturn"></svg-icon>
                归还
              </el-button>

              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['bkmgr:borrowRecord:remove']"
              >删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
      <el-tab-pane label="已归还" name="returned" :key="Math.random()">
        <el-table v-loading="loading" :data="borrowRecordList" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center"/>
          <el-table-column label="序号" align="center" type="index"/>
          <el-table-column label="书名" align="center" prop="bookName"/>
          <el-table-column label="借用用户" align="center" prop="borrowUserName"/>
          <el-table-column label="借用时间" align="center" prop="borrowTime" width="180"/>
          <el-table-column label="归还用户" align="center" prop="returnUserName"/>
          <el-table-column label="归还时间" align="center" prop="returnTime" width="180"/>
          <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                @click="handleShare(scope.row)"
                :disabled="scope.row.disabled"
                v-hasPermi="['bkmgr:borrowRecord:edit']"
              >分享
              </el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                @click="handleDelete(scope.row)"
                v-hasPermi="['bkmgr:borrowRecord:remove']"
              >删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </el-tab-pane>
    </el-tabs>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改借用记录管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="图书id" prop="bookId">
          <el-input v-model="form.bookId" placeholder="请输入图书id"/>
        </el-form-item>
        <el-form-item label="借用时间" prop="borrowTime">
          <el-date-picker clearable
                          v-model="form.borrowTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择借用时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="归还时间" prop="returnTime">
          <el-date-picker clearable
                          v-model="form.returnTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择归还时间"
          >
          </el-date-picker>
        </el-form-item>
        <el-form-item label="借用用户" prop="borrowUser">
          <el-input v-model="form.borrowUser" placeholder="请输入借用用户"/>
        </el-form-item>
        <el-form-item label="归还用户" prop="returnUser">
          <el-input v-model="form.returnUser" placeholder="请输入归还用户"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--    分享弹窗-->
    <el-dialog v-dialog-drag :title="title" :visible.sync="shareOpen" width="700px" append-to-body>
      <el-form ref="ShareForm" :model="shareForm" :rules="rules" label-width="80px">
        <el-form-item label="图书id" prop="bookId" v-show="false">
          <el-input v-model="shareForm.bookId" placeholder="请输入图书id"/>
        </el-form-item>
        <el-form-item label="图书名称" prop="bookName">
          <el-input v-model="shareForm.bookName" :disabled="true"/>
        </el-form-item>

        <el-form-item label="评分" prop="star">
          <el-rate
            style="position: absolute;top: 9px"
            v-model="shareForm.star"
            show-score
            text-color="#ff9900"
            score-template="{value}">
          </el-rate>
        </el-form-item>

        <el-form-item label="分享理由" prop="comment">
          <el-input type="textarea" v-model="shareForm.comment" placeholder="请输入分享内容"/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitShareForm">确 定</el-button>
        <el-button @click="cancelShare">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  listBorrowRecord,
  getBorrowRecord,
  delBorrowRecord,
  addBorrowRecord,
  updateBorrowRecord,
} from '@/api/bkmgr/borrowRecord'
import {bookReturn} from "@/api/bkmgr/book";
import {mapGetters} from "vuex";
import drag from "@/directive/dialog/drag";
import {addComment} from "@/api/bkmgr/comment";

export default {
  name: 'BorrowRecord',
  directives: {drag},
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      shareOpen: false,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      shareForm: {
        bookName: '',
        star: 0
      },
      // 显示搜索条件
      showSearch: true,
      borrowTimeRange: [],
      returnTimeRange: [],
      // 总条数
      total: 0,
      // 借用记录管理表格数据
      borrowRecordList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        bookName: null,
        isReturn: 0,
        startBorrowTime: null,
        endBorrowTime: null,
        startReturnTime: null,
        endReturnTime: null,
        borrowUser: null,
        returnUser: null,
        updateBy: null,
        updateTime: null
      },
      selectedReturnRecords: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {},
      activeName: 'unReturnPage',
      unReturnList: []
    }
  },
  created() {
    this.getList()
  },
  computed: {
    ...mapGetters(['name']),
  }
  ,
  methods: {
    /** 查询借用记录管理列表 */
    getList() {
      this.loading = true;
      listBorrowRecord(this.queryParams).then(response => {
        this.borrowRecordList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    cancelShare() {
      this.shareOpen = false
      this.reset()
    }
    ,
    // 表单重置
    reset() {
      this.form = {
        id: null,
        bookId: null,
        borrowTime: null,
        returnTime: null,
        borrowUser: null,
        returnUser: null,
        createBy: null,
        updateBy: null,
        createTime: null,
        updateTime: null
      }
      this.resetForm('form')
    }
    ,
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    }
    ,
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.queryParams = {
        isReturn: 0
      };
      this.borrowTimeRange = []
      this.returnTimeRange = []
      this.activeName = "unReturnPage"
      this.handleQuery()
    }
    ,
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.selectedReturnRecords = selection.map(item => {
        return {
          recordId: item.id,
          bookName: item.bookName
        }
      })
      this.single = selection.length !== 1
      this.multiple = !selection.length
    }
    ,
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = '添加借用记录管理'
    }
    ,
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const id = row.id || this.ids
      getBorrowRecord(id).then(response => {
        this.form = response.data
        this.open = true
        this.title = '修改借用记录管理'
      })
    },

    handleShare(row) {
      this.shareForm = {star: 0, bookName: ''}
      this.resetForm('shareForm')
      this.shareForm.bookId = row.bookId
      this.shareForm.recordId = row.id
      this.shareForm.bookName = row.bookName
      this.shareOpen = true
    },
    async submitShareForm() {
      await addComment(this.shareForm)
      this.shareOpen = false;
      this.$modal.msgSuccess('成功')
      this.getList()
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateBorrowRecord(this.form).then(response => {
              this.$modal.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addBorrowRecord(this.form).then(response => {
              this.$modal.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    }
    ,
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids
      this.$modal.confirm('是否确认删除借用记录管理编号为"' + ids + '"的数据项？').then(function () {
        return delBorrowRecord(ids)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess('删除成功')
      }).catch(() => {
      })
    }
    ,
    /** 导出按钮操作 */
    handleExport() {
      this.download('bkmgr/borrowRecord/export', {
        ...this.queryParams
      }, `borrowRecord_${new Date().getTime()}.xlsx`)
    }
    ,
    async handleReturn(row) {
      const returnRecords = row ? [{recordId: row.id, bookName: row.bookName}] : this.selectedReturnRecords
      const {msg} = await bookReturn(returnRecords)
      await this.$alert('<div style=\'overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;\'>'
        + msg + '</div>', '归还结果', {
        dangerouslyUseHTMLString: true, callback: () => {
          this.getList()
        }
      },)
    },
    handleClickChangePage(tab) {
      this.queryParams.isReturn = parseInt(tab.index);
      this.queryParams.pageNum = 1;
      this.getList()
    }
  }
  ,
  watch: {
    borrowTimeRange: function (newValue) {
      if (newValue) {
        this.queryParams.startBorrowTime = newValue[0]
        this.queryParams.endBorrowTime = newValue[1]
      } else {
        this.queryParams.startBorrowTime = null
        this.queryParams.endBorrowTime = null
      }
    }
    ,
    returnTimeRange: function (newVal) {
      if (newVal) {
        this.queryParams.startReturnTime = newVal[0]
        this.queryParams.endReturnTime = newVal[1]
      } else {
        this.queryParams.startReturnTime = null
        this.queryParams.endReturnTime = null
      }
    }
  }
}
</script>
