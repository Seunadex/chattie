import { observable, set } from "mobx";

export default class User {
  @observable id = null;
  @observable username = null;
  @observable email = null;
  @observable full_name = null;

  constructor(attributes) {
    this.update(attributes);
  }

  update(attributes) {
    console.log(attributes, 'attributes')
    set(this, attributes);
  }
}
