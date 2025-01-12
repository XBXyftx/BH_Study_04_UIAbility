import { IUserInfo } from '../pages/Index'

// export function  addScore(addScoreNum:number) {
//   let user:IUserInfo = AppStorage.get<IUserInfo>('user')!
//   if(user?.score)
//     user.score+=addScoreNum
//   AppStorage.set<IUserInfo>('user',user)
// }

export function addScore(addScoreNum:number) {
  let linkUser:SubscribedAbstractProperty<IUserInfo> = AppStorage.link('user')
  if (linkUser.get().score) {
    linkUser.get().score+=addScoreNum
  }
}