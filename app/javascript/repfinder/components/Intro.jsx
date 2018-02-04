import React from 'react';
import { Link } from 'react-router-dom';

class Intro extends React.Component {
  constructor () {
    super();
  }

  render () {
    return (
      <div>
        <h1>Who's your Congressional Representative?</h1>
        <p>We believe that a healthy and strong Democracy depends on citizens knowing who their elected leaders are. Regardless of what party or state you belong to, we need citizens like you to be informed and involved. Our goal is to provide you with information about your representatives in both the U.S. House and Senate and the issues they are voting on. We believe that well-informed voters will keep our Democracy that our nation has fought for going strong for another 250 years.</p>
        <Link to={`/find-district`}>Next</Link>
      </div>
    );
  }
}

export default Intro;
