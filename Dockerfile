FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
	graphviz \
	libsm6 \
	libxext6 \
	libxrender-dev \
	libglib2.0-0 \
	sudo \
	wget \
    vim

WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh && \
	bash /opt/Anaconda3-2023.09-0-Linux-x86_64.sh -b -p /opt/anaconda3 && \
	rm -f Anaconda3-2023.09-0-Linux-x86_64.sh

ENV PATH /opt/anaconda3/bin:$PATH
EXPOSE 8888

RUN pip install --upgrade pip && \
	pip install -- upgrade scikit-learn && \
    # pip install nibabel && \ # 神経画像データを扱うためのライブラリ
	pip install --upgrade plotly && \
    # plotlyグラフをオンラインで保存し、共有するためのライブラリ
	pip install chart_studio && \
    # jupyter上でjupyter-dashを使用できる(GUI的なもの)
    # Dashアプリケーションをjupyter notebooks上で実行するためのライブラリ
    # Dashはplotlyをベースにしたウェブアプリケーションの構築を簡素化するためのフレームワーク
	pip install jupyter-dash && \
    # ノートブック上でGUIを使うことができる
	pip install --upgrade "ipywidgets>=7.6" && \
	pip install lightgbm && \
	pip install xgboost && \
	pip install graphviz && \
	pip install catboost && \
    # カテゴリカル変数をエンコードするための機能を提供するライブラリ
	pip install category_encoders && \
    # ハイパーパラメータ最適化を行うためのライブラリ
	pip install hyperopt && \
    # scikit-learnのモデルのハイパーパラメータ探索を行うライブラリ
	pip install hpsklearn && \
	pip install optuna && \
	pip install shap && \
	pip install opencv-python && \
	pip install pycaret


WORKDIR /

CMD ["jupyter","lab","--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]