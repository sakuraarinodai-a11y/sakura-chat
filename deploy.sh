#!/usr/bin/env bash
# サクラ整骨院チャットボット デプロイスクリプト
# 使い方: bash deploy.sh "コミットメッセージ"
# このスクリプトを使うことで HTML_UPDATED が常に正確な時刻に自動更新される

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
HTML="$REPO_DIR/index.html"
MSG="${1:-deploy: update}"

# 現在時刻を YYYY/MM/DD HH:MM 形式で取得
NOW=$(date "+%Y/%m/%d %H:%M")

# HTML_UPDATED を現在時刻に自動書き換え
sed -i "s/var HTML_UPDATED = \".*\";/var HTML_UPDATED = \"$NOW\";/" "$HTML"

echo "✅ HTML_UPDATED を '$NOW' に更新しました"

cd "$REPO_DIR"
git add index.html
git commit -m "$MSG

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
git push origin main

echo "🚀 デプロイ完了: $NOW"
