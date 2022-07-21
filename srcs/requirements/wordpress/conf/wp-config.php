<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wp_db' );

/** Database username */
define( 'DB_USER', 'mehill' );

/** Database password */
define( 'DB_PASSWORD', 'secret' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         ',5t&f3?An#l}9t82yEC0pU$NM^@!wh@T c.&0ZtqZ-:vP!%w)Re}?|-O.WN2-pH4' );
define( 'SECURE_AUTH_KEY',  '!WqMhK}i.)|!]4+J&cKEI<]Ig3p^.#_sj9ojPrtC0D$ewn]5mE)b-lI},>7+3:4R' );
define( 'LOGGED_IN_KEY',    'R,f`s*xLXjhEvoOcMxOWjRG>ip8;&5,Io@gv!_J77m4SW0m`Ov.,:{I z<JNEskX' );
define( 'NONCE_KEY',        '@:opzG$_!y-O#Sel+W[zlDlR`oTojhM0tD^:xiqqtG{3g#~$?n5DUAa];2)RE<ag' );
define( 'AUTH_SALT',        'GAY`0xe-&D+P%K7)c~>1P[Udp@HZAV0~LjLYt)&!*NR6MJ1^f6x2?E:f1+ysNkz/' );
define( 'SECURE_AUTH_SALT', 'y&0g+OL#2u)]PHuKDEJyl2RZ7UIX,Wlg9c0Um-18&.S?q`GujiH[sb=xM5W#U>N8' );
define( 'LOGGED_IN_SALT',   'Cv2XnKh)sUpd3qT!{~WSvQ3<`Yc@&pYyPF@mt;^}w4_GaT%$l,%N{!DeS1+Dhu[P' );
define( 'NONCE_SALT',       'sZ?.u3Y:N~YIFetq*~wbth#FZa_{a^8H32=*[);c95^fX40U.+?v?QQyNy*JoJqe' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
