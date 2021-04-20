import style from './app.module.css'
import { useHistory } from 'react-router-dom'

export function Header() {
	const hist = useHistory()
	function acc() {
		hist.push("/patient")
	}
	const email = localStorage.getItem("user_email")
	if (email === null) {
		return(
			<div>
				No user login
			</div>
		)
	}
	
	return (
		<div className={style.header}>
			Account 
			<button onClick={acc} type="button">
				{email}
			</button>
			 
		</div>
	)

}