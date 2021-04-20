import axios from 'axios'
import React from 'react'
import { useParams } from 'react-router'
import { useHistory } from 'react-router-dom'

async function getPatientbyEmail(emailPatient) {
	console.log("get Patient")
	const addr = `http://localhost:9098/bmstuapi/patient`
	const response = await axios.get(addr, { params: { email: emailPatient } })
	console.log(response.data)
	return (response.data)
}



export function EachPatient() {



	const hist = useHistory()
	const email = localStorage.getItem("user_email")
	if (email === null) {
		hist.push("/")
	}

	const [state, setState] = React.useState(null)
	function onlyPatient() {
		getPatientbyEmail(email).then(response => setState(response))
	}
	React.useEffect(onlyPatient, [])

	const dtFormat = new Intl.DateTimeFormat(undefined, {
		year: "numeric",
		month: "short",
		day: "numeric",
		hour: "numeric",
		minute: "numeric"
	});

	if (state === null)
		return (
			<div>

			</div>
		)
	else
		return (
			<div>
				<p>
					FIO: {state.patient.FIO}
				</p>
				<p>
					Email: {email}	
				</p>
				<p>
					phone: {state.patient.phone}
				</p>
				<p>
					birthDate: {state.patient.birthDate}
				</p>
				<p>
					medicalHistory: {state.patient.medicalHistory}
				</p>
				<p>
					addInfo: {state.patient.addInfo}
				</p>

				<h2>
					Ваши записи:
				</h2>
				<ul>
					{state.appointments.map(appointment =>
						<li>
							<p>
								Date: {dtFormat.format(new Date(appointment.date/1000000))}
							</p>
							<p>
								FIO Doctor: {appointment.doctor.FIO}
							</p>
							<p>
								Doctor's Phone: {appointment.doctor.phone}
							</p>
						</li>)}
				</ul>
				<p>
					<button type="submit">Appointment</button>
				</p>
				
			</div>
		)
}