<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'sabra_database' );

/** MySQL database username */
define( 'DB_USER', 'sabra' );

/** MySQL database password */
define( 'DB_PASSWORD', 'sabra_21' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service:}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'rS$]qkYc`cmXWh!JO8Tj{W>m4O[tr]85|ZlnKN#FgolO(whX^zis*Ngq7 g-DM2+');
define('SECURE_AUTH_KEY',  'TpzI>fR:xdDIcj6P1#-mrck+#gIo,y_0v1B~SYqwYBoP-qc}/maee ki+5DVE||?');
define('LOGGED_IN_KEY',    'L-7>3LSlh,-3NR>gm|o/#P~ykVR-h~+<^+_6`%kDnbxQ-[D%xQVpV,v-Md=XPX29');
define('NONCE_KEY',        'NjYwP|#QC|eG-wO~_@2fqY+w!xgfh[{Gw+G`0*7E8,G a+M//-|+,e(|l/q&-93m');
define('AUTH_SALT',        '|&Do.R+7&e<0tx|?t/PB$puyj].p`j#HkT]GjB/^!^#%`&0|kR_Ox/79x8p+n|u!');
define('SECURE_AUTH_SALT', 'V,U,$S2;ss}ps-iQ5[E@n+ &0/N`|XWms):/j+-q]C+yhL=?sL&*l/I?6tk[0-+1');
define('LOGGED_IN_SALT',   'Av#0xlc|-QYj5<1yI$~cuI:@`|j+JOSio]@J:qz<{|#3p;~X)^]T-lEpe=g/)$;I');
define('NONCE_SALT',       'xc 8CAJp&IbnAVyXZQ;0^7M||orZA;iRBZ)A?Wu`/4Wt|aYw#K* KKCdi3mx(|=`');
/**#@-*/

/**
 * WordPress Database Table prefix.
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

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
