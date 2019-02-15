import { observable, set, action } from "mobx";
import ReactOnRails from "react-on-rails";


export default class Chatroom {
  @observable id = null;
  @observable name = null;
  @observable purpose = null;
  @observable topic = null;
  @observable creator = null;
  @observable access = null;
  @observable isDirect = null;

  @observable loaded = false;


  constructor(attributes) {
    if (attributes) {
      this.id = attributes.id;
      delete attributes.id;
    }

    this.update(attributes);

  }

  @action
  update({...attributes}) {
    set(this, attributes);
    this.loaded = true;

  }
}
