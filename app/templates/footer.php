		<footer>
			<div id="footer-links">
                <div id="footer-logo">
                    <a href="http://www.inwik.org">
                        <img src="../skins/common/images/logo-footer.png" />
                    </a>
                </div>
				<div id="footer-html5">
                    <a href="http://www.w3.org/html/logo/">
                        <img src="http://www.w3.org/html/logo/badge/html5-badge-h-connectivity-css3-multimedia-semantics.png" width="229" height="64" alt="HTML5 Powered with Connectivity / Realtime, CSS3 / Styling, Multimedia, and Semantics" title="HTML5 Powered with Connectivity / Realtime, CSS3 / Styling, Multimedia, and Semantics">
                    </a>
				</div>
				<div id="footer-gpl">
					<a href="http://www.gnu.org/licenses/agpl-3.0.html">
						<img src="../skins/common/images/agplv3.png" alt="GNU Affero General Public License v.3">
					</a>
				</div>
				<div id="footer-license">
					<a rel="license" href="http://creativecommons.org/licenses/by-nc/3.0/deed.es_CO">
						<img alt="Licencia Creative Commons" style="border-width:0" src="../skins/common/images/ccbync.png">
					</a>
				</div>
			</div>
		</footer>
		<!--Chosen-->
		<script src="../resources/chosen/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript">
			var config = {
			  '.chzn-select'           : {},
			  '.chzn-select-deselect'  : {allow_single_deselect:true},
			  '.chzn-select-no-single' : {disable_search_threshold:10},
			  '.chzn-select-no-results': {no_results_text:'Sin resultados'},
			  '.chzn-select-width'     : {width:"95%"}
			}
			for (var selector in config) {
			  $(selector).chosen(config[selector]);
			}
		</script>
		<!--Editor-->
		<script src='../resources/editor/jquery.editor.js'></script>
		<link rel="stylesheet" href="../resources/editor/editor.css">
		<!--Critical-proposal-->
		<script src='../resources/critical-proposal/jquery.critical-proposal.js'></script>
		<link rel="stylesheet" href="../resources/critical-proposal/critical-proposal.css">
        <!--Waypoints-->
        <script src="../resources/waypoints/waypoints.min.js"></script>
        <script src='../resources/waypoints/shortcuts/infinite-scroll/waypoints-infinite.min.js'></script>
	</body>
</html>
