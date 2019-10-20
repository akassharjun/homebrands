
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/shop.dart';

List<Product> getProductItems(String shop){
  if (shop == 'Surand\'s Sweet foods'){
    print('surands shoop');
    return sweetsList;
  } else if (shop == 'Charamel Eats'){
    print('Charamel Eats');
    return caramelList;
  } else if (shop == 'Yei\'s Brownies'){
    print('Yei\'s Brownies');
    return browniesList;
  } else if (shop == 'Gehans Sweets'){
    print('Charamel Eats');
    return IndianList;
  } else if (shop == 'Bombae Sweets'){
    print('Charamel Eats');
    return IndianList;
  } else if (shop == 'K Sweet Meats'){
    print('Charamel Eats');
    return MeatList;
  }else if (shop == 'The Gallery shop'){
    return theGalleryShop;
  }else if (shop == 'Arts and Crafts'){
    return artsAndCrafts;
  }else if (shop == 'Sunflower Shop'){
    return sunflowerShop;
  }else if (shop == 'Plants and Seeds'){
    return plantShop;
  }else if (shop == 'Gifts.inc'){
    return giftsInc;
  }else if (shop == 'John Gift Ideas'){
    return johnGiftIdeas;
  }else if (shop == 'The  Creative Stationary Shop'){
    return creativeStationaryShop;
  }else if (shop == 'Books and stuff'){
    return booksAndStuff;
  }else if (shop == 'Ravi Textiles'){
    return clothes;
  }else if (shop == 'kanthi\'s Dressers'){
    return clothes;
  }else if (shop == 'Thivyan\'s Food'){
    return food;
  }
}
List<Product> food = [
  Product(
      price: Price(currency: 'LKR', amount: 2000),
      name: 'Mac n Cheese',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0euzUbX_PRxwziBLsAvYVSsqRmB3m_P-j5zQP5aQaMCWAMrixhQ',
      id: 'F372873'),
  Product(
      price: Price(currency: 'LKR', amount: 3000),
      name: 'Manicotti',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwxYTt1BmbshGsp90TqnJOxyQXAHT9EuhswaibcUpOQpLtxsvg8w',
      id: 'F843758'),
  Product(
      price: Price(currency: 'LKR', amount: 1500),
      name: 'Pizza',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzo4PZ3fPoKnI4QvE0ogmYh_xFXwfp_dyJxMzJDAq6_llCZXKd',
      id: 'F8738753'),
];

List<Product> clothes = [
  Product(
      price: Price(currency: 'LKR', amount: 2000),
      name: 'unisex Denim Jackets',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4l4rfONcukQw13fWRmPAicH56yYSsPoMtZY7BnXPhvMqDOW1osQ',
      id: 'C372873'),
  Product(
      price: Price(currency: 'LKR', amount: 3000),
      name: 'unisex Denim pants',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4l4rfONcukQw13fWRmPAicH56yYSsPoMtZY7BnXPhvMqDOW1osQ',
      id: 'C843758'),
  Product(
      price: Price(currency: 'LKR', amount: 1500),
      name: 'Ladies frocks',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2DalXF10HXAbKDcl9qnO_BXKrgmC-O-kYkCAeoM3jLFXE_eqvig',
      id: 'C8738753'),
];

List<Product> booksAndStuff = [
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'Rag books',
      thumbnail:
      'https://www.artsmendocino.org/wp-content/uploads/sites/www.artsmendocino.org/images/2018/12/event-featured-David-Steffen-1544478595.jpeg',
      id: 'S372873'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Pen holders',
      thumbnail:
      'https://i.pinimg.com/originals/d6/01/b5/d601b549b8e7a794b2efe3dff9c7039f.jpg',
      id: 'S843758'),
  Product(
      price: Price(currency: 'LKR', amount: 300),
      name: 'Simple pen holder',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0c03lV6wo-Rj00qqVwY9orM58j4wvE8e_n0XScn5c0zZYOOLqQ',
      id: 'S8738753'),
];

List<Product> creativeStationaryShop = [
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'Stackable storage',
      thumbnail:
      'https://i.pinimg.com/originals/d6/01/b5/d601b549b8e7a794b2efe3dff9c7039f.jpg',
      id: 'S372873'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Pen holders',
      thumbnail:
      'https://i.pinimg.com/originals/d6/01/b5/d601b549b8e7a794b2efe3dff9c7039f.jpg',
      id: 'S843758'),
  Product(
      price: Price(currency: 'LKR', amount: 300),
      name: 'Simple pen holder',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH0c03lV6wo-Rj00qqVwY9orM58j4wvE8e_n0XScn5c0zZYOOLqQ',
      id: 'S8738753'),
];

List<Product> giftsInc = [
  Product(
      price: Price(currency: 'LKR', amount: 300),
      name: 'Hand-made gift boxes',
      thumbnail:
      'https://cdn-image.travelandleisure.com/sites/default/files/styles/1600x1000/public/gifts.jpg?itok=fAimw_Cd',
      id: 'G372873'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Hand-made Note books',
      thumbnail:
      'https://cdn.notonthehighstreet.com/fs/cd/28/47dd-856d-4ca3-b85b-d7c5a70b1e85/original_notebook-gift-set.jpg',
      id: 'G843758'),
  Product(
      price: Price(currency: 'LKR', amount: 1200),
      name: 'Custom engraved pens',
      thumbnail:
      'https://www.papierplume.com/pub/media/wysiwyg/texter3.jpg',
      id: 'G8738753'),
];

List<Product> johnGiftIdeas = [
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'Unisex gift sets',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTb-bhl0SILE11cET-WrwoSHaQPxHrEK_G_RIWzuJXnuDMwf1uUqg',
      id: 'G372873'),
  Product(
      price: Price(currency: 'LKR', amount: 1500),
      name: 'Chocolate box',
      thumbnail:
      'https://bateel.com/media/catalog/product/cache/b4e73b990302829110737f82b8732bab/o/a/oak_square_family_1.jpg',
      id: 'G843758'),
  Product(
      price: Price(currency: 'LKR', amount: 1200),
      name: 'Custom made pens',
      thumbnail:
      'https://www.papierplume.com/pub/media/wysiwyg/texter3.jpg',
      id: 'G8738753'),
];

List<Product> plantShop = [
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'Banana Dwarf',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN0rsfTgtt6mlq4MxGtmRMrbrzQjd9aBYdYbqwq-84DEAAKkqa',
      id: 'P372873'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Aloe vera gift',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeRoJcU5-LVzCjJcmcL3KrWTgJya8p0ahrXsR9z4ph4oNwlg25',
      id: 'P843758'),
  Product(
      price: Price(currency: 'LKR', amount: 300),
      name: 'Rose plant seeds(100g)',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlWMlrXcHoUJpg5ppA1FSrfo2odvWrcY-3P_JJWriGb_wZW-0p',
      id: 'P8738753'),
];
List<Product> sunflowerShop = [
  Product(
      price: Price(currency: 'LKR', amount: 500),
      name: 'Sunflower Seeds',
      thumbnail:
      'https://sc01.alicdn.com/kf/UTB8xpzXrwQydeJk43PUq6AyQpXaS/1st-Grade-and-Premium-Grade-Sunflower-Seed.jpg_350x350.jpg',
      id: 'P372873'),
  Product(
      price: Price(currency: 'LKR', amount: 1200),
      name: 'Sunflower Oil',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRU5CXiLGgio8sNAiJrNqE1NHxjQSNaIAqSbwoWWFwi42ZKjFcK',
      id: 'P843758'),
  Product(
      price: Price(currency: 'LKR', amount: 1400),
      name: 'Refined sunflower oil',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9h0N7eChg6MdUOsJpmeC4Tub2aCmSnr3LeUPR2f735Ou-ktb-',
      id: 'P8738753'),
];

List<Product> theGalleryShop = [
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'One Line Art',
      thumbnail:
      'https://ctl.s6img.com/society6/img/67zSdUadQKnrP94znTAjwDtWFnE/w_700/prints/~artwork/s6-original-art-uploads/society6/uploads/misc/b88cbe7302e84f1ca93791e9117608b3/~~/animals-collection-tiger-one-line-art-prints.jpg',
      id: 'K000002'),
  Product(
      price: Price(currency: 'LKR', amount: 1200),
      name: 'One Line Couple',
      thumbnail:
      'https://png.pngtree.com/png-vector/20190722/ourlarge/pngtree-dancing-people-one-line-drawing-minimalism-png-image_1546914.jpg',
      id: 'K00003453'),
  Product(
      price: Price(currency: 'LKR', amount: 1400),
      name: 'One Line Roses',
      thumbnail:
      'https://ak4.picdn.net/shutterstock/videos/1019966674/thumb/4.jpg',
      id: 'K000032343'),
];

List<Product> artsAndCrafts = [
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'Flower oil painting',
      thumbnail:
      'https://i.etsystatic.com/8903847/r/il/29a213/779137727/il_570xN.779137727_btz8.jpg',
      id: 'D985933'),
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'Lotus Oil painting',
      thumbnail:
      'https://i.pinimg.com/originals/2d/be/46/2dbe4667cc13e17560e7ebe40582dc9d.jpg',
      id: 'D834875'),
  Product(
      price: Price(currency: 'LKR', amount: 1000),
      name: 'Lips Oil painting',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMisc-C9zodbEzquDSRSLslOuj7ioKSJtMy0JIEpKKf9_Xez9teg',
      id: 'D298239'),
];

List<Product> sweetsList = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Gulab Jamun',
      thumbnail:
      'https://images-na.ssl-images-amazon.com/images/I/81zWg1w1uVL._SL1500_.jpg',
      id: 'K000002'),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Gummy Strings',
      thumbnail:
      'https://images-na.ssl-images-amazon.com/images/I/9187CTI60wL._SX385_.jpg',
      id: 'K2342347'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Skittle',
      thumbnail:'http://cdn.shopify.com/s/files/1/1002/6470/articles/American_Candy_vs_British_Sweets_0e38d923-039a-48a4-b498-a8d152b46bde_600x.jpg?v=1453912986',
      id: 'K1234567'),
  Product(
      price: Price(currency: 'LKR', amount: 800),
      name: 'Marbles',
      id: 'K239444',
      thumbnail:
      'https://images-na.ssl-images-amazon.com/images/I/71cM0JmxvZL._SX425_.jpg'),

  Product(
      price: Price(currency: 'LKR', amount: 900),
      name: 'Licorice',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDXPohYW1dj_-SLIjmIyMDir4L2rTVbaFA2wu1GsXkwgUNTXUg',
      id: 'K1234567'),
];

List<Product> caramelList = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Caramel cup',
      thumbnail:
      'https://i2.wp.com/www.livewellbakeoften.com/wp-content/uploads/2015/09/Homemade-Salted-Caramel-Sauce-1-4.jpg?fit=1360%2C1360&ssl=1',
      id: 'K0000034'),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Gummy Caramel',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA9yK6tF-1Ah8eBQ6GZyd6frr57hFuZWQQIXOTV6CLlZwwqhVHQA',
      id: 'K2342347'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Caramel Pie',
      thumbnail:'https://d1doqjmisr497k.cloudfront.net/-/media/mccormick-us/recipes/mccormick/n/800/no-bake-salted-caramel-pie.jpg',
      id: 'K1234567'),
  Product(
      price: Price(currency: 'LKR', amount: 800),
      name: 'ButterScotch cup',
      id: 'K239444',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTziugPRBvHD3kQrHZuzUU34sE0yhbtAfeC_7f-ZT_DhDaLznu7-Q'),

  Product(
      price: Price(currency: 'LKR', amount: 900),
      name: 'Caramel Chocolate cups',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOMa7qw05vb9rc6RDiSeqbMeBe9fBgv_SaeeY8M_UtRi7rhWKT',
      id: 'K1234567'),
];

List<Product> browniesList = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Classic Brownies',
      thumbnail:
      'https://www.averiecooks.com/wp-content/uploads/2019/04/boyfriendbrownies-6.jpg',
      id: 'K0000034'),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Fudgy Brownies',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM3qZH5cphRCna9HvsrpRdg9ouvbmUgKU-jESJz32SeNH_crW5hQ',
      id: 'K2342347'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'M&M Brownies',
      thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXbQsMMg5uTH4Ms4wuq6uYk2XTkv2AknrEFthfvzjCI3qMevMK',
      id: 'K1234567'),
];

List<Product> IndianList = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Sweet String',
      thumbnail:
      'https://video-images.vice.com/_uncategorized/1497301097709-DSC_0979.jpeg',
      id: 'K0000034'),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Indian Sweet Platter',
      thumbnail:
      'https://www.hindustantimes.com/rf/image_size_640x362/HT/p2/2015/11/10/Pictures/_8311bdee-878c-11e5-9788-42b4b9d38c49.jpg',
      id: 'K2342347'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'M&M Brownies',
      thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKzlS89K5Vbh6uDTlheh6ZY3KzeTEGluDB45J3nxHabRB0hd2hDg',
      id: 'K1234567'),
];

List<Product> MeatList = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Potato Kievs',
      thumbnail:
      'https://media-cdn.tripadvisor.com/media/photo-s/11/83/98/56/potato-kieves.jpg',
      id: 'K0000034'),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Fried chicken Stack',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRk8GOinnRiaupMliBYdBiFuFbvljxZ55riDFcxfVTMLA5eI958',
      id: 'K2342347'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'M&M Brownies',
      thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxbOHpfPNsXAxOvXzq8dHH0vdgakrftxxL6byfVMLtGLVQTZFRmA',
      id: 'K1234567'),
];


List<Product> trendingProductItemDashboard = [
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Curry bowl',
      business: 'Dons chicken',
      thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxbOHpfPNsXAxOvXzq8dHH0vdgakrftxxL6byfVMLtGLVQTZFRmA',
      id: 'K1234567'),
  Product(
      price: Price(currency: 'LKR', amount: 500),
      name: 'Skittle',
      business: 'Surand\'s Sweet foods',
      thumbnail:'http://cdn.shopify.com/s/files/1/1002/6470/articles/American_Candy_vs_British_Sweets_0e38d923-039a-48a4-b498-a8d152b46bde_600x.jpg?v=1453912986',
      id: 'K1234567'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'Aloe vera gift',
      business: 'Plants and Seeds',
      thumbnail:
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeRoJcU5-LVzCjJcmcL3KrWTgJya8p0ahrXsR9z4ph4oNwlg25',
      id: 'P843758'),
];


List<Shop> featuredDashboardShops = [
  Shop(
    businessName: 'Surand\'s Sweet foods',
    category: 'Sweets',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'The Gallery shop',
    category: 'Artwork',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Plants and Seeds',
    category: 'Plants',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Bombae Sweets',
    category: 'Sweets',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Plants and Seeds',
    category: 'Plants',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Bombae Sweets',
    category: 'Sweets',
    paymentMethod: "Cash/Card",
  ),
];