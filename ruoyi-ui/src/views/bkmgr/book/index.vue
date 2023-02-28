<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item
        label="图书名"
        prop="bookName"
      >
        <el-input
          v-model="queryParams.bookName"
          placeholder="请输入图书名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item
        label="作者"
        prop="author"
      >
        <el-input
          v-model="queryParams.author"
          placeholder="请输入作者"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item
        label="图书编号"
        prop="number"
      >
        <el-input
          v-model="queryParams.number"
          placeholder="请输入图书编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item
        label="出版社"
        prop="publishingHouse"
      >
        <el-input
          v-model="queryParams.publishingHouse"
          placeholder="请输入出版社"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item
        label="语言"
        prop="language"
      >
        <el-select
          v-model="queryParams.language"
          placeholder="请选择语言"
          clearable
        >
          <el-option
            v-for="dict in dict.type.wq_book_language"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>

      <el-form-item
        label="价值"
        prop="price"
      >
        <el-input
          v-model="queryParams.price"
          placeholder="请输入价值"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <!--      <el-form-item-->
      <!--        label="描述"-->
      <!--        prop="description"-->
      <!--      >-->
      <!--        <el-input-->
      <!--          v-model="queryParams.description"-->
      <!--          placeholder="请输入描述"-->
      <!--          clearable-->
      <!--          @keyup.enter.native="handleQuery"-->
      <!--        />-->
      <!--      </el-form-item>-->

      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
        >搜索
        </el-button>
        <el-button
          icon="el-icon-refresh"
          size="mini"
          @click="resetQuery"
        >重置
        </el-button>
      </el-form-item>
    </el-form>

    <el-row
      :gutter="10"
      class="mb8"
    >
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['bkmgr:book:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['bkmgr:book:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['bkmgr:book:remove']"
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
          v-hasPermi="['bkmgr:book:export']"
        >导出
        </el-button>
      </el-col>
      <el-col :span="1.5">

        <el-button
          type="danger"
          plain
          size="mini"
          :disabled="multiple"
          @click="handleBorrow"
          v-hasPermi="['bkmgr:book:borrow']"
        >
          <svg-icon icon-class="borrow"/>
          批量借用
        </el-button>
      </el-col>

      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>
    <el-table
      v-loading="loading"
      :data="bookList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column
        type="selection"
        width="55"
        align="center"
      />
      <el-table-column
        label="图书名"
        align="center"
        prop="bookName"
      />
      <el-table-column
        label="作者"
        align="center"
        prop="author"
      />
      <el-table-column
        label="图书编号"
        align="center"
        prop="number"
      />
      <el-table-column
        label="出版社"
        align="center"
        prop="publishingHouse"
      />
      <el-table-column
        label="语言"
        align="center"
        prop="language"
      >
        <template slot-scope="scope">
          <dict-tag
            :options="dict.type.wq_book_language"
            :value="scope.row.language"
          />
        </template>
      </el-table-column>
      <el-table-column
        label="价值"
        align="center"
        prop="price"
      />
      <el-table-column
        label="库存"
        align="center"
        prop="inventory"
      />
      <el-table-column
        label="描述"
        align="center"
        prop="description"
      />
      <el-table-column
        label="最后更新时间"
        align="center"
        prop="updateTime"
        width="180"
      />
      <el-table-column
        label="最后操作用户"
        align="center"
        prop="updateBy"
      />
      <el-table-column
        label="操作"
        align="center"
        width="210"
        class-name="small-padding"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            @click="handleSelectDetail(scope.row)"
            v-hasPermi="['bkmgr:book:edit']"
          >
            <svg-icon icon-class="detail"/>
            详情
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['bkmgr:book:edit']"
          >修改
          </el-button>

          <el-button
            size="mini"
            type="text"
            @click="handleBorrow(scope.row)"
            :disabled="scope.row.inventory<1"
            v-hasPermi="['bkmgr:book:borrow']"
          >
            <svg-icon icon-class="borrow"/>
            借用
          </el-button>

          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['bkmgr:book:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改图书信息对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="open"
      width="500px"
      v-dialog-drag
      append-to-body
    >
      <el-form
        ref="form"
        :model="form"
        :rules="rules"
        label-width="80px"
      >
        <el-form-item
          label="图书名"
          prop="bookName"
        >
          <el-input
            v-model="form.bookName"
            placeholder="请输入图书名"
          />
        </el-form-item>
        <el-form-item
          label="作者"
          prop="author"
        >
          <el-input
            v-model="form.author"
            placeholder="请输入作者"
          />
        </el-form-item>
        <el-form-item
          label="图书编号"
          prop="number"
        >
          <el-input
            v-model="form.number"
            placeholder="请输入图书编号"
          />
        </el-form-item>
        <el-form-item
          label="出版社"
          prop="publishingHouse"
        >
          <el-input
            v-model="form.publishingHouse"
            placeholder="请输入出版社"
          />
        </el-form-item>
        <el-form-item label="类型"
                      prop="bookTypes">
          <el-select
            v-model="form.bookTypeIds"
            multiple
            filterable
            remote
            reserve-keyword
            placeholder="请选择图书类型，可输入关键词搜索"
            :remote-method="remoteSearchBookTypesMethod"
            style="width:100%"
            :loading="typeLoading">
            <el-option
              v-for="item in bookTypeOptions"
              :key="item.typeId"
              :label="item.type"
              :value="item.typeId">
            </el-option>
          </el-select>
        </el-form-item>
        <el-form-item
          label="语言"
          prop="language"
        >
          <el-select
            v-model="form.language"
            placeholder="请选择语言"
            style="width:100%"
          >
            <el-option
              v-for="dict in dict.type.wq_book_language"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>

        <el-form-item
          label="库存"
          prop="inventory"
        >
          <el-input
            v-model="form.inventory"
            placeholder="请输入价值"
          />
        </el-form-item>

        <el-form-item
          label="价值"
          prop="price"
        >
          <el-input
            v-model="form.price"
            placeholder="请输入价值"
          />
        </el-form-item>

        <el-form-item
          label="描述"
          prop="description"
        >
          <el-input
            v-model="form.description"
            placeholder="请输入描述"
          />
        </el-form-item>

      </el-form>
      <div
        slot="footer"
        class="dialog-footer"
      >
        <el-button
          type="primary"
          @click="submitForm"
        >确 定
        </el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!--    详情对话框-->
    <el-dialog @dragDialog="handleDrag"
               title="图书详情"
               v-dialog-drag
               :visible.sync="bookDetailVisible"
               width="40%"
    >
      <Detail :detail="bookDetail" :baseUrl="baseUrl"/>
      <span
        slot="footer"
        class="dialog-footer"
      >
      </span>
    </el-dialog>
  </div>
</template>

<script>
import {addBook, borrowBook, delBook, getBook, listBook, updateBook} from '@/api/bkmgr/book'
import {getBookTypeListByType, listType} from "@/api/bkmgr/type";
import drag from "@/directive/dialog/drag";
import Detail from '@/views/bkmgr/book/Detail.vue'

export default {
  name: 'Book',
  components: {Detail},
  dicts: ['wq_book_language'],
  directives: {drag},
  data() {
    return {
      bookDetailVisible: false,
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      baseUrl: process.env.VUE_APP_BASE_API,
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,

      typeLoading: false,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 图书信息表格数据
      bookList: [],
      // 弹出层标题
      title: '',
      // 是否显示弹出层
      open: false,
      // 图书详情信息
      bookDetail: {},
      selectedBooks: [],
      selectedBookNumbers: [],
      resultVisible: false,
      resultTitle: '',
      borrowResult: {},
      bookTypeOptions: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        bookName: null,
        author: null,
        number: null,
        publishingHouse: null,
        language: null,
        description: null,
        price: null
      },
      // 表单参数
      form: {
        inventory: 0,
        bookTypeIds: []
      },
      // 表单校验
      rules: {
        bookName: [
          {required: true, message: '图书名不能为空', trigger: 'blur'}
        ],
        author: [{required: true, message: '作者不能为空', trigger: 'blur'}],
        number: [
          {required: true, message: '图书编号不能为空', trigger: 'blur'}
        ],
        publishingHouse: [
          {required: true, message: '出版社不能为空', trigger: 'blur'}
        ],
        language: [
          {required: true, message: '语言不能为空', trigger: 'change'}
        ],
        price: [{required: true, message: '价值不能为空', trigger: 'blur'}]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询图书信息列表 */
    getList() {
      this.loading = true
      listBook(this.queryParams).then((response) => {
        this.bookList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        bookId: null,
        bookName: null,
        author: null,
        number: null,
        publishingHouse: null,
        language: null,
        description: null,
        price: null,
        createTime: null,
        updateTime: null,
        createBy: null,
        updateBy: null,
        inventory: 0
      }
      this.resetForm('form')
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm('queryForm')
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.bookId)
      this.selectedBooks = selection.map((item) => item.bookName)
      this.selectedBookNumbers = selection.map((item) => item.number)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.getBookTypeList();
      this.open = true
      this.title = '添加图书信息'
    },
    /** 修改按钮操作 */
    async handleUpdate(row) {
      this.reset()
      const bookId = row.bookId || this.ids
      await this.getBookTypeList()
      const {data} = await getBook(bookId)
      this.form = data
      this.open = true
      this.title = '修改图书信息'
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          if (this.form.bookId != null) {
            updateBook(this.form).then((response) => {
              this.$modal.msgSuccess('修改成功')
              this.open = false
              this.getList()
            })
          } else {
            addBook(this.form).then((response) => {
              this.$modal.msgSuccess('新增成功')
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const bookIds = row.bookId || this.ids
      const bookNames = row.bookName || this.selectedBooks
      this.$modal
        .confirm(`是否确认删除书名为 [  ${bookNames}  ] 的数据项？`)
        .then(async function () {
          const {msg} = await delBook(bookIds)
          return msg
        }).then(msg => {
        this.$alert('<div style=\'overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;\'>'
          + msg + '</div>', '删除结果', {
          dangerouslyUseHTMLString: true, callback: () => {
            this.getList()
          }
        },)
      })
        .catch(() => {
        })
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download(
        'bkmgr/book/export',
        {
          ...this.queryParams
        },
        `图书列表_${new Date().getTime()}.xlsx`
      )
    },
    handleBorrow(row) {
      const numbers = row.number ? [row.number] : this.selectedBookNumbers
      borrowBook(numbers).then((res) => {
        this.$alert('<div style=\'overflow: auto;overflow-x: hidden;max-height: 70vh;padding: 10px 20px 0;\'>'
          + res.msg + '</div>', '借用结果', {
          dangerouslyUseHTMLString: true, callback: () => {
            this.getList()
          }
        },)
      })
    },
    handleSelectDetail(row) {
      // await this.$router.push("/bkmgr/comment")
      this.$router.push({path: '/bkmgr/comment', query: {bookId: row.bookId}})

      // const {data} = await getBook(row.bookId)
      // this.bookDetail = data
      // this.bookDetailVisible = true
    },
    async getBookTypeList() {
      const {rows} = await listType()
      this.bookTypeOptions = rows ? rows : [];
    },
    // 远程搜索图书类型方法
    async remoteSearchBookTypesMethod(param) {
      const {data} = await getBookTypeListByType(param)
      this.bookTypeOptions = data ? data : [];
    },
    handleDrag(el) {
      console.log(el)
    }
  }
}
</script>
