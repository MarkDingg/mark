import request from '@/utils/request'

// 查询图书评论列表
export function listComment(query) {
  return request({
    url: '/bkmgr/comment/list',
    method: 'get',
    params: query
  })
}

export function bookCommentById(id) {
  return request({
    url: `/bkmgr/comment/bookComment/${id}`,
    method: 'get',
  })
}

// 查询图书评论详细
export function getComment(id) {
  return request({
    url: '/bkmgr/comment/' + id,
    method: 'get'
  })
}

// 新增图书评论
export function addComment(data) {
  return request({
    url: '/bkmgr/comment',
    method: 'post',
    data: data
  })
}

// 修改图书评论
export function updateComment(data) {
  return request({
    url: '/bkmgr/comment',
    method: 'put',
    data: data
  })
}

// 删除图书评论
export function delComment(id) {
  return request({
    url: '/bkmgr/comment/' + id,
    method: 'delete'
  })
}
