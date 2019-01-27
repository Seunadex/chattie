import * as mobx from "mobx";
import ReactOnRails from "react-on-rails";
import UserStore from "./UserStore";

const userStore = new UserStore();

export const getCurrentUserStore = () => ReactOnRails.getStore("currentUser");

