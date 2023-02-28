import request from '@/utils/request'

// 查询图书信息列表
export function listBook(query) {
  return request({
    url: '/bkmgr/book/list',
    method: 'get',
    params: query
  })
}

// 查询图书信息详细
export function getBook(bookId) {
  return request({
    url: '/bkmgr/book/' + bookId,
    method: 'get'
  })
}

// 新增图书信息
export function addBook(data) {
  return request({
    url: '/bkmgr/book',
    method: 'post',
    data: data
  })
}

// 修改图书信息
export function updateBook(data) {
  return request({
    url: '/bkmgr/book',
    method: 'put',
    data: data
  })
}

// 删除图书信息
export function delBook(bookId) {
  return request({
    url: '/bkmgr/book/' + bookId,
    method: 'delete'
  })
}

export function bookDetail(bookId) {
  return request({
    url: '/bkmgr/book/detail/' + bookId,
    method: 'get'
  })
}

export function indexInfo() {
  return request({
    url: '/bkmgr/book/index',
    method: 'get'
  })
}

export function bookCategory() {
  return request({
    url: '/bkmgr/book/bookCategory',
    method: 'get'
  })
}


// 删除图书信息
export function borrowBook(numbers) {
  return request({
    url: '/bkmgr/book/borrow/',
    method: 'post',
    data:numbers
  })
}


// 图书封面上传
export function uploadBookCover(bookId,data) {
  return request({
    url: `/bkmgr/book/bookCover/${bookId}`,
    method: 'post',
    data: data
  })
}
export function bookReturn(data) {
  return request({
    url: '/bkmgr/book/bookReturn',
    method: 'post',
    data
  })
}
