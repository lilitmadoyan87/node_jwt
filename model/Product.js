module.exports = (sequelize, Sequelize) => {
    const Product = sequelize.define("product", {
        name: Sequelize.STRING,
        description: Sequelize.STRING,
        price: Sequelize.INTEGER
    })
    return Product
}