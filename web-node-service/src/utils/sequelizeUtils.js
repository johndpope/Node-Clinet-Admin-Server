/* 
	Sequelize log 信息工具
 */
const logs = require('../config/logConf.js')
const LogFile = logs.logFile(__dirname);

const validation = (value) => {
	if (value.name == 'SequelizeValidationError') {
		let message = []
		value.errors.map(item => {
			message.push(item.path + ':' + item.validatorKey)
		})
		LogFile.error('SequelizeValidationError')
		LogFile.error(value.message)
		return message.join(',')
	} else {
		LogFile.error(value)
		return value
	}
}



module.exports = {
	validation
};
