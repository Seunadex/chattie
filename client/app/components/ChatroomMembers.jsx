import React from "react";
import {getCurrentUserStore, getChatroomStore} from "../stores/RootStore";

export default class ChatroomMembers extends React.Component {
  currentUser = getCurrentUserStore();
  chatroom = getChatroomStore();


  render() {
    const { members } = this.props;
    console.log(this.chatroom);

    const users = members.map(member => (
      <div key={member.id}>
        <p>{member.username}</p>
      </div>
    ));
    return <div className="member-list">{users}</div>;
  }
}
