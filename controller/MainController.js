const { Product } = require("../model")

class MainController {
    static async addProduct(req, res) {
        await Product.create({ ...req.body, userId: req.user.id })
        res.send({ message: "Product was created" })
    }

    static async deleteProduct(req, res) {
        const { id } = req.params
        await Product.destroy({ where: { id } })
        res.send({ message: "Product was deleted" })
    }

    static async updateProduct(req, res) {
        const { id } = req.params
        await Product.update(req.body, { where: { id } })
        res.send({ message: "Product was updated" })
    }

    static async getProducts(req, res) {
        const data = await Product.findAll()
        res.send(data)
    }

    static async getProductById(req, res) {
        const { id } = req.params
        const data = await Product.findByPk(id)
        res.send(data)
    }

    static async getProductsByUserId(req, res) {
        const data = await Product.findAll({
            where: { userId: req.user.id }
        })
        res.send(data)
    }
}

module.exports = { MainController }