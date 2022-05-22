module.exports.define = function (sequelize, DataTypes) {
  return sequelize.define('User', {
    username: {
      unique: true,
      type: DataTypes.STRING,
    },
    password: DataTypes.STRING,
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    ratingstar: DataTypes.INTEGER,
    image: DataTypes.STRING
  });
}