
import axios from 'axios'

function sendJsonToAddr(addr, data) {
	const json = data;
	axios({
		method: 'post',
		url: addr,
		data: json
	});
}

function App() {

	console.log("pep")
	function loginForm(event) {
		event.preventDefault()
		const fio = event.target.FIO.value;
		var birthDate = event.target.birthDate.value
		console.log(birthDate)
		// birthDate = birthDate.replace(/[\-]/g,'');
		// console.log(birthDate)
		const email = event.target.email.value
		const phone = event.target.phone.value
		const dict = {
			FIO: fio,
			birthDate: birthDate,
			email: email,
			phone: phone
		}
		sendJsonToAddr('http://localhost:9098/bmstuapi/login', dict)
	}
	return (
		<form onSubmit={loginForm}>
			<div>
				<p>
				<label><b>FIO</b>
				<input type="text" placeholder="Enter FIO" name="FIO" required />
				</label>
				</p>

				<p>
				<label><b>Birth Date</b>
				<input type="date" placeholder="Enter date" name="birthDate" required />
				</label>
				</p>

				<p>
				<label><b>Email</b>
				<input type="email" placeholder="Enter email" name="email" required />
				</label>
				</p>

				<p>
				<label><b>Phone</b>
				<input type="text" placeholder="Enter phone" name="phone" required />
				</label>
				</p>
				
				<p>
				<button type="submit">Login</button>
				</p>
			</div>
		</form>

		// <form action="http://localhost:9098/bmstuapi/login" method="POST">
		// 	<div class="container">
		// 		<label for="FIO"><b>FIO</b></label>
		// 		<input type="text" placeholder="Enter FIO" name="FIO" required>
		// 		<button type="submit">Login</button>
		// 	</div>
		// </form>
	);
}

export default App;
