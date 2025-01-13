import { PTest } from './Index';

@Entry
@Component
struct CarMap {
  @State message: string = 'Hello World';
  @StorageLink('Test') test: PTest[] =[]
  build() {
    Column(){
      Text('地图打车')
        .fontSize(30)
      Text(this.test[0].num+'')
      Button('++')
        .onClick(()=>{
          this.test[0].num++
          this.test.splice(0,1,this.test[0])
        })
    }
    .height('100%')
    .width('100%')
  }
}