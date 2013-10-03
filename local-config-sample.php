<?php
/*
This is a sample local-config.php file
In it, you *must* include the four main database defines

You may include other settings here that you only want enabled on your local development checkouts
*/

define( 'DB_NAME', 'local_db_name' );
define( 'DB_USER', 'local_db_user' );
define( 'DB_PASSWORD', 'local_db_password' );
define( 'DB_HOST', 'localhost' ); // Probably 'localhost'

defined('SITE_ROOT') ? null : define('SITE_ROOT', 'local_site_root'); // eg. '/Users/...'

/**
 * Sets the debugging modes in WordPress
 * Defaults to on for local environment. 
 */
function environment_debug() {
	ini_set( 'display_errors', 1 );
	define( 'WP_DEBUG_DISPLAY', true );
}