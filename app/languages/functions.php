<?php
//Carga de idiomas---------------------------
    require_once DIR . '/vendor/php-gettext/gettext.php';
    require_once DIR . '/vendor/php-gettext/streams.php';

    if (!empty($_GET["lang"])){
        setcookie("lang", $_GET["lang"], strtotime('15 days'), "/");
        $language = $_GET["lang"];
    }elseif(!empty($_COOKIE["lang"])){
        $language=$_COOKIE["lang"];
    }else{
        $language = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'], 0, 2);
    }

	switch( $language )
	{
		case 'en':
			$l10n = 'en_GB';
        break;

        case 'es':
            $l10n = 'es_ES';
        break;

		default:
			$l10n = 'es_ES';
	}


	if( file_exists(DIR . '/app/languages/'. $l10n .'.mo') )
	{
		$gettext_tables = new gettext_reader(
				new CachedFileReader(RAIZ . '/app/languages/'. $l10n .'.mo')
		);
		$gettext_tables->load_tables();
	}

// Disponemos de dos funciones para obtener la traducción de cada texto almacenada en el catalogo.
	// La función __() recibe un texto y devuelve la traducción, o el texto original si no existe, por valor:
	function __($text)
	{
		global $gettext_tables;

		if (is_null($gettext_tables))
			return $text;
		else
			return $gettext_tables->translate($text);
	}


	// En el caso de la función _e() se recibe el texto y se imprime la traducción, o el original si no existe.
	function _e($text)
	{
		global $gettext_tables;

		if (is_null($gettext_tables))
			echo $text;
		else
			echo $gettext_tables->translate($text);
	}
?>
