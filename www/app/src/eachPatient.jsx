import axios from 'axios'
import React from 'react'
import { useParams } from 'react-router'
import { useHistory } from 'react-router-dom'
import style from './app.module.css'

async function getPatientbyEmail(emailPatient) {
	console.log("get Patient")
	const addr = `http://localhost:9098/bmstuapi/patient`
	const response = await axios.get(addr, { params: { email: emailPatient } })
	console.log(response.data)
	return (response.data)
}



export function EachPatient() {
	const hist = useHistory()
	function makeAppointment() {
		hist.push("/doctors")
	}
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
			<div className={style.all}>
				<div>
					<span className={style.secondary}>FIO: </span>
					<span className={style.main}>{state.patient.FIO}</span>
				</div>
				<div>
					<span className={style.secondary}>Email: </span>
					<span className={style.main}>{email}</span>
				</div>
				<div>
					<span className={style.secondary}>Phone: </span>
					<span className={style.main}>{state.patient.phone}</span>
				</div>
				<div>
					<span className={style.secondary}>Date of birth: </span>
					<span className={style.main}>{state.patient.birthDate}</span>
				</div>
				<div>
					<span className={style.secondary}>Medical history: </span>
					<span className={style.main}>{state.patient.medicalHistory}</span>
				</div>
				<div>
					<span className={style.secondary}>Additinal information: </span>
					<span className={style.main}>{state.patient.addInfo}</span>
				</div>

				<h2>
					Your appointments:
				</h2>
				<div>
					{state.appointments.map(appointment =>
					<div className={style.patientAppointments}>					
						<div>
							<span className={style.secondary}>Date: </span>
							<span className={style.main}>{dtFormat.format(new Date(appointment.date / 1000000))}</span>
						</div>
						<div>
							<span className={style.secondary}>Doctor: </span>
							<span className={style.main}>{appointment.doctor.FIO}</span>
						</div>
						<div>
							<span className={style.secondary}>Phone: </span>
							<span className={style.main}>{appointment.doctor.phone}</span>
						</div>
					</div>
					)}
				</div>
				<p>
					<button onClick={makeAppointment} type="button">New Appointment</button>
				</p>

			</div>
		)
}