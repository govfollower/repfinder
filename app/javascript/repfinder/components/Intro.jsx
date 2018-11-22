import React from 'react';
import { Link } from 'react-router-dom';

class Intro extends React.Component {
  constructor () {
    super();
  }

  render () {
    return (
      <div className="intro">
        <h1 className="h1">Who's your Representative?</h1>
        <p>We believe that a healthy and strong democracy depends on citizens knowing who their elected leaders are. Regardless of your party or state, we need citizens like you to be informed and involved. Our goal is to provide you with information about your representatives in both the U.S. House and Senate.</p>
        <Link className="button" to={`/find-district`}>Find My Representatives</Link>
      </div>
    );
  }
}

export default Intro;
