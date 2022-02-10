-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2021 at 04:24 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digikala1400_v01`
--

-- --------------------------------------------------------

--
-- Table structure for table `ads_categories`
--

CREATE TABLE `ads_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads_categories`
--

INSERT INTO `ads_categories` (`id`, `img`, `category_id`, `title`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Ads/2021/11/06.jpg', '1', 'گوشی', '1', '2021-11-08 08:34:55', '2021-11-08 08:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `childCategory` int(11) DEFAULT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `title`, `childCategory`, `parent`, `status`, `position`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'مشخصات', 1, 0, '1', '1', NULL, '2021-11-08 07:57:38', '2021-11-08 07:57:38'),
(2, 'جنس', 1, 1, '1', '1', NULL, '2021-11-08 07:57:56', '2021-11-08 07:57:56'),
(3, 'سایر توضیحات', 1, 1, '1', '2', NULL, '2021-11-08 07:58:10', '2021-11-08 07:58:40'),
(4, 'سازگار با گوشی موبایل', 1, 1, '1', '3', NULL, '2021-11-08 07:59:17', '2021-11-08 07:59:17'),
(5, 'ساختار', 1, 1, '1', '4', NULL, '2021-11-08 07:59:31', '2021-11-08 07:59:31');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_values`
--

INSERT INTO `attribute_values` (`id`, `product_id`, `attribute_id`, `status`, `value`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '1', 'پلاستیک سخت , پلاستیک نرم , TPU , TPE , سیلیکون', NULL, '2021-11-08 08:22:18', '2021-11-08 08:22:18'),
(2, 1, 3, '1', 'دارای استاندارد نظامی سقوط از ارتفاع 3 متر برآمدگی 1 میلی متری برای پوشش بیشتر لنز دوربین قابلیت تبدیل شدن به استند استفاده به عنوان گیره نگه دارنده', NULL, '2021-11-08 08:22:29', '2021-11-08 08:22:29'),
(3, 1, 4, '1', 'Samsung Galaxy A51', NULL, '2021-11-08 08:22:40', '2021-11-08 08:22:40'),
(4, 1, 5, '1', 'مات', NULL, '2021-11-08 08:22:51', '2021-11-08 08:22:51');

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `img`, `title`, `link`, `created_at`, `updated_at`) VALUES
(1, 'banner/2021/11/a82aa0ceaa542b25727129bb43543f4315504976_1635935121.gif', 'پارتنرشیپ ایکس ویژن', 'پارتنرشیپ ایکس ویژن', '2021-11-03 11:17:21', '2021-11-03 11:17:21'),
(2, 'banner/2021/11/8700d9f42376253e86ed95a5a67bbebd8c53ed43_1630496382.jpg', 'فدیو', 'فدیو', '2021-11-03 11:17:49', '2021-11-03 11:17:49'),
(3, 'banner/2021/11/8700d9f42376253e86ed95a5a67bbebd8c53ed43_1630496382.jpg', '01', '01', '2021-11-03 11:17:59', '2021-11-03 11:17:59'),
(4, 'banner/2021/11/b8cd82dbd830f2b26ab3688573c2680f146436e2_1635336759.jpg', 'شاوما', 'شاوما', '2021-11-03 11:24:02', '2021-11-03 11:24:02'),
(5, 'banner/2021/11/cf3f6a58ca8a6c605adac4cf7bc776e56bf1f1fd_1635333196.jpg', 'پرسیل', 'پرسیل', '2021-11-03 11:24:11', '2021-11-03 11:24:11'),
(6, 'banner/2021/11/cf3f6a58ca8a6c605adac4cf7bc776e56bf1f1fd_1635333196.jpg', 'پرسیل2', 'پرسیل2', '2021-11-03 11:24:20', '2021-11-03 11:24:20'),
(7, 'banner/2021/11/b8cd82dbd830f2b26ab3688573c2680f146436e2_1635336759.jpg', 'شادوما2', 'شادوما2', '2021-11-03 11:24:33', '2021-11-03 11:24:33'),
(8, 'banner/2021/11/8efcf8d1dd4eb498a5b5ff4a6bfac3041fd30cce_1632943196.jpg', 'پرفروش', 'پرفروش', '2021-11-03 11:31:14', '2021-11-03 11:33:14'),
(9, 'banner/2021/11/c8d413e89101254647498b9bdf92198362e801f7_1635237949.jpg', 'آریان', 'آریان', '2021-11-03 11:31:28', '2021-11-03 11:33:31'),
(10, 'banner/2021/11/4733b740d15e74f00d50ac92fb126911632b8053_1599385682.jpg', 'هدیه', 'هدیه', '2021-11-03 11:31:38', '2021-11-03 11:31:38'),
(11, 'banner/2021/11/904db8a169ce8fdc6493e21b6948d3e32a19ae68_1626258276.jpg', 'فروشنده شوید', 'فروشنده شوید', '2021-11-03 11:31:51', '2021-11-03 11:31:51'),
(12, 'banner/2021/11/6242330641b83b4bb5a4c13ff85174b48b644432_1628323882.jpg', 'فروشنده', 'فروشنده', '2021-11-03 11:37:21', '2021-11-03 11:37:21'),
(13, 'banner/2021/11/956cd52f1f18f11284016c86561d53bcdcfdeedd_1612606849.jpg', 'بومی', 'بومی', '2021-11-03 11:37:32', '2021-11-03 11:37:32'),
(14, 'banner/2021/11/29af73c7416d511f4967eaf0ff9158c505bc4435_1635750551.gif', 'پوشاک', 'پوشاک', '2021-11-03 11:57:46', '2021-11-03 11:57:46'),
(15, 'banner/2021/11/fd3031810851d65d25e6e2ce30de0a1e579c0fb5_1635853202.jpg', 'گربه', 'گربه', '2021-11-03 11:57:58', '2021-11-03 11:57:58'),
(16, 'banner/2021/11/5730956a0350ae37d9bd1b8fa1263ae9471ab8d0_1635422958.jpg', 'سرم مو', 'سرم مو', '2021-11-03 12:00:35', '2021-11-03 12:00:35');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `parent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `img`, `description`, `status`, `parent`, `link`, `vip`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'کاسیو', 'brand/2021/11/8b82cf7dafe10ffd77362b84dcf0adb4cb02d625_1599290286.jpg', 'شرکت پارس آناهید رایان سیستم به عنوان تنها نماینده رسمی و انحصاری شرکت کاسیو ژاپن در ایران ، فعالیت خود را از سال 1396در راستای ارائه کالای اصل با کیفیت آغاز کرده است. ساعت اصل کاسیو در ایران فقط با ضمانت‌نامه پوزیترون ارائه می‌شود که توسط مرکز خدمات شرکت پارس ارائه و پشتیبانی می‌شود.', '1', '3', 'کاسیو', '1', NULL, '2021-11-08 08:01:42', '2021-11-08 08:30:54'),
(2, 'مون', 'brand/2021/11/335bfae28ad2d1dacbd27ce82a05af3e7123698a_1599290454.jpg', 'برندی برای همه خانم های ساده پوش ایرانی ست که به دنبال انتخاب و خرید سریعِ پوشاک و اکسسوری روزمره و بادوام هستند؛ MOUNsa همگام با سلیقه ایرانی و با فروش انحصاری در فضای آنلاین است که پوشاک و اکسسوری های Basic (روزمره خانگی/ مناسب بیرون) و ماندگار را براساس طراحی های جهانی تولید می کند.', '1', '3', 'مون', '1', NULL, '2021-11-08 08:02:26', '2021-11-08 08:30:53');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `name`, `description`, `body`, `icon`, `img`, `status`, `link`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'کالای دیجیتال', 'کالای دیجیتال', 'خرید انواع کالای دیجیتال از فروشگاه اینترنتی دیجی کالا ', 'عمر انقلاب دیجیتال به کمتر از نیم قرن می‌رسد، اما همین برهه‌ی زمانی کوتاه در تاریخ، زندگی نوع بشر را کاملا دگرگون کرده و شتاب قابل توجهی به پیشرفت انسان در زمینه‌های مختلف بخشیده است. شاید اولین قدم‌های دیجیتالی شدن دنیا را بتوان تغییر تراتزیستورهای آنالوگ به دیجیتال دانست که بستر لازم برای کالای دیجیتال نظیر کامپیوتر، تلفن را فراهم کرد. در حال حاضر محصولات دیجیتالی آنقدر توسعه یافته‌اند که می‌توان ردپای آنها را در ساده‌ترین امور روزمره مشاهده کرد. بعضی از این محصولات به ابزارهای جدانشدنی برای انسان تبدیل شده‌اند، تصور زندگی بدون آنها و امکاناتی که در اختیار انسان قرار می‌دهند، وجود ندارد. موبایل‌ها، لپ‌تاپ، ماشین‌های ادارای از این دسته محصولات هستند. کامپیوترهای شخصی، لپ‌تاپ و گوشی تلفن همراه نیز مسیر پر فراز و نشیبی را پشت سر گذاشته‌اند تا به شکل هوشمند امروزی عرضه شود. اولین کامپیوتر قابل حمل جهان در سال 1981 به بازار آمد. این دستگاه صفحه نمایشی 5 اینچی داشت و وزن آن حدود 11 کیلوگرم بود. در حالیکه شرکت‌هایی نظیر اپل یا هواوی لپ‌تاپ‌هایی به وزن یک کیلوگرم ساخته‌اند.  \n\nاولین تلفن همراه نیز در سال 1983 در دنیا به فروش رسید که وزنی معادل یک کیلوگرم داشت و امکانات بسیار کمی را در اختیار داشت. قیمت این دستگاه بیش از سه هزار دلار بود. در حالیکه امروزه شاهد تلفن‌های همراه هوشمندی هستیم که ده‌ها وسیله را در دل خود جای داده‌اند و هر یک از آنها عملکرد فوق‌العاده‌ای رو در اختیار انسان قرار می‌دهد. هم‌چنین محدوده‌ی قیمت این دستگاه بسیار گسترده است و همه‌ی افراد می‌توانند آن را تهیه کنند.  \n\nدنیای دیجیتال نه تنها زندگی بشر را راحت‌تر از قبل کرده و زمان بیشتری برای آنها خریده است بلکه وسایل و سرگرمی‌های پیشرفته‌تر و مهیج‌تری را هم فراهم کرده است. تاریخچه‌ی ساخت کنسول بازی نیز مشابه سایر دستگاه‌های دیجیتال است. این صنعت از سال 1972 شروع به کار کرد. اولین کنسول‌های بازی تصویری سیاه و سفید داشتند و محیط بازی آنها بسیار ساده بود. این صنعت با تولید کنسول بازی ایکس باکس در ابتدای قرن 21 ام به اوج خود رسید و دنیای سرگرمی و بازی را متحول کرد. این دستگاه بسیار پیشرفته بود و گرافیک عالی و بازی‌های با کیفیتی را در اختیار علاقمندان قرار می‌داد. کنسول‌های بازی تاکنون 8 نسل را پشت سر گذاشته‌اند. شرکت‌هایی نظیر سونی و مایکروسافت مطرح‌ترین برندهای تولید کننده‌ی کنسول بازی هستند و شرکت‌های متعدد دیگری مثل لاجیتک لوازم جانبی آنها را عرضه می‌کند.  \n\nکالاهای دیجیتال به موبایل، لپ تاپ یا وسایل سرگرمی محدود نمی‌شوند. مچ‌بند و ساعت‌های هوشمند از جدیدترین محصولات دیجیتالی به شمار می‌آیند که امکانات زیادی را در اختیار انسان قرار می‌دهد. عملکرد ساعت‌های هوشمند برند اپل آنقدر پیشرفته است که می‌توان آن را یک کامپیوتر مچی در نظر گرفت. شما می‌توانید با ای سیم، تماس‌های اضطراری بین‌المللی برقرار کنید، در وب جستجو کنید و جواب تماس و پیام‌های خود را بدهید. علاوه بر این، اغلب مچ‌بندها و ساعت‌های هوشمند ابزارهای لازم برای پایش سلامت را در اختیار دارند و به طور دائم ضربان قلب، کیفیت خواب، تعداد قدم‌های برداشته شده و ... را محاسبه و گزارش می‌کنند. همچنین در نسخه‌های پیشرفته‌تر می‌توان برنامه‌هایی برای بیماران دیابتی و بهداشت و سلامت بانوان مشاهده کرد. \n\nدیجی کالا جدیدترین و به روزترین کالاهای دیجیتال عرضه شده در دنیا را برای مشتریان خود گردآوری کرده است. شما می‌توانید خوشنام‌ترین برندهای جهانی را در وبسایت دیجی کالا مشاهده و محصول مورد نظر خود از میان هزاران کالای دیجیتال خریداری کنید. ', 'electronics', 'category/2021/11/07.jpg', '1', '/main/electronic-devices/', NULL, '2021-11-03 10:45:11', '2021-11-08 07:23:23'),
(2, 'خودرو، ابزار و تجهیزات صنعتی', 'خودرو، ابزار و تجهیزات صنعتی', NULL, NULL, 'tools', 'category/2021/11/02.jpg', '1', '/main/vehicles/', NULL, '2021-11-03 10:45:55', '2021-11-07 05:52:57'),
(3, 'مد و پوشاک', 'مد و پوشاک', NULL, NULL, 'fashion', 'category/2021/11/03.jpg', '1', '/main/apparel/', NULL, '2021-11-03 10:46:29', '2021-11-07 09:47:22'),
(4, 'اسباب بازی، کودک و نوزاد', 'اسباب بازی، کودک و نوزاد', NULL, NULL, 'mother-and-child', 'category/2021/11/04.jpg', '1', '/main/mother-and-child/', NULL, '2021-11-03 10:47:01', '2021-11-07 11:03:31');

-- --------------------------------------------------------

--
-- Table structure for table `category_indices`
--

CREATE TABLE `category_indices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_indices`
--

INSERT INTO `category_indices` (`id`, `title_id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1', '1', '1', '1', '2021-11-08 08:32:02', '2021-11-08 08:32:02'),
(2, '2', '1', '1', '1', '1', '1', '2021-11-08 08:32:14', '2021-11-08 08:32:14');

-- --------------------------------------------------------

--
-- Table structure for table `category_level4s`
--

CREATE TABLE `category_level4s` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_levels`
--

CREATE TABLE `category_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `childCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorylevel4_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `property` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `child_categories`
--

CREATE TABLE `child_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `parent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `child_categories`
--

INSERT INTO `child_categories` (`id`, `title`, `name`, `status`, `parent`, `img`, `link`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'کیف و کاور گوشی', 'category-cell-phone-pouch-cover', '1', '1', 'childcategory/2021/11/87d84dbcb987e673295a21518433426409b05f82_1617636459.jpg', '/search/category-cell-phone-pouch-cover/', NULL, '2021-11-03 10:52:06', '2021-11-08 07:31:29'),
(2, 'پاور بانک (شارژر همراه)', 'category-cell-phone-screen-guard', '1', '1', 'childcategory/2021/11/4c7c037ea75f736ca823a57019883b12b2e422de_1617124485.jpg', '/search/category-cell-phone-screen-guard/', NULL, '2021-11-03 10:52:31', '2021-11-08 07:32:20'),
(3, 'سامسونگ', 'سامسونگ', '1', '2', NULL, 'سامسونگ', NULL, '2021-11-03 10:52:54', '2021-11-03 10:52:54'),
(4, 'هوآوی', 'هوآوی', '1', '2', NULL, 'هوآوی', NULL, '2021-11-03 10:53:16', '2021-11-03 10:53:16'),
(5, 'اپل', 'اپل', '1', '2', NULL, 'اپل', NULL, '2021-11-03 13:05:26', '2021-11-03 13:05:26'),
(6, 'شیائومی', 'شیائومی', '1', '2', NULL, 'شیائومی', NULL, '2021-11-03 13:05:39', '2021-11-03 13:05:39'),
(7, 'آنر', 'آنر', '1', '2', NULL, 'آنر', NULL, '2021-11-03 13:05:55', '2021-11-03 13:05:55');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `name`, `value`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'قرمز', '#F44336', '1', NULL, '2021-11-08 08:03:49', '2021-11-08 08:03:49'),
(2, 'سرمه ای', '#002171', '1', NULL, '2021-11-08 08:04:12', '2021-11-08 08:04:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `footer_inner_boxes`
--

CREATE TABLE `footer_inner_boxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `top` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_inner_boxes`
--

INSERT INTO `footer_inner_boxes` (`id`, `page_id`, `top`, `created_at`, `updated_at`) VALUES
(1, '1', 1, '2021-11-03 17:01:57', '2021-11-03 17:01:57'),
(2, '2', 1, '2021-11-03 17:02:36', '2021-11-03 17:02:36'),
(3, '3', 1, '2021-11-03 17:02:39', '2021-11-03 17:02:39'),
(4, '4', 1, '2021-11-03 17:02:43', '2021-11-03 17:02:43'),
(5, '5', 1, '2021-11-03 17:02:50', '2021-11-03 17:02:50'),
(6, '28', 0, '2021-11-03 17:19:04', '2021-11-03 17:19:04'),
(7, '29', 0, '2021-11-03 17:19:11', '2021-11-03 17:19:11'),
(8, '30', 0, '2021-11-03 17:19:16', '2021-11-03 17:19:16'),
(9, '31', 0, '2021-11-03 17:19:18', '2021-11-03 17:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `footer_link_ones`
--

CREATE TABLE `footer_link_ones` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_link_ones`
--

INSERT INTO `footer_link_ones` (`id`, `page_id`, `created_at`, `updated_at`) VALUES
(1, '6', '2021-11-03 17:07:29', '2021-11-03 17:07:29'),
(2, '7', '2021-11-03 17:07:35', '2021-11-03 17:07:35'),
(3, '8', '2021-11-03 17:07:37', '2021-11-03 17:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `footer_link_threes`
--

CREATE TABLE `footer_link_threes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_link_threes`
--

INSERT INTO `footer_link_threes` (`id`, `page_id`, `created_at`, `updated_at`) VALUES
(1, '14', '2021-11-03 17:08:09', '2021-11-03 17:08:09'),
(2, '15', '2021-11-03 17:08:14', '2021-11-03 17:08:14'),
(3, '16', '2021-11-03 17:08:20', '2021-11-03 17:08:20'),
(4, '17', '2021-11-03 17:08:23', '2021-11-03 17:08:23'),
(5, '18', '2021-11-03 17:08:27', '2021-11-03 17:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `footer_link_titles`
--

CREATE TABLE `footer_link_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_link_titles`
--

INSERT INTO `footer_link_titles` (`id`, `page_id`, `created_at`, `updated_at`) VALUES
(1, '19', '2021-11-03 17:08:39', '2021-11-03 17:08:39'),
(2, '20', '2021-11-03 17:08:42', '2021-11-03 17:08:42'),
(3, '21', '2021-11-03 17:08:45', '2021-11-03 17:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `footer_link_twos`
--

CREATE TABLE `footer_link_twos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_link_twos`
--

INSERT INTO `footer_link_twos` (`id`, `page_id`, `created_at`, `updated_at`) VALUES
(1, '9', '2021-11-03 17:07:48', '2021-11-03 17:07:48'),
(2, '10', '2021-11-03 17:07:55', '2021-11-03 17:07:55'),
(3, '11', '2021-11-03 17:08:00', '2021-11-03 17:08:00'),
(4, '12', '2021-11-03 17:08:02', '2021-11-03 17:08:02'),
(5, '13', '2021-11-03 17:08:05', '2021-11-03 17:08:05');

-- --------------------------------------------------------

--
-- Table structure for table `footer_partners`
--

CREATE TABLE `footer_partners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_partners`
--

INSERT INTO `footer_partners` (`id`, `page_id`, `created_at`, `updated_at`) VALUES
(1, '22', '2021-11-03 17:16:26', '2021-11-03 17:16:26'),
(2, '23', '2021-11-03 17:16:30', '2021-11-03 17:16:30'),
(3, '24', '2021-11-03 17:16:32', '2021-11-03 17:16:32'),
(4, '25', '2021-11-03 17:16:34', '2021-11-03 17:16:34'),
(5, '26', '2021-11-03 17:16:38', '2021-11-03 17:16:38'),
(6, '27', '2021-11-03 17:16:40', '2021-11-03 17:16:40');

-- --------------------------------------------------------

--
-- Table structure for table `footer_titles`
--

CREATE TABLE `footer_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `footer_titles`
--

INSERT INTO `footer_titles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'فروشگاه اینترنتی دیجی‌کالا، بررسی، انتخاب و خرید آنلاین', '2021-11-03 12:59:48', '2021-11-03 12:59:48'),
(2, 'دیجی‌کالا به عنوان یکی از قدیمی‌ترین فروشگاه های اینترنتی با بیش از یک دهه تجربه، با پایبندی به سه اصل، پرداخت در محل، ۷ روز ضمانت بازگشت کالا و تضمین اصل‌بودن کالا موفق شده تا همگام با فروشگاه‌های معتبر جهان، به بزرگ‌ترین فروشگاه اینترنتی ایران تبدیل شود. به محض ورود به سایت دیجی‌کالا با دنیایی از کالا رو به رو می‌شوید! هر آنچه که نیاز دارید و به ذهن شما خطور می‌کند در اینجا پیدا خواهید کرد. حتی زمانی که بین خرید کالاها برای شخصی مردد هستید می‌توانید با خرید کارت هدیه دیجی کالا ، انتخاب را به سایرین بسپارید. این فروشگاه مثل یک ویترین پر زرق و برق است که با انواع و اقسام محصولاتی نظیر گوشی موبایل سامسونگ ، ساعت هوشمند اپل ، تلویزیون سامسونگ ، لپ تاپ و الترابوک ایسوس ، گوشی موبایل هواوی و همچنین محصولاتی که هر فرد در زندگی شخصی، تحصیلی و کاری خود به آنها احتیاج پیدا می‌کند، چیده شده است. اینجا مرجع متنوع‌ترین کالاهای مصرفی از گوشی موبایل موتورولا گرفته تا تبلت لنوو ، اتو پاناسونیک ، جارو شارژی بلک اند دکر ، کولر آبی آبسال ، اسپیکر (بلندگو) جی بی ال و حتی خرید لوازم جهیزیه می‌باشد. دیجی‌کالا همچنین یک بازار آنلاین برای خرید جدیدترین و ضروری‌ترین لوازم خانگی همانند سرخ کن فیلیپس ، یخچال و فریزر امرسان ، جاروبرقی پارس خزر ، آبمیوه گیری بوش ، سینمای خانگی و ساندبار سونی و انواع پخش کننده خانگی می‌باشد تا هر فرد بتواند مطابق با سلیقه شخصی خود، خانه رویاهایش را بسازد. حتی می‌توانید از مشهورترین برندهای داخلی و خارجی انواع مدل مانتو جدید ، لباس خواب زنانه ، پیراهن مردانه ، پیراهن و لباس مجلسی زنانه ، لباس بچه گانه ، شومیز زنانه و دخترانه و انواع لباس زیر مردانه را به صورت آنلاین با کمک راهنمای سایز خریداری کنید. این فروشگاه اینترنتی حتی برای سرگرمی کودکان هم خرید محصولاتی مانند عروسک ، مدل‌های اسباب بازی دخترانه و پسرانه و انواع لگو را فراهم کرده است. همچنین با سر زدن به محصولات آرایشی و بهداشتی زنانه و مردانه مانند عطر و ادکلن دیور ، لالیک ، جگوار ، گرلن اصل ، انواع دستگاه اصلاح موی صورت فیلیپس ، موزر ، پاناسونیک و حتی بهترین برندهای رنگ مو و ابرو می‌توانید تجربه‌ای جدید از خرید آنلاین کسب کنید. شما می توانید کلیه نیازهای خود را تنها با چند کلیک سفارش داده و در کمترین زمان ممکن درب منزل تحویل بگیرید.', '2021-11-03 13:00:12', '2021-11-03 13:00:12'),
(3, 'استفاده از مطالب فروشگاه اینترنتی دیجی‌کالا فقط برای مقاصد غیرتجاری و با ذکر منبع         بلامانع است. کلیه حقوق این سایت متعلق به شرکت نوآوران فن آوازه (فروشگاه آنلاین دیجی‌کالا) می‌باشد.', '2021-11-03 13:00:50', '2021-11-03 13:00:50'),
(4, 'از جدیدترین تخفیف‌ها باخبر شوید', '2021-11-03 13:01:31', '2021-11-03 13:01:31'),
(5, 'با ما همراه باشید', '2021-11-03 13:01:56', '2021-11-03 13:01:56'),
(6, 'هفت روز هفته، ۲۴ ساعت شبانه‌روز پاسخگوی شما هستیم.', '2021-11-03 13:02:18', '2021-11-03 13:02:18'),
(7, 'تلفن پشتیبانی: ۶۱۹۳۰۰۰۰ - ۰۲۱', '2021-11-03 13:02:41', '2021-11-03 13:02:41'),
(8, '۶۲۹۹۹۹۱۱ - ۰۲۱', '2021-11-03 13:02:52', '2021-11-03 13:02:52'),
(9, '1', '2021-11-03 13:05:58', '2021-11-03 13:05:58'),
(10, '2', '2021-11-03 13:06:02', '2021-11-03 13:06:02'),
(11, '3', '2021-11-03 13:06:03', '2021-11-03 13:06:03'),
(12, '4', '2021-11-03 13:06:05', '2021-11-03 13:06:05'),
(13, '5', '2021-11-03 13:06:06', '2021-11-03 13:06:06'),
(14, '6', '2021-11-03 13:06:07', '2021-11-03 13:06:07'),
(15, '7', '2021-11-03 13:06:08', '2021-11-03 13:06:08'),
(16, '<img style=\"cursor:pointer\" onclick=\"window.open(&quot;https://logo.samandehi.ir/Verify.aspx?id=28177&amp;p=uiwkmcsirfthjyoejyoe&quot;, &quot;Popup&quot;,&quot;toolbar=no, scrollbars=no, location=no, statusbar=no, menubar=no, resizable=0, width=450, height=630, top=30&quot;)\" alt=\"samandehi-logo\" src=\"https://www.digikala.com/static/files/6e2d6b38.png\">', '2021-11-03 13:06:11', '2021-11-03 13:13:37'),
(17, '<img src=\"https://www.digikala.com/static/files/236e437c.png\" alt=\"ecunion-logo\" onclick=\"window.open(\'https://www.ecunion.ir/verify/digikala.com?token=35858775acf0232a8063\', \'Popup\',\'toolbar=no, location=no, statusbar=no, menubar=no, scrollbars=1, resizable=0, width=580, height=600, top=30\')\" style=\"cursor:pointer\">', '2021-11-03 13:06:14', '2021-11-03 13:13:55'),
(18, '<img referrerpolicy=\"origin\" src=\"https://Trustseal.eNamad.ir/logo.aspx?id=19077&amp;Code=sScdOJOzhFxtcEqkjP7P\" alt=\"\" style=\"cursor:pointer\" id=\"sScdOJOzhFxtcEqkjP7P\">', '2021-11-03 13:14:28', '2021-11-03 13:14:28');

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `galleries`
--

INSERT INTO `galleries` (`id`, `img`, `product_id`, `status`, `position`, `created_at`, `updated_at`) VALUES
(1, 'gallery/2021/11/8/3fbb5db2e998aa0446817a9118d6262e80e52e0f_1617464379.jpg', '1', '1', '1', '2021-11-08 08:23:16', '2021-11-08 08:23:16'),
(2, 'gallery/2021/11/8/4351c0d5c201f4589562a618ddd8f49d022fadd7_1617464391.jpg', '1', '1', '2', '2021-11-08 08:23:36', '2021-11-08 08:23:36'),
(3, 'gallery/2021/11/8/aeb412c82a4ce0704f63db317846d7d800c5743e_1617464381.jpg', '1', '1', '3', '2021-11-08 08:23:47', '2021-11-08 08:23:47');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `actionType` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `url`, `actionType`, `created_at`, `updated_at`) VALUES
(1, '1', 'افزودن دسته-کالای دیجیتال', 'ایجاد', '2021-11-03 10:45:11', '2021-11-03 10:45:11'),
(2, '1', 'افزودن دسته-خودرو، ابزار و تجهیزات صنعتی', 'ایجاد', '2021-11-03 10:45:55', '2021-11-03 10:45:55'),
(3, '1', 'افزودن دسته-مد و پوشاک', 'ایجاد', '2021-11-03 10:46:29', '2021-11-03 10:46:29'),
(4, '1', 'افزودن دسته-اسباب بازی، کودک و نوزاد', 'ایجاد', '2021-11-03 10:47:01', '2021-11-03 10:47:01'),
(5, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-03 10:49:39', '2021-11-03 10:49:39'),
(6, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-03 10:50:05', '2021-11-03 10:50:05'),
(7, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-03 10:50:26', '2021-11-03 10:50:26'),
(8, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-03 10:50:48', '2021-11-03 10:50:48'),
(9, '1', 'افزودن دسته کودک-', 'ایجاد', '2021-11-03 10:52:06', '2021-11-03 10:52:06'),
(10, '1', 'افزودن دسته کودک-', 'ایجاد', '2021-11-03 10:52:31', '2021-11-03 10:52:31'),
(11, '1', 'افزودن دسته کودک-', 'ایجاد', '2021-11-03 10:52:54', '2021-11-03 10:52:54'),
(12, '1', 'افزودن دسته کودک-', 'ایجاد', '2021-11-03 10:53:16', '2021-11-03 10:53:16'),
(13, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:17:21', '2021-11-03 11:17:21'),
(14, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:17:49', '2021-11-03 11:17:49'),
(15, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:17:59', '2021-11-03 11:17:59'),
(16, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:24:02', '2021-11-03 11:24:02'),
(17, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:24:11', '2021-11-03 11:24:11'),
(18, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:24:20', '2021-11-03 11:24:20'),
(19, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:24:33', '2021-11-03 11:24:33'),
(20, '1', 'افزودن اسلایدر-', 'ایجاد', '2021-11-03 11:25:15', '2021-11-03 11:25:15'),
(21, '1', 'فعال کردن اسلایدر-01', 'فعال', '2021-11-03 11:25:18', '2021-11-03 11:25:18'),
(22, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:31:14', '2021-11-03 11:31:14'),
(23, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:31:28', '2021-11-03 11:31:28'),
(24, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:31:38', '2021-11-03 11:31:38'),
(25, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:31:51', '2021-11-03 11:31:51'),
(26, '1', 'آپدیت بنر-پرفروش', 'آپدیت', '2021-11-03 11:33:14', '2021-11-03 11:33:14'),
(27, '1', 'آپدیت بنر-آریان', 'آپدیت', '2021-11-03 11:33:31', '2021-11-03 11:33:31'),
(28, '1', 'افزودن عنوان دسته صفحه اصلی سایت-', 'ایجاد', '2021-11-03 11:35:44', '2021-11-03 11:35:44'),
(29, '1', 'افزودن عنوان دسته صفحه اصلی سایت-', 'ایجاد', '2021-11-03 11:36:37', '2021-11-03 11:36:37'),
(30, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:37:21', '2021-11-03 11:37:21'),
(31, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:37:32', '2021-11-03 11:37:32'),
(32, '1', 'افزودن عنوان دسته صفحه اصلی سایت-', 'ایجاد', '2021-11-03 11:53:42', '2021-11-03 11:53:42'),
(33, '1', 'افزودن عنوان دسته صفحه اصلی سایت-', 'ایجاد', '2021-11-03 11:54:52', '2021-11-03 11:54:52'),
(34, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:57:46', '2021-11-03 11:57:46'),
(35, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 11:57:58', '2021-11-03 11:57:58'),
(36, '1', 'افزودن عنوان دسته صفحه اصلی سایت-', 'ایجاد', '2021-11-03 11:58:42', '2021-11-03 11:58:42'),
(37, '1', 'افزودن عنوان دسته صفحه اصلی سایت-', 'ایجاد', '2021-11-03 11:59:17', '2021-11-03 11:59:17'),
(38, '1', 'افزودن بنر-', 'ایجاد', '2021-11-03 12:00:35', '2021-11-03 12:00:35'),
(39, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 12:59:48', '2021-11-03 12:59:48'),
(40, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:00:12', '2021-11-03 13:00:12'),
(41, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:00:50', '2021-11-03 13:00:50'),
(42, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:01:31', '2021-11-03 13:01:31'),
(43, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:01:56', '2021-11-03 13:01:56'),
(44, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:02:18', '2021-11-03 13:02:18'),
(45, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:02:41', '2021-11-03 13:02:41'),
(46, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:02:52', '2021-11-03 13:02:52'),
(47, '1', 'افزودن دسته کودک-', 'ایجاد', '2021-11-03 13:05:26', '2021-11-03 13:05:26'),
(48, '1', 'افزودن دسته کودک-', 'ایجاد', '2021-11-03 13:05:39', '2021-11-03 13:05:39'),
(49, '1', 'افزودن دسته کودک-', 'ایجاد', '2021-11-03 13:05:55', '2021-11-03 13:05:55'),
(50, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:05:58', '2021-11-03 13:05:58'),
(51, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:02', '2021-11-03 13:06:02'),
(52, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:03', '2021-11-03 13:06:03'),
(53, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:05', '2021-11-03 13:06:05'),
(54, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:06', '2021-11-03 13:06:06'),
(55, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:07', '2021-11-03 13:06:07'),
(56, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:08', '2021-11-03 13:06:08'),
(57, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:11', '2021-11-03 13:06:11'),
(58, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:06:14', '2021-11-03 13:06:14'),
(59, '1', 'آپدیت عنوان فوتر صفحه سایت-', 'آپدیت', '2021-11-03 13:13:37', '2021-11-03 13:13:37'),
(60, '1', 'آپدیت عنوان فوتر صفحه سایت-', 'آپدیت', '2021-11-03 13:13:55', '2021-11-03 13:13:55'),
(61, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 13:14:28', '2021-11-03 13:14:28'),
(62, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:16:10', '2021-11-03 16:16:10'),
(63, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:16:37', '2021-11-03 16:16:37'),
(64, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:18:01', '2021-11-03 16:18:01'),
(65, '1', 'آپدیت منو-تخفیف‌ها و پیشنهادها', 'آپدیت', '2021-11-03 16:18:19', '2021-11-03 16:18:19'),
(66, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:18:47', '2021-11-03 16:18:47'),
(67, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:19:10', '2021-11-03 16:19:10'),
(68, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:19:35', '2021-11-03 16:19:35'),
(69, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:19:44', '2021-11-03 16:19:44'),
(70, '1', 'افزودن منو هدر-', 'ایجاد', '2021-11-03 16:23:55', '2021-11-03 16:23:55'),
(71, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 16:59:33', '2021-11-03 16:59:33'),
(72, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:00:03', '2021-11-03 17:00:03'),
(73, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:00:45', '2021-11-03 17:00:45'),
(74, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:01:12', '2021-11-03 17:01:12'),
(75, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:01:39', '2021-11-03 17:01:39'),
(76, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:01:57', '2021-11-03 17:01:57'),
(77, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:02:36', '2021-11-03 17:02:36'),
(78, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:02:39', '2021-11-03 17:02:39'),
(79, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:02:43', '2021-11-03 17:02:43'),
(80, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:02:50', '2021-11-03 17:02:50'),
(81, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:03:32', '2021-11-03 17:03:32'),
(82, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:03:52', '2021-11-03 17:03:52'),
(83, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:04:08', '2021-11-03 17:04:08'),
(84, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:04:30', '2021-11-03 17:04:30'),
(85, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:04:42', '2021-11-03 17:04:42'),
(86, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:04:53', '2021-11-03 17:04:53'),
(87, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:05:08', '2021-11-03 17:05:08'),
(88, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:05:22', '2021-11-03 17:05:22'),
(89, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:05:36', '2021-11-03 17:05:36'),
(90, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:05:54', '2021-11-03 17:05:54'),
(91, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:06:05', '2021-11-03 17:06:05'),
(92, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:06:17', '2021-11-03 17:06:17'),
(93, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:06:31', '2021-11-03 17:06:31'),
(94, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:06:49', '2021-11-03 17:06:49'),
(95, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:07:00', '2021-11-03 17:07:00'),
(96, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:07:13', '2021-11-03 17:07:13'),
(97, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:07:29', '2021-11-03 17:07:29'),
(98, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:07:35', '2021-11-03 17:07:35'),
(99, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:07:37', '2021-11-03 17:07:37'),
(100, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:07:48', '2021-11-03 17:07:48'),
(101, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:07:55', '2021-11-03 17:07:55'),
(102, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:00', '2021-11-03 17:08:00'),
(103, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:02', '2021-11-03 17:08:02'),
(104, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:05', '2021-11-03 17:08:05'),
(105, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:09', '2021-11-03 17:08:09'),
(106, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:14', '2021-11-03 17:08:14'),
(107, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:20', '2021-11-03 17:08:20'),
(108, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:23', '2021-11-03 17:08:23'),
(109, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:27', '2021-11-03 17:08:27'),
(110, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:39', '2021-11-03 17:08:39'),
(111, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:42', '2021-11-03 17:08:42'),
(112, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:08:45', '2021-11-03 17:08:45'),
(113, '1', 'افزودن شبکه اجتماعی-', 'ایجاد', '2021-11-03 17:10:22', '2021-11-03 17:10:22'),
(114, '1', 'افزودن شبکه اجتماعی-', 'ایجاد', '2021-11-03 17:10:56', '2021-11-03 17:10:56'),
(115, '1', 'افزودن شبکه اجتماعی-', 'ایجاد', '2021-11-03 17:11:12', '2021-11-03 17:11:12'),
(116, '1', 'افزودن شبکه اجتماعی-', 'ایجاد', '2021-11-03 17:11:26', '2021-11-03 17:11:26'),
(117, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:13:46', '2021-11-03 17:13:46'),
(118, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:14:24', '2021-11-03 17:14:24'),
(119, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:14:49', '2021-11-03 17:14:49'),
(120, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:15:11', '2021-11-03 17:15:11'),
(121, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:15:42', '2021-11-03 17:15:42'),
(122, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:16:07', '2021-11-03 17:16:07'),
(123, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:16:26', '2021-11-03 17:16:26'),
(124, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:16:30', '2021-11-03 17:16:30'),
(125, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:16:32', '2021-11-03 17:16:32'),
(126, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:16:34', '2021-11-03 17:16:34'),
(127, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:16:38', '2021-11-03 17:16:38'),
(128, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:16:40', '2021-11-03 17:16:40'),
(129, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:18:07', '2021-11-03 17:18:07'),
(130, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:18:16', '2021-11-03 17:18:16'),
(131, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:18:27', '2021-11-03 17:18:27'),
(132, '1', 'افزودن صفحه سایت-', 'ایجاد', '2021-11-03 17:18:40', '2021-11-03 17:18:40'),
(133, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:19:04', '2021-11-03 17:19:04'),
(134, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:19:11', '2021-11-03 17:19:11'),
(135, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:19:16', '2021-11-03 17:19:16'),
(136, '1', 'افزودن صفحه به فوتر سایت-', 'ایجاد', '2021-11-03 17:19:18', '2021-11-03 17:19:18'),
(137, '1', 'آپدیت دسته-کالای دیجیتال', 'آپدیت', '2021-11-03 19:30:52', '2021-11-03 19:30:52'),
(138, '1', 'آپدیت دسته-خودرو، ابزار و تجهیزات صنعتی', 'آپدیت', '2021-11-07 05:52:57', '2021-11-07 05:52:57'),
(139, '1', 'آپدیت دسته-مد و پوشاک', 'آپدیت', '2021-11-07 09:46:47', '2021-11-07 09:46:47'),
(140, '1', 'آپدیت دسته-مد و پوشاک', 'آپدیت', '2021-11-07 09:47:22', '2021-11-07 09:47:22'),
(141, '1', 'آپدیت دسته-اسباب بازی، کودک و نوزاد', 'آپدیت', '2021-11-07 11:03:13', '2021-11-07 11:03:13'),
(142, '1', 'آپدیت دسته-اسباب بازی، کودک و نوزاد', 'آپدیت', '2021-11-07 11:03:31', '2021-11-07 11:03:31'),
(143, '1', 'آپدیت زیردسته-لوازم جانبی گوشی', 'آپدیت', '2021-11-07 17:35:15', '2021-11-07 17:35:15'),
(144, '1', 'آپدیت زیردسته-گوشی موبایل', 'آپدیت', '2021-11-07 17:35:48', '2021-11-07 17:35:48'),
(145, '1', 'آپدیت زیردسته-خودروهای ایرانی و خارجی', 'آپدیت', '2021-11-07 17:36:12', '2021-11-07 17:36:12'),
(146, '1', 'آپدیت زیردسته-موتور سیکلت', 'آپدیت', '2021-11-07 17:42:28', '2021-11-07 17:42:28'),
(147, '1', 'آپدیت دسته-کالای دیجیتال', 'آپدیت', '2021-11-08 07:23:23', '2021-11-08 07:23:23'),
(148, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-08 07:25:45', '2021-11-08 07:25:45'),
(149, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-08 07:26:28', '2021-11-08 07:26:28'),
(150, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-08 07:27:31', '2021-11-08 07:27:31'),
(151, '1', 'افزودن زیر دسته-', 'ایجاد', '2021-11-08 07:28:14', '2021-11-08 07:28:14'),
(152, '1', 'آپدیت دسته کودک-کیف و کاور گوشی', 'آپدیت', '2021-11-08 07:31:29', '2021-11-08 07:31:29'),
(153, '1', 'آپدیت دسته کودک-پاور بانک (شارژر همراه)', 'آپدیت', '2021-11-08 07:32:20', '2021-11-08 07:32:20'),
(154, '1', 'آپدیت زیردسته-گوشی موبایل', 'آپدیت', '2021-11-08 07:34:46', '2021-11-08 07:34:46'),
(155, '1', 'افزودن مشخصات کالا-', 'ایجاد', '2021-11-08 07:57:38', '2021-11-08 07:57:38'),
(156, '1', 'افزودن مشخصات کالا-', 'ایجاد', '2021-11-08 07:57:56', '2021-11-08 07:57:56'),
(157, '1', 'افزودن مشخصات کالا-', 'ایجاد', '2021-11-08 07:58:10', '2021-11-08 07:58:10'),
(158, '1', 'آپدیت مشخصات کالا-سایر توضیحات', 'آپدیت', '2021-11-08 07:58:40', '2021-11-08 07:58:40'),
(159, '1', 'افزودن مشخصات کالا-', 'ایجاد', '2021-11-08 07:59:17', '2021-11-08 07:59:17'),
(160, '1', 'افزودن مشخصات کالا-', 'ایجاد', '2021-11-08 07:59:31', '2021-11-08 07:59:31'),
(161, '1', 'افزودن برند-', 'ایجاد', '2021-11-08 08:01:42', '2021-11-08 08:01:42'),
(162, '1', 'فعال کردن وضعیت برند-', 'فعال', '2021-11-08 08:01:45', '2021-11-08 08:01:45'),
(163, '1', 'افزودن برند-', 'ایجاد', '2021-11-08 08:02:26', '2021-11-08 08:02:26'),
(164, '1', 'افزودن رنگ-', 'ایجاد', '2021-11-08 08:03:49', '2021-11-08 08:03:49'),
(165, '1', 'افزودن رنگ-', 'ایجاد', '2021-11-08 08:04:12', '2021-11-08 08:04:12'),
(166, '1', 'افزودن محصول-کاور لوکسار مدل kikstand-100 مناسب برای گوشی موبایل سامسونگ Galaxy A51', 'ایجاد', '2021-11-08 08:21:51', '2021-11-08 08:21:51'),
(167, '1', 'افزودن مقدار مشخصه کالا-', 'ایجاد', '2021-11-08 08:22:18', '2021-11-08 08:22:18'),
(168, '1', 'افزودن مقدار مشخصه کالا-', 'ایجاد', '2021-11-08 08:22:29', '2021-11-08 08:22:29'),
(169, '1', 'افزودن مقدار مشخصه کالا-', 'ایجاد', '2021-11-08 08:22:40', '2021-11-08 08:22:40'),
(170, '1', 'افزودن مقدار مشخصه کالا-', 'ایجاد', '2021-11-08 08:22:51', '2021-11-08 08:22:51'),
(171, '1', 'افزودن تصویر محصول-', 'ایجاد', '2021-11-08 08:23:16', '2021-11-08 08:23:16'),
(172, '1', 'افزودن تصویر محصول-', 'ایجاد', '2021-11-08 08:23:36', '2021-11-08 08:23:36'),
(173, '1', 'افزودن تصویر محصول-', 'ایجاد', '2021-11-08 08:23:47', '2021-11-08 08:23:47'),
(174, '1', 'افزودن گارانتی-', 'ایجاد', '2021-11-08 08:24:55', '2021-11-08 08:24:55'),
(175, '1', 'افزودن تنوع قیمت محصول-', 'ایجاد', '2021-11-08 08:25:22', '2021-11-08 08:25:22'),
(176, '1', 'افزودن پیشنهاد شگفت انگیز-', 'ایجاد', '2021-11-08 08:25:57', '2021-11-08 08:25:57'),
(177, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:26:12', '2021-11-08 08:26:12'),
(178, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:26:19', '2021-11-08 08:26:19'),
(179, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:26:26', '2021-11-08 08:26:26'),
(180, '1', 'فعال کردن وضعیت منو-1', 'فعال', '2021-11-08 08:26:27', '2021-11-08 08:26:27'),
(181, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:26:35', '2021-11-08 08:26:35'),
(182, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:26:44', '2021-11-08 08:26:44'),
(183, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:26:52', '2021-11-08 08:26:52'),
(184, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:27:47', '2021-11-08 08:27:47'),
(185, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:27:51', '2021-11-08 08:27:51'),
(186, '1', 'افزودن منو-', 'ایجاد', '2021-11-08 08:27:55', '2021-11-08 08:27:55'),
(187, '1', 'فعال کردن وضعیت منو-2', 'فعال', '2021-11-08 08:27:59', '2021-11-08 08:27:59'),
(188, '1', 'فعال کردن وضعیت منو-2', 'فعال', '2021-11-08 08:28:00', '2021-11-08 08:28:00'),
(189, '1', 'افزودن محصول منتخب-', 'ایجاد', '2021-11-08 08:29:46', '2021-11-08 08:29:46'),
(190, '1', 'افزودن محصول منتخب-', 'ایجاد', '2021-11-08 08:30:21', '2021-11-08 08:30:21'),
(191, '1', 'فعال کردن وضعیت برند-', 'فعال', '2021-11-08 08:30:53', '2021-11-08 08:30:53'),
(192, '1', 'فعال کردن وضعیت برند-', 'فعال', '2021-11-08 08:30:54', '2021-11-08 08:30:54'),
(193, '1', 'افزودن محصول دسته صفحه اصلی-', 'ایجاد', '2021-11-08 08:32:02', '2021-11-08 08:32:02'),
(194, '1', 'افزودن محصول دسته صفحه اصلی-', 'ایجاد', '2021-11-08 08:32:14', '2021-11-08 08:32:14'),
(195, '1', 'افزودن تبلیغات دسته-', 'ایجاد', '2021-11-08 08:34:55', '2021-11-08 08:34:55'),
(196, '1', 'افزودن اسلایدر-', 'ایجاد', '2021-11-08 12:51:33', '2021-11-08 12:51:33'),
(197, '1', 'افزودن پیشنهاد شگفت انگیز-', 'ایجاد', '2021-11-08 12:52:23', '2021-11-08 12:52:23'),
(198, '1', 'افزودن بنر-', 'ایجاد', '2021-11-08 12:53:20', '2021-11-08 12:53:20'),
(199, '1', 'افزودن بنر-', 'ایجاد', '2021-11-08 12:53:38', '2021-11-08 12:53:38'),
(200, '1', 'حذف کردن بنر-موبایل', 'حذف', '2021-11-08 12:53:42', '2021-11-08 12:53:42'),
(201, '1', 'افزودن بنر-', 'ایجاد', '2021-11-08 12:53:57', '2021-11-08 12:53:57'),
(202, '1', 'افزودن بنر-', 'ایجاد', '2021-11-08 12:54:13', '2021-11-08 12:54:13'),
(203, '1', 'افزودن بنر-', 'ایجاد', '2021-11-08 12:54:37', '2021-11-08 12:54:37'),
(204, '1', 'حذف کردن بنر-لپتاب', 'حذف', '2021-11-08 12:55:35', '2021-11-08 12:55:35'),
(205, '1', 'افزودن بنر-', 'ایجاد', '2021-11-08 12:55:46', '2021-11-08 12:55:46'),
(206, '1', 'افزودن عناوین-', 'ایجاد', '2021-11-08 12:56:13', '2021-11-08 12:56:13'),
(207, '1', 'افزودن محصول-', 'ایجاد', '2021-11-08 12:56:23', '2021-11-08 12:56:23'),
(208, '1', 'حذف کردن محصول-1', 'حذف', '2021-11-08 12:57:02', '2021-11-08 12:57:02'),
(209, '1', 'افزودن محصول-', 'ایجاد', '2021-11-08 12:57:24', '2021-11-08 12:57:24');

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `index` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `category_id`, `subCategory_id`, `childCategory_id`, `index`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', NULL, NULL, '1', '2021-11-08 08:26:12', '2021-11-08 08:26:12'),
(2, '1', '2', NULL, NULL, '1', '2021-11-08 08:26:19', '2021-11-08 08:26:19'),
(3, '1', '1', '1', NULL, '1', '2021-11-08 08:26:26', '2021-11-08 08:26:27'),
(4, '1', '1', '2', NULL, '1', '2021-11-08 08:26:35', '2021-11-08 08:26:35'),
(5, '1', '2', '3', NULL, '1', '2021-11-08 08:26:44', '2021-11-08 08:26:44'),
(6, '1', '2', '4', NULL, '1', '2021-11-08 08:26:52', '2021-11-08 08:26:52'),
(7, '1', '2', '5', NULL, '1', '2021-11-08 08:27:47', '2021-11-08 08:27:47'),
(8, '2', '3', NULL, NULL, '1', '2021-11-08 08:27:51', '2021-11-08 08:27:59'),
(9, '2', '4', NULL, NULL, '1', '2021-11-08 08:27:55', '2021-11-08 08:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(43, '2014_10_12_000000_create_users_table', 1),
(44, '2014_10_12_100000_create_password_resets_table', 1),
(45, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(46, '2019_08_19_000000_create_failed_jobs_table', 1),
(47, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(48, '2020_05_21_100000_create_teams_table', 1),
(49, '2020_05_21_200000_create_team_user_table', 1),
(50, '2020_05_21_300000_create_team_invitations_table', 1),
(51, '2021_10_02_120003_create_categories_table', 1),
(52, '2021_10_03_233031_create_sub_categories_table', 1),
(53, '2021_10_04_120551_create_sessions_table', 1),
(54, '2021_10_04_133832_create_child_categories_table', 1),
(55, '2021_10_05_101657_create_logs_table', 1),
(56, '2021_10_06_085201_create_products_table', 1),
(57, '2021_10_07_193553_create_brands_table', 1),
(58, '2021_10_07_222949_create_colors_table', 1),
(59, '2021_10_08_174928_create_galleries_table', 1),
(60, '2021_10_08_222001_create_warranties_table', 1),
(61, '2021_10_09_000345_create_product_sellers_table', 1),
(62, '2021_10_09_102021_create_attributes_table', 1),
(63, '2021_10_09_114709_create_attribute_values_table', 1),
(64, '2021_10_13_110842_create_setting_footers_table', 1),
(65, '2021_10_13_170152_create_pages_table', 1),
(66, '2021_10_13_172045_create_footer_inner_boxes_table', 1),
(67, '2021_10_13_175254_create_footer_link_ones_table', 1),
(68, '2021_10_13_175306_create_footer_link_twos_table', 1),
(69, '2021_10_13_175320_create_footer_link_threes_table', 1),
(70, '2021_10_14_124837_create_news_letters_table', 1),
(71, '2021_10_14_132013_create_socials_table', 1),
(72, '2021_10_14_170033_create_footer_titles_table', 1),
(73, '2021_10_14_175209_create_footer_partners_table', 1),
(74, '2021_10_14_203741_create_site_headers_table', 1),
(75, '2021_10_14_221809_create_footer_link_titles_table', 1),
(76, '2021_10_17_164635_create_menus_table', 1),
(77, '2021_10_17_184446_create_ads_categories_table', 1),
(78, '2021_10_18_122422_create_banners_table', 1),
(79, '2021_10_18_130251_create_sliders_table', 1),
(80, '2021_10_18_201044_create_special_products_table', 1),
(81, '2021_10_20_000046_create_title_category_indices_table', 1),
(82, '2021_10_20_003828_create_category_indices_table', 1),
(83, '2021_10_20_185538_create_product_new_selecteds_table', 1),
(84, '2021_10_20_193227_create_product_selecteds_table', 1),
(85, '2021_11_06_141915_create_category_electronic_slider_table', 1),
(86, '2021_11_06_153643_create_category_electronic_amazing_table', 2),
(87, '2021_11_06_170039_create_category_electronic_banner_table', 3),
(88, '2021_11_07_085234_create_category_electronic_title_swiper_table', 4),
(89, '2021_11_07_085434_create_category_electronic_product_swiper_table', 4),
(90, '2021_11_07_093406_create_category_vehicle_slider_table', 5),
(91, '2021_11_07_093509_create_category_vehicle_amazing_table', 5),
(92, '2021_11_07_093613_create_category_vehicle_banner_table', 5),
(93, '2021_11_07_093643_create_category_vehicle_title_swiper_table', 5),
(94, '2021_11_07_093700_create_category_vehicle_product_swiper_table', 5),
(95, '2021_11_07_132228_create_category_apparel_slider_table', 6),
(96, '2021_11_07_132358_create_category_apparel_amazing_table', 6),
(97, '2021_11_07_132419_create_category_apparel_title_swiper_table', 6),
(98, '2021_11_07_132449_create_category_apparel_product_swiper_table', 6),
(99, '2021_11_07_132856_create_category_apparel_brand_table', 6),
(100, '2021_11_07_134524_create_category_apparel_banner_table', 6),
(101, '2021_11_07_144052_create_category_child_slider_table', 7),
(102, '2021_11_07_144215_create_category_child_amazing_table', 7),
(103, '2021_11_07_144318_create_category_child_brand_table', 7),
(104, '2021_11_07_144346_create_category_child_banner_table', 7),
(105, '2021_11_07_144422_create_category_child_title_swiper_table', 7),
(106, '2021_11_07_144440_create_category_child_product_swiper_table', 7),
(107, '2021_11_07_155617_create_category_categry_product_swiper_table', 8),
(108, '2021_11_07_155652_create_category_categry_title_swiper_table', 8),
(109, '2021_11_07_155720_create_category_categry_banner_table', 8),
(110, '2021_11_07_155743_create_category_categry_brand_table', 8),
(111, '2021_11_07_155823_create_category_categry_amazing_table', 8),
(112, '2021_11_07_155847_create_category_categry_slider_table', 8),
(117, '2021_11_08_111935_create_category_level4s_table', 9),
(118, '2021_11_08_112120_create_category_levels_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `news_letters`
--

CREATE TABLE `news_letters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news_letters`
--

INSERT INTO `news_letters` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'belal.alireza@gmail.com', '2021-11-08 08:33:22', '2021-11-08 08:33:22');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `img`, `title`, `link`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'page/2021/11/express.png', 'امکان تحویل اکسپرس', 'faq/question/79/', NULL, '2021-11-03 16:59:33', '2021-11-03 16:59:33'),
(2, 'page/2021/11/24.png', '۷ روز هفته، ۲۴ ساعته', 'page/contact-us/', NULL, '2021-11-03 17:00:03', '2021-11-03 17:00:03'),
(3, 'page/2021/11/home.png', 'امکان پرداخت در محل', 'faq/question/81/', NULL, '2021-11-03 17:00:45', '2021-11-03 17:00:45'),
(4, 'page/2021/11/7.png', '۷ روز ضمانت بازگشت کالا', '/faq/question/83/', NULL, '2021-11-03 17:01:12', '2021-11-03 17:01:12'),
(5, 'page/2021/11/images.png', 'ضمانت اصل بودن کالا', 'faq/question/82/', NULL, '2021-11-03 17:01:39', '2021-11-03 17:01:39'),
(6, NULL, 'نحوه ثبت سفارش', '/', NULL, '2021-11-03 17:03:32', '2021-11-03 17:03:32'),
(7, NULL, 'رویه ارسال سفارش', '/', NULL, '2021-11-03 17:03:52', '2021-11-03 17:03:52'),
(8, NULL, 'شیوه‌های پرداخت', '/', NULL, '2021-11-03 17:04:08', '2021-11-03 17:04:08'),
(9, NULL, 'پاسخ به پرسش‌های متداول', '/', NULL, '2021-11-03 17:04:30', '2021-11-03 17:04:30'),
(10, NULL, 'رویه‌های بازگرداندن کالا', '/', NULL, '2021-11-03 17:04:42', '2021-11-03 17:04:42'),
(11, NULL, 'شرایط استفاده', '/', NULL, '2021-11-03 17:04:53', '2021-11-03 17:04:53'),
(12, NULL, 'حریم خصوصی', '/', NULL, '2021-11-03 17:05:08', '2021-11-03 17:05:08'),
(13, NULL, 'گزارش باگ', '/', NULL, '2021-11-03 17:05:22', '2021-11-03 17:05:22'),
(14, NULL, 'اتاق خبر دیجی‌کالا', '/', NULL, '2021-11-03 17:05:36', '2021-11-03 17:05:36'),
(15, NULL, 'فروش در دیجی‌کالا', '/', NULL, '2021-11-03 17:05:54', '2021-11-03 17:05:54'),
(16, NULL, 'فرصت‌های شغلی', '/', NULL, '2021-11-03 17:06:05', '2021-11-03 17:06:05'),
(17, NULL, 'تماس با دیجی‌کالا', '/', NULL, '2021-11-03 17:06:17', '2021-11-03 17:06:17'),
(18, NULL, 'درباره دیجی‌کالا', '/', NULL, '2021-11-03 17:06:31', '2021-11-03 17:06:31'),
(19, NULL, 'راهنمای خرید از دیجی‌کالا', '/', NULL, '2021-11-03 17:06:49', '2021-11-03 17:06:49'),
(20, NULL, 'خدمات مشتریان', '/', NULL, '2021-11-03 17:07:00', '2021-11-03 17:07:00'),
(21, NULL, 'با دیجی‌کالا', '/', NULL, '2021-11-03 17:07:13', '2021-11-03 17:07:13'),
(22, 'page/2021/11/mag.svg', 'دیجی‌کالا مگ', '/', NULL, '2021-11-03 17:13:46', '2021-11-03 17:13:46'),
(23, 'page/2021/11/استایل.svg', 'دیجی استایل', '/', NULL, '2021-11-03 17:14:24', '2021-11-03 17:14:24'),
(24, 'page/2021/11/فیدیو.svg', 'فیدیبو', '/', NULL, '2021-11-03 17:14:49', '2021-11-03 17:14:49'),
(25, 'page/2021/11/c8cfebe7.svg', 'دیجی کلاب', '/', NULL, '2021-11-03 17:15:11', '2021-11-03 17:15:11'),
(26, 'page/2021/11/a2f19563.svg', 'دیجی پی', '/', NULL, '2021-11-03 17:15:42', '2021-11-03 17:15:42'),
(27, 'page/2021/11/9ea6b446.svg', 'دیجی کالا', 'دیجی کالا', NULL, '2021-11-03 17:16:07', '2021-11-03 17:16:07'),
(28, 'page/2021/11/f822b108.svg', 'بازار', '/', NULL, '2021-11-03 17:18:07', '2021-11-03 17:18:07'),
(29, 'page/2021/11/مایکت.svg', 'مایکت', '/', NULL, '2021-11-03 17:18:16', '2021-11-03 17:18:16'),
(30, 'page/2021/11/dd753f51.png', 'گوگل پلی', '/', NULL, '2021-11-03 17:18:27', '2021-11-03 17:18:27'),
(31, 'page/2021/11/c4abfc14.png', 'اپ استور', '/', NULL, '2021-11-03 17:18:40', '2021-11-03 17:18:40');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subcategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `childcategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categorylevel4_id` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `brand_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `publish_product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` int(11) DEFAULT NULL,
  `gift` int(11) DEFAULT NULL,
  `shipment` int(11) DEFAULT NULL,
  `original` int(11) NOT NULL DEFAULT 1,
  `order_count` int(11) NOT NULL DEFAULT 0,
  `special` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `vendor_id`, `img`, `title`, `name`, `link`, `category_id`, `subcategory_id`, `childcategory_id`, `categorylevel4_id`, `color_id`, `brand_id`, `tags`, `body`, `description`, `price`, `discount_price`, `number`, `weight`, `status_product`, `publish_product`, `view`, `gift`, `shipment`, `original`, `order_count`, `special`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 'product/2021/11/8/0f3e2c01d4a621e090fd656e837795d4f980f1d8_1617464397.jpg', 'کاور لوکسار مدل kikstand-100 مناسب برای گوشی موبایل سامسونگ Galaxy A51', 'کاور لوکسار مدل kikstand-100 مناسب برای گوشی موبایل سامسونگ Galaxy A51', 'کاور-لوکسار-مدل-kikstand-100-مناسب-برای-گوشی-موبایل-سامسونگ-Galaxy-A51', '1', '1', '1', NULL, '1', NULL, 'کاور', NULL, 'kikstand-100 مدلی دیگر از برند لوکسار است و تمرکز خود را بر روی مقاومت گذاشته که علاوه بر داشتن 1 میلی متر بلندی بیشتر برای حفظ لنز دوربین گوشی، دارای استاندارد نظامی سقوط از ارتفاع 3 متر نیز است. این قاب علاوه بر استفاده از بهترین متریال اولیه ، زیبایی خاصی نیز دارد که ارزش خرید این محصول را دو چندان میکند. در قسمت پشت این قاب نیز یک گیره نگهدارنده وجود دارد که میتواند گوشی شما را به حالت افقی و عمودی دربیاورد که گزینه ای بسیار مناسب برای تماشای فیلم میباشد . علاوه بر آن از این نگه دارنده میتوان به عنوان گیره نگه دارنده دست استفاده کرد.', '130000', '104000', '100', '100', '1', '1', NULL, 1, 1, 1, 0, 1, NULL, '2021-11-08 08:21:51', '2021-11-08 08:21:51');

-- --------------------------------------------------------

--
-- Table structure for table `product_new_selecteds`
--

CREATE TABLE `product_new_selecteds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_new_selecteds`
--

INSERT INTO `product_new_selecteds` (`id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1', '1', '1', '2021-11-08 08:29:46', '2021-11-08 08:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_selecteds`
--

CREATE TABLE `product_selecteds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_selecteds`
--

INSERT INTO `product_selecteds` (`id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1', '1', '1', '2021-11-08 08:30:21', '2021-11-08 08:30:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_sellers`
--

CREATE TABLE `product_sellers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `warranty_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_count` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit_order` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_sellers`
--

INSERT INTO `product_sellers` (`id`, `vendor_id`, `product_id`, `time`, `warranty_id`, `price`, `discount_price`, `color_id`, `product_count`, `limit_order`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5', '1', '140000', '100000', '2', '150', '0', '1', NULL, '2021-11-08 08:25:22', '2021-11-08 08:25:22');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dR5wFfG70ElooPyaPZQowN2kqIExwN30iZtu5v42', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiWTlyTW8wSGQ2a3lJdlE1dkRwdW4wam1DUGpvcmk5OXRqTU9LS2JtWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYWluL2VsZWN0cm9uaWMtZGV2aWNlcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkejRwMDNjVkpYUXNOOUZCdU16dkl2dW8xYnlEV09rZ2VZeElTSzZkd3c5S2VTQXBQNXR2cW0iO30=', 1636376257);

-- --------------------------------------------------------

--
-- Table structure for table `setting_footers`
--

CREATE TABLE `setting_footers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `footer_feature-innerbox` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_social_link` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_middlebar_link_col1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_middlebar_link_col1_ul` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_middlebar_link_col2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_middlebar_link_col2_ul` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_middlebar_link_col3_ul` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_address_contact1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_address_contact2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_address_contact3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_address_images_appstore` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_address_images_cafebazar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_address_images_miket` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_top_address_images_sibapp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_title` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_category` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_safety-partner1` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_safety-partner2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_safety-partner3` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_brand` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_more_info_copyright` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_headers`
--

CREATE TABLE `site_headers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_headers`
--

INSERT INTO `site_headers` (`id`, `img`, `icon`, `link`, `title`, `status`, `created_at`, `updated_at`) VALUES
(2, NULL, 'fresh', '/', 'سوپرمارکت', '1', '2021-11-03 16:16:10', '2021-11-03 16:16:10'),
(3, NULL, 'amazing', '/', 'تخفیف‌ها و پیشنهادها', '1', '2021-11-03 16:16:37', '2021-11-03 16:18:19'),
(4, NULL, 'my-digikala', '/', 'دیجی‌کالای من', '1', '2021-11-03 16:18:01', '2021-11-03 16:18:01'),
(5, NULL, 'plus', '/', 'دیجی پلاس', '1', '2021-11-03 16:18:47', '2021-11-03 16:18:47'),
(6, NULL, 'digiclub', '/', 'دیجی کلاب', '1', '2021-11-03 16:19:10', '2021-11-03 16:19:10'),
(7, NULL, '', '/', 'سوالی دارید', '1', '2021-11-03 16:19:35', '2021-11-03 16:19:35'),
(8, NULL, '', '/', 'فروشنده شوید', '1', '2021-11-03 16:19:44', '2021-11-03 16:19:44'),
(9, NULL, 'دسته بندی کالاها', 'دسته بندی کالاها', 'دسته بندی کالاها', '1', '2021-11-03 16:23:55', '2021-11-03 16:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `img`, `title`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, 'slider/2021/11/8700d9f42376253e86ed95a5a67bbebd8c53ed43_1630496382.jpg', '01', '02', '1', '2021-11-03 11:25:15', '2021-11-03 11:25:18');

-- --------------------------------------------------------

--
-- Table structure for table `socials`
--

CREATE TABLE `socials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `socials`
--

INSERT INTO `socials` (`id`, `img`, `icon`, `title`, `link`, `created_at`, `updated_at`) VALUES
(1, NULL, 'instagram', 'ایسنتاگرام', 'instagram', '2021-11-03 17:10:22', '2021-11-03 17:10:22'),
(2, '', 'twitter', 'تویتر', 'twitter', '2021-11-03 17:10:56', '2021-11-03 17:10:56'),
(3, '', 'linkedin', 'linkedin', 'linkedin', '2021-11-03 17:11:12', '2021-11-03 17:11:12'),
(4, '', 'aparat', 'aparat', 'aparat', '2021-11-03 17:11:26', '2021-11-03 17:11:26');

-- --------------------------------------------------------

--
-- Table structure for table `special_products`
--

CREATE TABLE `special_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `supermarket` int(11) DEFAULT NULL,
  `natural` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_products`
--

INSERT INTO `special_products` (`id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `supermarket`, `natural`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '1', '1', '1', 1, 1, '2021-11-08 08:25:57', '2021-11-08 08:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `parent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `title`, `name`, `status`, `parent`, `img`, `link`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'لوازم جانبی گوشی', 'category-mobile-accessories', '1', '1', NULL, '/search/category-mobile-accessories/', NULL, '2021-11-03 10:49:39', '2021-11-07 17:35:15'),
(2, 'گوشی موبایل', 'category-mobile-phone', '1', '1', 'subcategory/2021/11/77f6b5b39b58f0b81c7707e3626f55b74ee348aa_1623857594.jpg', '/search/category-mobile-phone/', NULL, '2021-11-03 10:50:05', '2021-11-08 07:34:46'),
(3, 'خودروهای ایرانی و خارجی', 'category-cars', '1', '2', NULL, '/search/category-cars/', NULL, '2021-11-03 10:50:26', '2021-11-07 17:36:12'),
(4, 'موتور سیکلت', 'category-motorbike', '1', '2', NULL, '/search/category-motorbike/', NULL, '2021-11-03 10:50:48', '2021-11-07 17:42:28'),
(5, 'مردانه', 'category-mens-apparel', '1', '3', NULL, '/search/category-mens-apparel/', NULL, '2021-11-08 07:25:45', '2021-11-08 07:25:45'),
(6, 'لباس مردانه', 'category-men-clothing', '1', '3', NULL, '/search/category-men-clothing/', NULL, '2021-11-08 07:26:28', '2021-11-08 07:26:28'),
(7, 'بهداشت و حمام کودک و نوزاد', 'category-health-and-bathroom-tools', '1', '4', NULL, '/search/category-health-and-bathroom-tools/', NULL, '2021-11-08 07:27:31', '2021-11-08 07:27:31'),
(8, 'پوشاک و کفش کودک و نوزاد', 'category-kids-apparel', '1', '4', NULL, '/search/category-kids-apparel/', NULL, '2021-11-08 07:28:14', '2021-11-08 07:28:14');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fallon\'s Team', 1, '2021-11-03 09:54:02', '2021-11-03 09:54:02');

-- --------------------------------------------------------

--
-- Table structure for table `team_invitations`
--

CREATE TABLE `team_invitations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team_user`
--

CREATE TABLE `team_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `team_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `title_category_indices`
--

CREATE TABLE `title_category_indices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `title_category_indices`
--

INSERT INTO `title_category_indices` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'گوشی موبایل', '2021-11-03 11:35:44', '2021-11-03 11:35:44'),
(2, 'هدفون، هدست و هنذفری', '2021-11-03 11:36:37', '2021-11-03 11:36:37'),
(3, 'لپتاب', '2021-11-03 11:53:42', '2021-11-03 11:53:42'),
(4, 'ساعت هوشمند', '2021-11-03 11:54:52', '2021-11-03 11:54:52'),
(5, 'لوازم خودرو', '2021-11-03 11:58:42', '2021-11-03 11:58:42'),
(6, 'کیف و کاور گوشی', '2021-11-03 11:59:17', '2021-11-03 11:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'Fallon Bray', 'pyxywom@mailinator.com', NULL, '$2y$10$z4p03cVJXQsN9FBuMzvIvuo1byDWOkgeYxISK6dww9KeSApP5tvqm', NULL, NULL, NULL, NULL, NULL, '2021-11-03 09:54:02', '2021-11-03 09:54:02');

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warranties`
--

INSERT INTO `warranties` (`id`, `name`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'مهندسین پیشگام', '1', NULL, '2021-11-08 08:24:55', '2021-11-08 08:24:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ads_categories`
--
ALTER TABLE `ads_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_indices`
--
ALTER TABLE `category_indices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_level4s`
--
ALTER TABLE `category_level4s`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_levels`
--
ALTER TABLE `category_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `child_categories`
--
ALTER TABLE `child_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `footer_inner_boxes`
--
ALTER TABLE `footer_inner_boxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_link_ones`
--
ALTER TABLE `footer_link_ones`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_link_threes`
--
ALTER TABLE `footer_link_threes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_link_titles`
--
ALTER TABLE `footer_link_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_link_twos`
--
ALTER TABLE `footer_link_twos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_partners`
--
ALTER TABLE `footer_partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `footer_titles`
--
ALTER TABLE `footer_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news_letters`
--
ALTER TABLE `news_letters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_new_selecteds`
--
ALTER TABLE `product_new_selecteds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_selecteds`
--
ALTER TABLE `product_selecteds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_sellers`
--
ALTER TABLE `product_sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `setting_footers`
--
ALTER TABLE `setting_footers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_headers`
--
ALTER TABLE `site_headers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socials`
--
ALTER TABLE `socials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `special_products`
--
ALTER TABLE `special_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_user_id_index` (`user_id`);

--
-- Indexes for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`);

--
-- Indexes for table `team_user`
--
ALTER TABLE `team_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`);

--
-- Indexes for table `title_category_indices`
--
ALTER TABLE `title_category_indices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ads_categories`
--
ALTER TABLE `ads_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_indices`
--
ALTER TABLE `category_indices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category_level4s`
--
ALTER TABLE `category_level4s`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_levels`
--
ALTER TABLE `category_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `child_categories`
--
ALTER TABLE `child_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `footer_inner_boxes`
--
ALTER TABLE `footer_inner_boxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `footer_link_ones`
--
ALTER TABLE `footer_link_ones`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `footer_link_threes`
--
ALTER TABLE `footer_link_threes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `footer_link_titles`
--
ALTER TABLE `footer_link_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `footer_link_twos`
--
ALTER TABLE `footer_link_twos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `footer_partners`
--
ALTER TABLE `footer_partners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `footer_titles`
--
ALTER TABLE `footer_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `news_letters`
--
ALTER TABLE `news_letters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_new_selecteds`
--
ALTER TABLE `product_new_selecteds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_selecteds`
--
ALTER TABLE `product_selecteds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_sellers`
--
ALTER TABLE `product_sellers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `setting_footers`
--
ALTER TABLE `setting_footers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `site_headers`
--
ALTER TABLE `site_headers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socials`
--
ALTER TABLE `socials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `special_products`
--
ALTER TABLE `special_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `team_invitations`
--
ALTER TABLE `team_invitations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team_user`
--
ALTER TABLE `team_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `title_category_indices`
--
ALTER TABLE `title_category_indices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `team_invitations`
--
ALTER TABLE `team_invitations`
  ADD CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
