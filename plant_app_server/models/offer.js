module.exports.define = function (sequelize, DataTypes) {
    return sequelize.define('Offer', {
        images: DataTypes.JSON,
        title: DataTypes.STRING
    });
  }