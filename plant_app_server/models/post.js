module.exports.define = function (sequelize, DataTypes) {
    return sequelize.define('Post', {
        type: DataTypes.STRING,
        location: DataTypes.STRING,
        caption: DataTypes.STRING,
        time: DataTypes.DATE,
        images: DataTypes.JSON,
        isActive: DataTypes.BOOLEAN,
    });
  }