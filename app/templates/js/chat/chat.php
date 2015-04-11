<?php
    if(!empty($_SESSION['username'])) {
?>
<div id="chat">
	<div id="chat-title">
		<p>Chat global</p>
		<span id="max-chat"></span>
	</div>
	<div id="chat-close">
		<span></span>
	</div>
	<div id="messages">
		<div class="message-user">
			<div class="message-avatar">
				<a href="usuarios/albertoi">
					<img src="../../images/avatar/albertoi.jpg">
				</a>
			</div>
			<div class="message-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </div>
		</div>
		<div class="message-user">
			<div class="message-avatar">
				<a href="usuarios/albertoi">
					<img src="../../images/avatar/albertoi2.jpg">
				</a>
			</div>
			<div class="message-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>
		</div>
		<div class="message-user">
			<div class="message-avatar">
				<a href="usuarios/albertoi">
					<img src="../../images/avatar/link.jpg">
				</a>
			</div>
			<div class="message-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</div>
		</div>
	</div>
	<div id="messageinput">
		<input type="text" placeholder="Escribe aquí tu mensaje">
	</div>
</div>

<?php
    }
?>
