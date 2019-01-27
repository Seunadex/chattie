import React from "react";
import {getCurrentUserStore} from "../stores/RootStore";

export default class ChatroomMembers extends React.Component {
  currentUser = getCurrentUserStore();


  render() {
    const { members } = this.props;
    console.log(this.currentUser);

    const users = members.map(member => (
      <div key={member.id}>
        <p>{member.username}</p>
      </div>
    ));
    return <div className="member-list">{users}</div>;
  }
}
