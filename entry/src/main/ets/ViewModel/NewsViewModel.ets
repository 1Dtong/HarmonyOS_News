import NewsTypeModel from './NewsTypeModel'
import {CommonConstant as Const} from '../common/constant/CommonConstant'
import {httpRequestGet} from '../common/utils/HttpUtil'
import ResponseResult from './ResponseResult'

class NewsViewModel {
  getNewsTypeList(): Promise<NewsTypeModel[]> {
    return new Promise((resolve: Function, reject) => {
      let url = `${Const.SERVER}/${Const.GET_NEWS_TYPE}`
      httpRequestGet(url).then((data: ResponseResult) => {
        if (data.code === Const.SERVER_CODE_SUCCESS) {
          resolve(data.data)
        } else {
          reject(Const.TabBars_DEFAULT_NEWS_TYPES)
        }
      }).catch(() => {
        reject(Const.TabBars_DEFAULT_NEWS_TYPES)
      })
    })
  }
  getDefaultTypeList(): NewsTypeModel[] {
  return Const.TabBars_DEFAULT_NEWS_TYPES
  }
}

let newsViewModel = new NewsViewModel()
export default newsViewModel as NewsViewModel