import axios from 'axios'
import React from 'react'
import style from './app.module.css'

function SendAppointment(event) {
	event.preventDefault()
	console.log('Appointment')
}

async function getDoctors() {
	console.log("get Doctors")
	const addr = 'http://localhost:9098/bmstuapi/getDoctors'
	const response = await axios({
		method: 'get',
		url: addr
	})


	console.log(response.data)
	return (response.data)
}

export function Doctors() {
	const [state, setState] = React.useState([])
	function onlyDoctors() {
		getDoctors().then(response => setState(response.doctors))
	}
	React.useEffect(onlyDoctors, [])

	return (
		<div className={style.all}>
			<table>
				<thead>
					<tr>
						<th>
							<span className={style.secondary}>FIO</span>
						</th>
						<th>
							<span className={style.secondary}>Email</span>
						</th>
						<th>
							<span className={style.secondary}>Phone</span>
						</th>
					</tr>
				</thead>
				<tbody>
					{state.map(doctor => (
						<tr>
							<td>
								<span className={style.main}>
									<a href={`/doctor/${doctor.ID}`}>{doctor.FIO}</a>
								</span>
							</td>
							<td>
								<span className={style.main}>
								{doctor.email}
								</span>
							</td>
							<td>
							<span className={style.main}>
								{doctor.phone}
								</span>
							</td>
						</tr>
					))}
				</tbody>
			</table>
		</div>
	)
}
