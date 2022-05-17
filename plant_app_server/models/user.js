module.exports.define = function (sequelize, DataTypes) {
  return sequelize.define('User', {
    username: {
      unique: true,
      type: DataTypes.STRING,
    },
    birthday: DataTypes.DATE,
    firstName: DataTypes.STRING,
    lastName: DataTypes.STRING,
    ratingstar: DataTypes.INTEGER,
    image: DataTypes.STRING
  });
}