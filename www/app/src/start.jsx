import {useHistory} from 'react-router-dom'
import style from './app.module.css'

export function Start() {
	const hist = useHistory()
	function signIn() {
		hist.push("/signIn")
	}
	function signUp() {
		hist.push("/signUp")
	}
	return (
		<div className={style.all}>
			<button onClick={signIn} type="button">
				Sign In
			</button>
			<button onClick={signUp} type="button">
				Sign Up
			</button>
			<h2 className={style.start}>
				Welcome to Dentistry
			</h2>
			<div className="start">
				Pow
			</div>
		</div>
	)
}

