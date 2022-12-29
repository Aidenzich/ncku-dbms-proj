export default (router, {exceptions, database}) => {
	const { ServiceUnavailableException } = exceptions;

	router.get('/hello', (req, res) => res.send('Hello, World!'));
	router.get('/test', (req, res) => {
		let sql = req.query.q		
		database.raw(sql)
			.then((results) => res.json(results["rows"]))
			.catch((error) => {
				throw new ServiceUnavailableException(error.message);
			});
	});
};
