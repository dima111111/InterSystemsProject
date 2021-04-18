import axios from 'axios'
import React from 'react'
import { useParams } from 'react-router'
import { useHistory } from 'react-router-dom'

export async function sendJsonToAddr(addr, data) {
	const json = data;
	return axios({
		method: 'post',
		url: addr,
		data: json
	});

}

async function getDoctor(idDoctor) {
	console.log("get Doctor")
	const addr = `http://localhost:9098/bmstuapi/doctors/${idDoctor}`
	const response = await axios({
		method: 'get',
		url: addr
	})
	return (response.data)
}

export function EachDoctor() {
	const param = useParams()
	const [state, setState] = React.useState(null)
	function onlyDoctor() {
		getDoctor(param.id).then(response => setState(response))
	}
	React.useEffect(onlyDoctor, [])

	const dtFormat = new Intl.DateTimeFormat(undefined, {
		year: "numeric",
		month: "short",
		day: "numeric",
		hour: "numeric",
		minute: "numeric"
	});

	const hist = useHistory()
	async function makeAppointment(date) {
		
		const email = localStorage.getItem("user_email")
		if (email === null) {
			hist.push("/")
		}
		const appointment = {date: date, userEmail: email, doctorId: state.doctor.ID}
		return sendJsonToAddr('http://localhost:9098/bmstuapi/appointments', appointment)
	}

	if (state === null)
		return (
			<div>
				
			</div>
		)
	else
		return (
			<div>
				<p>FIO: {state.doctor.FIO}</p>
				<p>Email: {state.doctor.email}</p>
				<p>Phone: {state.doctor.phone}</p>
				<p>Exp: {state.doctor.experience}</p>
				<p>Education: {state.doctor.education}</p>
				<p>Schedule:</p>
				<ul>
					{state.schedules.map(schedule=>
						<li>
							{dtFormat.format(new Date(schedule.date / 1000000))}
							<button onClick={()=>makeAppointment(schedule.date)}>
								Make Appointment
							</button>
						</li>
						)}
				</ul>

			</div>
		)
}