import axios from 'axios'
import React from 'react'
import { useParams } from 'react-router'
import { useHistory } from 'react-router-dom'
import style from './app.module.css'

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
	const hist = useHistory()
	function listDoctors() {
		hist.push("/doctors")
	}

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

	// const hist = useHistory()
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
			<div className={style.all}>
				<div>
					<span className={style.secondary}>FIO: </span>
					<span className={style.main}>{state.doctor.FIO}</span>
				</div>
				<div>
					<span className={style.secondary}>Email: </span>
					<span className={style.main}>{state.doctor.email}</span>
				</div>
				<div>
					<span className={style.secondary}>Phone: </span>
					<span className={style.main}>{state.doctor.phone}</span>
				</div>
				<div>
					<span className={style.secondary}>Experience: </span>
					<span className={style.main}>{state.doctor.experience}</span>
				</div>
				<div>
					<span className={style.secondary}>Education: </span>
					<span className={style.main}>{state.doctor.education}</span>
				</div>

				<h2>
					Schedule
				</h2>
				<div>
					{state.schedules.map(schedule=>
						<div className={style.patientAppointments}>
							<div>
								<span className={style.secondary}>Date: </span>
								<span className={style.main}>{dtFormat.format(new Date(schedule.date))}</span>					
							</div>
							<div>
								<button onClick={()=>makeAppointment(schedule.date)}>
									Make Appointment
								</button>
							</div>
						</div>
					)}
				</div>
				<p>
					<button onClick={listDoctors} type="button"> List of Doctors </button>
				</p>
			</div>
		)
}
