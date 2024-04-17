const express = require("express")
const { User } = require("../model/index")
const router = express.Router()
const bcrypt = require("bcrypt")
const UserDto = require('../dtos/user-dto');
const crypto = require("crypto")
const tokenService = require("./../service/token-service")
const passport = require('passport');
const Local = require("passport-local").Strategy

router.post('/check', passport.authenticate('jwt', { session: false }), (req, res) => {
    res.send({ user: req.user })
})

router.post('/register', async (req, res, next) => {
    try {
        const { name, surname, email, password } = req.body
        const canditate = await User.findOne({ where: { email: email } })
        if (canditate) {
            return res.status(401).send(`${email} is already exist!`)
        }
        const emailToken = await crypto.randomBytes(3).toString('hex').toUpperCase();
        const user = await User.create({ name, surname, email, password: bcrypt.hashSync(password, 10), emailToken });
        const userDto = new UserDto({ ...user.dataValues })
        const tokens = tokenService.generateToken({ ...userDto });
        await tokenService.saveToken(userDto.id, tokens.refreshToken);
        userDto.refreshToken = tokens.refreshToken;
        res.cookie('refreshToken', userDto.refreshToken, {
            maxAge: 30 * 24 * 60 * 60 * 1000,
            httpOnly: true
        })
        res.send(userDto)
    } catch (e) {
        next(e)
    }
})

router.post('/login',
    passport.authenticate('local'),
    async (req, res) => {
        try {
            if (req.user.isVerified == 1) {
                let comp = bcrypt.compareSync(req.body.password, req.user.password)
                if (comp) {
                    const userDto = new UserDto(req.user);
                    const tokens = await tokenService.generateToken({
                        ...userDto
                    });
                    await tokenService.saveToken(userDto.id, tokens.refreshToken);
                    res.cookie('refreshToken', tokens.refreshToken, {
                        maxAge: 30 * 24 * 60 * 60 * 1000,
                        httpOnly: true
                    })
                    userDto.refreshToken = tokens.refreshToken
                    res.send(userDto)
                } else {
                    res.send({
                        error: 'Wrong Username and/or Password'
                    })
                }
            } else {
                res.send({
                    verify: 'You have to verify your email'
                })
            }
        } catch (err) { }
    });


passport.use('local', new Local(
    async function (username, password, done) {
        try {
            let user = await User.findOne({
                where: {
                    email: username
                }
            })
            if (user) {
                done(null, user)
            } else {
                done(null, false)
            }
        } catch (err) { }
    }
));

passport.serializeUser(function (user, done) {
    done(null, user.id);
});

passport.deserializeUser(async function (id, done) {
    let user = await User.findOne({
        where: {
            id: id
        }
    });
    done(null, user);
});

module.exports = router