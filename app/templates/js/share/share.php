<script src='/resources/share/jquery.share.js'></script>
<link rel="stylesheet" href="/resources/share/share.css">
<div id="social-bar">
	<div id="social-bar-links">
		<!--facebook-->
		<a href="#"
		  onclick="
			window.open(
			  'https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href)+'&t='+document.title,
			  'facebook-share-dialog',
			  'width=626,height=436');
			return false;">
		  <img src="/resources/share/images/facebook.svg" alt="facebook">
		</a>
		<!--twitter-->
		<a href="#"
			onclick="
				window.open(
				'https://twitter.com/intent/tweet?hashtags=inwik&text='+document.title+' '+location.href+'&url='+encodeURIComponent(location.href),
				'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=200,width=600');
				return false;">
			<img src="/resources/share/images/twitter.svg" alt="twitter">
		</a>
		<!--google plus-->
		<a href="#"
			onclick="
				window.open(
				'https://plus.google.com/share?url='+encodeURIComponent(location.href),
			'', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600');
			return false;">
		  <img src="/resources/share/images/gplus.svg" alt="google plus">
		 </a>
		<!--tumblr-->
		<a href="#"
			onclick="
				window.open(
				'http://www.tumblr.com/share?v=3&u='+encodeURIComponent(location.href),
				'', 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=600, width=600');
				return false;">
			<img src="/resources/share/images/tumblr.svg" alt="tumblr">
		</a>
		 <!--tuenti-->
		<a href="#"
			onclick="
				window.open(
				'http://www.tuenti.com/share?url='+encodeURIComponent(location.href),
				'', 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=600, width=600');
				return false;">
			<img src="/resources/share/images/tuenti.svg" alt="tuenti">
		</a>
		<!--menéame-->
		<a href="#"
			onclick="
				window.open(
				'http://www.meneame.net/submit.php?url='+encodeURIComponent(location.href),
				'', 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=600, width=600');
				return false;">
			<img src="/resources/share/images/meneame.svg" alt="menéame">
		</a>
        <!--pocket-->
 		<a href="#"
			onclick="
				window.open(
				'https://getpocket.com/save?url='+encodeURIComponent(location.href)+'&title='+document.title,
				'', 'menubar=no, toolbar=no, resizable=yes, scrollbars=yes, height=600, width=600');
				return false;">
			<img src="/resources/share/images/pocket.svg" alt="pocket">
		</a>
	</div>
	<div id="social-bar-close">
		<button>Cerrar</button>
	</div>
</div>
