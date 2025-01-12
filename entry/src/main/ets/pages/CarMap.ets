import { PTest } from './Index';

@Entry
@Component
struct CarMap {
  @State message: string = 'Hello World';
  @StorageLink('Test') test: PTest = { num: 0 }
  build() {
    Column(){
      Text('地图打车')
        .fontSize(30)
      Text(this.test.num.toString())
      Button('++')
        .onClick(()=>{
          this.test.num++
        })
    }
    .height('100%')
    .width('100%')
  }
}