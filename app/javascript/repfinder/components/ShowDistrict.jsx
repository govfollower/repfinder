import React from 'react';
import { Link } from 'react-router-dom';
import queryString from 'query-string';
import axios from 'axios';

class ShowDistrict extends React.Component {
  constructor () {
    super();
    this.state = {
      district: {},
      house: {},
      senate: [],
      state: {}
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
        this.setState(response.data);
      })
      .catch(error => {
        console.error(error);
      });
  }

  componentDidMount () {
    this.fetchReps();
  }

  render () {
    var district = this.state.district
    var house = this.state.house
    var senate = this.state.senate
    var state = this.state.state

    return (
      <div>
        <div>
          <h2>District {district.number}</h2>
          <h3>{state.name}</h3>
        </div>
        <div>
          <h5>House</h5>
          <h4>{house.first_name} {house.middle_name} {house.last_name}</h4>
          <p>Party: {house.party}</p>
          <p>DOB: {house.dob}</p>
          <p>Phone: {house.phone}</p>
          <p>Reelection year: {house.reelection_year}</p>
        </div>
        <div>
          <h5>Senate</h5>
          {
            senate.map(rep => {
              return (
                <div key={rep.id}>
                  <h4>{rep.first_name} {rep.middle_name} {rep.last_name}</h4>
                  <p>Party: {rep.party}</p>
                  <p>DOB: {rep.dob}</p>
                  <p>Phone: {rep.phone}</p>
                  <p>Reelection year: {rep.reelection_year}</p>
                </div>
              )
            })
          }
        </div>
        <a href="/find-district">Change District</a>
      </div>
    );
  }
}

export default ShowDistrict;
