const { Client } = require('tplink-smarthome-api');
 
const client = new Client();
const plug = client.getDevice({host: '192.168.1.37'}).then((device) => {
	device.emeter.getRealtime().then((usage) => {
		console.log(JSON.stringify(usage));
	});
});
