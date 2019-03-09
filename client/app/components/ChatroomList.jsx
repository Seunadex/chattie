import React from 'react';
import { getCurrentUserStore } from "../stores/RootStore";

export default class ChatroomList extends React.Component {
  currentUser = getCurrentUserStore();

  render() {
    const { chatrooms } =  this.currentUser;

    const chatroom = chatrooms.map(chatroom => (
      <div key={chatroom.id}>
        <p>{chatroom.name}</p>
      </div>
    ))

    return <div>{chatroom}</div>
  }
}
