const SQLize = require('sequelize');

const { Sequelize, DataTypes } = SQLize;

const User = require('./user');
const Post = require('./post');
const Bid = require('./bid');
const Offer = require('./offer');

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
    Post: Post.define(sequelize, DataTypes),
    Bid: Bid.define(sequelize, DataTypes),
    Offer: Offer.define(sequelize, DataTypes)

}

models.User.hasMany(models.Post);
models.Post.belongsTo(models.User);

models.User.belongsToMany(models.User, { through: 'following', as: 'followee' });
models.User.belongsToMany(models.User, { through: 'followed', as: 'follower' });


models.Bid.belongsTo(models.User);
models.User.hasMany(models.Bid);
models.Post.hasMany(models.Bid);
models.Bid.belongsTo(models.Post);

models.Offer.belongsTo(models.User);
models.User.hasMany(models.Offer);
models.Post.hasMany(models.Offer);
models.Offer.belongsTo(models.Post);

async function init() {
    await sequelize.sync({});
    await mock();
    console.log("All models were synchronized successfully.");
}

async function mock() {
    try {
        const users = await models.User.findAll();
        if (users.length == 0) {
            const user1 = await models.User.create({
                username: 'vinguyen32',
                password: 'password',
                birthday: new Date(),
                image: "https://avatars.githubusercontent.com/u/65844160?v=4",
                firstName: "Vi",
                lastName: "Nguyen",
                ratingstar: 5
            });

            const user2 = await models.User.create({
                username: 'hieutran91',
                password: 'password',
                birthday: new Date(),
                image: "https://avatars.githubusercontent.com/u/9521989?v=4",
                firstName: "Hieu",
                lastName: "Tran",
                ratingstar: 3
            });

            const user3 = await models.User.create({
                username: 'plantworld',
                password: 'password',
                birthday: new Date(),
                image: "https://www.ecuagenera.com/WebRoot/Store/Shops/ecuagenera/5CE5/803C/4A86/985B/7102/C0A8/DA44/0B0A/Anthurium_luxurians_one_ml.JPG",
                firstName: "Chloe",
                lastName: "Taylor",
                ratingstar: 3.5
            });

            const user4 = await models.User.create({
                username: 'felinejungle',
                password: 'password',
                birthday: new Date(),
                image: "https://www.urbanjunglebloggers.com/wp-content/uploads/2017/10/livingwithcatsandplants.jpg",
                firstName: "Kitty",
                lastName: "Chan",
                ratingstar: 4.5
            });

            const user5 = await models.User.create({
                username: 'plantclub',
                password: 'password',
                birthday: new Date(),
                image: "https://www.plantclubshop.com/uploads/b/6af15aefb21f841d502549fa8644965bd6983f61c9c9bc64c01a6da938ce0dae/927002A3-B7E0-41E2-81F4-9E41C6B2D6B9_1613025029.JPEG",
                firstName: "Miley",
                lastName: "Monstera",
                ratingstar: 5
            });

            const tradingPost = await models.Post.create({
                type: "TRADING",
                location: "Los Angeles",

                title: "Philodendron Golden Dragon",
                caption: "A beautiful 6 leaves of Variegated Golden Dragon Rare Plant is up for trading. Would love to see what you got",
                time: new Date(),
                images: [
                    "https://i.etsystatic.com/26466238/r/il/0b8597/3771286847/il_570xN.3771286847_teup.jpg",
                    "https://growgardener.b-cdn.net/wp-content/uploads/2021/12/Philodendron-Golden-Dragon.jpg",
                    "https://cdn.shopify.com/s/files/1/1075/8376/products/image_ca27764a-29ea-46e2-a420-6a83cf44479b.jpg?v=1647991122"
                ],
                isActive: true,
                UserId: user1.id
            })

            await models.Post.create({
                type: "TRADING",
                location: "San Francisco",

                title: "Anthurium Clarinervium",
                caption: "",
                time: new Date(),
                images: [
                    "https://fiddleandthorn.com/static/f73e6221feb0b1df26f918af2bb3cb47/e04a1/pexels-tiia-pakk-4953083-scaled-aspect-ratio-4-3-scaled-1.jpg",
                    "https://smartgardenguide.com/wp-content/uploads/2020/07/anthurium-clarinervium-care-16.jpg",
                    "https://i.etsystatic.com/26584509/r/il/a194ba/2923331089/il_fullxfull.2923331089_skw1.jpg",
                    "https://urbanhouseplant.com/wp-content/uploads/2021/06/anthurium-clarinervium-matuda-1.jpg"
                ],
                isActive: false,
                UserId: user1.id
            })

            await models.Post.create({
                type: "TRADING",
                location: "San Jose",

                title: "Philodendron Pink Princess",
                caption: "In search of Strawberry Shake, Anthurium Vetchii, Florida Beauty, and other rare plants to trade",
                time: new Date(),
                images: [
                    "https://balconygardenweb-lhnfx0beomqvnhspx.netdna-ssl.com/wp-content/uploads/2022/01/Philodendron-Pink-Princess-Care-2.jpg",
                    "https://static.wixstatic.com/media/e1ce09_51532371dc394219bba440b0a61b602e~mv2.jpg/v1/fill/w_1000,h_1333,al_c,q_90,usm_0.66_1.00_0.01/e1ce09_51532371dc394219bba440b0a61b602e~mv2.jpg"

                ],
                isActive: true,
                UserId: user2.id
            })


            const biddingPost = await models.Post.create({
                type: "BIDDING",
                location: "San Jose",
                data: {
                    basePrice: 75,
                    currency: "USD",
                    minimumBid: 10
                },
                title: "Anthurium Warocqueanum",
                caption: "Dark narrow form of Queen, 3 big leaves",
                time: new Date(),
                images: [
                    "https://cdn.shopify.com/s/files/1/0586/7526/5743/products/image_b5f1da3e-7df9-4f6f-bca9-f56905391789_2048x2048.jpg?v=1638265220",
                    "http://cdn.shopify.com/s/files/1/0472/6453/0590/products/anthurium-warocqueanum-dark-form-pre-order-downtown-plant-club-695620_54b73959-00eb-48c1-92c6-d70de30a235e_1200x1200.jpg?v=1643383548"
                ],
                isActive: true,
                UserId: user2.id
            })

            await models.Post.create({
                type: "BIDDING",
                location: "Florida",
                data: {
                    basePrice: 180,
                    currency: "USD",
                    minimumBid: 10
                },
                title: "Monstera Albo Cuttings",
                caption: "Highly Variegated Monstera Albo topcuts",
                time: new Date(),
                images: [
                    "https://homeostasisdesign.com/wp-content/uploads/2021/05/Monstera-borsigiana.jpg",
                    "https://pbs.twimg.com/media/ESifBmmXkAclTJ8.jpg",
                    "https://pbs.twimg.com/media/EojdH3eXMAEDsDG.jpg"
                ],
                isActive: false,
                UserId: user3.id
            })

            // await models.Post.create({
            //     type: "BIDDING",
            //     location: "Napa Valley",
            //     data: {
            //         basePrice: 200,
            //         currency: "USD",
            //         minimumBid: 10
            //     },
            //     title: "Variegated Alocasia Frydek",
            //     caption: "This stunning plant is available now!",
            //     time: new Date(),
            //     images: [
            //         "https://i.pinimg.com/originals/44/ba/6b/44ba6bec9c2c31a627a7e17e62fcb6f5.jpg",
            //         "https://images.squarespace-cdn.com/content/v1/5ecee8ccbaacf76f4d3ca700/e7ba9997-de6c-429e-bbf4-d816062ebf99/274595220_654525759196161_1103853353696965866_n+%281%29.jpg",
            //         "https://i.pinimg.com/originals/78/37/a3/7837a3b8de17150a7104508a70b778dc.jpg"
            //     ],
            //     isActive: false,
            //     UserId: user3.id
            // })

            await models.Post.create({
                type: "BIDDING",
                location: "Napa Valley",
                data: {
                    basePrice: 200,
                    currency: "USD",
                    minimumBid: 10
                },
                title: "Variegated Alocasia Frydek",
                caption: "This stunning plant is available now!",
                time: new Date(),
                images: [
                    "https://i.pinimg.com/originals/44/ba/6b/44ba6bec9c2c31a627a7e17e62fcb6f5.jpg",
                    "https://images.squarespace-cdn.com/content/v1/5ecee8ccbaacf76f4d3ca700/e7ba9997-de6c-429e-bbf4-d816062ebf99/274595220_654525759196161_1103853353696965866_n+%281%29.jpg",
                    "https://i.pinimg.com/originals/78/37/a3/7837a3b8de17150a7104508a70b778dc.jpg"
                ],
                isActive: false,
                UserId: user4.id
            })

            await models.Post.create({
                type: "BIDDING",
                location: "Miami",
                data: {
                    basePrice: 1000,
                    currency: "USD",
                    minimumBid: 100
                },
                title: "Philodendron Florida Beauty",
                caption: "This huge mother Florida Beauty plant is looking so gorgous!!",
                time: new Date(),
                images: [
                    "https://www.pflanzen-wunder.de/wp-content/uploads/2021/05/plantmomdivinity-scaled.jpg",
        
                ],
                isActive: true,
                UserId: user4.id
            })

            await models.Post.create({
                type: "TRADING",
                location: "San Jose",

                title: "Philodendron Gloriosum",
                caption: "This plant brings me a lot of joy, I currently have 3 of this plants so I want to trade it for another plants you have :)",
                time: new Date(),
                images: [
                    "https://images.squarespace-cdn.com/content/v1/56091b78e4b09e2b03426d22/1612262955571-HK3GWMIGACQ0M5YF4HGH/Philodendron%2Bgloriosum%2Bcare.jpg",
                    "https://images.squarespace-cdn.com/content/v1/56091b78e4b09e2b03426d22/1612262620562-C9Q035KSGIOSLAD872ZO/Philodendron+gloriosum.JPG",
                    "https://plantophiles.com/wp-content/uploads/2020/05/IMG_8235.jpg"


                ],
                isActive: true,
                UserId: user5.id
            })
        }
    }
    catch (e) {
        console.log("error: ", e)
    }
}


init();


module.exports = models;

