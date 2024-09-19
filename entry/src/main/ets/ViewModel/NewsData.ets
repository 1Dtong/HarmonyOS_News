// 观察，当这个类被拿去用时，实例对象传入参数，
// 通过objectLink关联的那个组件中，有用到的地方，调用的属性值也会随之改变
@Observed
export class CustomRefreshLoadLayoutClass {
  isVisible: boolean
  imageSrc: Resource
  textValue: Resource
  heightValue: number

  constructor(isVisible: boolean, imageSrc: Resource, textValue: Resource, heightValue: number) {
    this.isVisible = isVisible
    this.imageSrc = imageSrc
    this.textValue = textValue
    this.heightValue = heightValue

  }
}