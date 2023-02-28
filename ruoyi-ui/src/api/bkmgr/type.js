import request from '@/utils/request'

// 查询图书类型列表
export function listType(query) {
  return request({
    url: '/bkmgr/type/list',
    method: 'get',
    params: query
  })
}

// 查询图书类型详细
export function getType(typeId) {
  return request({
    url: '/bkmgr/type/' + typeId,
    method: 'get'
  })
}

// 新增图书类型
export function addType(data) {
  return request({
    url: '/bkmgr/type',
    method: 'post',
    data: data
  })
}

// 修改图书类型
export function updateType(data) {
  return request({
    url: '/bkmgr/type',
    method: 'put',
    data: data
  })
}

// 删除图书类型
export function delType(typeId) {
  return request({
    url: '/bkmgr/type/' + typeId,
    method: 'delete'
  })
}

export function getBookTypeListByType(name) {
  return request({
    url: '/bkmgr/type/listByType',
    method: "get",
    params: {bookTypeName: name}
  })
}

