/**
 * Populate DB with sample data on server start
 * to disable, edit config/environment/index.js, and set `seedDB: false`
 */

'use strict';

var User = require('../api/user/user.model');
var Product = require('../api/product/product.model');
var Catalog = require('../api/catalog/catalog.model');
var mainCatalog, home, books, clothing;

User.find({}).removeAsync()
  .then(function() {
    User.createAsync({
      provider: 'local',
      name: 'Test User',
      email: 'test@test.com',
      password: 'test'
    }, {
      provider: 'local',
      role: 'admin',
      name: 'Admin',
      email: 'admin@admin.com',
      password: process.env.ADMIN_PASSWORD || 'admin'
    })
    .then(function() {
      console.log('finished populating users');
    });
  });

Catalog
  .find({})
  .remove()
  .then(function () {
    return Catalog.create({ name: 'All'});
  })
  .then(function (catalog) {
    mainCatalog = catalog;
    return mainCatalog.addChild({name: 'Home'});
  })
  .then(function (category) {
    home = category._id;
    return mainCatalog.addChild({name: 'Books'});
  })
  .then(function (category) {
    books = category._id;
    return mainCatalog.addChild({name: 'Clothing'});
  })
  .then(function (category) {
    clothing = category._id;
    return Product.find({}).remove({});
  })
  .then(function() {
    return Product.create({
      title: 'Gaia 8',
      imageUrl: '/assets/uploads/gaia-8.png',
      price: 1899,
      stock: 999,
      categories: [home],
      description: 'Gaia 8 the amazing grow light'
    }, {
      title: 'Gaia 4',
      imageUrl: '/assets/uploads/gaia-4.png',
      price: 699,
      stock: 15,
      categories: [home],
      description: 'Gaia 4 the amazing grow light'
    }, {
      title: 'Persephone Bloom',
      imageUrl: '/assets/uploads/persephone.png',
      price: 99,
      stock: 8,
      categories: [books],
      description: 'Persephone bloom'
    }, {
      title: 'Gaianysus T-shirt',
      imageUrl: '/assets/uploads/gaianysus.png',
      price: 29,
      stock: 15,
      categories: [clothing],
      description: 'The Gaianysus T-shirt'
    }, {
      title: 'Gaia 6',
      imageUrl: '/assets/uploads/gaia-6.png',
      price: 1299,
      stock: 18,
      categories: [home],
      description: 'Gaia 6 - the mid range beast light'
    });
  })
  .then(function () {
    console.log('Finished populating Products with categories');
  })
  .then(null, function (err) {
    console.error('Error populating Products & categories: ', err);
  });
