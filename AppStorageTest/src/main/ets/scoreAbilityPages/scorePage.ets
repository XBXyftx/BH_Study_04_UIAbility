import { IUserInfo } from '../pages/Index'

@Entry
@Component
struct ScorePage {
  @StorageLink('user') user: IUserInfo = {
    name: '',
    age: 0,
    score: 0
  }

  build() {
    Column() {
      Text('积分广场')
        .fontSize(50)
      Button('攒积分 +50')
        .onClick(() => {
          this.user.score += 50
        })
      Button('+20')
        .onClick(() => {
          this.user.score += 20
        })
      Button('+1')
        .onClick(() => {
          this.user.score += 1
        })
    }
    .height('100%')
    .width('100%')
  }
}