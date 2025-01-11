@Entry
@Component
struct CarMap {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Text('地图打车')
        .fontSize(30)
    }
    .height('100%')
    .width('100%')
  }
}