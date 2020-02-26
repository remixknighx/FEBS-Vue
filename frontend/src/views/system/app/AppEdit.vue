<template>
  <a-drawer
    :title="title"
    :maskClosable="false"
    width="650"
    placement="right"
    :closable="false"
    @close="onClose"
    :visible="appEditVisiable"
    style="height: calc(100% - 55px);overflow: auto;padding-bottom: 53px;"
  >
    <a-form :form="form">
      <a-form-item label="应用名称" v-bind="formItemLayout">
        <a-input
          v-decorator="['appName',
                   {rules: [
                    { required: true, message: '应用名称不能为空'},
                    { max: 20, message: '长度不能超过20个字符'}
                  ]}]"
        />
      </a-form-item>
      <a-form-item label="是否启用" v-bind="formItemLayout">
        <a-checkbox :checked="checked" @click="onChange">是否启用</a-checkbox>
      </a-form-item>
    </a-form>
    <div class="drawer-bootom-button">
      <a-popconfirm title="确定放弃编辑？" @confirm="onClose" okText="确定" cancelText="取消">
        <a-button style="margin-right: .8rem">取消</a-button>
      </a-popconfirm>
      <a-button @click="handleSubmit" type="primary" :loading="loading">提交</a-button>
    </div>
  </a-drawer>
</template>

<script>
const formItemLayout = {
  labelCol: { span: 3 },
  wrapperCol: { span: 18 }
}
export default {
  name: 'AppEdit',
  props: {
    appEditVisiable: {
      default: false
    }
  },
  data() {
    return {
      title: '',
      formItemLayout,
      loading: false,
      form: this.$form.createForm(this),
      app: {},
      checked: false
    }
  },
  methods: {
    reset() {
      this.button = {}
      this.loading = false
      this.form.resetFields()
    },
    onClose() {
      this.reset()
      this.$emit('close')
    },
    onChange(e) {
      this.app.status = 1 - this.app.status
      this.checked = this.app.status === 1
    },
    setFormValues({ ...app }) {
      this.form.getFieldDecorator('appName')
      this.form.setFieldsValue({ appName: app.appName })
      if (app.id !== undefined) {
        // 编辑操作
        this.title = '编辑应用'
        this.app.status = app.status
        this.app.id = app.id
      } else {
        // 新增操作
        this.title = '新增应用'
        this.app.status = 0
      }
      this.checked = app.status === 1
    },
    handleSubmit() {
      this.form.validateFields((err, values) => {
        if (!err) {
          this.loading = true
          let app = this.form.getFieldsValue()
          app.status = this.app.status
          if (this.app.id === undefined) {
            // 新增操作
            this.$post('app', {
              ...app
            })
              .then(() => {
                this.reset()
                this.$emit('success')
              })
              .catch(() => {
                this.loading = false
              })
          } else {
            // 更新操作
            app.id = this.app.id
            this.$put('app', {
              ...app
            })
              .then(() => {
                this.reset()
                this.$emit('success')
              })
              .catch(() => {
                this.loading = false
              })
          }
        }
      })
    }
  }
}
</script>
