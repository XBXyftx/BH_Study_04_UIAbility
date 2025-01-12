import { IUserInfo } from '../pages/Index'
import { addScore } from '../utils/addScore'

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
      Text('积分广场 '+this.user.score)
        .fontSize(50)
      Button('攒积分 +50')
        .onClick(() => {
          addScore(50)
        })
      Button('+20')
        .onClick(() => {
          addScore(20)
        })
      Button('+1')
        .onClick(() => {
          addScore(1)
        })
    }
    .height('100%')
    .width('100%')
  }
}