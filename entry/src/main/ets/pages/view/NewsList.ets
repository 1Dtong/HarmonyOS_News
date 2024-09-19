import CustomRefreshLoadLayout from '../view/CustomRefreshLoadLayout'
import { CustomRefreshLoadLayoutClass } from '../../ViewModel/NewsData'

@Component
export default struct NewsList {
  @State newsModel: number = 0
  // 当 tab 切换时加载数据
  changeCategory() {
    setTimeout(() => {
      this.newsModel = 1
    }, 2000)
  }

  aboutToAppear(): void {
    this.changeCategory()
  }

  build() {
    Column() {
      if (this.newsModel === 0) {
        this.LoadingLayout()
      } else {
        this.ListLayout()
      }

    }
  }

  // 加载中的ui组件
  @Builder LoadingLayout() {
    CustomRefreshLoadLayout({
      customRefreshLoadLayoutClass: new CustomRefreshLoadLayoutClass(
        true,
        $r('app.media.ic_pull_up_load'),
        $r('app.string.pull_up_load_text'),
        30
      )
    })
  }

  @Builder ListLayout() {
    Text('新闻列表数据')
  }
}

