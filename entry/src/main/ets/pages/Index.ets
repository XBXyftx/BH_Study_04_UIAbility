import { common, Want } from '@kit.AbilityKit';

export interface PTest {
  num: number
}

let p: PTest = {
  num: 10
}
PersistentStorage.persistProp('Test', p)

@Entry
@Component
struct Index {
  //1. 获取上下文对象(后续直接使用)对象中包含了跳转方法，跨UI Ability的跳转方法
  context = getContext(this) as common.UIAbilityContext;
  @StorageLink('Test') test: PTest = { num: 0 }

  build() {
    Column() {
      Text('支付宝首页-Ability')
        .fontSize(30)
      Button('地图打车-去打车')
        .onClick(() => {
          //2. 准备 wan t类型的对象并设置属性
          let wantInfo: Want = {
            deviceId: '', // deviceId为空表示本设备
            bundleName: 'com.example.bh_study_04_uiability', // AppScope/app.json5确认
            moduleName: 'entry', // moduleName非必选
            abilityName: 'CarAbility', //  src/main/module.json5确认
            parameters: {
              // 自定义信息
              info: '传递的信息'
            },
          }
          //3. 通过上下文对象拉起对应的 Abilit
          this.context.startAbility(wantInfo)
        })
      Text(this.test.num.toString())
    }
    .height('100%')
    .width('100%')
  }
}