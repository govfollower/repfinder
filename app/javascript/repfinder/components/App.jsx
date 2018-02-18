import React from 'react'
import {
  BrowserRouter as Router,
  Route,
  Switch
} from 'react-router-dom'
import Intro from './Intro'
import FindDistrict from './FindDistrict'
import ShowDistrict from './ShowDistrict'

const App = (props) => (
  <Router>
    <Switch>
      <Route
        exact path='/'
        component={Intro}
      />
      <Route
        path='/find-district'
        component={FindDistrict}
      />
      <Route
        path='/districts/:districtId'
        component={ShowDistrict}
      />
    </Switch>
  </Router>
)

// You will need this on the bottom of each component file
// to make it available through ES6 'import' statements.

export default App