-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2021 at 02:20 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `digikala_category`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_amazing`
--

CREATE TABLE `category_amazing` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `property1` int(11) DEFAULT NULL,
  `property2` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_amazing`
--

INSERT INTO `category_amazing` (`id`, `c_id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `property1`, `property2`, `created_at`, `updated_at`) VALUES
(1, '1', '3', '1', '1', '7', '1', 5, 12, NULL, NULL),
(2, '5', '14', '5', '35', '47', '1', NULL, 0, NULL, NULL),
(3, '1', '4', '1', '1', '7', '1', 7, 11, NULL, NULL),
(4, '1', '2', '1', '2', '5', '1', 1, 2, NULL, NULL),
(5, '1', '11', '1', '18', '28', '1', NULL, 0, NULL, NULL),
(6, '1', '15', '1', '18', '28', '1', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_banner`
--

CREATE TABLE `category_banner` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_banner`
--

INSERT INTO `category_banner` (`id`, `c_id`, `img`, `title`, `link`, `type`, `created_at`, `updated_at`) VALUES
(1, '1', 'categorypage/2021/7/bc928cad36c9cc9aed866ec4de30dfd9f5e50ec7_1607016116c401.jpg', 'اقدامات روز کرونا', 'banner', '0', NULL, NULL),
(2, '5', 'categorypage/2021/7/b28174d47d588f1558d3431249e453f3bb964a4c_1610910719c401.jpg', 'سوپر مارکتی', 'marketu', '0', NULL, NULL),
(3, '1', 'categorypage/2021/7/1f8226c4f32b961075ae267fc15e46e6b7a65839_1610266709.jpg', 'کندی', 'کندی', '0', NULL, NULL),
(4, '1', 'categorypage/2021/7/3b877e4dcd0625b73418aa963fd2a4df1dbe9a66_1594114949.jpg', 'ساعت هوشمند', 'smarti', '0', NULL, NULL),
(5, '1', 'categorypage/2021/7/7fa8b876bcc081b4ba273c420d7057074ee0814c_1594115055.jpg', 'powerbank', 'powerbank', '0', NULL, NULL),
(6, '1', 'categorypage/2021/7/cb5fe8de696fa080639fe6d4a432a13f9fe2393c_1594115103.jpg', 'laptop', 'laptop', '1', NULL, NULL),
(7, '1', 'categorypage/2021/7/f925d9ce3095224977a570c11b1f2ceaea4e68e5_1612162117c401.jpg', 'namdaran', 'namdaran', '1', NULL, NULL),
(9, '1', 'categorypage/2021/7/5a07df3e82e741074f8bf9cf7553b785430ac2a7_1594133899.jpg', 'hedp', 'hedp', '1', NULL, NULL),
(10, '1', 'categorypage/2021/7/0299f43e5874e2a941e541c1429fff049f30cdc6_1594133741.jpg', 'camera', 'camera', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_brand`
--

CREATE TABLE `category_brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_brand`
--

INSERT INTO `category_brand` (`id`, `c_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, '1', '1', NULL, NULL),
(2, '1', '3', NULL, NULL),
(3, '2', '5', NULL, NULL),
(4, '2', '6', NULL, NULL),
(5, '2', '7', NULL, NULL),
(7, '2', '8', NULL, NULL),
(8, '1', '9', NULL, NULL),
(9, '2', '10', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_product_swiper`
--

CREATE TABLE `category_product_swiper` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subCategory_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `childCategory_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_product_swiper`
--

INSERT INTO `category_product_swiper` (`id`, `c_id`, `title_id`, `product_id`, `category_id`, `subCategory_id`, `childCategory_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', '1', '3', '1', '1', '7', '1', NULL, NULL),
(2, '1', '1', '4', '1', '1', '7', '1', NULL, NULL),
(3, '1', '1', '2', '1', '2', '5', '1', NULL, NULL),
(4, '5', '4', '14', '5', '35', '47', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_slider`
--

CREATE TABLE `category_slider` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_slider`
--

INSERT INTO `category_slider` (`id`, `c_id`, `img`, `title`, `link`, `status`, `created_at`, `updated_at`) VALUES
(1, '1', 'categorypage/2021/6/5a07df3e82e741074f8bf9cf7553b785430ac2a7_1594133899.jpg', 'هدفون و هندزفری', 'hedf', '1', NULL, NULL),
(2, '1', 'categorypage/2021/6/6e2eaa6bfc3839be260170a1c141951748a14a35_1594134030.jpg', 'تبلت', 'tablet', '1', NULL, NULL),
(3, '2', 'categorypage/2021/6/847133eaea7802378ac40447b9520060351e2730_1601384919.jpg', 'car', 'cv', '1', NULL, NULL),
(4, '3', 'categorypage/2021/6/3f50a565fd2020696deb374d3e26aed37de655d0_1601820141.jpg', 'sd', 'ds', '1', NULL, NULL),
(5, '4', 'categorypage/2021/6/c426e2b7cb48ef51df44782ae56d646f8fbc8bff_1601380132.jpg', 'sd', 'fdfd', '1', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_title_swiper`
--

CREATE TABLE `category_title_swiper` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category_title_swiper`
--

INSERT INTO `category_title_swiper` (`id`, `c_id`, `title`, `link`, `created_at`, `updated_at`) VALUES
(1, '1', 'دیجیتال‌هایی که همه باید داشته باشن', '/digita', NULL, NULL),
(2, '2', 'نور و روشنایی', '/noor', NULL, NULL),
(3, '2', 'ابزار برقی', '/barg', NULL, NULL),
(4, '5', 'سوپرمارکت', 'si', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(44, '2014_10_12_000000_create_users_table', 1),
(45, '2014_10_12_100000_create_password_resets_table', 1),
(46, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(47, '2019_08_19_000000_create_failed_jobs_table', 1),
(48, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(49, '2020_05_21_100000_create_teams_table', 1),
(50, '2020_05_21_200000_create_team_user_table', 1),
(51, '2020_05_21_300000_create_team_invitations_table', 1),
(52, '2021_03_13_133638_create_categories_table', 1),
(53, '2021_03_15_151924_create_sub_categories_table', 1),
(54, '2021_03_16_155421_create_sessions_table', 1),
(55, '2021_03_16_173110_create_child_categories_table', 1),
(56, '2021_03_17_064213_create_logs_table', 1),
(57, '2021_03_19_122945_create_products_table', 1),
(58, '2021_03_23_103459_create_brands_table', 1),
(59, '2021_03_23_132053_create_colors_table', 1),
(60, '2021_03_23_173003_create_galleries_table', 1),
(61, '2021_03_25_202358_create_warranties_table', 1),
(62, '2021_03_25_205953_create_product_sellers_table', 1),
(63, '2021_03_26_122343_create_attributes_table', 1),
(64, '2021_03_26_161433_create_attribute_values_table', 1),
(65, '2021_04_03_134833_create_setting_footers_table', 1),
(66, '2021_04_03_144527_create_pages_table', 1),
(67, '2021_04_06_132649_create_footer_inner_boxes_table', 1),
(68, '2021_04_06_140115_create_footer_link_ones_table', 1),
(69, '2021_04_06_140127_create_footer_link_twos_table', 1),
(70, '2021_04_06_140154_create_footer_link_threes_table', 1),
(71, '2021_04_06_164101_create_footer_link_titles_table', 1),
(72, '2021_04_07_091028_create_news_letters_table', 1),
(73, '2021_04_07_132154_create_socials_table', 1),
(74, '2021_04_07_165236_create_footer_titles_table', 1),
(75, '2021_04_07_182343_create_footer_partners_table', 1),
(76, '2021_04_10_054255_create_site_headers_table', 1),
(77, '2021_04_27_050723_create_menus_table', 1),
(78, '2021_04_28_133659_create_ads_categories_table', 1),
(79, '2021_05_03_195610_create_banners_table', 1),
(80, '2021_05_03_212647_create_sliders_table', 1),
(81, '2021_05_03_231048_create_special_products_table', 1),
(82, '2021_05_06_094343_create_title_category_indices_table', 1),
(83, '2021_05_07_030522_create_category_indices_table', 1),
(84, '2021_05_13_064239_create_product_new_selecteds_table', 1),
(85, '2021_05_13_070914_create_product_selecteds_table', 1),
(86, '2021_05_18_100457_create_category_electronic_slider_table', 1),
(87, '2021_05_18_120706_create_category_electronic_amazing_table', 2),
(88, '2021_05_27_160307_create_category_electronic_banner_table', 3),
(89, '2021_06_01_035418_create_category_electronic_title_swiper_table', 4),
(90, '2021_06_01_035506_create_category_electronic_product_swiper_table', 4),
(91, '2021_06_10_070803_create_category_vehicle_slider_table', 5),
(92, '2021_06_10_070831_create_category_vehicle_amazing_table', 5),
(93, '2021_06_10_070854_create_category_vehicle_banner_table', 5),
(94, '2021_06_10_070920_create_category_vehicle_title_swiper_table', 5),
(95, '2021_06_10_070935_create_category_vehicle_product_swiper_table', 5),
(96, '2021_06_13_070947_create_category_apparel_slider_table', 6),
(97, '2021_06_13_071007_create_category_apparel_amazing_table', 6),
(98, '2021_06_13_071044_create_category_apparel_banner_table', 6),
(99, '2021_06_13_071056_create_category_apparel_title_swiper_table', 6),
(100, '2021_06_13_071115_create_category_apparel_product_swiper_table', 6),
(101, '2021_06_13_071128_create_category_apparel_brand_table', 6),
(102, '2021_06_17_163137_create_category_child_slider_table', 7),
(103, '2021_06_17_163157_create_category_child_amazing_table', 7),
(104, '2021_06_17_163210_create_category_child_banner_table', 7),
(105, '2021_06_17_163234_create_category_child_brand_table', 7),
(106, '2021_06_17_163248_create_category_child_title_swiper_table', 7),
(107, '2021_06_17_163303_create_category_child_product_swiper_table', 7),
(108, '2021_06_19_094454_create_category_product_swiper_table', 8),
(109, '2021_06_19_094519_create_category_title_swiper_table', 8),
(110, '2021_06_19_094536_create_category_banner_table', 8),
(111, '2021_06_19_094547_create_category_brand_table', 8),
(112, '2021_06_19_094600_create_category_amazing_table', 8),
(113, '2021_06_19_094612_create_category_slider_table', 8);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_amazing`
--
ALTER TABLE `category_amazing`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_banner`
--
ALTER TABLE `category_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_brand`
--
ALTER TABLE `category_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_product_swiper`
--
ALTER TABLE `category_product_swiper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_slider`
--
ALTER TABLE `category_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_title_swiper`
--
ALTER TABLE `category_title_swiper`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_amazing`
--
ALTER TABLE `category_amazing`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_banner`
--
ALTER TABLE `category_banner`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `category_brand`
--
ALTER TABLE `category_brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category_product_swiper`
--
ALTER TABLE `category_product_swiper`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `category_slider`
--
ALTER TABLE `category_slider`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `category_title_swiper`
--
ALTER TABLE `category_title_swiper`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
