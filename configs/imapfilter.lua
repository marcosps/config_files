-- Grab passwd from gpged encrypted passwd
cmd = io.popen("gpg -q -d ~/.Maildir/gmail/.passwords.gpg", "r")
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
	'@envios.saraiva.com.br'
}
for _, email in ipairs(listEmails) do
	matches = gmail.INBOX:contain_from(email)
	matches:move_messages(gmail['INBOX/promotions'])
end

matches = gmail.INBOX:contain_from('*@github.com')
matches:move_messages(gmail['INBOX/github.com'])