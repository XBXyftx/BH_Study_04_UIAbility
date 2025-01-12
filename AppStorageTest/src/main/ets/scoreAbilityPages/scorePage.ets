@Entry
@Component
struct ScorePage {

  build() {
    Column(){
      Text('积分广场')
        .fontSize(50)
      Button('攒积分 +50')
      Button('+20')
      Button('+1')
    }
    .height('100%')
    .width('100%')
  }
}