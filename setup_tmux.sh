cd
rm -rf .tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
# cp .tmux/.tmux.conf.local .
cp dotfiles/tmux.conf.local .
