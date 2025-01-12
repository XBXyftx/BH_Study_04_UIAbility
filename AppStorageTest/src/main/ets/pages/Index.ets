import { common, Want } from '@kit.AbilityKit';
interface IUserInfo {
  name:string,
  age:number,
  score:number
}
let userInfo:IUserInfo = {
  name:'A',
  age:30,
  score:500
}
AppStorage.setOrCreate('userInfo',userInfo)

@Entry
@Component
struct Index {
  //1. 获取上下文对象(后续直接使用)对象中包含了跳转方法，跨UI Ability的跳转方法
  context = getContext(this) as common.UIAbilityContext;
  build() {
    Column(){
      Text('个人中心')
        .fontSize(40)
      Text('姓名: 小张')
        .fontSize(20)
      Text('年纪: 20')
        .fontSize(20)
      Text('积分: 100')
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