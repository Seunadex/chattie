import React from "react";
import { observer } from "mobx-react";
import { observable, action } from "mobx";

@observer
export default class HelloWorld extends React.Component {
  @observable name = this.props.name;

  @action
  updateName = name => {
    this.name = name;
  };

  render() {
    return (
      <div>
        <h3>Hello, {this.name}!</h3>
        <form>
          <label htmlFor="name">Say hello to:</label>
          <input
            id="name"
            type="text"
            value={this.name}
            onChange={e => this.updateName(e.target.value)}
          />
        </form>
        <div>
          <h2>Seun Adekunle</h2>
        </div>
      </div>
    );
  }
}
