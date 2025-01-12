import { common, Want } from '@kit.AbilityKit';
export interface IUserInfo {
  name:string,
  age:number,
  score:number
}
let userInfo:IUserInfo = {
  name:'A',
  age:30,
  score:500
}
AppStorage.setOrCreate('user',userInfo)

@Entry
@Component
struct Index {
  //1. 获取上下文对象(后续直接使用)对象中包含了跳转方法，跨UI Ability的跳转方法
  context = getContext(this) as common.UIAbilityContext;
  @StorageLink('user') user:IUserInfo={
    name:'',
    age:0,
    score:0
  }
  build() {
    Column(){
      Text('个人中心')
        .fontSize(40)
      Text(`姓名: ${this.user.name}`)
        .fontSize(20)
      Text(`年纪: ${this.user.age}`)
        .fontSize(20)
      Text(`积分: ${this.user.score}`)
        .fontSize(20)
      Button('去积分广场')
        .onClick(()=>{
          //2. 准备 wan t类型的对象并设置属性
          let wantInfo: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.bh_study_04_uiability', // AppScope/app.json5确认
            moduleName: 'AppStorageTest', // moduleName非必选
            abilityName: 'ScoreAbility', //  src/main/module.json5确认
            parameters: {
              // 自定义信息
              info: '传递的信息'
            },
          }
          //3. 通过上下文对象拉起对应的 Abilit
          this.context.startAbility(wantInfo)
        })
    }
    .height('100%')
    .width('100%')
  }
}