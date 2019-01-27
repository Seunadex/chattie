import { action, observable } from "mobx";
import User from "./User";

export default class UserStore {
  @observable users = new Map();
  find(id) {
    return this.users.get(id);
  }
}
