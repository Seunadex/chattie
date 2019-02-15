import ReactOnRails from "react-on-rails";
import User from "../stores/User";
import Chatroom from "../stores/Chatroom";

ReactOnRails.registerStore({
  currentUser: ({records}) => new User(records),
  chatroom: ({records}) => new Chatroom(records)
});
