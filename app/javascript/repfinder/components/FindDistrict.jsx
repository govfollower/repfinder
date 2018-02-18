import React from 'react';
import { Link } from 'react-router-dom';
import queryString from 'query-string';
import axios from 'axios';

class FindDistrict extends React.Component {
  constructor () {
    super();
    this.state = {
      states: [],
      districts: []
    };
    // This binding is necessary to make `this` work in the callback
    this.fetchDistricts = this.fetchDistricts.bind(this);
    this.setDistrictId = this.setDistrictId.bind(this);
  }

  fetchStates () {
    axios({
      // baseURL: `http://api.${window.location.host}`,
      headers: {
        'Content-Type': 'application/json'
      },
      url: '/v1/states'
    })
      .then(response => {
        this.setState({ states: response.data });
      })
      .catch(error => {
        console.error(error);
      });
  }

  fetchDistricts (e) {
    var stateId = e.target.value
    axios({
      headers: {
        'Content-Type': 'application/json'
      },
      url: `/v1/states/${stateId}/districts`
    })
      .then(response => {
        this.setState({ districts: response.data });
      })
      .catch(error => {
        console.error(error);
      });
  }

  setDistrictId (e) {
    var districtId = e.target.value
    this.setState({
      districtId: districtId
    })
  }

  // setQuoteIdFromQueryString (qs) {
  //   this.qsParams = queryString.parse(qs);
  //   if (this.qsParams.quote) {
  //     // assign quote ID from the URL's query string
  //     this.quoteId = Number(this.qsParams.quote);
  //   } else {
  //     this.quoteId = 1;
  //     // update URL in browser to reflect current quote in query string
  //     this.props.history.push(`/?quote=${this.quoteId}`);
  //   }
  // }

  componentDidMount () {
    // this.setQuoteIdFromQueryString(this.props.location.search);
    this.fetchStates();
  }

  componentWillReceiveProps (nextProps) {
    // this.setQuoteIdFromQueryString(nextProps.location.search);
    // this.fetchQuote(this.quoteId);
  }

  render () {
    var states = this.state.states
    var districts = this.state.districts
    var districtId = this.state.districtId

    return (
      <div>
        <select onChange={this.fetchDistricts}>
          {
            states.map((state) => {
              return <option key={state.id} value={state.id}>{state.name}</option>
            })
          }
        </select>
        <h3>Districts</h3>
        <select onChange={this.setDistrictId}>
          {
            districts.map((district) => {
              return <option key={district.id} value={district.id}>{district.number}</option>
            })
          }
        </select>
        <div>
        {
          districtId ? <a href={'/districts/' + districtId}>Next</a> : ''
        }
        </div>
      </div>
    );
  }
}

export default FindDistrict;
