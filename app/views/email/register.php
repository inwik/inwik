<html>
    <body>
        <p><?=__("Bienvenido/a a")?> {PAGE_NAME}, {USER}.</p>
        <p><?=__("Este es tu código de activación")?>: {EMAIL_KEY}</p>
        <p><?=__("¡Entra en este enlace, introduce tus datos y serás parte de esta gran comunidad!")?></p>
        <a href='{PAGE_DOMAIN}/?activation={EMAIL_KEY}'>{PAGE_DOMAIN}/?activation={EMAIL_KEY}</a>
        <p><?=__("Si tienes algún problema con tu registro ponte en contacto con nosotros a través de esta dirección")?>:</p> <a href='mailto:{CONTACT_EMAIL}'>{CONTACT_EMAIL}</a>
        <p><?=__("¡Bienvenido/a!")?></p>
    <body>
</html>
