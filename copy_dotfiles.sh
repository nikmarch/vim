sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd dotfiles

for f in *
do
  cp -f $f ~/.$f
done

cd -
