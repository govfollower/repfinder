import React from 'react';
import { Link } from 'react-router-dom';
import queryString from 'query-string';
import axios from 'axios';

class FindDistrict extends React.Component {
  constructor () {
    super();
    this.state = {
      allDistricts: [],
      allStates: [],
      addressCity: '',
      addressStreet: '',
      selDistrict: {},
      selState: {}
    };
    // This binding is necessary to make `this` work in the callback
    this.fetchStatesAndDistricts = this.fetchStatesAndDistricts.bind(this);
    this.handleAddressSubmit = this.handleAddressSubmit.bind(this);
    this.selectState = this.selectState.bind(this);
    this.selectDistrict = this.selectDistrict.bind(this);
  }

  getStates () {
    return axios({
      // baseURL: `http://api.${window.location.host}`,
      headers: {
        'Content-Type': 'application/json'
      },
      url: '/v1/states'
    })
  }

  getDistricts () {
    return axios({
      // baseURL: `http://api.${window.location.host}`,
      headers: {
        'Content-Type': 'application/json'
      },
      url: '/v1/districts'
    })
  }

  fetchStatesAndDistricts () {
    axios.all([
      this.getStates(),
      this.getDistricts()
    ])
    .then(res => {
      this.setState({ 
        allStates: res[0].data,
        allDistricts: res[1].data
      })
    }, this)
    .catch(error => {
      console.error(error)
    })
  }

  handleAddressSubmit (e) {
    e.preventDefault()
    console.log(e, e.target, e.target.value)
    var form = e.target.formSerialize()
    console.log(form) 
  }

  selectState (e) {
    var stateId = parseInt(e.target.value)
    var selState = this.state.allStates.find(state => {
      return state.id === stateId
    })
    var stateDistricts = this.state.allDistricts.filter(district => {
      return district.state_id === stateId
    })
    this.setState({
      selState: selState,
      selDistrict: stateDistricts[0]
    });
  }

  selectDistrict (e) {
    var districtId = parseInt(e.target.value)
    var selDistrict = this.state.allDistricts.find(district => {
      return district.id === districtId
    })
    this.setState({
      selDistrict: selDistrict
    })
  }

  componentDidMount () {
    this.fetchStatesAndDistricts();
  }

  render () {
    var allStates = this.state.allStates
    var allDistricts = this.state.allDistricts
    var selState = this.state.selState
    var selDistrict = this.state.selDistrict

    var filDistricts = allDistricts.filter(district => {
      return district.state_id === selState.id
    })
    // TODO:
    // 1. Select State
    // 2. If state has only one district -> show next
    // 3. If state has > 1 district, render district map (dropdown menu) or address form
    // 4. On form submit -> find district and then do a javascript redirect
    return (
      <div>
        <p><strong>Choose your state: </strong></p>
        <select onChange={this.selectState}>
          {
            allStates.map((state) => {
              return <option key={state.id} value={state.id}>{state.name}</option>
            })
          }
        </select>
        <h3>Districts</h3>
          {
            filDistricts.length > 1 ? (
              <div>
                <p>{selState.name} has {filDistricts.length} districts in the House. Please select your district.</p> 
                <select onChange={this.selectDistrict}>
                  {
                    filDistricts.map((district) => {
                      return <option key={district.id} value={district.id}>{district.number}</option>
                    })
                  }
                </select>
                <div>
                  {
                    selDistrict.id ? <a href={'/districts/' + selDistrict.id}>View Representatives for {selState.name} District {selDistrict.number}</a> : ''
                  }
                </div>

                <p><strong>Don't know your district?</strong></p>
                <p>Your district is based on the address you use when you register to vote. You can use the form below to lookup your district.</p>
                <p>Here are some additional resources to help you find your district:</p>
                <p>Map</p>
                <p>Census.gov link</p>
                <form onSubmit={this.handleAddressSubmit}>
                  <div>
                    <p><label>Street (e.g. 123 Main St)</label></p>
                    <input type="text" name="street" />
                  </div>
                  <div>
                    <p><label>City (e.g. Los Angeles)</label></p>
                    <input type="text" name="city" />
                  </div>
                  <div>
                    <input type="hidden" value={selState.abbr} name="state"/>
                  </div>
                  <div>
                    <input type="submit" value="Submit" />
                  </div>
                </form>
              </div>
            ) : ''
          }
      </div>
    );
  }
}

export default FindDistrict;
