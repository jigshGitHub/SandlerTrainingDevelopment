<?php

$path = 'uploads/';
/*
 Change this if you want to upload files somewhere else
 For example here is absolute path:
   $path = '/var/www/folder/for/uploads/';
 or relative path:
   $path = '../../folder/for/uploads/';
 Do not forget trailing slash.
*/

$url_prefix = preg_replace('/(u\.php.*)/', 'uploads/', $_SERVER['PHP_SELF']);
/*
 If you have specific URL of uploads dir please set this variable with your value.
 For example:
   $url_prefix = 'http://domain.tld/path/to/uploads/';
 Do not forget trailing slash.
*/


$image_ext_regexp = '/\.(jpe?g|png|gif|bmp|svg)$/';
/*
 Change this variable if you have specific set of allowed image extensions.
 Read more about regular expressions to understand the format of this parameter's value.
*/


/* --------------------------------------------------------------------------------- */

$i = 0;
$src = [];
while (isset($_FILES['file_'.$i])) {

    $file = $_FILES['file_'.$i];
    
    if (preg_match($image_ext_regexp, $file['name']) !== 1)
        continue;
    

    $file_name;
    for ($n=0;true;$n++) {
        if ($n == 0)
            $file_name = $file['name'];
        else
            $file_name = $n . '-' . $file['name'];
        if (!file_exists($path . $file_name))
            break;
    }

    if (is_uploaded_file($file['tmp_name']))
		$r = move_uploaded_file($file['tmp_name'], $path . $file_name);
	else
		$r = rename($file['tmp_name'], $path . $file_name);

	if ($r !== false) {
	    $src[] = $file_name;
	} else {
        if (substr(php_sapi_name(), 0, 3) == 'cgi')
            header("Status: 400 Bad Request");
        else
            header("HTTP/1.1 400 Bad Request");
        echo 'Unable to move uploaded file. Check the path for uploads folder (currently "'.$path.'") in "u.php" and permissions for webserver to write into it.';
        die;
	}


	$i++;
}

if (count($src) == 0) {
    if (substr(php_sapi_name(), 0, 3) == 'cgi')
        header("Status: 400 Bad Request");
    else
        header("HTTP/1.1 400 Bad Request");
    
    echo 'No images received.';
    
    
    die;
}

$html = '';
for ($i = 0; $i < count($src); $i++) {
    $url = $url_prefix . $src[$i];
    
    $html .= '<img src="' . $url_prefix.$src[$i] . '"/>';
    
    
}
if (count($src) > 1)
    $html = '<div>' . $html . '</div>';

echo $html;

?>