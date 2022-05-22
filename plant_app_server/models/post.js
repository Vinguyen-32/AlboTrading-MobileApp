module.exports.define = function (sequelize, DataTypes) {
    return sequelize.define('Post', {
        title: DataTypes.STRING,
        type: DataTypes.STRING,
        location: DataTypes.STRING,
        caption: DataTypes.STRING,
        time: DataTypes.DATE,
        images: DataTypes.JSON,
        isActive: DataTypes.BOOLEAN,
        data: DataTypes.JSON,
    });
  }