



/*	日期編譯 */
function dateFormate(date) {
	let result = "";
	result = result.concat(new Date(date).toLocaleDateString())
		.concat(" " + new Date(date).toLocaleTimeString())

	return result;
}

