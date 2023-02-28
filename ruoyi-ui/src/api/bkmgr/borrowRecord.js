import request from '@/utils/request'

// 查询借用记录管理列表
export function listBorrowRecord(query) {
  return request({
    url: '/bkmgr/borrowRecord/list',
    method: 'get',
    params: query
  })
}

// 查询借用记录管理详细
export function getBorrowRecord(id) {
  return request({
    url: '/bkmgr/borrowRecord/' + id,
    method: 'get'
  })
}

// 新增借用记录管理
export function addBorrowRecord(data) {
  return request({
    url: '/bkmgr/borrowRecord',
    method: 'post',
    data: data
  })
}

// 修改借用记录管理
export function updateBorrowRecord(data) {
  return request({
    url: '/bkmgr/borrowRecord',
    method: 'put',
    data: data
  })
}

// 删除借用记录管理
export function delBorrowRecord(id) {
  return request({
    url: '/bkmgr/borrowRecord/' + id,
    method: 'delete'
  })
}


