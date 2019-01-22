import PropTypes from "prop-types";
import React from 'react';

export default class ChatroomMembers extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const { dms } = this.props;
    console.log(dms);
    return (
      <div className="member-list">
        {dms && dms.map (name => (
          <div>
            <h6>Seun Adekunle</h6>
          <p>{name[0]}</p>
          </div>
        )
        )}

      </div>
    )
  }
}
