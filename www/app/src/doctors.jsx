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
					<th>FIO</th>
					<th>Email</th>
					<th>Phone</th>
					</tr>
				</thead>
				<tbody>
					{state.map(doctor=>(
						<tr>
							<td>
								<a href={`/doctor/${doctor.ID}`}>{doctor.FIO}</a>
							</td>
							<td>{doctor.email}</td>
							<td>{doctor.phone}</td>
						</tr>
					))}
				</tbody>
			</table>

		</div>
	)
}