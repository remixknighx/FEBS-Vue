<template>
  <a-card :bordered="false" class="card-area">
    <div :class="advanced? 'search': null">
      <!-- 搜索区域 -->
      <a-form layout="horizontal">
        <a-row>
          <div :class="advanced ? null: 'fold'">
            <a-col :md="8" :sm="24">
              <a-form-item label="应用名称" :labelCol="{span: 6}" :wrapperCol="{span: 14, offset: 2}">
                <a-input v-model="queryParams.appName" />
              </a-form-item>
            </a-col>
            <a-col :md="12" :sm="24">
              <a-button style="margin-left: 8px" type="primary" @click="search">查询</a-button>
              <a-button style="margin-left: 8px" @click="reset">重置</a-button>
            </a-col>
          </div>
        </a-row>
      </a-form>
    </div>
    <div>
      <div class="operator">
        <a-button type="primary" ghost @click="edit">新增</a-button>
        <a-button @click="batchDelete">删除</a-button>
      </div>
      <a-table
        ref="TableInfo"
        :columns="columns"
        :rowKey="record => record.id"
        :dataSource="dataSource"
        :pagination="pagination"
        :loading="loading"
        :rowSelection="{selectedRowKeys: selectedRowKeys, onChange: onSelectChange}"
        :scroll="{ x: 900 }"
        @change="handleTableChange"
        bordered
      >
        <template slot="email" slot-scope="text, record">
          <a-popover placement="topLeft">
            <template slot="content">
              <div>{{text}}</div>
            </template>
            <p style="width: 150px;margin-bottom: 0">{{text}}</p>
          </a-popover>
        </template>
        <template slot="operation" slot-scope="text, record">
          <a-icon
            type="setting"
            theme="twoTone"
            twoToneColor="#4a9ff5"
            @click="edit(record)"
            title="修改应用"></a-icon>&nbsp;
        </template>
      </a-table>
    </div>

    <!-- 新增以及编辑应用 -->
    <app-edit
      ref="appEdit"
      @success="handleAppEditSuccess"
      @close="handleAppEditClose"
      :appEditVisiable="appEditVisiable"
    ></app-edit>
  </a-card>
</template>

<script>
import AppEdit from './AppEdit'

export default {
  name: 'App',
  components: { AppEdit },
  data() {
    return {
      appInfo: {
        visiable: false,
        data: {}
      },
      loading: false,
      advanced: false,
      queryParams: {},
      filteredInfo: null,
      sortedInfo: null,
      paginationInfo: null,
      dataSource: [],
      selectedRowKeys: [],
      pagination: {
        pageSizeOptions: ['10', '20', '30', '40', '100'],
        defaultCurrent: 1,
        defaultPageSize: 10,
        showQuickJumper: true,
        showSizeChanger: true,
        showTotal: (total, range) =>
          `显示 ${range[0]} ~ ${range[1]} 条记录，共 ${total} 条记录`
      },
      appEditVisiable: false
    }
  },
  mounted() {
    this.fetch()
  },
  computed: {
    columns() {
      let { sortedInfo, filteredInfo } = this
      sortedInfo = sortedInfo || {}
      filteredInfo = filteredInfo || {}
      return [
        {
          title: '应用名称',
          dataIndex: 'appName'
        },
        {
          title: '状态',
          dataIndex: 'status',
          customRender: (text, row, index) => {
            switch (text) {
              case 0:
                return <a-tag color="red">未启用</a-tag>
              case 1:
                return <a-tag color="cyan">启用</a-tag>
              default:
                return text
            }
          },
          filters: [
            { text: '有效', value: '1' },
            { text: '锁定', value: '0' }
          ],
          filterMultiple: false,
          filteredValue: filteredInfo.status || null,
          onFilter: (value, record) => record.status.includes(value)
        },
        {
          title: '创建时间',
          dataIndex: 'createTime',
          sorter: true,
          sortOrder: sortedInfo.columnKey === 'createTime' && sortedInfo.order
        },
        {
          title: '更新时间',
          dataIndex: 'modifyTime',
          sorter: true,
          sortOrder: sortedInfo.columnKey === 'modifyTime' && sortedInfo.order
        },
        {
          title: '操作',
          dataIndex: 'operation',
          scopedSlots: { customRender: 'operation' }
        }
      ]
    }
  },
  methods: {
    edit(record) {
      this.$refs.appEdit.setFormValues(record)
      this.appEditVisiable = true
    },
    handleAppEditClose() {
      this.appEditVisiable = false
    },
    handleAppEditSuccess() {
      this.appEditVisiable = false
      this.$message.success('保存应用成功')
      this.fetch()
    },
    onSelectChange (selectedRowKeys) {
      this.selectedRowKeys = selectedRowKeys
    },
    batchDelete() {
      if (!this.selectedRowKeys.length) {
        this.$message.warning('请选择需要删除的记录')
        return
      }
      let that = this
      this.$confirm({
        title: '确定删除所选中的记录?',
        content: '当您点击确定按钮后，这些记录将会被彻底删除，如果其包含子记录，也将一并删除！',
        centered: true,
        onOk () {
          that.$delete('app/' + that.selectedRowKeys.join(',')).then(() => {
            that.$message.success('删除成功')
            that.selectedRowKeys = []
            that.fetch()
          })
        },
        onCancel () {
          that.selectedRowKeys = []
        }
      })
    },
    search() {
      let { sortedInfo, filteredInfo } = this
      let sortField, sortOrder
      // 获取当前列的排序和列的过滤规则
      if (sortedInfo) {
        sortField = sortedInfo.field
        sortOrder = sortedInfo.order
      }
      this.fetch({
        sortField: sortField,
        sortOrder: sortOrder,
        ...this.queryParams,
        ...filteredInfo
      })
    },
    reset() {
      // 取消选中
      this.selectedRowKeys = []
      // 重置分页
      this.$refs.TableInfo.pagination.current = this.pagination.defaultCurrent
      if (this.paginationInfo) {
        this.paginationInfo.current = this.pagination.defaultCurrent
        this.paginationInfo.pageSize = this.pagination.defaultPageSize
      }
      // 重置列过滤器规则
      this.filteredInfo = null
      // 重置列排序规则
      this.sortedInfo = null
      // 重置查询参数
      this.queryParams = {}
      // 清空部门树选择
      this.$refs.deptTree.reset()
      // 清空时间选择
      if (this.advanced) {
        this.$refs.createTime.reset()
      }
      this.fetch()
    },
    handleTableChange(pagination, filters, sorter) {
      // 将这三个参数赋值给Vue data，用于后续使用
      this.paginationInfo = pagination
      this.filteredInfo = filters
      this.sortedInfo = sorter

      this.appInfo.visiable = false
      this.fetch({
        sortField: sorter.field,
        sortOrder: sorter.order,
        ...this.queryParams,
        ...filters
      })
    },
    fetch(params = {}) {
      // 显示loading
      this.loading = true
      if (this.paginationInfo) {
        // 如果分页信息不为空，则设置表格当前第几页，每页条数，并设置查询分页参数
        this.$refs.TableInfo.pagination.current = this.paginationInfo.current
        this.$refs.TableInfo.pagination.pageSize = this.paginationInfo.pageSize
        params.pageSize = this.paginationInfo.pageSize
        params.pageNum = this.paginationInfo.current
      } else {
        // 如果分页信息为空，则设置为默认值
        params.pageSize = this.pagination.defaultPageSize
        params.pageNum = this.pagination.defaultCurrent
      }
      this.$get('app/list', {
        ...params
      }).then(r => {
        let data = r.data
        const pagination = { ...this.pagination }
        pagination.total = data.total
        this.dataSource = data.rows
        this.pagination = pagination
        // 数据加载完毕，关闭loading
        this.loading = false
      })
    }
  }
}
</script>

<style lang='less' scoped>
@import '../../../../static/less/Common';
// .test {
//   color: #42b984;
//   font-size: 1.1rem;
//   font-weight: 600;
// }
</style>
