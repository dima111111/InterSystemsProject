import {Start} from './start'
import {SignIn} from './signIn'
import {SignUp} from './signUp'
import {Doctors} from './doctors'
import {EachDoctor} from './eachDoctor'
import {EachPatient} from './eachPatient'
import {EachAppointment} from './eachAppointment'

import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link,
  useParams
} from "react-router-dom";

function App() {
	return (
		// <EachDoctor />
		<Router>
		<div>
			<Switch>

			<Route path="/patient">
				<EachPatient />
			</Route>

			<Route path="/doctors">
				<Doctors />
			</Route>

			<Route path="/doctor/:id">
				<EachDoctor />
			</Route>

			<Route path="/signIn">
				<SignIn />
			</Route>

			<Route path="/signUp">
				<SignUp />
			</Route>

			<Route path="/">
				<Start />
			</Route>

			</Switch>
		</div>
		</Router>
	)
}

export default App;
