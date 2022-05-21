module.exports.define = function (sequelize, DataTypes) {
    return sequelize.define('Bid', {
        amount: DataTypes.DOUBLE
    });
  }