const SQLize = require('sequelize');

const { Sequelize, DataTypes } = SQLize;

const User = require('./user');
const Post = require('./post');

const USERNAME = "root";
const PASSWORD = "cmpe137";

const sequelize = new Sequelize("cmpe137", USERNAME, PASSWORD, {
    host: "localhost",
    dialect: "mysql",
    pool: {
        max: 5,
        min: 0,
        idle: 10000
    },
});

const models = {
    User: User.define(sequelize, DataTypes),
    Post: Post.define(sequelize, DataTypes)
}

models.User.hasMany(models.Post);
models.Post.belongsTo(models.User);

models.User.belongsToMany(models.User, { through: 'following', as: 'followee' });
models.User.belongsToMany(models.User, { through: 'followed', as: 'follower' });



async function init() {
    await sequelize.sync({});
    await mock();
    console.log("All models were synchronized successfully.");
}

async function mock() {
    try {
        const users = await models.User.findAll();
        if (users.length == 0) {
            const user = await models.User.create({
                username: 'vinguyen32',
                birthday: new Date(),
                image: "https://avatars.githubusercontent.com/u/65844160?v=4",
                firstName: "Vi",
                lastName: "Nguyen",
                ratingstar: 5
            });

            const post = await models.Post.create({
                type: "TRADING",
                location: "123 Home street, San Jose CA95121",

                title: "Monstera Albo",
                caption: "Freebie",
                time: new Date(),
                images: [
                    "https://img.artpal.com/649041/27-20-1-17-5-1-55m.jpg",
                    "https://images.squarespace-cdn.com/content/v1/53c71197e4b0db5fbd4fa87e/1420928172537-FXQFXEQRZG87EL234LJG/ROSE+%26+IVY+JOURNAL+BOTANICALS+MONSTER+LEAF"
                ],
                isActive: true,
                UserId: user.id
            })
            console.log("user: " + JSON.stringify(users, null, 4));
        }
    }
    catch (e) {
        console.log("error: ", e)
    }
}


init();


module.exports = models;

