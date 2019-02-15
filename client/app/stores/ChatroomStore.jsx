import { action, computed, observable, runInAction } from "mobx";
import ReactOnRails from "react-on-rails";
import Chatroom from "./Chatroom";

export default class ChatroomStore {
  @observable chatrooms = new Map();

  constructor(chatrooms) {
    this.merge(chatrooms);
  }

  @action
  merge(newChatrooms) {
    const newChatroomsMap = new Map(
      newChatrooms && newChatrooms.map(chatroomAttributes => [
        chatroomAttributes.id.toString(),
        new Chatroom(chatroomAttributes)
      ])
    );

    this.chatrooms = new Map([...this.chatrooms, ...newChatroomsMap]);
  }

  find(id) {
    const stringId = id.toString();
    let chatroom = this.chatrooms.get(stringId);

    if (!chatroom) {
      chatroom = new Chatroom({ id: stringId });
      this.chatrooms.set(stringId, chatroom);
    }

    return chatroom;
  }
}
