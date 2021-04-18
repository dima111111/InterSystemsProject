import axios from 'axios'

function SendAppointment(event) {
	event.preventDefault()
	console.log('Appointment')
}


async function getDoctors() {
	console.log("get Doctors")
	var addr = 'http://localhost:9098/bmstuapi/getDoctors'
	const response = await axios({
		method: 'get',
		url: addr
	})
	

	console.log(response)
	return (response)
}

export function Doctors() {

	var jo = getDoctors()
	console.log(jo)

	return (
		<div>
			

			<table>
				<thead>
					<tr>
					<th>FIO</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Schedule</th>
					<th>Appointment</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td>
						<a href='eachDoctor.html'>Pepov</a>
					</td>
					<td>2@a.2e</td>
					<td>12-asc-12</td>
					<td>04/12/2021 14:00</td>
					<td>
						<button type="submit" onClick={SendAppointment}>
							Записаться
						</button>
					</td>
					</tr>
				</tbody>
			</table>

		</div>
	)
}