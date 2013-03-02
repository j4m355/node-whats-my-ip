settings = require(__dirname + '/config/config')(__dirname + "/config/settings.json")

###
START APPLICATION NOW :
###

express = require('express')
app = express()
exec = require('child_process').exec

app.engine('jade', require('jade').__express);
app.use(express.bodyParser());

app.set('view options',
  layout: false
)

app.get('/', (req, res)->
	res.render(__dirname + '/views/top.jade')
	)
	
app.post('/query', (req,res) ->
	debugger
	pcName = req.body.pcName
	console.log pcName
	res.set('Content-Type', 'json')	
	exec "ping #{pcName} -4", (error, stdout, stderr) ->
		res.send stdout
		)
	

app.use(express.static(__dirname + '/public'));


app.listen(3301)
console.log('Listening on port 3301')




