class Chatroom extends React.Component {
  constructor(props) {
    super(props)
  }
  render () {
    return (
      <React.Fragment>
        <div className='container-wrapper' id='container-wrapp'>
          <div className='message-side'>
            <div className='name-header'>
              <p>
                <strong>{this.props.chatroom.name}</strong><br></br>
                <span className='users'><i className="fa fa-star color-star"></i> | <i className="fa fa-users"></i> {this.props.users.length} |</span>
              </p>
              <hr></hr>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
}


