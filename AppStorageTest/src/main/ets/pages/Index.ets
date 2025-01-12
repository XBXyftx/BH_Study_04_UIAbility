@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Text('个人中心')
        .fontSize(40)
      Text('姓名')
        .fontSize(20)
      Text('年纪')
        .fontSize(20)
      Text('积分')
        .fontSize(20)
      Button('去积分广场')
    }
    .height('100%')
    .width('100%')
  }
}