import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class Product {
  final int id, category_id,brand_id;
  final String title,description;
  final List<String> images;
  final List<Color> colors;
  final double rating;
  final bool isFavourite, isPopular;


  Product({
    required this.id,
    required this.images,
    required this.colors,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
     this.category_id=0,
     this.brand_id=0,
    required this.description,
  });
}


final String baseurl = "http://127.0.0.1:8000";
//List<Products> products=[];





// Our demo Products

List<Product> demoProducts = [
 /*Product(
    id: 1,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/51ox3l9OzDL.__AC_SY300_SX300_QL70_ML2_.jpg",
      // "assets/images/ps4_console_white_2.png",
      // "assets/images/ps4_console_white_3.png",
      // "assets/images/ps4_console_white_4.png",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Samsung Galaxy Note 20 Ultra, Snapdragon 865 Plus, Dual SIM, 6.9 Inch, 256 GB, 12 GB RAM, 5G, Mystic Bronze",
    description: "6.9-inch Infinity-O display with Dynamic AMOLED technology guarantees detailed images with true-to-life colours.108MP main camera captures every detail of your face in ultra-high resolution.Powerful chipset and bluetooth 5.1, A2DP, LE, aptX accounts for seamless multitasking.High capacity battery (4500mAh) powers the device for prolonged hours on a single charge.The S Pen (INCLUDED) with Bluetooth functionality, that lets you write, draw and control many important features using intuitive gestures",
    rating: 4.3,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "https://m.media-amazon.com/images/I/41musAj0m+S._AC_SY300_SX300_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Samsung Galaxy A32 Dual SIM - 6.4 Inches, 6GB RAM, 128GB, 4G LTE - Awesome Blackt",
    description: "64MP main camera captures every detail of your face in ultra-high resolution.Powerful chipset accounts for seamless multitasking.Furnished with a generously sized display for enhanced viewing.High capacity battery powers the device for prolonged hours on a single charge.Thin, lightweight body fits easily in the palm of your hand",
    rating: 4.3,
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/61jLiCovxVL.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "New Apple iPhone 13 Pro with Facetime (128GB) - Sierra Blue",
    description: "Macro Photography - With its redesigned lens and powerful autofocus system, the new Ultra-Wide camera can focus at just 2 cm ? making even the smallest details seem epic. Transform a leaf into abstract art. Capture a caterpillar?s fuzz. Magnify a dewdrop. The beauty of tiny awaits.iPhone 13 Pro was made for low light. The Wide camera adds a wider aperture and our largest sensor yet ? and it leverages the LiDAR Scanner for Night mode portraits. Ultra-Wide gets a wider aperture, a faster sensor, and all-new autofocus. And Telephoto now has Night mode..The new Super Retina XDR display with ProMotion can refresh from 10 to 120 times per second, and all kinds of frame rates in between. It intelligently ramps up when you need exceptional graphics performance, and ramps down to save power when you don?t. It even accelerates and decelerates naturally to match the speed of your finger as you scroll. You?ve never felt anything like it.The display?s ability to refresh up to 120Hz ? combined with the amazing graphics performance of the new 5-core GPU on A15 Bionic ? makes iPhone 13 Pro perfect for power gamers..Facetime is available on the product & would be accessible in regions where facetime is permitted by telecom operators",
    rating: 4.2,
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/71mIwMb0b9S.__AC_SY300_SX300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "LG 43 inches UHD 4K Smart TV, Active HDR, WebOS Operating System, ThinQ AI - 43UP7550PVG",
    description: "Fast, accurate quad-core processor eliminates noise and creates more vibrant colors and contrasts.Enjoy rich, perfect and multi-dimensional sound thanks to the built-in speaker in the TV for sound from all angles.Brilliant screen that provides an amazing viewing experience and an ultra-clear picture.Diffuses the light uniformly and reduces light leakage, for a great viewing experience from different angles.Features 20w sound output power, 220-240v voltage and frequency 50-60Hz",
    rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),Product(
    id: 5,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/71MHTD3uL4L.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Apple iPhone 12 Pro Max 128GB Blue",
    description: "5G transforms iPhone with accelerated wireless speeds and better performance on congested networks.12mp main camera captures every detail in ultra-high resolution.Clocked with premium a14 bionic processor that ensures reliable performance.Fueled by a powerful 3687 mAh battery that facilitates prolonged hours of user life.Facetime is available on the product & would be accessible in regions where facetime is permitted by telecom operators",
    rating: 3.9,
    isFavourite: true,
    isPopular: true,
  ),Product(
    id: 6,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/71cSV-RTBSL.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
    title: "Apple iPhone 12 Pro with Facetime - 256GB, 5G, Gold - Middle East Version",
    description: "5G transforms iPhone with accelerated wireless speeds and better performance on congested networks.12mp main camera captures every detail in ultra-high resolution.Clocked with premium a14 bionic processor that ensures reliable performance.Fueled by a powerful 3687 mAh battery that facilitates prolonged hours of user life.Facetime is available on the product & would be accessible in regions where facetime is permitted by telecom operators",
    rating: 3.9,
    isFavourite: true,
    isPopular: true,
  ),*/Product(
    id: 1,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/81A3nwwKt2S.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 4.2,

      title: "Samsung Galaxy A12 Dual SIM Mobile - 6.5 Inch, 128 GB, 4 GB RAM, 4G LTE - Black",
      description: "48MP main camera captures every detail of your face in ultra-high resolution.Powerful chipset accounts for seamless multitasking.Furnished with a generously sized display for enhanced viewing.High capacity battery powers the device for prolonged hours on a single charge.Thin, lightweight body fits easily in the palm of your hand",
      category_id: 1,
      brand_id: 1

  ),Product(
    id: 2,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/51ox3l9OzDL.__AC_SY300_SX300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 4.3,
      title: "Samsung Galaxy Note 20 Ultra, Snapdragon 865 Plus, Dual SIM, 6.9 Inch, 256 GB, 12 GB RAM, 5G, Mystic Bronze",
      description: "6.9-inch Infinity-O display with Dynamic AMOLED technology guarantees detailed images with true-to-life colours.108MP main camera captures every detail of your face in ultra-high resolution.Powerful chipset and bluetooth 5.1, A2DP, LE, aptX accounts for seamless multitasking.High capacity battery (4500mAh) powers the device for prolonged hours on a single charge.The S Pen (INCLUDED) with Bluetooth functionality, that lets you write, draw and control many important features using intuitive gestures",
      category_id: 1,
      brand_id: 1

  ),Product(
    id: 3,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/61qcH1P2XjS.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 3.4,
      title: "Samsung Galaxy S21 Ultra Dual SIM Mobile - 6.8 Inches, 256 GB, 12 GB RAM, 5G - Black",
      description: "Take Epic Photography: Capture the never-been-seen before with two 10MP telephoto cameras, a 12MP ultra wide, 108MP wide (incl. Laser ToF Lense), and a 40MP front camera. It's a massive leap for mobile photography..Infinity-O Dynamic AMOLED 2x Display: Content comes alive on the HDR10+ certified 6.8-inch screen. Complementing it is a 120Hz refresh rate, so that you get incredibly smooth scrolling and gaming.S Pen: Get the function and versatility of the S Pen on your Galaxy S21 Ultra. Change the way you edit and fine-tune, on the fly.12GB of RAM and 256GB of ROM: Thanks to a powerful processor with built-in advanced AI and more-than-generous amounts of RAM, it's performance beyond anything we've done before.5000mAh Battery with Fast Charging: All the fuel in minutes ? shareable and available wirelessly. It doesn't stop there ? they are intelligent, analyzing your usage patterns to save more power, giving you more charge",
      category_id: 1,
      brand_id: 1
  ),Product(
    id: 4,
    images: [
      "https://m.media-amazon.com/images/I/41musAj0m+S._AC_SY300_SX300_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 4.3,
      title: "Samsung Galaxy A32 Dual SIM - 6.4 Inches, 6GB RAM, 128GB, 4G LTE - Awesome Black",
      description: "64MP main camera captures every detail of your face in ultra-high resolution.Powerful chipset accounts for seamless multitasking.Furnished with a generously sized display for enhanced viewing.High capacity battery powers the device for prolonged hours on a single charge.Thin, lightweight body fits easily in the palm of your hand",
      category_id: 1,
      brand_id: 1
  ),Product(
    id: 5,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/61jLiCovxVL.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 4.1,
      title: "New Apple iPhone 13 Pro with Facetime (128GB) - Sierra Blue",
      description: "Macro Photography - With its redesigned lens and powerful autofocus system, the new Ultra-Wide camera can focus at just 2 cm ? making even the smallest details seem epic. Transform a leaf into abstract art. Capture a caterpillar?s fuzz. Magnify a dewdrop. The beauty of tiny awaits.iPhone 13 Pro was made for low light. The Wide camera adds a wider aperture and our largest sensor yet ? and it leverages the LiDAR Scanner for Night mode portraits. Ultra-Wide gets a wider aperture, a faster sensor, and all-new autofocus. And Telephoto now has Night mode..The new Super Retina XDR display with ProMotion can refresh from 10 to 120 times per second, and all kinds of frame rates in between. It intelligently ramps up when you need exceptional graphics performance, and ramps down to save power when you don?t. It even accelerates and decelerates naturally to match the speed of your finger as you scroll. You?ve never felt anything like it.The display?s ability to refresh up to 120Hz ? combined with the amazing graphics performance of the new 5-core GPU on A15 Bionic ? makes iPhone 13 Pro perfect for power gamers..Facetime is available on the product & would be accessible in regions where facetime is permitted by telecom operators",
      category_id: 1,
      brand_id: 2
  ),Product(
    id: 6,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/618bG-1RJdL.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 4.5,
      title: "Samsung 43 Inch 4K UHD Smart LED TV with Built-in Receiver and Remote Control, Black - UA43AU7000UXEG",
      description: "Immerse yourself in the picture with one billion shades of color.Powerful 4K upscaling ensures you get up to 4K resolution for the content you love.High dynamic range increases the range of light levels on your TV so you can enjoy an enormous spectrum of colors and all the visual details, in even the darkest scenes.Dynamic crystal color delivers lifelike variations so you can see every subtlety.You'll also experience more lifelike color expressions due to its sophisticated color mapping technology.A sleek and elegant design that draws you to the purest picture.Keep your cables tidy and conceal them, reducing clutter and keeping a seamless look for your TV",
      category_id: 2,
      brand_id: 1
  ),Product(
    id: 7,
    images: [
     "https://images-na.ssl-images-amazon.com/images/I/71mIwMb0b9S.__AC_SY300_SX300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 4.2,
      title: "LG 43 inches UHD 4K Smart TV, Active HDR, WebOS Operating System, ThinQ AI - 43UP7550PVG",
      description: "Fast, accurate quad-core processor eliminates noise and creates more vibrant colors and contrasts.Enjoy rich, perfect and multi-dimensional sound thanks to the built-in speaker in the TV for sound from all angles.Brilliant screen that provides an amazing viewing experience and an ultra-clear picture.Diffuses the light uniformly and reduces light leakage, for a great viewing experience from different angles.Features 20w sound output power, 220-240v voltage and frequency 50-60Hz",
      category_id: 2,
      brand_id: 3
  ),Product(
    id: 8,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/71MHTD3uL4L.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 3.9,
      title: "Apple iPhone 12 Pro Max 128GB Blue",
      description: "5G transforms iPhone with accelerated wireless speeds and better performance on congested networks.12mp main camera captures every detail in ultra-high resolution.Clocked with premium a14 bionic processor that ensures reliable performance.Fueled by a powerful 3687 mAh battery that facilitates prolonged hours of user life.Facetime is available on the product & would be accessible in regions where facetime is permitted by telecom operators",
      category_id: 1,
      brand_id: 2
  ),Product(
    id: 9,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/71ZOtNdaZCL.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 3.7,
    title: "Apple iPhone?12 128GB 4 GB RAM, Blue",
    description: "The power of A14?Bionic brings the latest AR experiences to life. Explore ancient relics, dissect a frog ? even try out a new couch with AR?Quick?Look..Sound moves around you in 3D space, so you feel like you?re inside the?action..Both the Wide and Ultra Wide cameras now have Night mode ? and it?s better than ever at capturing incredible low-light shots. The new Wide camera brings in 27 percent more light. So whether you take photos by day or by moonlight, you?ll get a level of detail and color that wasn?t possible before..Dual SIM: 1 Physical SIM, 1 e-SIM.Facetime is available on the product & would be accessible in regions where facetime is permitted by telecom operators",
    category_id: 1,
    brand_id: 2

  ),Product(
    id: 10,
    images: [
      "https://images-na.ssl-images-amazon.com/images/I/71cSV-RTBSL.__AC_SX300_SY300_QL70_ML2_.jpg",
    ],
    colors: [
      Color(0xFFF6625E),
      Color(0xFF836DB8),
      Color(0xFFDECB9C),
      Colors.white,
    ],
      rating: 3.9,
      title: "Apple iPhone 12 Pro with Facetime - 256GB, 5G, Gold - Middle East Version",
      description: "5G transforms iPhone with accelerated wireless speeds and better performance on congested networks.12mp main camera captures every detail in ultra-high resolution.Clocked with premium a14 bionic processor that ensures reliable performance.Fueled by a powerful 3687 mAh battery that facilitates prolonged hours of user life.Facetime is available on the product & would be accessible in regions where facetime is permitted by telecom operators",
      category_id: 1,
      brand_id: 2
  ),
  Product(
      id: 11,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/71bCvQo69XS.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.3,
      title: "HP 255 G7 Laptop - Ryzen 5 3500U, 8 GB RAM, 1 TB HDD, Radeon Graphics, 15.6-Inch HD, DOS - Sliver",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 4,
      brand_id: 4
  ),Product(
      id: 12,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/41wHdNChKWL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3,
      title: "Lenovo V15-IIL 82C500T6ED laptop, intel 10th Gen core i3-1005G1, 4 GB RAM, 1 TB HDD, Integrated Intel UHD Graphics card, 15.6",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 4,
      brand_id: 6
  ),Product(
      id: 13,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/91zKmiPmArS.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 2.4,
      title: "Dell Vostro 3500 laptop - 11th Intel core i7-1165G7, 8GB RAM, 1TB HDD, Nvidia GeForce MX330 GDDR5 Graphics, 15.6 Inch FHD, Ub",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 4,
      brand_id: 5
  ),Product(
      id: 14,
      images: [
        "https://m.media-amazon.com/images/I/41GB8pP0v+L._AC_SX300_SY300_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.8,
      title: "Xiaomi Mi Box S with 4K HDR Android TV Streaming Media Player Google Assistant Remote Official International Version - BLACK",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 7
  ),Product(
      id: 15,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/51ZGK7KUA4L.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.7,
      title: "Xiaomi 11 Lite 5G NE Dual SIM - 6.55 inches, 128GB ,8 GB RAM, 5G, Bubblegum Blue",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 7
  ),Product(
      id: 16,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61hj2b6hVJL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating:  3.7,
      title: "Xiaomi Redmi Note 11,90 Hz Amoled Pioneer, 64 GB, 4GB RAM, Graphite Gray",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 7
  ),Product(
      id: 17,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/613duVZu6CL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4,
      title: "Xiaomi Redmi Buds 3 Pro Wireless Smart Earbuds with Noise Cancelation, Dual-device connectivity, Wireless charging, 28h long ",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 3,
      brand_id: 7
  ),Product(
      id: 18,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61qyi9y2iHS.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4,
      title: "Xiaomi Mi Home Security Camera 360? 1080p",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 5,
      brand_id: 7
  ),Product(
      id: 19,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/41F7qu-NKdL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 2.7,
      title: "Xiaomi Redmi 9A Dual SIM Mobile Phone, 13 MP Camera, 6.53 Inch Touch Screen, 2 GB RAM, 32 GB, 4G LTE - Granite Grey",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 7
  ),Product(
      id: 20,
      images: [
        "https://m.media-amazon.com/images/I/61bfjW+Tv5L._AC_SY300_SX300_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.6,
      title: "Xiaomi 11 Lite5G NE Dual SIM - 6.55 inches,128 GB ,8GB RAM ,5G, Truffle Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 7
  ),Product(
      id: 21,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/31PgnGI1ijL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.1,
      title: "Xiaomi Mi Portable Photo Printer - White",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 7
  ),Product(
      id: 22,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61UZ41QdbCL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 2.9,
      title: "Xiaomi Mi Smart Band 5 - Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 7
  ),Product(
      id: 23,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/51-Fn41CwkL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4,
      title: "Xiaomi Mi Desktop Full HD Monitor 1C, BHR4510GL, 23.8 inch, 60 Hz - Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 7
  ),Product(
      id: 24,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/31O5el1GeUL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.4,
      title: "Xiaomi Mi VXN4304GL Fast Charging Power Bank 20000mAh 18W - Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 7
  ),Product(
      id: 25,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61mH1EqCUBL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.4,
      title: "SONY HEADPH MDR-ZX110AP WHT",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 3,
      brand_id: 8
  ),Product(
      id: 26,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/71baSkSQPlL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.1,
      title: "Sony WI-C310 Wireless Headphone - Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 3,
      brand_id: 8
  ),Product(
      id: 27,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/7160xoKFtgL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.1,
      title: "Sony 1000XM4 Wireless Bluetooth Noise Cancellation Headphone with Microphone - Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 3,
      brand_id: 8
  ),Product(
      id: 28,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/41PUEGmrArS.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.1,
      title: "Sony PlayStation Gold Wireless Headset For PS4 - Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 3,
      brand_id: 8
  ),Product(
      id: 29,
      images: [
        "https://m.media-amazon.com/images/I/81l5ByqXQ+L._AC_SX300_SY300_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.9,
      title: "Canon EOS 800D EF-S 18-55mm F4-5.6 IS STM lens - 24.2 MP DSLR Camera Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 5,
      brand_id: 9
  ),Product(
      id: 30,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/71rEGALiLfL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4,
      title: "Canon EOS 4000D EF-S 18-55mm III Lens - Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 5,
      brand_id: 9
  ),Product(
      id: 31,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/91CdhsQNSXL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.1,
      title: "Canon?EOS 6D Mark II Body, 26.2 MP, DSLR Camera, Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 5,
      brand_id: 9
  ),Product(
      id: 32,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/510BMH39rFS.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.4,
      title: "EOS 4000D 18-55 III Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 9
  ),Product(
      id: 33,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/81Uk-SIJNwL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.5,
      title: "Canon i-Sensys MF3140 All-In-One Laser Printer",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 9
  ),Product(
      id: 34,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61yznqmstnL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.7,
      title: "Canon I-Sensys MF443dw 4-In-1 Mono Laser Printer - White",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 9
  ),Product(
      id: 35,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/51Q8Uq6RyfL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.7,
      title: "Canon EOS 5D Mark IV Body Only - 30.4MP, DSLR Camera, Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 5,
      brand_id: 9,
    isPopular: true
  ),Product(
      id: 36,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61zLXzN-lIL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.6,
      title: "Nike Swoosh Headband",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 10
  ),Product(
      id: 37,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/914dP4EuGOL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.6,
      title: "Microsoft xbox 360 controller for pc and Xbox 360, USB, Black",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 7,
      brand_id: 11
  ),Product(
      id: 38,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61FcADisrzL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 2.6,
      title: "Marvel Spiderman Video Game (PS4)",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 6,
      brand_id: 8
  ),Product(
      id: 39,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61IafpD5Y9S.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.3,
      title: "God Of War by Sony Region 2 - Playstation 4",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 6,
      brand_id: 8
  ),Product(
      id: 40,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/91dhTQmbXwL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 5,
      title: "The Witcher 3 Game of the year edition (PS4)",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 6,
      brand_id: 12,
      isPopular: true
  ),Product(
      id: 41,
      images: [
        "https://m.media-amazon.com/images/I/716o8AMc+sS._AC_SX342_SY445_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.5,
      title: "SONY PS5 GHOST OF TSUSHIMA DIRECTOR'S CUT- PS5, Black, 10GHOCU2",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 13
  ),Product(
      id: 42,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/21bn7AjfSnS.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.7,
      title: "Apple Pencil (2nd Generation) White - MU8F2",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 2
  ),Product(
      id: 43,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/21poabjmBdL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 5,
      title: "Apple 20W USB-C Power Adapter - White",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 2,
    isPopular: true
  ),Product(
      id: 44,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/61i1itSp8lL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 2.4,
      title: "Apple Iphone XS With Facetime - 256 GB",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 2
  ),Product(
      id: 45,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/81sxRBhe2sS.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4,
      title: "2021 Apple iPad Pro (12.9-inch, Wi-Fi + Cellular, 2TB) - Space Grey (5th Generation)",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 2
  ),Product(
      id: 46,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/815g8Uo656S.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.9,
      title: "Apple TV 4K (32GB)",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 1,
      brand_id: 2,
    isPopular: true
  ),Product(
      id: 47,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/51VUsJCYxUL.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 5,
      title: "Apple 85W MagSafe 2 Power Adapter for MacBook Pro with Retina display MD506",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 2,
    isPopular: true
  ),Product(
      id: 48,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/71ey-9D8yDL.__AC_SX300_SY300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 3.8,
      title: "New 2021 Apple iPad mini (8.3-inch, Wi-Fi, 64GB) - Space Grey (6th Generation)",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 9,
      brand_id: 2
  ),Product(
      id: 49,
      images: [
        "https://images-na.ssl-images-amazon.com/images/I/316okEZ4C9L.__AC_SY300_SX300_QL70_ML2_.jpg",
      ],
      colors: [
        Color(0xFFF6625E),
        Color(0xFF836DB8),
        Color(0xFFDECB9C),
        Colors.white,
      ],
      rating: 4.7,
      title: "Apple Magic Mouse 2 - White, MLA02",
      description: "AirPods deliver an unparalleled wireless headphone experience.Put them in your ears and they connect immediately, immersing you in rich, high-quality sound.They can sense when they?re in your ears and pause when you take them out.Talking to your favourite personal assistant is easier than ever.Optical sensors and motion accelerometers work together to automatically controlling the audio experience",
      category_id: 7,
      brand_id: 2,
    isPopular: true
  ),
];


const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
