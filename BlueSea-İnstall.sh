
mkdir -p "$HOME/.bluesea"

proot-distro login alpine -- /bin/sh -c 'cat > /root/.profile' <<'PROFILE'
export PS1="~Root@BlueSea# "

python() {
    apk update && apk add python3 py3-pip
    if [ "$?" -eq 0 ]; then
        echo "Python kuruldu. Çalıştırmak için: python3"
    fi
}

c++() {
    apk update && apk add clang
    if [ "$?" -eq 0 ]; then
        echo "Clang kuruldu. Derleyici: clang++"
    fi
}

saat() {
    date '+%H:%M:%S'
}

help() {
    echo "===== BlueSea OS Komutları ====="
    echo "python  - Python 3 ve pip kur"
    echo "c++     - Clang derleyicisini kur"
    echo "saat    - Saati göster"
    echo "help    - Yardım menüsü"
    echo "clear   - Ekranı temizle"
    echo "exit    - Sistemden çık"
}

clear
echo "#==Merhaba Kullanıcı!==#"
echo "BlueSea OS | Alpine Linux"
echo "Komutları görmek için: help"
PROFILE

cat > "$HOME/bluesea" <<'LAUNCHER'
#!/data/data/com.termux/files/usr/bin/bash

set -e
DIR="$HOME/.bluesea"
PASSFILE="$DIR/password.sha256"

if ! proot-distro list 2>/dev/null | grep -q 'alpine'; then
    echo "Alpine Linux kurulu değil. Önce kurulum yap."
    exit 1
fi

if [ ! -f "$PASSFILE" ]; then
    echo "=== BlueSea OS İlk Kurulum ==="
    while true; do
        read -rsp "Yeni şifre: " P1
        echo
        read -rsp "Şifreyi tekrar gir: " P2
        echo

        if [ -z "$P1" ]; then
            echo "Şifre boş olamaz."
        elif [ "$P1" != "$P2" ]; then
            echo "Şifreler eşleşmiyor, tekrar dene."
        else
            printf '%s' "$P1" | sha256sum | cut -d ' ' -f1 > "$PASSFILE"
            chmod 600 "$PASSFILE"
            unset P1 P2
            echo "BlueSea şifresi oluşturuldu."
            break
        fi
    done
fi

echo "=== BlueSea OS ==="
read -rsp "BlueSea şifresi: " INPUT
echo
HASH=$(printf '%s' "$INPUT" | sha256sum | cut -d ' ' -f1)
unset INPUT

if [ "$HASH" != "$(cat "$PASSFILE")" ]; then
    echo "Hatalı şifre!"
    exit 1
fi

unset HASH
exec proot-distro login alpine -- /bin/sh -l
LAUNCHER

chmod +x "$HOME/bluesea"
echo "Kurulum tamamlandı. Başlatmak için: ~/bluesea"
