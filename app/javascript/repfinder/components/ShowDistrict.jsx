import React from 'react';
import { Link } from 'react-router-dom';
import queryString from 'query-string';
import axios from 'axios';

class ShowDistrict extends React.Component {
  constructor () {
    super();
    this.state = {
      reps: {}
    };
  }

  fetchReps() {
    var districtId = this.props.match.params.districtId

    axios({
      // baseURL: `http://api.${window.location.host}`,
      headers: {
        'Content-Type': 'application/json'
      },
      url: `/v1/districts/${districtId}/reps`
    })
      .then(response => {
        this.setState({ reps: response.data });
      })
      .catch(error => {
        console.error(error);
      });
  }

  componentDidMount () {
    this.fetchReps();
  }

  render () {

    return (
      <div>
        <p>Hellow world!</p>
      </div>
    );
  }
}

export default ShowDistrict;
