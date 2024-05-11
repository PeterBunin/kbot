### kbot
Telegram bot with golang

# link to bot
[t.me/peterbunin_bot](https://t.me/peterbunin_bot)

## make TELE_TOKEN variable

read -s TELE_TOKEN  
[put token here]  
save

# check variable output

echo $TELE_TOKEN

# export variable to OS

export $TELE_TOKEN

# How to build

go build -ldflags "-X="github.com/PeterBunin/kbot/cmd.appVersion=v1.0.2

# How to run (locally)

./kbot start
