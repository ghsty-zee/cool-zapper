FROM archlinux:latest

RUN pacman -Syyu --noconfirm && \
    pacman -S --noconfirm python-pip zstd p7zip gcc git ffmpeg && \
    python3 -m venv /venv && \
    pacman -Scc --noconfirm
ENV PATH="/venv/bin:$PATH"
RUN pip3 install -U pip setuptools wheel && \
    mkdir /app
WORKDIR /app
RUN git clone https://github.com/dipu564/unzip-bot-dips.git /app && \
    pip3 install -U -r requirements.txt
COPY .env /app/.env
EXPOSE 3000
CMD ["/bin/bash", "start.sh"]
