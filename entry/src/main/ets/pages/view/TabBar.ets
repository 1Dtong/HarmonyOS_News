import NewsTypeModel from '../../ViewModel/NewsTypeModel'
import NewsViewModel from '../../ViewModel/NewsViewModel'
import {CommonConstant as Count} from '../../common/constant/CommonConstant'
import NewsList from '../view/NewsList'

@Component
export default struct TabBar {
  @State tabBarArray: NewsTypeModel[] = NewsViewModel.getDefaultTypeList()
  @State currentIndex: number = 0

  aboutToAppear(): void {
    NewsViewModel.getNewsTypeList().then((typeList: NewsTypeModel[]) => {
      this.tabBarArray = typeList
    }).catch((typeList: NewsTypeModel[]) => {
      this.tabBarArray = typeList
    })
  }

  // 自定义组件
  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabBarArray[index].name)
        .height(Count.FULL_HEIGHT)
        .padding({left: Count.TabBars_HORIZONTAL_PADDING, right: Count.TabBars_HORIZONTAL_PADDING})
        .fontSize(this.currentIndex === index ? Count.TabBars_SELECT_TEXT_FONT_SIZE : Count.TabBars_UN_SELECT_TEXT_FONT_SIZE)
        .fontWeight(this.currentIndex === index ? Count.TabBars_SELECT_TEXT_FONT_WEIGHT : Count.TabBars_UN_SELECT_TEXT_FONT_WEIGHT)
        .fontColor($r('app.color.fontColor_text3'))
    }
  }

  build() {
    Tabs() {
      ForEach(this.tabBarArray, (tabsItem: NewsTypeModel) => {
        TabContent() {
          Column() {
            // 新闻组件
            NewsList()
          }
        }
        .tabBar(this.TabBuilder(tabsItem.id))
      })
    }
    .barWidth(Count.TabBars_BAR_WIDTH)
    .barHeight(Count.TabBars_BAR_HEIGHT)
    .barMode(BarMode.Scrollable)
    .onChange((index: number) => {
      console.log(`${index}`)
      this.currentIndex = index
    })
  }
}