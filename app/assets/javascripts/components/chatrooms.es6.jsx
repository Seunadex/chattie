class Chatrooms extends React.Component {
  render () {
    let rooms;
    console.log(this.props.chatrooms)
    if(this.props.chatrooms.length > 0) {
      rooms = <div className="room-container">
                { this.props.chatrooms.map(function (chatroom){
                  return (
                      <div className='card' key={chatroom.id}>
                        { chatroom.name }
                        <div className='icon-link'>
                          <p>
                            <a href={"/chatrooms/" + chatroom.id + "/edit"}>
                              <i className="fa fa-edit"></i>
                            </a>
                          </p>
                          <p>
                            <a data-method="delete" href={"/chatrooms/" + chatroom.id + "/chatroom_users"}>
                              <i className="fa fa-times-circle"></i>
                            </a>
                          </p>
                        </div>
                      </div>
                    )
                })}
              </div>
    }
    else {
      rooms = <div class="no-room">
                <h4>No Chatroom yet!!!</h4>
              </div>
    }
    return (
      <React.Fragment>
        <div className="index-page">
        <a className="btn btn-primary new-chatroom-btn" href="/chatrooms/new">New Chatroom</a>
          <h3>Chatrooms</h3>
          { rooms }
        </div>
      </React.Fragment>
    );
  }
}



