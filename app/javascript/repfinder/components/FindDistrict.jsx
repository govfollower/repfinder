import React from 'react';
import { Link } from 'react-router-dom';
import queryString from 'query-string';
import axios from 'axios';

class FindDistrict extends React.Component {
  constructor () {
    super();
    this.state = {
      states: []
    };
  }

  fetchStates () {
    axios.get( `api/states` )
        .then(response => {
          this.setState({ states: response.data });
        })
        .catch(error => {
          console.error(error);
        });
  }

  fetchDistricts(stateId) {
    axios.get( `api/states/${stateId}/districts` )
        .then(response => {
          this.setState({ districts: response.data });
        })
        .catch(error => {
          console.error(error);
        });
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
    // const nextQuoteId = Number(this.state.quote.id) + 1;

    return (
      <div>
        <select>
          <option>Some Option</option>
        </select>
        <Link to={`districts/29`}>Next</Link>
      </div>
    );
  }
}

export default FindDistrict;
