# Go言語の公式イメージをベースにする
FROM golang:latest

# 作業ディレクトリを設定
WORKDIR /app

# 先に go.mod と go.sum をコピー
COPY go.mod go.sum ./
# 必要なパッケージをダウンロード
RUN go mod download

# ホストのファイルをコンテナ内の作業ディレクトリにコピー
COPY . .

# ポートフォリオアプリケーションをビルド
RUN go build -o portfolio

# アプリケーションを起動
CMD ["./portfolio"]
