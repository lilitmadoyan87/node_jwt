const {Sequelize} = require('sequelize')

const sequelize = new Sequelize('db', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    port: 3306
});

const User = require("./user")(sequelize, Sequelize)

sequelize.sync()
module.exports = {
    User,
    sequelize
}