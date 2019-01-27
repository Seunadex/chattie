import ReactOnRails from "react-on-rails";
import User from "../stores/User";

ReactOnRails.registerStore({
  currentUser: ({records}) => new User(records)
});
