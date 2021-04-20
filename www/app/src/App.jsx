import { Start } from './start'
import { SignIn } from './signIn'
import { SignUp } from './signUp'
import { Doctors } from './doctors'
import { EachDoctor } from './eachDoctor'
import { EachPatient } from './eachPatient'
import { EachAppointment } from './eachAppointment'
import { Header } from './Header'

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

		<Router>
			<div>
				<Switch>

					<Route path="/patient">
						<Header />
						<EachPatient />
					</Route>

					<Route path="/doctors">
						<Header />
						<Doctors />
					</Route>

					<Route path="/doctor/:id">
						<Header />
						<EachDoctor />
					</Route>

					<Route path="/signIn">
						<Header />
						<SignIn />
					</Route>

					<Route path="/signUp">
						<Header />
						<SignUp />
					</Route>

					<Route path="/">
						<Header />
						<Start />
					</Route>

				</Switch>
			</div>
		</Router>
	)
}

export default App;
