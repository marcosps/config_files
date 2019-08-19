-- Grab passwd from gpged encrypted passwd
cmd = io.popen("secret-tool lookup personal yes", "r")
pass = cmd:read("*a")

gmail = IMAP {
	server = 'imap.gmail.com',
	username = 'marcos.souza.org@gmail.com',
	password = pass,
	ssl = 'tsl1'
}

-- create folder if not exists
options.create = true

gmail.INBOX:check_status()

-- Move mails from kernel mailing lists to specific directories
listFolders = {'linux-block',
		'linux-scsi',
		'linux-raid',
		'linux-kernel'
}
for _, folder in ipairs(listFolders) do
	matches = gmail.INBOX:contain_to(folder .. '@vger.kernel.org')
	matches:move_messages(gmail['INBOX/' .. folder])
end

-- promotional emails
listEmails = {
	'@e.carrefour.com.br',
	'@envios.saraiva.com.br',
	'@emkt.submarino.com.br',
	'@deals.banggood.com',
	'@edm.gearbest.com',
	'@amazon.com.br',
	'@youtube.com',
	'@linkedin.com',
	'@twitter.com',
	'@spotify.com',
	'@spotify.com',
	'@meetup.com',
	'@duolingo.com'
}
for _, email in ipairs(listEmails) do
	matches = gmail.INBOX:contain_from(email)
	matches:move_messages(gmail['INBOX/promotions'])
end

matches = gmail.INBOX:contain_from('*@github.com')
matches:move_messages(gmail['INBOX/github.com'])
