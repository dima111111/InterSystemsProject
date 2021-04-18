
function signInForm(event) {
	event.preventDefault()
	const email = event.target.email.value
	const dict = {
		email: email
	}
	console.log(email)
	console.log(dict)
}
export function SignIn() {
	return (
		<div>
			<form onSubmit={signInForm}>
			<div>
				<p>
				<label>
					<b>Email</b>
					<input type="email" placeholder="Enter email" name="email" required />
				</label>
				</p>
				<p>
				<button type="submit">
					Sign In
				</button>
				</p>
			</div>
		</form>
		</div>
	)
}