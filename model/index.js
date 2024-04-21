const {Sequelize} = require('sequelize')

const sequelize = new Sequelize('node_jwt1', 'root', '', {
    host: 'localhost',
    dialect: 'mysql',
    port: 3306
});

const User = require("./user")(sequelize, Sequelize)
const Product = require("./Product")(sequelize, Sequelize)
Product.belongsTo(User, {onUpdate: "cascade", onDelete: "cascade"})
User.hasMany(Product, {onUpdate: "cascade", onDelete: "cascade"})

sequelize.sync()
module.exports = {
    User, Product,
    sequelize
}