KonfigSV = {}

KonfigSV.Webhook = ''
KonfigSV.WebhookTitle = 'K_Fraud Logs'
KonfigSV.WebhookColor = "999999"


function BanLogic(src)
    -- Add your ban logic here if you want to
    DropPlayer(src, "Attempted to exploit.")
end