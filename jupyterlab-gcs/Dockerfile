FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
	&& apt-get install -y \
		python3 \
		python3-pip \
		wget \
		curl \
		vim \
		git \
		fonts-noto-cjk \
		language-pack-ja

RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - && apt-get update -y && apt-get install google-cloud-sdk -y

# echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list : gcloud CLIの配布URLをパッケージソーづとして追加
# curl https://packages.cloud.google.com/apt/doc/apt-key.gpg : Google cloudの公開鍵のインポート


COPY requirements.txt /tmp/requirements.txt

RUN pip install -U pip \
	&& pip install --no-cache-dir -r /tmp/requirements.txt \
	&& rm -r /tmp/requirements.txt

WORKDIR /work
EXPOSE 3333

CMD ["jupyter-lab", "--ip=0.0.0.0", "--LabApp.token=''", "--no-browser", "--allow-root", "--notebook-dir='/work'"]