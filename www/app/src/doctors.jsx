function SendAppointment(event) {
	event.preventDefault()
	console.log('Appointment')
}

export function Doctors() {
	return (
		<div>
		<form onSubmit={SendAppointment}>
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
						<button type="submit">
							Записаться
						</button>
					</td>
					</tr>
				</tbody>
			</table>
		</form>
		</div>
	)
}